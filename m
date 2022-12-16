Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416E64E72C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 07:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p63ll-0003Cd-Na; Fri, 16 Dec 2022 01:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1p63li-0003CK-0O
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 01:00:26 -0500
Received: from relay.yourmailgateway.de ([188.68.63.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1p63lf-0003oH-PV
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 01:00:25 -0500
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4NYJNf2zsQz5xhr
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1671170418; bh=hLjXG5ckpYjtxBIbjokMMDzgnGUOHzXc10JzKTqitRI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=IUWNYuMqSzenIapbiuaY3eQ4+W+gyoCJqNjhm62P25VownnsW/WZsQ+zJzpktrU7y
 4yYYNzawWKPWWwiQ247ww3P6h7MYEHdxfPziBplUe6uzJ4oJ28ZPhLXzDYAvH44KAN
 DG760TYbDoSe5uF93zSx8TuJvekjeKqmnpK85TSs5mqpgQWt89kFiMFM85+Unza21G
 mFHIbaBBTBKO49FJteM2V3d3mYqfxwDPDQSwjdsqelhgdoW8XKuJk4Hb8pvdNAQUyl
 d9bfrUEaZkTgCxSn6l9rP5T7JMmOPsljrI15jbCvZZN0YujPO98Kk0/XdhYGbr0VyX
 B2rf/PSXiUDaQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4NYJNd3XfRz4y5S
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:00:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4NYJNc6NDBz8scj
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:00:16 +0100 (CET)
Received: from [192.168.54.9] (ip-095-223-071-051.um35.pools.vodafone-ip.de
 [95.223.71.51])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 0D23060734
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:00:12 +0100 (CET)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.71.51) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <834e831d-d48e-8d17-8712-c58e32121982@zapateado.de>
Date: Fri, 16 Dec 2022 07:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: qemu no sound
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <1dd17997fa2a5dbb455cb4bcb7436d0d@api.mail.freenet.de>
From: Helge Konetzka <hk@zapateado.de>
In-Reply-To: <1dd17997fa2a5dbb455cb4bcb7436d0d@api.mail.freenet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <167117041239.6907.8276211721808277755@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-Rspamd-Queue-Id: 0D23060734
X-Spamd-Result: default: False [-5.60 / 15.00]; BAYES_HAM(-5.50)[99.99%];
 MIME_GOOD(-0.10)[text/plain]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:3209, ipnet:95.223.0.0/16, country:DE];
 RCVD_COUNT_ZERO(0.00)[0]; RCPT_COUNT_ONE(0.00)[1];
 TO_DN_NONE(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: +IeCQSGinyQPMizEbqsEIwsnzqqBbOlyMjN+qiavRSUS
Received-SPF: pass client-ip=188.68.63.98; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Andreas,

Am 15.12.22 um 08:36 schrieb andschlick@freenet.de:
> 
> Hello dear Qemu community,
> 
> I installed qemu under Windows 11 home and downloaded the following 
> file. kali-linux-2022.4-qemu-amd64.qcow2 and started it with the 
> following command. unfortunately without sound what kind of command do I 
> have to add for sound support.
> 
>   C:\Users\andsc\Desktop\qemu\qemu-system-x86_64.exe -accel whpx -smp 4 
> -hda net nic,model=virtio -net user --vga qxl -boot strict=on -usbdevice 
> tablet Thank you for your support
> 

I'm focussing on your sound problem, so I did not test with kali image. 
This command works for me on Windows 10 22H2 using a 
Msys2/Mingw64-Bash-Shell with Qemu 7.1.94:

qemu-system-x86_64 \
  -M q35 \
  -accel whpx,kernel-irqchip=off \
  -m 1536 \
  -audiodev id=audio0,driver=dsound \
  -device ich9-intel-hda -device hda-duplex,audiodev=audio0 \
  -cdrom openSUSE-Leap-15.3-GNOME-Live-x86_64-Media.iso

"-audiodev id=audio0,driver=dsound" defines, how the host provides the sound
"-device ich9-intel-hda -device hda-duplex,audiodev=audio0" refers to 
the sound provider and creates sound devices for the guest.

Maybe the whole command can be a starting point, too.

I did not use "-vga qxl" here, because this implies spice usage which 
adds more complexity because the spice client needs to communicate with 
qemu.
"-M q35" defines a more current computer than leaving it out

Regards,
Helge.

