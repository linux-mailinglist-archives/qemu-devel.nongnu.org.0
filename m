Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4547C8D5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 22:35:48 +0100 (CET)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzmnT-000349-Dr
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 16:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mzmlc-00029k-GI
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 16:33:52 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=37455
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mzmlZ-0001aI-IR
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 16:33:52 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id fo11so515548qvb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 13:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=92BLME1qj0DdlSO1wzYWmGQKYS6xUgdaELp1LJw3H3I=;
 b=R3v0/tdEwf0VHEtv2XIk7SZ8fnM6rgrW5bksPbToiICKqVHsbFFjWp2oTHznhPcliA
 Kdl81AvxpBwnPN6b+HM8qmqr3Oo8HJ8NuGFzmaDVMdorN/OfKygenk7txFYQ2V/lOuNw
 UnALNUdLQvXo2Q1BFJuQg6TPjFMJZVOGds/Iy33z6K2FWM/4exW4YoFZ2hR8ogtOqnjD
 HTdqdo/UnKut7WdRiEhKBzSa3pMJWCqR0/kkIKNOgzTCGUBHGKO0HnWPoX5MTE3NydiX
 umEV49GocuF/gRCHugBXsOcmRq7sWSRRrY9HAP8WXh8ELjBNOjCLxXOS462eJFTxX608
 zz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=92BLME1qj0DdlSO1wzYWmGQKYS6xUgdaELp1LJw3H3I=;
 b=CqVqfiv7AuVO8hbBza/aRx1LQjTUV7Xq2qcLdbtIYPK6Im9jmcWCyHAyJiOCOsq8pi
 fwZu8w6gLB9zTvaUpifOC/zaCb52HVU6mz8VBcBhlcQJxlCnLJ4FxlgQh2YvJrP92Ogn
 U4KY2VM5OnJBBhwwN1Dlqkeifq9QKFsHZxUk1VVOkUIUCYjEcrQdWiQVGEcJkXh3BGEX
 m5Eqm8/LLUpCTSYcYNAicrtz8rIWTf9XCIUB02bykfDjazJr2CyP6/uVQnGU2OUEy61g
 UQpsrxbaurTx0TOIvLtWSukTWUC8r7bIBL43XgrKAS5Of3oBthbIH+0cstYQnImSjeNF
 2uFA==
X-Gm-Message-State: AOAM532VnsY00Qi+tHzf6tICeXO2sKJ7jTAyA2Pyv0U2HUjbZtG1T5wV
 /rtP2j7ataS1Cw94AVwyQ0I=
X-Google-Smtp-Source: ABdhPJzTFEWGxxx3CCsfbmFWiODjPCjk/nc0GFU8JiB+uICxdCcdPtFmtwOCNpdse2hgAFuipAbzxA==
X-Received: by 2002:ad4:5def:: with SMTP id jn15mr187427qvb.109.1640122420684; 
 Tue, 21 Dec 2021 13:33:40 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:e707:b911:92d:ccb8:4968?
 ([2804:431:c7c7:e707:b911:92d:ccb8:4968])
 by smtp.gmail.com with ESMTPSA id r187sm152213qke.11.2021.12.21.13.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 13:33:40 -0800 (PST)
Message-ID: <8ab3b465-dfec-8579-2b96-e0383f9bcc6f@gmail.com>
Date: Tue, 21 Dec 2021 18:33:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: powernv gitlab ci regression
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, clombard@linux.vnet.ibm.com
References: <461a77d6-a5d2-0ba1-de95-bc8cfa5fb83b@linaro.org>
 <9f1947e0-86d8-60e4-87bf-f4a5ec0d6ea8@gmail.com>
 <a9031035-5623-d0ec-1e68-7f1371a4ee87@kaod.org>
 <b454cba4-7254-fbe6-0235-8a0778f2938d@gmail.com>
In-Reply-To: <b454cba4-7254-fbe6-0235-8a0778f2938d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/21/21 06:44, Daniel Henrique Barboza wrote:
> 
> 
> On 12/21/21 05:20, Cédric Le Goater wrote:
>> On 12/21/21 03:37, Daniel Henrique Barboza wrote:
>>> Hey,
>>>
>>> On 12/20/21 18:35, Richard Henderson wrote:
>>>> Hi guys,
>>>>
>>>> Somewhere within
>>>>
>>>>> Merge tag 'pull-ppc-20211217' of https://github.com/legoater/qemu into staging
>>>>> ppc 7.0 queue:
>>>>>
>>>>> * General cleanup for Mac machines (Peter)
>>>>> * Fixes for FPU exceptions (Lucas)
>>>>> * Support for new ISA31 instructions (Matheus)
>>>>> * Fixes for ivshmem (Daniel)
>>>>> * Cleanups for PowerNV PHB (Christophe and Cedric)
>>>>> * Updates of PowerNV and pSeries documentation (Leonardo and Daniel)
>>>>> * Fixes for PowerNV (Daniel)
>>>>> * Large cleanup of FPU implementation (Richard)
>>>>> * Removal of SoftTLBs support for PPC74x CPUs (Fabiano)
>>>>> * Fixes for exception models in MPCx and 60x CPUs (Fabiano)
>>>>> * Removal of 401/403 CPUs (Cedric)
>>>>> * Deprecation of taihu machine (Thomas)
>>>>> * Large rework of PPC405 machine (Cedric)
>>>>> * Fixes for VSX instructions (Victor and Matheus)
>>>>> * Fix for e6500 CPU (Fabiano)
>>>>> * Initial support for PMU (Daniel)
>>>>
>>>> is something that has caused a timeout regression in avocado-system-centos:
>>>>
>>>>>  (047/171) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '047-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2021-12-17T19.23-... (90.46 s)
>>>>>  (048/171) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '048-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2021-12-17T19.23-... (90.55 s)
>>>>
>>>> See e.g. https://gitlab.com/qemu-project/qemu/-/jobs/1898304074
>>>
>>> Thanks for letting us know. I bisected it and the culprit is this patch:
>>>
>>>
>>> commit 4db3907a40a087e2cc1839d19a3642539d36610b
>>> Author: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Date:   Fri Dec 17 17:57:18 2021 +0100
>>>
>>>      target/ppc: enable PMU instruction count
>>>
>>>
>>> This is a patch where I added instruction count in the ppc64 PMU. After this patch the
>>> performance of these 2 tests are degraded to the point where we're hitting timeouts in
>>> gitlab (didn't hit timeouts in my machine but the performance is noticeable worse).
>>>
>>> I'll need to see the serial console of the VM booting up to evaluate if there's some kernel
>>> module during boot time that is using the PMU and causing the delay. I'll also take a look
>>> into improving the performance as well (e.g. using more TCG code and avoid calling helpers).\

Just rewrote the fore-mentioned patch using TCG ops. Here's some numbers running the tests on
my local machine:

- using current master:

  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (71.00 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (69.57 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (76.04 s)


  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (72.62 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (76.50 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (73.58 s)


- after my TCG Ops rewrite to count instructions:


  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (39.97 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (40.19 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (41.76 s)

  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (40.88 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (41.49 s)
  (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (42.04 s)


Also, there's a high possibility that the code I wrote is not optimized since I'm not well
versed with TCG ops/code. I expect that after a couple of reviews from Richard we might be able
to bring down those numbers even further.


I'll clean this up and send for review.


Thanks,


Daniel



>>
>> Run with :
>>
>>    build/tests/venv/bin/avocado --show=app,console run -t machine:powernv9  build/tests/avocado/boot_linux_console.py
>>
>> * 6.2
>>
>> ...
>> console: [    1.559904] PCI: CLS 0 bytes, default 128
>> /console: [    8.830245] Initialise system trusted keyrings
>> console: [    8.832347] Key type blacklist registered
>> console: [    8.834558] workingset: timestamp_bits=54 max_order=14 bucket_order=0
>> console: [    9.073051] integrity: Platform Keyring initialized
>> console: [    9.073586] Key type asymmetric registered
>> console: [    9.074025] Asymmetric key parser 'x509' registered
>> console: [    9.075359] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
>> console: [    9.095115] IPMI message handler: version 39.2
>> console: [    9.096161] ipmi device interface
>> console: [    9.514308] ipmi-powernv ibm,opal:ipmi: IPMI message handler: Found new BMC (man_id: 0x000000, prod_id: 0x0000, dev_id: 0x20)
>> -console: [   10.171273] IPMI Watchdog: driver initialized
>> \console: [   10.974462] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
>> console: [   10.975059] hvc0: No interrupts property, using OPAL event
>> console: [   10.989699] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>> console: [   11.156033] brd: module loaded
>> console: [   11.235965] loop: module loaded
>> console: [   11.249922] libphy: Fixed MDIO Bus: probed
>> console: [   11.254128] i2c /dev entries driver
>> console: [   11.255782] powernv-cpufreq: ibm,pstate-min node not found
>> console: [   11.256134] powernv-cpufreq: Platform driver disabled. System does not support PState control
>> console: [   11.273326] ipip: IPv4 and MPLS over IPv4 tunneling driver
>> console: [   11.303989] NET: Registered protocol family 10
>> console: [   11.323651] Segment Routing with IPv6
>> console: [   11.325267] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>> console: [   11.335866] NET: Registered protocol family 17
>> console: [   11.336900] Key type dns_resolver registered
>> console: [   11.337358] secvar-sysfs: secvar: failed to retrieve secvar operations.
>> console: [   11.337877] drmem: No dynamic reconfiguration memory found
>> console: [   11.341767] Loading compiled-in X.509 certificates
>> console: [   11.362272] Loaded X.509 cert 'Build time autogenerated kernel key: 987b64c96d830fe42d02bbf502e028ebe85c2b4e'
>> console: [   11.667162] Key type encrypted registered
>> console: [   11.674616] ima: No TPM chip found, activating TPM-bypass!
>> console: [   11.676949] ima: Allocated hash algorithm: sha256
>> console: [   11.682967] Secure boot mode disabled
>> console: [   11.683726] Trusted boot mode disabled
>> console: [   11.684075] ima: No architecture policies found
>> console: [   11.748319] Freeing unused kernel memory: 13696K
>> console: [   11.748717] This architecture does not have kernel memory protection.
>> console: [   11.750290] Run /init as init process
>> /console: [   13.712943] udevd[74]: starting version 3.2.9
>> console: [   13.731186] random: udevd: uninitialized urandom read (16 bytes read)
>> console: [   13.735595] random: udevd: uninitialized urandom read (16 bytes read)
>> console: [   13.737907] random: udevd: uninitialized urandom read (16 bytes read)
>> -console: [   13.832821] udevd[75]: starting eudev-3.2.9
>> |console: [   16.333618] PTP clock support registered
>> console: [   16.601330] e1000e: Intel(R) PRO/1000 Network Driver
>> console: [   16.601791] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>> console: [   16.607410] e1000e 0001:02:03.0: enabling device (0100 -> 0102)
>> console: [   16.617706] e1000e 0001:02:03.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
>> console: [   16.697120] usbcore: registered new interface driver usbfs
>> console: [   16.699742] usbcore: registered new interface driver hub
>> console: [   16.702753] usbcore: registered new device driver usb
>> console: [   16.762288] nvme nvme0: pci function 0002:01:00.0
>> console: [   16.763998] nvme 0002:01:00.0: enabling device (0100 -> 0102)
>> /console: [   16.881654] rtc-opal opal-rtc: registered as rtc0
>> console: [   17.032286] rtc-opal opal-rtc: setting system clock to 2021-12-21T03:38:58 UTC (1640057938)
>> console: [   17.052213] nvme nvme0: 1/0/0 default/read/poll queues
>> console: [   17.055242] e1000e 0001:02:03.0 0001:02:03.0 (uninitialized): registered PHC clock
>> console: [   17.213376] e1000e 0001:02:03.0 eth0: (PCI Express:2.5GT/s:Width x1) 52:54:00:12:34:57
>> console: [   17.213982] e1000e 0001:02:03.0 eth0: Intel(R) PRO/1000 Network Connection
>> console: [   17.214655] e1000e 0001:02:03.0 eth0: MAC: 3, PHY: 8, PBA No: 000000-000
>> console: [   17.399217] xhci_hcd 0001:02:02.0: xHCI Host Controller
>> console: [   17.400904] xhci_hcd 0001:02:02.0: new USB bus registered, assigned bus number 1
>> console: [   17.408566] xhci_hcd 0001:02:02.0: hcc params 0x00080001 hci version 0x100 quirks 0x0000000000000014
>> -console: [   17.855122] hub 1-0:1.0: USB hub found
>> console: [   17.901064] hub 1-0:1.0: 4 ports detected
>> console: [   17.997599] xhci_hcd 0001:02:02.0: xHCI Host Controller
>> console: [   17.998280] xhci_hcd 0001:02:02.0: new USB bus registered, assigned bus number 2
>> console: [   17.999035] xhci_hcd 0001:02:02.0: Host supports USB 3.0 SuperSpeed
>> console: [   18.104390] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
>> console: [   18.311117] hub 2-0:1.0: USB hub found
>> console: [   18.481076] hub 2-0:1.0: 4 ports detected
>> console: [   18.676328] 1 fixed-partitions partitions found on MTD device flash@0
>> console: [   18.676887] Creating 1 MTD partitions on "flash@0":
>> PASS (42.00 s)
>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>> JOB TIME   : 42.60 s
>>
>>
>> * 7.0
>>
>> ....
>> console: [    3.669714] PCI: CLS 0 bytes, default 128
>> \console: [   38.778763] Initialise system trusted keyrings
>> console: [   38.781487] Key type blacklist registered
>> console: [   38.786515] workingset: timestamp_bits=54 max_order=14 bucket_order=0
>> |console: [   39.406270] integrity: Platform Keyring initialized
>> console: [   39.407161] Key type asymmetric registered
>> console: [   39.407879] Asymmetric key parser 'x509' registered
>> console: [   39.411112] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
>> console: [   39.458660] IPMI message handler: version 39.2
>> console: [   39.461141] ipmi device interface
>> console: [   39.864578] ipmi-powernv ibm,opal:ipmi: IPMI message handler: Found new BMC (man_id: 0x000000, prod_id: 0x0000, dev_id: 0x20)
>> /console: [   40.518598] IPMI Watchdog: driver initialized
>> \console: [   42.679606] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
>> console: [   42.680490] hvc0: No interrupts property, using OPAL event
>> console: [   42.718661] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>> console: [   43.131333] brd: module loaded
>> |console: [   43.331465] loop: module loaded
>> console: [   43.366052] libphy: Fixed MDIO Bus: probed
>> console: [   43.375750] i2c /dev entries driver
>> console: [   43.380135] powernv-cpufreq: ibm,pstate-min node not found
>> console: [   43.380691] powernv-cpufreq: Platform driver disabled. System does not support PState control
>> console: [   43.423981] ipip: IPv4 and MPLS over IPv4 tunneling driver
>> console: [   43.497912] NET: Registered protocol family 10
>> console: [   43.540218] Segment Routing with IPv6
>> console: [   43.542407] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>> console: [   43.568856] NET: Registered protocol family 17
>> console: [   43.570360] Key type dns_resolver registered
>> console: [   43.571289] secvar-sysfs: secvar: failed to retrieve secvar operations.
>> console: [   43.572075] drmem: No dynamic reconfiguration memory found
>> console: [   43.579066] Loading compiled-in X.509 certificates
>> console: [   43.621261] Loaded X.509 cert 'Build time autogenerated kernel key: 987b64c96d830fe42d02bbf502e028ebe85c2b4e'
>> console: [   44.052308] Key type encrypted registered
>> console: [   44.061477] ima: No TPM chip found, activating TPM-bypass!
>> console: [   44.064700] ima: Allocated hash algorithm: sha256
>> console: [   44.072905] Secure boot mode disabled
>> console: [   44.074908] Trusted boot mode disabled
>> console: [   44.075445] ima: No architecture policies found
>> /console: [   44.157077] Freeing unused kernel memory: 13696K
>> console: [   44.157843] This architecture does not have kernel memory protection.
>> console: [   44.160154] Run /init as init process
>> |console: [   47.520497] udevd[74]: starting version 3.2.9
>> console: [   47.555948] random: udevd: uninitialized urandom read (16 bytes read)
>> console: [   47.563916] random: udevd: uninitialized urandom read (16 bytes read)
>> console: [   47.567528] random: udevd: uninitialized urandom read (16 bytes read)
>> console: [   47.729266] udevd[75]: starting eudev-3.2.9
>> /console: [   49.004222] urandom_read: 5 callbacks suppressed
>> console: [   49.004347] random: udevd: uninitialized urandom read (16 bytes read)
>> |console: [   59.758967] PTP clock support registered
>> /console: [   60.749571] e1000e: Intel(R) PRO/1000 Network Driver
>> console: [   60.750176] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>> console: [   60.763411] e1000e 0001:02:03.0: enabling device (0100 -> 0102)
>> console: [   60.775134] e1000e 0001:02:03.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
>> console: [   60.840369] nvme nvme0: pci function 0002:01:00.0
>> console: [   60.842333] nvme 0002:01:00.0: enabling device (0100 -> 0102)
>> console: [   61.001290] usbcore: registered new interface driver usbfs
>> console: [   61.008092] usbcore: registered new interface driver hub
>> console: [   61.013320] usbcore: registered new device driver usb
>> -console: [   61.260003] e1000e 0001:02:03.0 0001:02:03.0 (uninitialized): registered PHC clock
>> console: [   61.439568] e1000e 0001:02:03.0 eth0: (PCI Express:2.5GT/s:Width x1) 52:54:00:12:34:57
>> console: [   61.440440] e1000e 0001:02:03.0 eth0: Intel(R) PRO/1000 Network Connection
>> console: [   61.441473] e1000e 0001:02:03.0 eth0: MAC: 3, PHY: 8, PBA No: 000000-000
>> console: [   61.453243] nvme nvme0: 1/0/0 default/read/poll queues
>> console: [   61.852525] rtc-opal opal-rtc: registered as rtc0
>> console: [   62.041247] rtc-opal opal-rtc: setting system clock to 2021-12-21T03:39:09 UTC (1640057949)
>> console: [   62.175046] xhci_hcd 0001:02:02.0: xHCI Host Controller
>> console: [   62.176904] xhci_hcd 0001:02:02.0: new USB bus registered, assigned bus number 1
>> console: [   62.188065] xhci_hcd 0001:02:02.0: hcc params 0x00080001 hci version 0x100 quirks 0x0000000000000014
>> \console: [   62.849997] hub 1-0:1.0: USB hub found
>> console: [   62.998795] hub 1-0:1.0: 4 ports detected
>> |console: [   63.232067] xhci_hcd 0001:02:02.0: xHCI Host Controller
>> console: [   63.233192] xhci_hcd 0001:02:02.0: new USB bus registered, assigned bus number 2
>> console: [   63.234507] xhci_hcd 0001:02:02.0: Host supports USB 3.0 SuperSpeed
>> console: [   63.468360] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
>> console: [   63.786654] hub 2-0:1.0: USB hub found
>> console: [   63.908912] hub 2-0:1.0: 4 ports detected
>> /console: [   65.069424] 1 fixed-partitions partitions found on MTD device flash@0
>> console: [   65.070221] Creating 1 MTD partitions on "flash@0":
>> PASS (89.13 s)
>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>> JOB TIME   : 89.77 s
>>
>>
>> Emulation is twice as slow.  That's not good.
>>
>>
>>> It might be the case that the performance gain is enough to make these tests happy again,
>>> although my initial guess is that there's something during boot that is starting the PMU and
>>> leaving it running.
>>
>> MMCR0 is set to 0 when kernel is started. I guess the modeling is wrong in
>> pmc_is_inactive() or pmc_get_event().
> 
> 
> Well that's not great. As far as the ISA goes, MMCR0 fully cleared indicates that the
> PMU is counting instruction and cycles in PMCs 5 and 6. In fact, the initial MMCR0
> value is explicitly set to 0x80000000 (frozen bit set) in cpu_init.c because of that.
> The programming note of section 10.2 of PowerISA 3.1 also mentions it:
> 
> ----
> The Performance Monitor can be effectively disabled (i.e., put
> into a state in which Performance Monitor SPRs are not altered
> and Performance Monitor exceptions do not occur) by setting
> MMCR0 to 0x0000_0000_8000_0000.
> -- 
> 
> Anyway, I just tested a new assumption where if all the PMU control registers (MMCR0,
> MMCR1, MMCR2 and MMCRA) are all cleared at the same time the PMU is not running. The idea
> is that this condition matches what we might see in an early boot. This fixed the problem
> with the avocado tests. I need to test this new condition with the pseries PMU and EBB test
> suits, but I have a guess that it'll be fine there as well - the Perf driver is always
> writing something in these registers when using the PMU.
> 
> 
> Meanwhile I'll see if I can get in touch with the Perf kernel folks. Setting MMCR0 to
> zero at kernel start, if you follow ISA 3.1 to the letter, will start event counting
> because all the frozen bits are cleared.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
>>
>> Thanks,
>>
>> C.

