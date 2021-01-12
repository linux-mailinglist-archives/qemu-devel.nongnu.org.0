Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD82F2E5F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:49:55 +0100 (CET)
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIBO-0002hs-1i
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzI2v-00019Y-BM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:41:09 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzI2s-0005Ri-62
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:41:08 -0500
Received: by mail-ed1-x52d.google.com with SMTP id c7so1934791edv.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RuPWhkAVH0A59fYOCHhaInSzSpq/boZju9pdFT06dM0=;
 b=jET6N2lFwRYDZHc4eTv+AhXDAe8nU4+Nz29pa1LmOTbZHhAFkzSOuVwJ9cXw/+BYB2
 UrUfg5ja1YM6OK9vaPBMgyTVN96eFrEYyfTnvWloEK4XuKBFOeMyW7MNjVyfz8ym/4Xh
 1jblCZQh/XlFKW24gZ+2lpMLwC/Cyo3Rf/TSTqQ/0lU9K+B/QzJwJw/fRteRdyQOFSRq
 K0Gtj8OschUYwP9Oiw60VVNufRimVCsDoXktlrapYjjHdslOd+a7IoT8zw5UIWtsCAeJ
 FwFOLzMDYvjBHKWv3D0WDYabFKn2DZh27R3cmJLAdG7aRpD0GDCTP4Wx3wBOFIF4tX3C
 Et7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RuPWhkAVH0A59fYOCHhaInSzSpq/boZju9pdFT06dM0=;
 b=IvXmbVbzmTxJaKu/8YgM+JWVdKST6dLfDBFvuq2C7qB4bIz6vHEzU658pVblRkdOT9
 1Zc+qvyjwatuGuqeuwj7vR6ouKSbbACNk0fyOjDPG2Ircrep654fxA8UGkEEcjUMBgZo
 OQbgv1APy+J5TLrgKlCisnUrRe0/apeJVnQMgnKSWJYzOhUVqsSjiu1M72aR6zQsveT2
 HqEuGQs1yu/BBxwMLpNVf5omg6rxuQ6wKoSvnZVq7Tm3eW5ESTSVjHO/s+ov4BuyLujx
 656BODzuliExAJDwf8zqbNWJ/bmiIaF+QGbZjadQypDVOMyXeZcrSOsPi3QTCctyzXPR
 7eWA==
X-Gm-Message-State: AOAM533GIWUITbvQcpW3/tNBdE8kzTOzgnWK1V4vtN8FZJpkSp8qQahO
 LbumIqdNmwVwyKMeYZ/YOIb5dDhR8OVi6LaklnXkxw==
X-Google-Smtp-Source: ABdhPJzuCsSapPN82AjXoXFtNkOkZ1MrCeKGI3Fy5zFrIGzVIWq9k8E4BmKhkKUmpX08h2X8ZZOGv1q6RaqSUlLhl9w=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2990289edr.251.1610451664069; 
 Tue, 12 Jan 2021 03:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <CAFEAcA_DONsg-c_-sEA_T_P+5jYSAXtTDfcvy7_h7oGWOqJ+nA@mail.gmail.com>
 <X/jTED/ktnoFxm6e@SPB-NB-133.local>
 <CAFEAcA-vQqmSLZ-haRcVMG=RjPR+Uz=_semCKE0sjmkfuQaQpQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-vQqmSLZ-haRcVMG=RjPR+Uz=_semCKE0sjmkfuQaQpQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 11:40:52 +0000
Message-ID: <CAFEAcA-p9U9imdnNFjty0apDX3AxwT1yXDB=ZYVicA1cQWJBHA@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 22:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 8 Jan 2021 at 21:47, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > On Fri, Jan 08, 2021 at 03:05:55PM +0000, Peter Maydell wrote:
> > > This menu bar breakage appears to be caused by this patch. I have
> > > no idea why, because the patch looks pretty harmless. Nonetheless,
> > > I'm going to have to drop it from my queue.
> > >
> >
> > I think the patch is valid per-se and doubt the patch would cause menu
> > bar breakage. I had unresponsive menu bar on Catalina even without the
> > patch.
>
> Well, for me it seemed to be consistent that with this patch the
> menu bar didn't work, and without it it did work. I'll have
> another look later.

I reproed the "menu bar doesn't work" without this patch, so indeed
it's not to blame. I've put it back in my queue.

It seems like when QEMU initially starts the menu bar doesn't
work; switching to another app and back again makes it start
working. I haven't yet looked through the rest of the discussion
in this thread about possible fixes to this.

thanks
-- PMM

