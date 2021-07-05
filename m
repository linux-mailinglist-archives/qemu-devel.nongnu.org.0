Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EEC3BBA84
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:51:47 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LGT-0007S7-8L
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0LFS-0006le-3u
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:50:42 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0LFQ-00006Z-Ca
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:50:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso3355748wms.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fbcxD0ZcjBEjOCQgiJZCY+iSbum6jiVE6FY3tAv5xvM=;
 b=RYu3O+/GT6oQzc2Moq7qA9E9h5oJxP1ygX0fJtvrzTvcWwnbiR2qGqZBR299pIcFG3
 D3EtuVYmToNcpuOHGfp55CkjAP0Dv79RrWk8U9Hh/ltqeM5eKHPXMblo4mmCaBRsXmtD
 ihyvN23UWSLhCtXQuH9bPX4XIcNAue9AEM52JHO+UN3WaCo31aBPIOyVBIPPP+xbHpS9
 PySnfceaq+B8HmQ9RxTGzv0IuLDzGnzxDOdM0HMjGWVnRJ3Ge//6/R2ynK3dSXhS1zFD
 1e0YL1KS8JC0j6QN+1xZYGbRLw7fhuqKzMKGtcrD14hVxCwBTtDmI/L7iWHwdZBbaxNf
 pHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fbcxD0ZcjBEjOCQgiJZCY+iSbum6jiVE6FY3tAv5xvM=;
 b=s9WkU3a8QawZEjfEYItDFVPaLf91nQ9t6oBvxIjNhRzMBBwMNdC/TBVA8TEr38C6Nf
 yZdlOvYgdz7u5eMDOD/T98wMkaX2Rw5QMQJgcm+5/E/rj4I0a8MgauCgUgqvTK+NVaMN
 R2f9sZIHmasKJYCfEsP/Z4B/8MJWHIDfuSDd9r2mQs+UO/h63zBSM8bSjc+ds+irI0lX
 +kXZuQWWStn4mu82n2PVVxTBQ9MaLdNfe4XvYgx36zYNjVT90kddm9+Fk/yTZBvVin8P
 dIG2FOyAsqDB3Y0ZAjmkS2zySZenOzGnQyis0HBDrK1qsWk0a0AiZt0bqNGmz1cgInWZ
 zvyQ==
X-Gm-Message-State: AOAM533NcLoJ0/rQyNI3utsGq1+/WsA7aEVrC4eRXLcadXAb4oQ6hdUV
 h6r33Bctce5Z0KmtUtMfbO8=
X-Google-Smtp-Source: ABdhPJxBn37TmZuhyM8hRDFbe76PBodXhwOAcCq8VthOi7fy9tfLX0g9JmnMi1uvAB8sVYn6geGUzQ==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr13797993wmh.104.1625478638351; 
 Mon, 05 Jul 2021 02:50:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm11678150wrr.54.2021.07.05.02.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 02:50:37 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Test NetBSD 5.1 on the Jazz Magnum
 machine
To: Finn Thain <fthain@linux-m68k.org>
References: <20210705002618.745807-1-f4bug@amsat.org>
 <a71eea-5054-c4a-4632-531bb6d66b3@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b82e1528-1659-68d2-8e6f-d40e3d97a475@amsat.org>
Date: Mon, 5 Jul 2021 11:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a71eea-5054-c4a-4632-531bb6d66b3@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 2:58 AM, Finn Thain wrote:
> On Mon, 5 Jul 2021, Philippe Mathieu-Daudé wrote:
> 
>> Test NetBSD 5.1 on the Jazz Magnum machine. As the firmware is not
>> redistributable, it has to be extracted from the floppy configuration
>> disk coming with a Mips Magnum 4000 system, then the NTPROM_BIN_PATH
>> environment variable has to be set. For convenience a NVRAM pre-
>> initialized to boot NetBSD is included. The test can be run as:
>>
>>   $ NTPROM_BIN_PATH=/path/to/ntprom.bin \
>>     avocado --show=app,console \
>>     run -t machine:magnum tests/acceptance/
>>   Fetching asset from tests/acceptance/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_5_1
>>    (1/1) tests/acceptance/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_5_1:
>>   console: EISA Bus 0 Initialization In Progress... Direct Memory Access (DMA) System Control Port B Timer 1 OK.
>>   console: ARC Multiboot Version 174 (SGI Version 2.6)
>>   console: Copyright (c) 1991,1992  Microsoft Corporation
>>   console: Actions:
>>   console: Start Windows NT
>>   console: Run a program
>>   console: Run setup
>>   console: Use the arrow keys to select.
>>   console: Press Enter to choose.
>>   console: Program to run:
>>   console: scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)netbsd
>>   console: NetBSD/arc Bootstrap, Revision 1.1
>>   console: (builds@b7.netbsd.org, Sat Nov  6 14:06:36 UTC 2010)
>>   console: devopen: scsi(0)cdrom(2)fdisk(0) type disk file netbsd
>>   console: NetBSD 5.1 (RAMDISK) #0: Sat Nov  6 14:17:36 UTC 2010
>>   console: builds@b7.netbsd.org:/home/builds/ab/netbsd-5-1-RELEASE/arc/201011061943Z-obj/home/builds/ab/netbsd-5-1-RELEASE/src/sys/arch/arc/compile/RAMDISK
>>   console: MIPS Magnum

>> +class MipsJazz(Test):
>> +
>> +    timeout = 60
>> +
>> +    @skipUnless(os.getenv('NTPROM_BIN_PATH'), 'NTPROM_BIN_PATH not available')
>> +    def test_magnum_netbsd_5_1(self):
>> +        """
>> +        :avocado: tags=arch:mips64el
>> +        :avocado: tags=machine:magnum
>> +        :avocado: tags=os:netbsd
>> +        :avocado: tags=device:sonic
>> +        :avocado: tags=device:esp
>> +        """
>> +        drive_url = ('http://archive.netbsd.org/pub/NetBSD-archive/'
>> +                     'NetBSD-5.1/iso/arccd-5.1.iso')
> 
> This can be updated to NetBSD 9.2 (the regressions in NetBSD have been 
> fixed).

Indeed, with this change:

-- >8 --
diff --git a/tests/acceptance/machine_mips_jazz.py
b/tests/acceptance/machine_mips_jazz.py
index 0b6640edc12..54968959372 100644
--- a/tests/acceptance/machine_mips_jazz.py
+++ b/tests/acceptance/machine_mips_jazz.py
@@ -33,13 +33,11 @@ def test_magnum_netbsd_5_1(self):
         :avocado: tags=device:sonic
         :avocado: tags=device:esp
         """
-        drive_url = ('http://archive.netbsd.org/pub/NetBSD-archive/'
-                     'NetBSD-5.1/iso/arccd-5.1.iso')
-        drive_hash = ('c91a57fb373636247d1f1ce283a610ba529e208604a'
-                      'f2a9e0237551fb3d25459c7697775af8c8d35a9764e'
-                      'fca87cfb591f363643e93417cfdb8857215ceb405e')
+        drive_url = ('http://cdn.netbsd.org/pub/NetBSD/'
+                     'NetBSD-9.2/images/NetBSD-9.2-arc.iso')
+        drive_hash = '409c61aee5459e762cdb120d2591ed2e'
         drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash,
-                                      algorithm='sha512')
+                                      algorithm='md5')
         ntprom_hash = '316de17820192c89b8ee6d9936ab8364a739ca53'
         ntprom_path = self.fetch_asset('file://' +
os.getenv('NTPROM_BIN_PATH'),
                                        asset_hash=ntprom_hash,
algorithm='sha1')
---

I get:

console: [   1.0000000] NetBSD 9.2 (RAMDISK) #0: Wed May 12 13:15:55 UTC
2021
console: [   1.0000000]
mkrepro@mkrepro.NetBSD.org:/usr/src/sys/arch/arc/compile/RAMDISK
console: [   1.0000000] MIPS Magnum
...
console: # [   6.1232105]
pmap_tlb_update_addr(0x87eb5f60,0x69a000,0x1ee59e, 0)
...
console: [  20.2174752] rebooting...
PASS (48.98 s)

>> +        nvram_path = 'nvram.bin'
> 
> Does the test work when nvram.bin is uninitialized by the ARC firmware?

No, because the serial is not used by default.

> Perhaps the default MAC address (from the SONIC PROM) would be more 
> appropriate? Alternatively, if you want to check that '00:00:00:02:03:04' 
> actually got used, you can do this:
> 
> erase ^H, werase ^W, kill ^U, intr ^C, status ^T
> Terminal type? [vt100] 
> Erase is backspace.                                                     
> (I)nstall, (S)hell or (H)alt ? s
> # ifconfig
> sn0: flags=0x8802<BROADCAST,SIMPLEX,MULTICAST> mtu 1500
>         ec_capabilities=1<VLAN_MTU>
>         ec_enabled=0
>         address: 00:00:00:02:03:04
> lo0: flags=0x8048<LOOPBACK,RUNNING,MULTICAST> mtu 33160
> # 

I noticed it was not working, maybe I'm missing one of Mark's patches.

Thanks for the review,

Phil.

