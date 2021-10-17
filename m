Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45B430AFC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:58:00 +0200 (CEST)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc9Tz-0007Ag-7V
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mc9SO-0006SD-SF
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:56:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mc9SL-0005o5-9x
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:56:20 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDhV1-1mT6lN15bb-00Ao4C; Sun, 17 Oct 2021 18:56:14 +0200
Subject: Re: [PATCH 8/8] q800: add NMI handler
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-9-mark.cave-ayland@ilande.co.uk>
 <40098631-e3de-b334-43a7-e0e7ff2751c4@vivier.eu>
 <20e94c6d-99e7-2ecd-412d-20265ab43c97@ilande.co.uk>
 <e17830c6-2b0c-c42e-423d-a1008da8a82f@vivier.eu>
 <1e25bce7-4b37-0e42-7b99-6b173e255262@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <50238fee-e5ae-671a-59cd-b46b41d1f6ff@vivier.eu>
Date: Sun, 17 Oct 2021 18:56:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1e25bce7-4b37-0e42-7b99-6b173e255262@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1EMS9sNUkDWd4Gd1EWD0wAx3+YL0VZQj7hUhpUIO5LvlA7kRmc5
 6X9ZbVjk1TuDELcsbz+wdym9cMRkVNWUBCEakaS0VAdeQgO7Cf7aIYfvhxeBYCk5NQwXEmZ
 VZRBCZJqz+50bRYPn+g6hDwQwQWwxwj++UgACRGtOQXm91lrrmyROYsjdDhopC9qDYiblt2
 1AijriXJPzY7HHkg6L4QQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V2exOHRm1rI=:skt3VEc8qT5WZSdIKuKoEu
 adzr851OYtgvSIEEX0RB7PoKAOiYgbegobXF7N0zx5IxaKc1AZs4m8gUd6TsW8fodbbFlVq8W
 XWsCRxmj0Lbd7frGF+hcvC967lQ0AyB0/O+Vw0JDGtW67mYHXnbH9G4tzBZcFzYaZ3O6oPuBF
 cK0AlRriwyiFkbCJVMo7hJyY9E5+/4PJ7ETgwaS7/HVXLJko7ECZX7SDbmd/raMQtx6i4K3m4
 RKIP6lQtdpsBXFD/IRmkCneDktb9hvGZG3oPpeLD4HQif9G9Zwnih8Bp1S0qE8tmWRF/i2Eb/
 eLW7+3FykVbjekFCDwZKTxFoHt0N9GbPSlGMN/rDSxlJjD3CalV/NR1TAzLkpsD0LJg19g6Em
 33utdCArNY/+1/DQLwN8thfB71LYer+7gbNzgbk4Y+pK9v1hAf9MNXvA4+lZYDz4ljC1V//id
 jIltvWrASXUMB+Wk2Z3IZkbo96oJbrZ1s+Hm+krYk3EEnPqoq50P9Vod7vA3nmkMQKtSvBEOU
 4a3pTATaIn9kfc/YpwWBCisn64loaXpXFsnA/fyVJzyFZpaaGePF+xjOJB//1RIZiYvOpI0lA
 FdK/GZbPU9cRDH9VRwRayW9RmrKMDQUdfR8/OGz4pLOCyrlJZM8On7fJx/MXovQSWOkwrq+9j
 mZKLe0j9rbgrx4cuXoXHBRaqW+bNsaTSy4nis1ByPFpB1HY6JVP+F2DKvDZXUnUyntO0uxfEy
 +B38CFMVDSD1dDgspwG/6stv4SstX13AXzKFGA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 17/10/2021 à 12:00, Mark Cave-Ayland a écrit :
...
> I've just tried this on Linux, and it seems to work okay although I get several copies of the
> register dump on the console for a single invocation of "info nmi" e.g.
> 
> [    4.610000] Non-Maskable Interrupt
> [    4.610000] Modules linked in: mac_esp(+) esp_scsi macsonic
> [    4.610000] PC: [<00002dc0>] arch_cpu_idle+0x4/0x6
> [    4.610000] SR: 2000  SP: (ptrval)  a2: 00395314
> [    4.610000] d0: 00000000    d1: 00000002    d2: 0004b492    d3: 00392000
> [    4.610000] d4: 00000000    d5: 00000000    a0: 00392000    a1: 00395314
> [    4.610000] Process swapper (pid: 0, task=(ptrval))
> [    4.610000] Frame format=0
> [    4.610000] Stack from 00393f9c:
> [    4.610000]         0004b540 00000431 0040ee22 0004b4c4 0002bf6a 004005f0 00393ff8 0004b714
> [    4.610000]         0003e23a 0029c518 000000c2 0040eb54 3dc1e5d0 00000000 0004ff74 0003efe2
> [    4.610000]         003f4e92 00000000 00000040 00000000 00000000 00000000 0040ee22 00000000
> [    4.610000]         003f3872
> [    4.610000] Call Trace: [<0004b540>] do_idle+0x7c/0xd2
> [    4.610000]  [<0004b4c4>] do_idle+0x0/0xd2
> [    4.610000]  [<0002bf6a>] kernel_thread+0x0/0x26
> [    4.610000]  [<004005f0>] __alloc_bootmem+0x0/0x38
> [    4.610000]  [<0004b714>] cpu_startup_entry+0xe/0x12
> [    4.610000]  [<0003e23a>] find_task_by_pid_ns+0x0/0x22
> [    4.610000]  [<0029c518>] rest_init+0x78/0x82
> [    4.610000]  [<0004ff74>] printk+0x0/0x18
> [    4.610000]  [<0003efe2>] parse_args+0x0/0x2c2
> [    4.610000]  [<003f4e92>] start_kernel+0x43e/0x448
> [    4.610000]  [<003f3872>] _sinittext+0x872/0x11f8
> [    4.610000] Code: bc00 0060 f210 f0ff 7001 60cc 4e72 2000 <4e75> 2079 003b fc6c 4a88 6702 4e90
> 60fe 2079 003b fc68 4a88 6702 4e90 60fe 2f0c
> 
> (repeated 7 or 8 times)
> 
> MacsBug seems to handle this better: as soon as the NMI is triggered, MacsBug opens and displays
> "NMI" both if the programmer switch GPIO is held active, or pulsed as implemented in the patch. When
> using the above patch, subsequent NMI triggers do not display "NMI" or change MacsBug in any visible
> way which suggests that once the NMI is triggered, the NMI is ignored until the programmers switch
> GPIO is inactive once again.
> 
> Do you see the repeated register output in Linux for a single press of the programmers switch on a
> real Quadra 800? It may be that Linux could be improved by having similar logic.

In fact, register output is repeated while I keep the button pressed (5.14 kernel provided by Finn)

If I press and release one (or several) time(s) before the end of the first output I have only one
output.

Thanks,
Laurent

