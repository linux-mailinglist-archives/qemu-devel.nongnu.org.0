Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42F66B4C7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 00:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHCSd-0008RM-8i; Sun, 15 Jan 2023 18:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pHCSb-0008RE-7I
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 18:30:45 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pHCSZ-0004UC-3b
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 18:30:44 -0500
Received: by mail-lj1-x22e.google.com with SMTP id a37so2515172ljq.0
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 15:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9l9v/LuJGzr5NKR+uZ0aJdE/4kM0WgAPzKH1HojAVt8=;
 b=7KOJcVws1wsr4lfe5e/2CrLkGPmCbBXeFZw8OLCh7qIXmEaxBISOPiG9ULCpAkWKV7
 y8sH2QPQDlPDPLilKYB6x57s1yc+yn8b+K8tEZOPWvMutsPEo0/rWw+xcK2pkdKdbrm/
 sm+YXZCZ51dSkqAoEgEWICADphfbqmqxvY7UupGAwZ6Pscsy8oV5Fq9I65sBWh/ecvnV
 arO6iy/omeYcZfhkGOFHp/UxCjCjbTMgQXXY2yOB/ENyBJY331ZrNmjaMFbkHrzZRND0
 QZJShn097r2orMSPB5sWK4HlhDDgvc+qt+B55y49Nikqb9as57k4Bt7okHydSL6C0qsK
 a0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9l9v/LuJGzr5NKR+uZ0aJdE/4kM0WgAPzKH1HojAVt8=;
 b=L3Z2U/GX73z+JektYKEFv5H9hFH+yR922/JSDi+2SusqFbl8dYlMHAmPmNGtKnJ0tI
 tEAwyP7K4ki/TbtGjATXvrOyoARNlpUZwpt0neQ87P/Rpm/qhDKW0y+6upSrDaOsD8xt
 fFDPCkrcpqQYNvQ3rPuRPY6MZ9KG+JL3YILVxG8P1tNFgIwuFUzm1bFb+I8dBava20YS
 v0z5lnbNlpp5TVx3nW+9Tx5IuBXpwY+4YPPBb7w1zBCFuFApjp/1d/ddApAiAFUOdtSr
 q7mL/sLRyq6om8+BF+QUYi5DNhb8x7bXNK5pJueEVEP5wQ+E9WUiDl6bp+xS468Jd8Mh
 K4uQ==
X-Gm-Message-State: AFqh2krf1IWWe3HU4lDBjHTvPuNH0CdvAYn+io0v+7VC3nCSzYyT0gZb
 N8sC/giTD+CGwopisNpsg/yJhZEFWXCFPDvMqgDnlA==
X-Google-Smtp-Source: AMrXdXuNVzF6Xl1CnHLaUmtfe27zI/OJWDBGJRJbz3SziPaSNYPBB3CIDh2zmqPscnFg6tK0e4tFc6xm9FcgxZHoFRI=
X-Received: by 2002:a05:651c:b1e:b0:280:78f1:8b85 with SMTP id
 b30-20020a05651c0b1e00b0028078f18b85mr1849482ljr.449.1673825440804; Sun, 15
 Jan 2023 15:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
In-Reply-To: <20221129081037.12099-1-jasowang@redhat.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Mon, 16 Jan 2023 02:30:29 +0300
Message-ID: <CAPv0NP74wPer5uqrWYh8EeFO_YSATNuo5UpADD2QrE34=FwkrQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org, 
 eric.auger@redhat.com, Yan Vugenfirer <yvugenfi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 29, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
> Hi All:
>
> According to ATS, device should work if ATS is disabled. This is not
> correctly implemented in the current intel-iommu since it doesn't
> handle the UNMAP notifier correctly. This breaks the vhost-net +
> vIOMMU without dt.
>
> The root casue is that the when there's a device IOTLB miss (note that
> it's not specific to PCI so it can work without ATS), Qemu doesn't
> build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> won't trigger the UNMAP notifier.
>
> Fixing by build IOVA tree during IOMMU translsation.
>
> Thanks
>
> Jason Wang (3):
>   intel-iommu: fail MAP notifier without caching mode
>   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
>   intel-iommu: build iova tree during IOMMU translation
>
>  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 25 deletions(-)
>
> --
> 2.25.1
>

Hi Jason,

I've tried the series with Windows Server 2022 guest with vhost and
intel-iommu (device-iotlb=off) and now networking on this system has
become working.
So, as we discussed, I'm waiting for the series to be accepted in some
form to continue my work about supporting guests who refuse Device-TLB
on systems with device-iotlb=on.

Tested-by: Viktor Prutyanov <viktor@daynix.com>

Best regards,
Viktor Prutyanov

