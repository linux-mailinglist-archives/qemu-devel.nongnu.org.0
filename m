Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2251441EE7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:59:34 +0100 (CET)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhaej-0000s9-3d
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhadx-0000A2-6D
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:58:45 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:41780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhadv-0000DQ-CR
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:58:44 -0400
Received: by mail-ua1-x930.google.com with SMTP id u9so32969364uac.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=farul29KqHBQxNso94urrExHnPJLbT3h/swwJ0BZTVQ=;
 b=ofVis3eYQqx14IJOiQHDxKHQVW0Gzfbd7z/imbYD8oLOboICZp92rj94zlU/KgNOPa
 egl/tz6+fpTsPS/HWYR1MHKU4EhiX3V4SdTzvrJ6ba+aYrjGRa9q9//7v0Xu49yUVtHd
 v1WN9o1TnCyRYN3+yafMd7Jxomq9jCVL6yryw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=farul29KqHBQxNso94urrExHnPJLbT3h/swwJ0BZTVQ=;
 b=V6NCob83ZuFrFb9Al4GJY89ikKsi3GDs/knjaA0Z4cfV2PqsdJECVwzcsFclph6Nml
 XO/rN69q/HN/iPIW8hxHeQnEeP6F0jLd92hgin76cWsne+KYrDxm2lGFPMFnHJ6fe4nG
 OOPeVEVphIG3q0sHAB/3DJpqKxTI3WVEYAA+pP3erV45ABdivtIeaMtOhQgJ0N+lpZnV
 axhenC589rSZo1a9uGUiRzCbCm0/h5RYlO5YtCyAe+/H8E2uQc//yxz7TujL0HA+8Aam
 mX2dfByjWPBqpNkTpt+hqN6D8bgzw60uEABccSdQ04x/HRhuQ4a532V+xwr7sijuqvtn
 UZXA==
X-Gm-Message-State: AOAM533DKoquBoBwMhSOrBzH1kLYFdgob1fELrDNn5ZUPBXr1XrizAa6
 PH9nuDbVcgX0Ng4AQwKy7mGbVe241hEIkI96fmrRAA==
X-Google-Smtp-Source: ABdhPJwhyHPa1qJ44cUxfa/mgWpxA6UcsR9fUU/G4QzTDXZ+UyJJMbG33ZWgm1NiT2SNq1ea+ci9FlROQgXkzSMKujY=
X-Received: by 2002:a05:6102:21a3:: with SMTP id
 i3mr9798775vsb.8.1635785920947; 
 Mon, 01 Nov 2021 09:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 1 Nov 2021 10:58:30 -0600
Message-ID: <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=sjg@google.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
> >
> > Add this file, generated from qemu, so there is a reference devicetree
> > in the U-Boot tree.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Note that the dtb you get from QEMU is only guaranteed to work if:
>  1) you run it on the exact same QEMU version you generated it with
>  2) you pass QEMU the exact same command line arguments you used
>     when you generated it

Yes, I certainly understand that. In general this is not safe, but in
practice it works well enough for development and CI. I am able to use
QEMU versions that differ by two years, partly because I am not trying
to do anything clever.

I have sent a patch to add an indication of where the devicetree came
from, to help with visibility on this.

Regards,
Simon

