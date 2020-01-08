Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF14133D0F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 09:26:49 +0100 (CET)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip6fx-0003x8-2u
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 03:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pizhenwei@bytedance.com>) id 1ip6fB-0003LK-IF
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 03:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1ip6f8-000875-Jq
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 03:25:59 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1ip6f8-000860-7K
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 03:25:58 -0500
Received: by mail-pl1-x62c.google.com with SMTP id g6so823080plp.6
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language;
 bh=9fIGVi/07qTm9ZIqBSPTg25qlPyGoP5iVnAMD5cxIYs=;
 b=DkzjrSWKtn76Cxe56ipuHet8LcB58R35LDlWd6UdviMMmCmYkOID2UZtEH8UMsyMJ1
 wxs69lj6b9qXyBeKORIbFfaVQa3xg57GUys0JaVXQFMOz4s/dwvXWxyp/2Uydmb0Acy6
 fwFMKai7UqIrBVOTtavauXhQxyFqWEXT2oI+/9kDsJmvsOnbr3QwvCxLMv+sS8/7Um5j
 qWTO6Skmgqn4BdZgoVjFfM1gww937P2EiZBQnO6E9KExtL15q35RySI8hPPcg6iANsyo
 LjzQOnkMbdzMfSF38CIF5C01/gZ7L7hwS4di3T0l37aosaNfjpmt6glYqHFAaOscQx5D
 u0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language;
 bh=9fIGVi/07qTm9ZIqBSPTg25qlPyGoP5iVnAMD5cxIYs=;
 b=eHysaSpmzjhp/rsBL/DGfJuBx0xnfWLsB3UZSmfvYGIaVtd8hT8GwgymIGbRSHS3LV
 AFC0QQgoRDC3Zk6XF/hVkw3tFd+2PKYjsjQlSA6JyEAazSE9nPW92F8IvpnIgKmUh5GQ
 PNQgeSNbXbdtIXOJcl5Ukh6IoBAu2P4UH3TRW0+UNRtLNGCXMXumJxn+PCNqmYSe5w0U
 hqN6nH01s0vxGQ7jt8CO3L63tVGSb3aNgenI2mBTU7WzAOvPZEo9IhIgaoSP/XZ21/qr
 5KK7z+IrEtVOCLBCITPY7mXuNEkQMrlEjrPv7T3v1fXAsX4yi6p9cytN5W0eK3tLOHxJ
 JOzQ==
X-Gm-Message-State: APjAAAWsrUiO29XIw2kaq1M+PK5F+STE/lI67dAcRyVdgfIGxY8p24nA
 2E+mcMmI9+VoGfBKVyoTtFDGOQ==
X-Google-Smtp-Source: APXvYqzfQg2H8F4qoR1igNv0HH9J3AJgnnPgbmNB++EfpBMmvd9PkzGaPk95Q9lbdcLfYgIeflh9pQ==
X-Received: by 2002:a17:90a:8584:: with SMTP id
 m4mr3058297pjn.123.1578471956259; 
 Wed, 08 Jan 2020 00:25:56 -0800 (PST)
Received: from [10.2.24.220] ([61.120.150.77])
 by smtp.gmail.com with ESMTPSA id j7sm2808911pgn.0.2020.01.08.00.25.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 00:25:55 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
Subject: discuss about pvpanic
To: pbonzini@redhat.com
Message-ID: <2feff896-21fe-2bbe-6f68-9edfb476a110@bytedance.com>
Date: Wed, 8 Jan 2020 16:25:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------B451C23F20E8876804ADF693"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62c
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
Cc: Greg KH <gregkh@linuxfoundation.org>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, "yelu@bytedance.com" <yelu@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B451C23F20E8876804ADF693
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey, Paolo

Currently, pvpapic only supports bit 0(PVPANIC_PANICKED).
We usually expect that guest writes ioport (typical 0x505) in panic_notifier_list callback
during handling panic, then we can handle pvpapic event PVPANIC_PANICKED in QEMU.

On the other hand, guest wants to handle the crash by kdump-tools, and reboots without any
panic_notifier_list callback. So QEMU only knows that guest has rebooted (because guest
write 0xcf9 ioport for RCR request), but QEMU can't identify why guest resets.

In production environment, we hit about 100+ guest reboot event everyday, sadly we
can't separate the abnormal reboot from normal operation.

We want to add a new bit for pvpanic event(maybe PVPANIC_CRASHLOADED) to represent the guest has crashed,
and the panic is handled by the guest kernel. (here is the previous patchhttps://lkml.org/lkml/2019/12/14/265)

What do you think about this solution? Or do you have any other suggestions?

-- 
Thanks and Best Regards,
zhenwei pi


--------------B451C23F20E8876804ADF693
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>Hey, Paolo</pre>
    <pre>
Currently, pvpapic only supports bit 0(PVPANIC_PANICKED).
We usually expect that guest writes ioport (typical 0x505) in panic_notifier_list callback
during handling panic, then we can handle pvpapic event PVPANIC_PANICKED in QEMU.

On the other hand, guest wants to handle the crash by kdump-tools, and reboots without any
panic_notifier_list callback. So QEMU only knows that guest has rebooted (because guest
write 0xcf9 ioport for RCR request), but QEMU can't identify why guest resets.

In production environment, we hit about 100+ guest reboot event everyday, sadly we 
can't separate the abnormal reboot from normal operation.

We want to add a new bit for pvpanic event(maybe PVPANIC_CRASHLOADED) to represent the guest has crashed, 
and the panic is handled by the guest kernel. (here is the previous patch <a href="https://lkml.org/lkml/2019/12/14/265">https://lkml.org/lkml/2019/12/14/265</a>)

What do you think about this solution? Or do you have any other suggestions?
</pre>
    <pre class="moz-signature" cols="72">-- 
Thanks and Best Regards,
zhenwei pi</pre>
  </body>
</html>

--------------B451C23F20E8876804ADF693--

