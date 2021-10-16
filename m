Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED308430079
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 07:59:23 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbcj4-0003wY-Ld
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 01:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajaygargnsit@gmail.com>)
 id 1mbchz-0003Gp-RU
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 01:58:15 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajaygargnsit@gmail.com>)
 id 1mbchy-0004H3-DY
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 01:58:15 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so271567otb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Q7FUP+N01v+YLqZsoSXz0aSSuxX3vj0T3Lusi7JvYUM=;
 b=QtCDIa8a38GYTygcyzrGAHO1AukOuIuGaYOshJOw1LDDce/dSzxPlU3bFg6tj/AZmY
 dXir1tm0PvUCzpAwiY273TXuGdTKz12J3719Z5/1a71EcVubzrpnASTdHUerBpcj06ME
 di1X2S9R+gnfxksHSWd/BYX6eVyz1HKZLW2Ot3joYoICMbEx8RAuV6kVj3zX0TX9ypda
 XtsPHCBfbEDR69tksjRsth9wyb0wSfAwJ3kFlj302EQLJ+ObNMcaJAIWeMfWh/EjxgiG
 ZzB+9FI3mdh76WAPhN6o0uFhkl58m8JDAbTV1Ca7/M6gxohiMS8mvdKGi/ZJDRjIcsce
 uYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Q7FUP+N01v+YLqZsoSXz0aSSuxX3vj0T3Lusi7JvYUM=;
 b=NI2TK7mVkFfVCE85eNXsvc9gXfdX43rRgW9KsUkU0OJ7OoFrBougExmrrfis5A9qH4
 Hc7/W62v2lEfZcxl231LD/5VrH6wAg6gKoY3qVPxtMRH0X6uiSK1vKTg5Vg6Sk4wVxAp
 8ylg+X901m15BgFsHSxJ13KJlkrI72FijfjtF8iBKzmsbhbOQKctLvLiy8VncreTmSc4
 faYVO7HG8VZTTPhSj2HMeQke3dgY3BwAEI9LqA+keih3F0gFBJ2T5dth/yL3bKtmzwPX
 rSnCYRtFRnYH5IRUPB1OaK6D1ofOO37kqaIVL+CwpVlsTfxFloOijMgkx0AFOkgi90YD
 HaWQ==
X-Gm-Message-State: AOAM530zsMSX4oqtNudUoCxKioFMm2EODe7MR+ibCqipNQ8xQvyNcn56
 QjHSqFrXY2tXAKKkCT9Vl98HV0nqEqYjy8eXDWVboDUKxNUcuA==
X-Google-Smtp-Source: ABdhPJzhhPes9335wRm9GCuDPQsm3GaZt/d2eYyLCJ3GT0NvRaiteuUtsgHXZb4x+GTn25FpkAJxLAVMv0Q2EelAex4=
X-Received: by 2002:a05:6830:438a:: with SMTP id
 s10mr11499091otv.173.1634363892845; 
 Fri, 15 Oct 2021 22:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHP4M8URVjPEGFLHFXk4iS-7FYpg_=ZCVr2f6ufcFkNnZqAUug@mail.gmail.com>
In-Reply-To: <CAHP4M8URVjPEGFLHFXk4iS-7FYpg_=ZCVr2f6ufcFkNnZqAUug@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Sat, 16 Oct 2021 11:28:01 +0530
Message-ID: <CAHP4M8XVUwbJ+i8DeH0E5vOFY7zX2QnOsLTC7FGJGO2_aoUJiA@mail.gmail.com>
Subject: Re: Host-PCI-Device mapping
To: QEMU Developers <qemu-devel@nongnu.org>, iommu@lists.linux-foundation.org, 
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=ajaygargnsit@gmail.com; helo=mail-ot1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Never mind, found the answers in kvm_set_user_memory :)

On Fri, Oct 15, 2021 at 9:36 PM Ajay Garg <ajaygargnsit@gmail.com> wrote:
>
> Hello everyone.
>
> I have a x86_64 L1 guest, running on a x86_64 host, with a
> host-pci-device attached to the guest.
> The host runs with IOMMU enabled, and passthrough enabled.
>
> Following are the addresses of the bar0-region of the pci-device, as
> per the output of lspci -v :
>
> * On host (hpa) => e2c20000
> * On guest (gpa) => fc078000
>
>
> Now, if /proc/<qemu-pid>/maps is dumped on the host, following line of
> interest is seen :
>
> #############################################################################
> 7f0b5c5f4000-7f0b5c5f5000 rw-s e2c20000 00:0e 13653
>   anon_inode:[vfio-device]
> #############################################################################
>
> Above indicates that the hva for the pci-device starts from 0x7f0b5c5f4000.
>
>
> Also, upon attaching gdb to the qemu process, and using a slightly
> modified qemugdb/mtree.py (that prints only the information for
> 0000:0a:00.0 name) to dump the memory-regions, following is obtained :
>
> #############################################################################
> (gdb) source qemu-gdb.py
> (gdb) qemu mtree
>     00000000fc078000-00000000fc07c095 0000:0a:00.0 base BAR 0 (I/O) (@
> 0x56540d8c8da0)
>       00000000fc078000-00000000fc07c095 0000:0a:00.0 BAR 0 (I/O) (@
> 0x56540d8c76b0)
>         00000000fc078000-00000000fc07c095 0000:0a:00.0 BAR 0 mmaps[0]
> (I/O) (@ 0x56540d8c7c30)
> (gdb)
> #############################################################################
>
> Above indicates that the hva for the pci-device starts from 0x56540d8c7c30.
>
> As seen, there is a discrepancy in the two results.
>
>
> What am I missing?
> Looking for pointers, will be grateful.
>
>
> Thanks and Regards,
> Ajay

