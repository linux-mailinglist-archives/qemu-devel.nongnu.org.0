Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1053A4D72
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 09:41:58 +0200 (CEST)
Received: from localhost ([::1]:59470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lryHE-0002jP-6t
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 03:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lryG6-00023l-M7
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 03:40:46 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lryG4-0002dW-O7
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 03:40:46 -0400
Received: by mail-wm1-x32b.google.com with SMTP id f17so9227807wmf.2
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 00:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8hqe85GvuRnyViemNFdOP8Igz+UPtCkU/VFHHAEnffs=;
 b=afMm90EjzKRf8djhbdHSAhlj0MWdXQ+ciExyn317YIkjahWrnwPbs8XiMLwL6yF47E
 m5iWuWAO54YYYhq08JUAwHfd2fN8S5Knry+CUZN6WgdtNeyCBRiFmsKGvaqwkc3Qy6K0
 0CRFXfQtfkUJ/s1cCc12oY1SoLr5qq2wNe1Cs7OYPjZ1CQMIHWddaXB2HEJ/KxyzTamX
 D+AZwxegvPJX7mXEk5hmGg+5wCHO6QdLlWyjWWXTnzZv9kYGlLGfQHyA302HTOpZ/nTR
 3o/4cVuvEuJ+WEx9CiUXnJd09aTKpq33VmZ2hmJhIZuqWX3pjU210jbLZ+djj75D6V0Q
 5RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8hqe85GvuRnyViemNFdOP8Igz+UPtCkU/VFHHAEnffs=;
 b=HZNRc1x7T0H3AuGbM7XKeTzr99A5T6gPZaeO4jRjW7JWMruX3EpDRnNVHd33Mc97hF
 Z3soU6hVJ7Cs8cNhxP0jjF13249iRA5N/p78EccQTDvFiNsr88SfBpMVexj95pP+xpXp
 tW5H33YFOaGtFuxKk6uefwG/6rm6emJ9uIcxBzOobIKffgv8xzZqTmK5xfvYpCmEYp/U
 OTvLqIoVakqPQIRU5dM8qL81H0R3aWVyDe3uuyclyqG4F2YDyqEfSeTX7gJAbD0AecX+
 lM9/LSg74Iilmd6BsJDUaVEYXLOUhrYWqTqKhwxBRziTY2gIkfxITOQ9y11XmNvXze+j
 h+9w==
X-Gm-Message-State: AOAM5338oXPnW4Rh5Bic3qOWv2yhHwYBQx5MogC6ACWOOEXaXAcC2uET
 4dL+0PrlcSn0HHF5MNGrSS8=
X-Google-Smtp-Source: ABdhPJwjtnEwqJSgjPEWRteT3tMEGfOsvbvJ4ES++q99rtCZDmzyf+KaUYuNXLfBJo6euQ0JtcW7hw==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr23810502wmq.50.1623483642534; 
 Sat, 12 Jun 2021 00:40:42 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id o18sm9633087wrx.59.2021.06.12.00.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 00:40:41 -0700 (PDT)
Subject: Re: QEMU | USB Ethernet device (RNDIS) does not work on several
 tested operating systems (#198)
To: Paul Zimmerman <pauldzim@gmail.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
References: <reply-a8857b5ced579c7499da46ef969a0b87@gitlab.com>
 <issue_86599308@gitlab.com> <note_597531265@gitlab.com>
 <note_598004557@gitlab.com>
 <CAAdtpL4utd6p3_Rg+h3rFt=V2sKv288G11dNqjDU21YitC2q-A@mail.gmail.com>
 <CADBGO7-KMxXA4sXGdztNfoK2h6Jim6Kyi=yuLLC083jAv_sppw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <44d114c5-a43d-815e-a3e5-b551654e9960@amsat.org>
Date: Sat, 12 Jun 2021 09:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CADBGO7-KMxXA4sXGdztNfoK2h6Jim6Kyi=yuLLC083jAv_sppw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paul Zimmerman <paulz@synopsys.com>,
 QEMU / QEMU <incoming+a8857b5ced579c7499da46ef969a0b87@incoming.gitlab.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 9:48 PM, Paul Zimmerman wrote:
> I will take a look. Might take me a couple of days to get to it though.

Thanks!

Odd, your comment appears as posted by myself on GitLab:
https://gitlab.com/qemu-project/qemu/-/issues/198#note_599551747

BTW Paul, could you join QEMU GitLab project to help us with this issue?
https://gitlab.com/qemu-project/qemu/-/project_members/request_access

> 
> On Fri, Jun 11, 2021 at 4:10 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Cc'ing Paul Zimmerman for the hcd-dwc2 model.
>>
>> On Thu, Jun 10, 2021 at 2:10 PM programmingkidx (@programmingkidx) wrote:
>>> 虎游 commented:
>>>
>>> The same problem occurred in my Raspberry Pi 3b+ emulation.
>>>
>>> Host: Debian 10 x86_64. Guest rootfs: https://download.canaan-creative.com/avalon921/openwrt/latest/rpi3-modelb/openwrt-brcm2708-bcm2710-rpi-3-ext4-sdcard.img.gz Guest kernel & dtd: https://github.com/dhruvvyas90/qemu-rpi-kernel/tree/master/native-emulation
>>>
>>> Command:
>>>
>>> /usr/local/bin/qemu-system-aarch64 -M raspi3 -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" -dtb ../qemu-rpi-kernel/native-emulation/dtbs/bcm2710-rpi-3-b-plus.dtb -drive file=avalon.img,format=raw,if=sd,id=root -kernel ../qemu-rpi-kernel/native-emulation/5.4.51\ kernels/kernel8.img -m 1G -smp 4 -usb -device usb-mouse -device usb-kbd -nographic -no-reboot -device usb-net,netdev=eth0 -netdev tap,id=eth0,ifname=avalon,script=no,downscript=no Output:
>>>
>>> [ 0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034] [ 0.000000] Linux version 5.4.51-v8+ (dom@buildbot) (gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9)) #1333 SMP PREEMPT Mon Aug 10 16:58:35 BST 2020 [ 0.000000] Machine model: Raspberry Pi 3 Model B+
>>>
>>> ...
>>>
>>> usbnet: failed control transaction: request 0x8006 value 0x600 index 0x0 length 0xa usbnet: failed control transaction: request 0x8006 value 0x600 index 0x0 length 0xa usbnet: failed control transaction: request 0x8006 value 0x600 index 0x0 length 0xa [ 3.688532] usb 1-1.3: New USB device found, idVendor=0525, idProduct=a4a2, bcdDevice= 0.00 [ 3.688739] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=10 [ 3.689454] usb 1-1.3: Product: RNDIS/QEMU USB Network Device [ 3.689563] usb 1-1.3: Manufacturer: QEMU [ 3.689639] usb 1-1.3: SerialNumber: 1-1.3
>>>
>>> ...
>>>
>>> root@OpenWrt:/# ifconfig -a lo Link encap:Local Loopback inet addr:127.0.0.1 Mask:255.0.0.0 UP LOOPBACK RUNNING MTU:65536 Metric:1 RX packets:156 errors:0 dropped:0 overruns:0 frame:0 TX packets:156 errors:0 dropped:0 overruns:0 carrier:0 collisions:0 txqueuelen:1000 RX bytes:9836 (9.6 KiB) TX bytes:9836 (9.6 KiB)
>>>
>>> root@OpenWrt:/# ip a 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00 inet 127.0.0.1/8 scope host lo valid_lft forever preferred_lft forever Finally, there is no nic available in guest OS.
> 

