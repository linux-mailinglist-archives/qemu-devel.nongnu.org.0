Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D619A112242
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 05:55:36 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icMhC-0007DU-8V
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 23:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1icMSu-000512-Br
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 23:40:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1icMSm-0008T4-Db
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 23:40:36 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:45303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1icMSl-0008C4-4l
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 23:40:32 -0500
Received: by mail-pj1-x1043.google.com with SMTP id r11so2428065pjp.12
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 20:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T1xxfmjBDCU6OPUHf00PBDkDb9YGfh04DGyAP/aGAUE=;
 b=wk/Ju48/kClQ0u2MDTAsk8G48GhR5V9kNbqQD9msxSilPnVwwb30uH5ss/XwfMIuUE
 RLUU0uASgFOy/A1Pk6TwX7Ow9VW0SPp2+QFcrJQpr4aE9qrlRY1MZADN0DmwFTXhX2lj
 tspa6FL+RpYsFFhGF5KFgJ6ZcsqxXLsIuDiEWV3fVF1LCO+8VQTPnzGMO/bzk2tE65zg
 idOjgPQKRJxzBImNVHGm/TVjUJ+i6ohDUIuWcxwO+KDBnrPbMDOiHVUfGl0pLD9kw1d+
 2HeMv8jPeR2jz/zuS5jWkUvCe8HkUS0YKe1S2WRrvazfTaldT/6Pvj+phq7ltkofQCph
 oDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T1xxfmjBDCU6OPUHf00PBDkDb9YGfh04DGyAP/aGAUE=;
 b=aV1/zQFCg/uuDXvNph6xoUfPSDNNhiMgNJavEXZZLckTinZgoTRCLb6bL1W/fX5JjD
 PXfseJjUkXFd/yPtiGSVDr9nc/CZMReUHHJdrJDBmsuSUUe3wQUqRT8Mjj4i/t0fNJfV
 GJJ6bHHrsmzJyb8lhxbM2eNYX4iSt+rqrt3RAiL5Jt7LRn73h4tpQHu+8K3d4gSopC7S
 T9szd2hKc42vLI9u3Flzj0Pt5bodNKCdM784ZZ5e8KIUklOHeHdJtc8GMt2Hm/Slm3cS
 gQqZe3iHfLQH9BEmT0MNoAxjEfc2AJvwWZv36p0tnX+Bu9ydFlp10cFHDSEHkxvjmCH7
 aLzQ==
X-Gm-Message-State: APjAAAVu9poXV1Ux+DJPXqTF7RtzWQs80A6gHS3LgJw6LOzBs/LD7KX9
 4kU/kjxsN7INFzrn2ygJp6Ge3Q==
X-Google-Smtp-Source: APXvYqxv3izc3EALubbwn9FwW3eh0k6ce8BEL17z8+JQjCK+Vq4vNGKAEmf/W0CvjIWJUjO6gfJ2kw==
X-Received: by 2002:a17:902:7c04:: with SMTP id x4mr1642987pll.0.1575434427543; 
 Tue, 03 Dec 2019 20:40:27 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n15sm5342962pgf.17.2019.12.03.20.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 20:40:26 -0800 (PST)
Subject: Re: [PULL v2 4/6] spapr: Add /chosen to FDT only at reset time to
 preserve kernel and initramdisk
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20191118105319.7658-1-lvivier@redhat.com>
 <20191118105319.7658-5-lvivier@redhat.com>
 <a65399f9-fb59-a54b-3185-1f48ee979d3d@redhat.com>
 <13846307-0e59-53b3-38cf-54270b43ed87@redhat.com>
 <96e02c6c-d381-1055-faca-406c475c94f4@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <d52bab1e-a7bd-acf5-3243-da8543b5bc2c@ozlabs.ru>
Date: Wed, 4 Dec 2019 15:40:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <96e02c6c-d381-1055-faca-406c475c94f4@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/12/2019 15:23, Alexey Kardashevskiy wrote:
> 
> 
> On 04/12/2019 03:09, Laurent Vivier wrote:
>>
>> Bad reply, the problem is with
>>
>> "spapr: Render full FDT on ibm,client-architecture-support"
> 
> 
> https://git.qemu.org/?p=SLOF.git;a=blob;f=board-qemu/slof/fdt.fs;h=3e4c1b34b8af2dcebde57e548c94417e5e20e1cc;hb=HEAD#l265
> 
> A "bit ugly" became really ugly as before we were only patching
> interrupt-map for PHB (7 cells per line) only but now we have to patch
> (or, rather, skip) the PCI bridge interrupt-map (9 cells per line).
> 
> Fixing now...


Basically, this:


diff --git a/board-qemu/slof/fdt.fs b/board-qemu/slof/fdt.fs
index 3e4c1b34b8af..463a2a8c0c2d 100644
--- a/board-qemu/slof/fdt.fs
+++ b/board-qemu/slof/fdt.fs
@@ -300,8 +300,13 @@ fdt-claim-reserve
    \ ." Replacing in " dup node>path type cr
    >r
    s" interrupt-map" r@ get-property 0= IF
-      ( old new prop-addr prop-len  R: node )
-      fdt-replace-interrupt-map
+      dup e00 = IF
+          ( old new prop-addr prop-len  R: node )
+          fdt-replace-interrupt-map
+      ELSE
+         2drop
+          ."  no idea what this is" cr
+      THEN
    THEN





> 
> 
>>
>> Sorry,
>> Laurent
>>
>> On 03/12/2019 16:57, Laurent Vivier wrote:
>>> On 18/11/2019 11:53, Laurent Vivier wrote:
>>>> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>
>>>> Since "spapr: Render full FDT on ibm,client-architecture-support" we build
>>>> the entire flatten device tree (FDT) twice - at the reset time and
>>>> when "ibm,client-architecture-support" (CAS) is called. The full FDT from
>>>> CAS is then applied on top of the SLOF internal device tree.
>>>>
>>>> This is mostly ok, however there is a case when the QEMU is started with
>>>> -initrd and for some reason the guest decided to move/unpack the init RAM
>>>> disk image - the guest correctly notifies SLOF about the change but
>>>> at CAS it is overridden with the QEMU initial location addresses and
>>>> the guest may fail to boot if the original initrd memory was changed.
>>>>
>>>> This fixes the problem by only adding the /chosen node at the reset time
>>>> to prevent the original QEMU's linux,initrd-start/linux,initrd-end to
>>>> override the updated addresses.
>>>>
>>>> This only treats /chosen differently as we know there is a special case
>>>> already and it is unlikely anything else will need to change /chosen at CAS
>>>> we are better off not touching /chosen after we handed it over to SLOF.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> Message-Id: <20191024041308.5673-1-aik@ozlabs.ru>
>>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> ---
>>>>  hw/ppc/spapr.c | 25 +++++++++++++++----------
>>>>  1 file changed, 15 insertions(+), 10 deletions(-)
>>>>
>>>
>>> This patch breaks pseries boot when we use a pci-bridge (since v4.2.0-rc0):
>>>
>>> ...
>>>     -device pci-bridge,id=pci_bridge1,bus=pci.0,addr=0x3,chassis_nr=1 \
>>>     -device virtio-scsi-pci,bus=pci_bridge1 \
>>> ...
>>>
>>> OF stdout device is: /vdevice/vty@71000000
>>> Preparing to boot Linux version 5.4.0-rc3+ (lvivier@localhost) (gcc
>>> version 4.8.5 20150623 (Red Hat 4.8.5-39) (GCC)) #2 SMP Wed Nov 13
>>> 09:08:20 EST 2019
>>> Detected machine type: 0000000000000101
>>> command line: BOOT_IMAGE=/vmlinuz-5.4.0-rc3+ root=/dev/mapper/rhel-root
>>> ro crashkernel=auto rd.lvm.lv=rhel/root rd.lvm.lv=rhel/swap
>>> Max number of cores passed to firmware: 2048 (NR_CPUS = 2048)
>>> Calling ibm,client-architecture-support...
>>>
>>> ( 300 ) Data Storage Exception [ 1dc5f230 ]
>>>
>>>
>>>     R0 .. R7           R8 .. R15         R16 .. R23         R24 .. R31
>>> 8000000000001000   000000001e477010   0000000000000000   000000001dc17500
>>> 000000001e67afe0   0000000020000004   0000000000000000   000000001dc1bf88
>>> 000000001dc21800   000000001dc5f248   000000001e477010   0000000000000003
>>> 000000001dc61000   000000001e78dc2d   000000001dc1c158   000000000000f001
>>> 0000000000000000   a000000000000001   0000000000008000   000000001e67b060
>>> 000000001dc5f230   0000000000000000   000000000000f003   ffffffffffffffff
>>> 000000001e745860   0000000000000000   0000000000000006   000000001dbf48f8
>>> 000000001dc5f248   0000000000000000   000000001e67b050   000000001dc1c350
>>>
>>>     CR / XER           LR / CTR          SRR0 / SRR1        DAR / DSISR
>>>         80000808   000000001dbf34d4   000000001dbf4194   0000000020000004
>>> 0000000020000000   000000001dbf48f8   8000000000001000           40000000
>>>
>>>
>>> 4a >
>>>
>>> Thanks,
>>> Laurent
>>>
>>
> 

-- 
Alexey

