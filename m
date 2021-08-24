Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A923F66C3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:26:51 +0200 (CEST)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIaCI-0007OZ-1a
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaB1-0005kn-Uo
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:25:31 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaB0-0002xA-I8
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:25:31 -0400
Received: by mail-ed1-x532.google.com with SMTP id q3so32860939edt.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vyr/1omE23keOHZ192gOeToxye+E/cq6IHSg65DhufY=;
 b=VGGTD0+YoWsl1Q1f/E8atDXXybJ0oMK3sY2ouWBTceyvkCaHc/hPFWQ7z17kKxQkA2
 IDGl0u8pKbGb2tJmTenicZJxT7o39gPt6BJNfn/0M2XZI5s08kJ+Ef65vYX1FymzvNOF
 JWKJygprc8qIllBow1WWPavJhtlVM2ngIXpLmWh3afueAABZZFE5ftTK6gCvkeo144OL
 lsxKmk9DM+vRqYT4y9dZmY0rlHd6T0zzmsyavA+JjYwumRShYRfyWZSIkCO+SeW4bqFF
 60MEF5H0+bwzVqE/dCYxGJDkmhyoh9/MITJCor0Z9s6YFngpfkJ4eL6KIB9iKIRbH536
 +qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vyr/1omE23keOHZ192gOeToxye+E/cq6IHSg65DhufY=;
 b=IvfqUiHRaLoFr3uqlG+BpWVjifoKVUOR0i10RoM3e5UPzJmrL/Smhkg6Mou4XF9aSS
 we9dE2Nnyv41YI4u/We+j63P2mPzDhUmwgFiu5xjQ8Q0aWtEgRXaiDIqnr/wIdRCaeUp
 d4k47e3vOGFP0GqlsPKBWTFwlRsvdd8Ma0A5r1J9ZTdO5dT9a8B3k6iZrd76J2cmaPam
 TcBmNIwBYTVNcdarr+oIdjmZRj4pYP6iV0lUR8BNV3CSHqvBYHiKldLsFRr+ufoIcyOx
 nixWi20jd4WcK/ryqrdfesQ8KmvwaSVtukUZdyqcthaWMFuUd22sBHtgLejCHweyi4fQ
 UMDg==
X-Gm-Message-State: AOAM533NDbDyQC5pr0yEQTNWLcFAPMK2btlVEwQ3rBc/emqbtHjmC4Oa
 QHYc3AfRoRfisPrvOJhR1Z0bk1cgrOVdl0q7Y7L8Tc/WDUY=
X-Google-Smtp-Source: ABdhPJwk7swV947hWRlbo64ylYWISAB6tLI06QV3NhxLT56AlT1llz0YF4U5tpGoipUU1Cqx1rhPmKmQaTwBbG2jHfM=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr43681908edu.100.1629825929302; 
 Tue, 24 Aug 2021 10:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-29-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:24:42 +0100
Message-ID: <CAFEAcA9VL7Y2TroHiXpRJWiNX8aNRfCiqehA9DOi=wBafKX8PA@mail.gmail.com>
Subject: Re: [PATCH v2 28/30] linux-user/sh4: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sh4/cpu_loop.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

