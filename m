Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D153542A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:57:22 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuJbl-0007Is-HW
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nuJad-0005o6-FD
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nuJaZ-0000wc-UB
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653594967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GKFioNg/Fk4gKHlQSBMfqGjHefJA6NFNJPkJumAE+c8=;
 b=bpTzSde+GD8qiw1zj/FoMf/3qwbaRVjT8xBVOwgt12rVn4AXrSw1Z/XcAkq78HOlUsuATT
 7bW0TLUwayuL/nq4dqMQ1AR31uye2JoQJjYHucth8IDodtiS+KmwpX4XJ+Pt7FNv9I7Q8P
 hW9HcBhEIFJQ3/4bqY48UW6sAw4qct8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-q_SfadGyNQSvmieN1NSNyg-1; Thu, 26 May 2022 15:56:06 -0400
X-MC-Unique: q_SfadGyNQSvmieN1NSNyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so1522070wmj.0
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 12:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GKFioNg/Fk4gKHlQSBMfqGjHefJA6NFNJPkJumAE+c8=;
 b=jRJEPPje6zJV/K0tIeNmzmKtPAWAV5e7up/giRNfeAghXkDrZOsLJGTYa798HiNq59
 QbZd3lDHd5YXf1zb4K9MYoRKcosY3qMv6iuRSxvYlICpKhvq1T7dojEx5n/uVcS4QSMS
 MqZD9QJIgO/q8yVVchXoySDlg2ML53wRdq6fk1XaIoGl/PGJeYhhYrty64rCJPzToVe3
 /qAv9JK9hT9vT7IJrCfOAHIaaK+8ms7Pkjflvxeofvv6Xknn3Q7PQrdxF9d60gcSgRpw
 QOcCk4/NsZzGXjxU9kealqAnily/m5UizbfKVlKijIVPkZGOvzbn0UI1FwIP1yvrH3QH
 7pbg==
X-Gm-Message-State: AOAM531fdXIyXoP5LML/+iqBV5PgYVXPPLnNaNcpwGk61I+dPw7zrLVF
 nUErLIC8EJ/ZK7osWCJNpJM3+SMAZdmnQJvCWu/ZgU9TUIt8T22AYm/WgIGtSFje4+ambgE++0e
 SS2Dxj/ouNPg3YKU=
X-Received: by 2002:adf:f948:0:b0:20f:f964:7621 with SMTP id
 q8-20020adff948000000b0020ff9647621mr10475744wrr.235.1653594964689; 
 Thu, 26 May 2022 12:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnlxEA6Pr3FtYJrf95N8WjM32kJaiTr8Eo6ZjJ4Ky8eSfTJcY8ia0YIqbHk778YeJyFC+ZaA==
X-Received: by 2002:adf:f948:0:b0:20f:f964:7621 with SMTP id
 q8-20020adff948000000b0020ff9647621mr10475727wrr.235.1653594964355; 
 Thu, 26 May 2022 12:56:04 -0700 (PDT)
Received: from redhat.com ([2.55.29.191]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b002100c6cce6bsm21666wrp.109.2022.05.26.12.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 12:56:03 -0700 (PDT)
Date: Thu, 26 May 2022 15:55:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Cedric Le Goater <clg@kaod.org>
Subject: Re: [PULL v2 75/86] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_SIZE_MAX
Message-ID: <20220526153640-mutt-send-email-mst@kernel.org>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-76-mst@redhat.com>
 <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
 <de56b35-c77-e979-b8bd-17c439f4b56d@eik.bme.hu>
 <28f2b859-7ca4-d779-d94b-c9dc3e21ed39@eik.bme.hu>
 <20220526150859-mutt-send-email-mst@kernel.org>
 <693fe9cc-ee68-a3dd-3639-81521dd954b@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693fe9cc-ee68-a3dd-3639-81521dd954b@eik.bme.hu>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 26, 2022 at 09:34:08PM +0200, BALATON Zoltan wrote:
> On Thu, 26 May 2022, Michael S. Tsirkin wrote:
> > On Thu, May 26, 2022 at 06:43:25PM +0200, BALATON Zoltan wrote:
> > > On Thu, 26 May 2022, BALATON Zoltan wrote:
> > > > Hello,
> > > > 
> > > > On Thu, 26 May 2022, Daniel Henrique Barboza wrote:
> > > > > Hi,
> > > > > 
> > > > > This patch broke the boot of the sam460ex ppc machine:
> > > > > 
> > > > > qemu-system-ppc -M sam460ex -kernel
> > > > > ./buildroot/qemu_ppc_sam460ex-latest/vmlinux \
> > > > > -device virtio-net-pci,netdev=net0 -netdev user,id=net0 -serial mon:stdio \
> > > > > -nographic -snapshot
> > > > > qemu-system-ppc: ../hw/pci/pcie_host.c:97: pcie_host_mmcfg_init:
> > > > > Assertion `size <= PCIE_MMCFG_SIZE_MAX' failed.
> > > 
> > > With just qemu-system-ppc -M sam460ex the assert seems to happen when the
> > > guest (board firmware?) writes a value to CFGMSK reg:
> > > 
> > > (gdb) bt
> > > #0  0x00007ffff68ff4a0 in raise () at /lib64/libc.so.6
> > > #1  0x00007ffff68ea536 in abort () at /lib64/libc.so.6
> > > #2  0x00007ffff68ea42f in _nl_load_domain.cold () at /lib64/libc.so.6
> > > #3  0x00007ffff68f7ed2 in  () at /lib64/libc.so.6
> > > #4  0x000055555596646f in pcie_host_mmcfg_init (e=e@entry=0x5555567942f0, size=size@entry=0x20000000) at ../hw/pci/pcie_host.c:97
> > > #5  0x000055555596653b in pcie_host_mmcfg_map (size=0x20000000, addr=0xd20000000, e=0x5555567942f0) at ../hw/pci/pcie_host.c:105
> > > #6  pcie_host_mmcfg_update (e=0x5555567942f0, enable=0x1, addr=0xd20000000, size=0x20000000) at ../hw/pci/pcie_host.c:118
> > > #7  0x0000555555a70d7c in ppc_dcr_write (dcr_env=0x555556669c10, dcrn=0x122, val=0xe0000001) at ../hw/ppc/ppc.c:1418
> > > #8  0x0000555555abdabb in helper_store_dcr (env=0x555556633360, dcrn=0x122, val=0xe0000001) at ../target/ppc/timebase_helper.c:188
> > > 
> > > This is done in the board firmware here:
> > > 
> > > https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD#l963
> > > 
> > > when trying to map config space. Here the size is calculated as 0x20000000
> > > which does not fit the assert. I'm not sure what this means though and where
> > > is the problem. Any ideas?
> > > 
> > > Regards,
> > > BALATON Zoltan
> > 
> > 
> > It says so, does it not?
> > 
> > 1051         switch (port) {
> > 1052         case 0:
> > 1053                 mtdcr(DCRN_PEGPL_CFGBAH(PCIE0), high);
> > 1054                 mtdcr(DCRN_PEGPL_CFGBAL(PCIE0), low);
> > 1055                 mtdcr(DCRN_PEGPL_CFGMSK(PCIE0), 0xe0000001); /* 512MB region, valid */
> > 1056                 break;
> > 1057         case 1:
> > 1058                 mtdcr(DCRN_PEGPL_CFGBAH(PCIE1), high);
> > 1059                 mtdcr(DCRN_PEGPL_CFGBAL(PCIE1), low);
> > 1060                 mtdcr(DCRN_PEGPL_CFGMSK(PCIE1), 0xe0000001); /* 512MB region, valid */
> > 1061                 break;
> > 1062 #if CONFIG_SYS_PCIE_NR_PORTS > 2
> > 1063         case 2:
> > 1064                 mtdcr(DCRN_PEGPL_CFGBAH(PCIE2), high);
> > 1065                 mtdcr(DCRN_PEGPL_CFGBAL(PCIE2), low);
> > 1066                 mtdcr(DCRN_PEGPL_CFGMSK(PCIE2), 0xe0000001); /* 512MB region, valid */
> > 1067                 break;
> > 1068 #endif
> 
> Yes, the size matches what the firmware programs it.
> 
> > and basically according to spec max size is 256MB.
> 
> Maybe this SoC does not follow the spec you're referring to? Complies to
> some other spec like a newer version or has its own idea? I don't have docs
> to tell.
> 
> > we can fix the firmware of course, or we can just drop the assert,
> > or force it within range in the ppc code.
> 
> According to this random Cisco IOS dump I've found:
> 
> https://www.hardware.com.br/comunidade/switch-cisco/1128380/
> 
> looks like this value is valid on that hardware so that likely means we
> should not "fix" the firmware. (Also not because it's what the real board
> uses or at least very close to it so it should work with the emulated board
> too and keeping it close to the real hardware ensures the emulation is
> accurate.) That means we should either revert this back (why was this
> changed back in the first place, did it cause any problems?) or maybe try
> restricting the value in the PPC model.

It didn't it was just weird behaviour. High bit in the address was
ignored, so the config space was mapped many times at offsets
0,256M, etc up to whatever size was.
> > Fixing firmware seems cleaner ... want to try?
> > Any preference?
> 
> I'd leave making a patch to someone else but can help testing it. As per the
> above if we can't revert it maybe we can try restricting size in ppc440_uc.c
> where pcie_host_mmcfg_update() is called. Since the PCIe bus on this board
> probably does not work now anyway probably nothing will notice this for now.
> 
> Regards,
> BALATON Zoltan


I am guessing the unused space is just ignored.
so I am inclined to restrict in PPC model,
where we also have a chance to document what is going on.




diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 993e3ba955..a1ecf6dd1c 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
     case PEGPL_CFGMSK:
         s->cfg_mask = val;
         size = ~(val & 0xfffffffe) + 1;
+        /*
+         * Firmware sets this register to E0000001. Why we are not sure,
+         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
+         * ignored.
+         */
+        if (size > PCIE_MMCFG_SIZE_MAX) {
+            size = PCIE_MMCFG_SIZE_MAX;
+        }
         pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
         break;
     case PEGPL_MSGBAH:


