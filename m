Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A51411DC8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:22:16 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMzf-00009g-4X
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSMxX-0006kV-0P
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:20:03 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSMxV-0008OZ-Fz
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:20:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so24825122wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Dgn1Mtpl/Q3FdZkU0MV91QmrjSZHoaCb2A7V8u5OHY=;
 b=JckAZK/46vdfF+U5UWjK4YiFf7F66BLahrbLJOASA5zQ91xB9uaX2SOhg4tKklRU6h
 RK0naXwifda1ff2mSbR9Z19pES2hTi4OZhBMiizbPuiPwYDD+M11UuihPkhl0Xv+kISs
 97yxgfhUffbZcPE4uiSvRTkshQBX1NQyq7/zreVf+ue+NoOz/ftR9YvigRmdRP9WxpXS
 4Reqwpy6dzFcBg7jbElsRy4bswcjxFWr1r571WvD+DI40L1fC/yk3F31KKCHovyx34nX
 QOkgEewSuYQ8Cr4rs0lzjHFQOL9QkKxrnQvD83mClomYuxSF31J1bfIiZA6CxR6lAT86
 NCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Dgn1Mtpl/Q3FdZkU0MV91QmrjSZHoaCb2A7V8u5OHY=;
 b=jNHxzIczZOdfzQEKp/BAYGIUPJ4Hehd1kuy+feT7ApH6lr3voIhjKowr6SsbpUHUxx
 rDrTg3Li95kFqfJbnOLjq2cdb7SWWAizas/mzSrXPkDsF7ZVy7MLv6poSdJiHrzlFzb6
 Y3QzXQ9h+6WBQhjDXxO/DVIaliLABMrdnoZ9gtmQB9V/H43BY27wutM4x1/dIoJH6WmM
 pBe/qlseXJJhMpwXbjmMK+DfRZeJW6r8e2N4NmRU9aJZKICr46g2LtafBZQoqHWeCBvz
 UeGg69dgEM3jQyQh17tk0IjUY+CvzFrQPbqZ4dJApakJ2qIDja0uyBaVLgrsH0LejfIM
 1PTA==
X-Gm-Message-State: AOAM533H4naFedWhX0cZUGf+nHj+qIZ4x7neFeyZUXUp8jtEp7vWOEOI
 2yXVfzZPDCrsSSKlfnKOZXI+A7ZoyGURwqX5UUZMwA==
X-Google-Smtp-Source: ABdhPJyWiWaML944VV6tpMyvYOvzwuabtwZOuP29S2GPnzWeCpB2XXlfMBT1MCgOgKJn3X3D6wtxt6LT26L9hOAQLDw=
X-Received: by 2002:adf:f185:: with SMTP id h5mr30381698wro.302.1632158399848; 
 Mon, 20 Sep 2021 10:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
 <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
 <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
 <CAFPHj6OWBhBg_SfXQ0MbjJ-Lfg3-=6=sLeY9zTaVU=LAMdSmBA@mail.gmail.com>
 <CAFEAcA-Fi4ZVdXMv-HZ5EPMGpj_fH2VmY+ZFeKKXvVYp4OkP0A@mail.gmail.com>
 <CAFPHj6PhOxcXjxHnW33iO2z+Z72LyFOeg5Z5uDBCTM-RVz7Q6A@mail.gmail.com>
In-Reply-To: <CAFPHj6PhOxcXjxHnW33iO2z+Z72LyFOeg5Z5uDBCTM-RVz7Q6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 18:19:07 +0100
Message-ID: <CAFEAcA_JU9C4-9y=V4p4rokdS6=y9CH1bF5pcCg+VO8mbPeQ9w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 17:49, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> On Mon, 20 Sept 2021 at 17:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> That's OK -- our "int" properties are int64_t. So we could easily
>> fit something like 10000 == 1.0000 uT, in case we might want
>> the extra precision in future. That would be 1,000,000 == 1 G
>> (assuming I haven't messed up my arithmetic ;-))
>>
> Is 0.001 uT OK to use as a starting point? I think that's enough for most
> sensors I'm aware of.

The thing is that the starting point is also the finishing point:
once we have released something that uses a particular set of
units, we can't change it in future without breaking backwards
compatibility. So we need to get it right now.

-- PMM

