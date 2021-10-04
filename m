Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD04210C3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:53:52 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOPf-0007N2-WC
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJs-00069f-40
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJp-0007Fn-Iu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so8441300wmg.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQGNxYIzjDT2KpIG15wKs4CsyjD5selTaWPYzGnp3lY=;
 b=NJmtSfBWeUGf0ZkOwNwa/TRMd9Hri900VmRu/Ghx+9yFsf69H4AD3giGGBzZZamawG
 ppZ710Q0klRwWEu5RhlOVLxv3CnMJ8WfIb3XQDyL8XAZsOtgvSjHRz/6ASfLMVsrefXP
 FnSL8sMTV6AOnQ6Ls1N13U2hsUxlJgc3xX8pxqwaMTjsxB+bCC2y/EmqiK1Dv6lrhg7T
 Wr8joWUNr6Hsjee6A4RGcAP/LrzyqvvDpghkbo875u1B+VPW4wGvqdHZD0R4AGG6Ddgz
 vI5DxE4vbIoKdEfp3M9DPYnCwTDQl3+nLHxWo3MqfTI+kP1t04vo0wW7XBneQAUA5ki1
 PPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQGNxYIzjDT2KpIG15wKs4CsyjD5selTaWPYzGnp3lY=;
 b=eIA6Ay1+eS/cK14hHksRpzE6q+/kZKwlXQv/b9Q9P6rBIHyKSAQLYTiIGTC1IEm4lV
 VXZ4GS5P5+yt3azVRRGzrlahDMYR3ljJTEvWrO5+fgmObOFW4CK93riIOc5tUSFIgIRH
 XQVlLuCUwCSEtJgTkri/m83YewyHTUrLDnIaWN9p4UbJ+heS8lrDl1bL3Fb7ULb2KCUp
 5P33dm87toyhykvapbw35ZpejrSr5xaXi+maF5A3QqwUqnyKYj32A3I3cetlbOcRhBmi
 0ccGrDcNQYqisFTubhXB0bl4lNDEUONw68xr0IRfPzI2UPbAtF9mArJ1vr6bfF/N6DXw
 SAOA==
X-Gm-Message-State: AOAM5305mBfFnDwL5S5sYwhyCF0ig7JbyBmEJ3bDy+YmcgSa40Yyw//v
 3hCmfmVD3EMPSRl9z2CylaQtGnKR6qaFMQ==
X-Google-Smtp-Source: ABdhPJwFS+H442u4DzfKLkROuCdni98UhKroC3x2LMScfeCXCuQf+/Yu3oU4soU2Rdd0h4379bvBHg==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr18110891wmc.75.1633355268113; 
 Mon, 04 Oct 2021 06:47:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q18sm16658640wmc.7.2021.10.04.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:47:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B1531FF96;
 Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/7] enabling RasperryPi 4 emulation - WIP state
Date: Mon,  4 Oct 2021 14:47:34 +0100
Message-Id: <20211004134742.2044280-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phillipe,

I needed to test some Xen things on a model I could debug so I took
the liberty of re-basing you patches from a 2 years ago. Most of the
changes involve dropping patches since merged and dealing with the
resultant merging fallout. The fix I posted on Friday for the
calculation of the ram base for kernel loading is included. Other
tweaks involve moving the location of peri_base to what is indicated
by the DTBs (I'm still not sure where the Linux addresses come from,
does it re-map the physical address space somewhere?).

My testing ended at getting Xen to boot up and at least echo some
stuff to the console:

  ./qemu-system-aarch64 -machine raspi4b -serial mon:stdio -kernel ~/lsrc/xen/xen-only.cross.arm64/xen/xen -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all console=d
  tuart dtuart=serial0 sync_console" -display none -dtb ./bcm2711-rpi-4-b.dtb            
  - UART enabled -                                                                      
  - Boot CPU booting -                       
  - Current EL 00000008 -                    
  - Initialize CPU -                                                                    
  - Turning on paging -               
  - Zero BSS -                                                                          
  - Ready -                             
  (XEN) Checking for initrd in /chosen
  (XEN) RAM: 0000000000000000 - 000000003bffffff            
  (XEN)                               
  (XEN) MODULE[0]: 0000000000200000 - 000000000034d0c8 Xen         
  (XEN) MODULE[1]: 0000000008000000 - 000000000801cea4 Device Tree 
  (XEN)  RESVD[0]: 0000000000000000 - 0000000000001000
  (XEN)                                
  (XEN)                               
  (XEN) Command line: <NULL>              
  (XEN) Domain heap initialised                                                         
  (XEN) Booting using Device Tree        
  (XEN) Platform: Raspberry Pi 4                                                        
  (XEN) No dtuart path configured
  (XEN) Bad console= option 'dtuart'

My next steps involve debugging Xen so I thought I'd post where I am
for the next person that wants to properly wire up the Pi4.

Alex Bennée (1):
  hw/arm: fix the position of vcram for raspi

Philippe Mathieu-Daudé (6):
  hw/misc/bcm2835_property: Add FIXME comment for uninitialized memory
  hw/misc/bcm2835_property: Handle the 'domain state' property
  hw/arm/bcm2835_peripherals: Map various BCM2711 blocks
  hw/arm/bcm2836: Add the BCM2711 which uses a GICv2
  hw/arm/bcm2838: Map the PCIe memory space
  hw/arm/raspi: Add the Raspberry Pi 4B board

 include/hw/arm/bcm2835_peripherals.h |  9 ++-
 include/hw/arm/bcm2836.h             |  3 +
 include/hw/arm/raspi_platform.h      | 14 +++++
 hw/arm/bcm2835_peripherals.c         | 38 +++++++++---
 hw/arm/bcm2836.c                     | 89 ++++++++++++++++++++++++++++
 hw/arm/raspi.c                       | 34 ++++++++---
 hw/misc/bcm2835_property.c           | 10 ++++
 7 files changed, 179 insertions(+), 18 deletions(-)

-- 
2.30.2


