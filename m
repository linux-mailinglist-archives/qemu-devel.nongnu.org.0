Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB669439F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWX6-0001gV-BJ; Mon, 13 Feb 2023 05:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRWX4-0001fY-Cz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:58:02 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRWX2-0003vP-QP
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:58:02 -0500
Received: by mail-pl1-x634.google.com with SMTP id be8so13100280plb.7
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tRDWDjmG7UqYnK4/S3DiaKX/55SL64JbhGOEM/5Ri00=;
 b=GV2jFpiUF7/Sf7lBaEvH0+vNdjjJ3LpPwGm4aQnmFdrtb/a9WEQhx4Fu2+mBXCvtgT
 KD9oYQoycG0k8o4JOSRZfAOZ6g1846ZWwzSMR/Ts7IgS6a8dSnmjsPRSK0z68gR1xDb7
 l17WzJHb3jhOiIkMQgQ8ul1QloJGPkDp97jNlrVNsItpgfcL24FHtK87KEGiM+STk+0b
 UOFX/MrtvH5A6adk0eRJUdqcIm3Y9+wg+NkQ967RFgWEb4nuqz0lYnJkm/rLOuBB6gP1
 SF3kSVZ1iyTGbbFMzWGaAn6Y/JWEvgjjCXih9QOsi/14ceiGHWgVSuABT4EkvSvRfGeP
 Y+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tRDWDjmG7UqYnK4/S3DiaKX/55SL64JbhGOEM/5Ri00=;
 b=7/QR4yrJ6F7XCalx/tPxlwGSHxNSjjHmNhHLDydfKeSoZGJyQSGQjNNy7zef2mSeBa
 XuoucPwLARgoP0dEvTOZO+XYqs5rvuaieFjMbQWHi3DHHiVJYdzZKzegwuBsvJPQZaOA
 bodzZC2PcofTaboh/JoSf8e2KJnhhEMQ5I1OkeKXj9Yr4x2iKhcAT8xBlyWWCzefMfLX
 6jpnna//aMcbCTPKlreL47uT5UCM6VVzJU6V8eYb2OjCA2yIo1Jry7tFq6dZTZKZwM3j
 sgsWKbvJL8Pzz0aWbav4RkOuPc8p9JbeW2CthBNDIGufFuJy59GcKb29DG3zUnYZ0w3V
 ujWg==
X-Gm-Message-State: AO0yUKW0S1kFeHIz4AbWD5JmL5z7S0fbkHIkPVD1DCbe23fhZl0Zb9+o
 O4IiwHGfPbNuHbecku6VB412f33neYkftRh+mlHNKQ==
X-Google-Smtp-Source: AK7set9oMK7NJGTWnYoD4laFa7rj/G5w1nz+WfsOEC5/nqM+q1VCbX5Ydty5Pcax6gm+HisvKUGejJxA5XQi0swY8FY=
X-Received: by 2002:a17:90a:108:b0:233:cee2:343 with SMTP id
 b8-20020a17090a010800b00233cee20343mr1326094pjb.53.1676285878929; Mon, 13 Feb
 2023 02:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
In-Reply-To: <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 10:57:47 +0000
Message-ID: <CAFEAcA9iBui4zHCo+4b6o6rTXgQ=VpNzWUUTZmv_CR=cxWV3gw@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, eric.auger@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 11 Feb 2023 at 23:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/10/23 12:19, Mostafa Saleh wrote:
> > @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
> >
> >           VMSTATE_END_OF_LIST(),
> >       },
> > +    .subsections = (const VMStateDescription * []) {
> > +        &vmstate_gbpa,
> > +        NULL
> > +    }
>
> Actually, I suspect that you need a pre_load hook that resets gbpa, which will then be
> overwritten if and only if the saved value != reset value.

VM loads are guaranteed to start from a VM state which is freshly
reset, so the device's reset method is sufficient for this.

thanks
-- PMM

