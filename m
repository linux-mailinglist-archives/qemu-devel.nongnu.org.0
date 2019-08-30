Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED33EA381A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 15:53:32 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3hLG-0007qv-Ka
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 09:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3hGK-0004I2-Bz
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3hGF-0007ym-DM
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:48:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3hG8-0007fh-F1; Fri, 30 Aug 2019 09:48:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1922C307D84B;
 Fri, 30 Aug 2019 13:48:11 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC81600F8;
 Fri, 30 Aug 2019 13:48:05 +0000 (UTC)
To: peng.hao2@zte.com.cn, drjones@redhat.com
References: <201812120954362374357@zte.com.cn>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <704db664-bc2e-7814-e8af-424b7d8aad14@redhat.com>
Date: Fri, 30 Aug 2019 15:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <201812120954362374357@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 30 Aug 2019 13:48:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V12 0/5] add pvpanic mmio support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peng,

On 12/12/18 2:54 AM, peng.hao2@zte.com.cn wrote:
>>> v11 --> v12
>>>      realize pvpanic as a pci device and use the mmio of pci device.
>>
>> Do you have a pointer to the kernel patches?
>>
>> Thanks,
>>> drew
>>
> I'm still sorting out the code for the kernel part, and I haven't submitted a patch yet.
> 

What is the status of the effort to get this PCI PVPANIC device available?

I am unsure about the kernel driver status. I found

[PATCH V6 0/4] add pvpanic driver framework
https://lwn.net/Articles/780193/

Thank you in advance

Best Regards

Eric

