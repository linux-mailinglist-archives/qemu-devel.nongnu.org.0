Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F89407555
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 08:31:34 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOwY1-0001dK-BY
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 02:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mOwVl-0000Ts-I5
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 02:29:13 -0400
Received: from relay.yourmailgateway.de ([188.68.61.102]:33925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mOwVd-0003qv-BZ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 02:29:12 -0400
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4H62rW5ymbz80LC;
 Sat, 11 Sep 2021 08:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1631341739; bh=LCyzdaJL2z8QPvDByxXTZUa42tBCqIUwETmu5tciwcQ=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=jf94h7H4jVePpClx++0m0/ZgB32KRyOJyVqutGQVMzcIsw/YuhV9Jk7qKa8hpbjNs
 I2kPslpUuI0ENXM5dmEw7GUPLeo8lc8zrVt69M2w6VyAvdFqNeF1Qmr9LriNuRDlRz
 1B8sMu4ToxdTyX/zjZVEPMLUCckPLv6Tj7wlUfDoziPeoeUCCalXZ/+d0IX+8Zz6B0
 68lwyK0kGX+2JQMfsxKevNQ248ydWUU/NqEU/wpB19mWrncaux6f4ZTOEkXXtmnHn1
 +Ff8HKj49/OC1tZpN+tSQXCXAiEuQByb9EtyKI4XR6q1orQAsv4f3NXB1JAZVMsWlw
 rFxrw96S2UdmA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4H62rW5b3hz80L7;
 Sat, 11 Sep 2021 08:28:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Score: -1.5
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4H62rW0s32z8tL5;
 Sat, 11 Sep 2021 08:28:58 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-41.hsi16.unitymediagroup.de
 [95.223.69.41])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 1A012650C3;
 Sat, 11 Sep 2021 08:28:58 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.41) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
Message-ID: <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
Date: Sat, 11 Sep 2021 08:28:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <163134173836.9265.9702818521698303542@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: fvV0hSxmCr3ulVUBzbBiiyVFlbE4i8bpcZjX29zZWh8+
Received-SPF: pass client-ip=188.68.61.102; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Am 10.09.21 um 17:44 schrieb Paolo Bonzini:
> On 25/08/21 18:43, Helge Konetzka wrote:
>> Furthermore I would like to propose to change the instructions for 
>> Native builds with MSYS2 on Wiki Windows page.
>>
>> Please remove the section which copies system binaries to match the 
>> expected file names!
>>
>> Instead define variables for configure (gcc-ar and gcc-ranlib are 
>> existing copies of x86_64-w64-mingw32-gcc-ar and 
>> x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make install:
>>
>> AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres 
>> STRIP=strip \
>> ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
> 
> Do you even need anything but "./configure"? (possibly AR=gcc-ar NM=nm 
> at the beginning)?

Sorry for being indistinct!

My intention was to put "AR=gcc-ar NM=nm OBJCOPY=objcopy 
RANLIB=gcc-ranlib WINDRES=windres STRIP=strip" in front of "./configure" 
(see the '\' after STRIP=strip) instead of copying binaries:

diff -Naur qemu.org.orig/Hosts/W32 qemu.org/Hosts/W32
--- qemu.org.orig/Hosts/W32	2021-09-11 08:27:01.198715675 +0200
+++ qemu.org/Hosts/W32	2021-09-11 08:28:15.853605118 +0200
@@ -232,14 +232,6 @@
      Close the MSYS2 console.
      Start mingw64.exe.

-cd /mingw64/bin
-cp x86_64-w64-mingw32-gcc-ar.exe x86_64-w64-mingw32-ar.exe
-cp x86_64-w64-mingw32-gcc-ranlib.exe x86_64-w64-mingw32-ranlib.exe
-cp windres.exe x86_64-w64-mingw32-windres.exe
-cp nm.exe x86_64-w64-mingw32-nm.exe
-cp objcopy.exe x86_64-w64-mingw32-objcopy.exe
-cd ~
-
      Download the QEMU source code:

  git clone https://www.github.com/qemu/qemu
@@ -247,6 +239,7 @@
      Finally build QEMU with:

  cd qemu
+AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres 
STRIP=strip \
  ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
  make


