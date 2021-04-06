Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEA354F03
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:50:50 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lThQ9-0006zD-MI
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThNx-0005bG-DX; Tue, 06 Apr 2021 04:48:33 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThNv-0006K3-KG; Tue, 06 Apr 2021 04:48:33 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e188so4334947ybb.13;
 Tue, 06 Apr 2021 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rHHtIdlDyt+2CgDrEjFRrnnywaXNohk66fMQPpZdUm4=;
 b=MN/uPBWzejfyN++Hc7lTTNtbfZAEj+CEuWFokzB04a61k7nqLoXZms70UHAbgqoVbb
 82gx1JjLahnOIbDBf03aLN2NpskjPAalnTMZfdDMIQLypsd2UphBjUIUz8NifXsocEmM
 xHXDdVFLEmyyBxwg7Mrl4NMwBmRvyZHw8i4w4OtB5d4fSMc2vKfY90XXo3FBag0/GITU
 goScOUqpSeyJ6oclpX0bB2gubglHQXEYBQFFWbiYXKZwiXgMtPdHnfCEiJ3eX+83tOoJ
 fQyhxkrVGpAyukYT0VmZGoNOe52cUVzyJLfRZBvc2tgiZKlp6+y1W+UTH+bANpCRV1+f
 0HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rHHtIdlDyt+2CgDrEjFRrnnywaXNohk66fMQPpZdUm4=;
 b=EwVBkJDtSIhSIlzBtrHR8MC/80pdzJ8vBeU9STq8zxtnGYMjkRhuXtImSjguU27+oI
 6bPa++GkQaF64qe+S12umOIkuNoITZeUSgFbrFv10FsE22xODgp1onRtsVw0Sl9oAdu1
 SCMXstTcQlYbXC7aLRCyWrFQ8yoniJHOLtd1D362PL9nvfmS0QaNiXk8rNnOmnYcEkUz
 dCi2tWqMI10nLY9svOwy4MHhhOlkD13MoYwXF5M/Th32EkZnHLMk34C84cQItgIX0Khj
 q7VHKYEDeRI2IRESBcdyah2idAQB4svovrmJxGISuRb5PWW7Eqq8j49PBQSmSuSWW3FJ
 WDLA==
X-Gm-Message-State: AOAM531/zBEla0Nd3/ADTmo3I1PZrk97jYdr9wJ7jRVI+EGwIxmP9Dym
 oumEpWQ6dWlKhYIC4dwuJ8h7q63P++XaOfMz70k=
X-Google-Smtp-Source: ABdhPJwRPFBZikyxzL2ZZ229RUwmmFVHjZuWs/Ri8T39e3e+9WNJ1vfgoSpFieRwGOC2V8s18baug/Sm2QI9dDiC7zE=
X-Received: by 2002:a25:e04c:: with SMTP id x73mr36196508ybg.387.1617698910318; 
 Tue, 06 Apr 2021 01:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210314121506.18303-1-bmeng.cn@gmail.com>
In-Reply-To: <20210314121506.18303-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:48:19 +0800
Message-ID: <CAEUhbmWD=Pixh5pXqU1cqG2juOXj1sv37raSmwu1kjVRbFAXXQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] ppc: qemu: Add eTSEC support
To: Priyanka Jain <priyanka.jain@nxp.com>, Ramon Fried <rfried.dev@gmail.com>, 
 Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Tom Rini <trini@konsulko.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Priyanka,

On Sun, Mar 14, 2021 at 8:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> QEMU ppce500 machine can dynamically instantiate an eTSEC device
> if "-device eTSEC" is given to QEMU.
>
> This series updates the fixed-link ethernet PHY driver as well as
> the Freescale eTSEC driver to support the QEMU ppce500 board.
>
> 3 patches related to fixed phy in v1 are dropped in v2 as the changes
> were done by Vladimir's fixed phy & Sandbox DSA series [1]. Vladimir's
> series is now included in v2 to avoid dependencies.
>
> This cover letter is cc'ed to QEMU mailing list for a heads-up.
> A future patch will be sent to QEMU mailing list to bring its in-tree
> U-Boot source codes up-to-date.
>
> Azure results: PASS
> https://dev.azure.com/bmeng/GitHub/_build/results?buildId=343&view=results
>
> This series is avaiable at u-boot-x86/eTSEC for testing.
>
> [1] https://patchwork.ozlabs.org/project/uboot/patch/20210216224804.3355044-2-olteanv@gmail.com/
>
> Changes in v4:
> - describe "ranges" is required fo the alternate description
> - make platform_bus_map_region() return void

Now the v2021.07 merge window is open, would you please apply this
series? Thanks!

Regards,
Bin

