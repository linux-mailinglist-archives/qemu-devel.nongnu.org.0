Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2BA50C8E7
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 12:02:24 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niCat-00017A-97
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 06:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1niCYg-0000Iz-BF
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 06:00:06 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:44156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1niCYe-0003ok-Ei
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 06:00:05 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e67799d278so7341614fac.11
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 03:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIRNvPn46nw86lIW/kvACy+Pif9kNHkmVlJReegmodE=;
 b=HDlJV4DC/k38Ek4az51WzMJNI++frYH1Hh7LveHnCK9JazxCd44QiE6htM8EAAIi4g
 VvUa5J0x64cIBpmTR/WX2oxQcWZQFwKsgt1m5p09bWDd/T4wvxp2Xxl1Y7BzzsS91BmX
 F5iWCYjgf23GaYlnSwM/jC4uJscFPb7CvyI52406MhUDEKLs8x+ugGCKBkhDyH859LFn
 GVaQdxwN+lPDf5kbJjpLzn6D6REZx4CGgqPHxmZWjbySuYxyEoE99aEfI2ruItni/2aH
 rqlnELLuUdxne18Kec+lpB7kdstjkWb7t/vvSQiXfGm4xSlQDy/pq8NsVNypltKKRmnP
 VkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIRNvPn46nw86lIW/kvACy+Pif9kNHkmVlJReegmodE=;
 b=qSJ6GCq8yR1RFAVJBP8kHkBKetoSmO/rBWPFLmgX24hyXkM5xBELXZEGOEEugO1oEr
 u9dvwwamH6oXEuFkWTBSz43XqsvOsFt6xIN8ZpexZHKK9ZO3im8Ruq57kQQDWopEgfiy
 3JqRSvzjhgUyEKeEtIlTzJ/KMQ62ItaJgywJNfI8/447gk+cCshRG0Lxm7EQ2QnSyFZB
 XEHheR1+1xC+WxLN+Lh4WZWrFFagw/qGAwGfIlQIrzwsdJ9/uhJYqDE8S6+LybRCu7S8
 8Iy2G2UmPF/Leo7HGiTkLU+b63oB3UGR9I93Ne/cDJptesegvHoI3WlZUNzu6+ewD9fa
 OVYg==
X-Gm-Message-State: AOAM530di9KI1o5+Q/H81FfvA9jxn35Rir6ZfXTlgnX4Ni/aGR69aB3A
 wgAzaPkMP7gNc4Q+K6H4pHi88GDwNh+xz2njCNg=
X-Google-Smtp-Source: ABdhPJxiJ14f/2xJTmB+Xo2wwz7Oce098ryUUdjtdWc0vzSpE9ChJQVVU99zxnEo/P/4etbYYRUJXeNUdRiDtFXPiU4=
X-Received: by 2002:a05:6870:580e:b0:e2:7e06:e785 with SMTP id
 r14-20020a056870580e00b000e27e06e785mr3815141oap.38.1650708002354; Sat, 23
 Apr 2022 03:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220413172246.73708-1-gautamnagrawal@gmail.com>
 <CAFEAcA8Zs9SStbHYPgprODCav1BkMFqKhizt5Yp_XmZ05bfLLQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8Zs9SStbHYPgprODCav1BkMFqKhizt5Yp_XmZ05bfLLQ@mail.gmail.com>
From: Gautam Agrawal <gautamnagrawal@gmail.com>
Date: Sat, 23 Apr 2022 15:29:51 +0530
Message-ID: <CAG-ETXv8cDEsN5a=raQRTMky6uBh9EpJAhB7pNd3GDOwACX7Aw@mail.gmail.com>
Subject: Re: [PATCH v2] Warn user if the vga flag is passed but no vga device
 is created
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, thuth@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I will make changes in hw/ppc/spapr.c . In hw/hppa/machine.c ,
vga_interface_type is used inside if condition to check for graphics
device creation, but I am not able to find any relation with creation
of vga interface. Could you kindly provide some pointers about it?

thanks,

Regards,
Gautam Agrawal

On Thu, 21 Apr 2022 at 20:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 13 Apr 2022 at 18:23, Gautam Agrawal <gautamnagrawal@gmail.com> wrote:
> >
> > A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> > has been used to track the creation of vga interface. If the vga flag is passed
> > in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
> > To warn user, the condition checks if vga_interface_created is false
> > and default_vga is equal to 0.If "-vga none" is passed, this patch will not warn the
> > user regarding the creation of VGA device.
> >
> > The initialisation of Global variable "vga_interface_created" in softmmu/globals.c
> > has also been corrected.
> >
> > The warning "A -vga option was passed but this
> > machine type does not use that option; no VGA device has been created"
> > is logged if vga flag is passed but no vga device is created.
> >
> > "vga_interface_created" has also been included in "xen_machine_pv.c" and
> > "fuloong2e.c". This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.
> >
> > Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
> > ---
> >  hw/isa/isa-bus.c          | 1 +
> >  hw/mips/fuloong2e.c       | 1 +
> >  hw/pci/pci.c              | 1 +
> >  hw/sparc/sun4m.c          | 2 ++
> >  hw/sparc64/sun4u.c        | 1 +
> >  hw/xenpv/xen_machine_pv.c | 1 +
> >  include/sysemu/sysemu.h   | 1 +
> >  softmmu/globals.c         | 1 +
> >  softmmu/vl.c              | 6 ++++++
> >  9 files changed, 15 insertions(+)
>
> You've missed the uses of vga_interface_type in hw/hppa/machine.c
> and hw/ppc/spapr.c. ("git grep vga_interface_type" will give you the
> list of all the files which touch that variable.)
>
> thanks
> -- PMM

