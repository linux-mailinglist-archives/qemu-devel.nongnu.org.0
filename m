Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC701C71CE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 15:39:36 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWKGt-0004HW-AC
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 09:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1jWKF1-00037e-RG
 for qemu-devel@nongnu.org; Wed, 06 May 2020 09:37:39 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1jWKF0-0006fx-CZ
 for qemu-devel@nongnu.org; Wed, 06 May 2020 09:37:39 -0400
Received: from MUA
 by vps-vb.mhejs.net with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.93.0.4) (envelope-from <mail@maciej.szmigiero.name>)
 id 1jWKEi-0007su-P6; Wed, 06 May 2020 15:37:20 +0200
Subject: Re: [PATCH v4 5/6] i386: Hyper-V VMBus ACPI DSDT entry
To: Igor Mammedov <imammedo@redhat.com>
References: <20200424123444.3481728-1-arilou@gmail.com>
 <20200424123444.3481728-6-arilou@gmail.com>
 <20200505150637.7131e79b@redhat.com> <20200505153838.GC2862@jondnuc>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Autocrypt: addr=mail@maciej.szmigiero.name; prefer-encrypt=mutual; keydata=
 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 sg==
Message-ID: <30fea22b-ef36-04d9-17ef-d13e3f93a3c5@maciej.szmigiero.name>
Date: Wed, 6 May 2020 15:37:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505153838.GC2862@jondnuc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 09:37:29
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: eyakovlev@virtuozzo.com, Jon Doron <arilou@gmail.com>, rvkagan@gmail.com,
 qemu-devel@nongnu.org, liran.alon@oracle.com,
 Roman Kagan <rkagan@virtuozzo.com>, pbonzini@redhat.com, vkuznets@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.05.2020 17:38, Jon Doron wrote:
> On 05/05/2020, Igor Mammedov wrote:
> 
> I dont know what were the original intentions of the original patch authors (at this point I simply rebased it, and to be honest I did not need this patch to get where I was going to, but it was part of the original patchset).
> 
> But I'm willing to do any changes so we can keep going forward with this.
> 
>> On Fri, 24 Apr 2020 15:34:43 +0300
>> Jon Doron <arilou@gmail.com> wrote:
>>
>>> Guest OS uses ACPI to discover VMBus presence.  Add a corresponding
>>> entry to DSDT in case VMBus has been enabled.
>>>
>>> Experimentally Windows guests were found to require this entry to
>>> include two IRQ resources. They seem to never be used but they still
>>> have to be there.
>>>
>>> Make IRQ numbers user-configurable via corresponding properties; use 7
>>> and 13 by default.
>> well, it seems that at least linux guest driver uses one IRQ,
>> abeit not from ACPI descriptior
>>
>> perhaps it's what hyperv host puts into _CRS.
>> Could you dump ACPI tables and check how hyperv describes vmbus in acpi?
>>
>>
> 
> I can no longer get to the HyperV computer I had (in the office so hopefully if someone else has access to HyperV machine and willing to reply here with the dumped ACPI tables that would be great).
> 

Here is a VMBus ACPI device description from Hyper-V in Windows Server 2019:

Device (\_SB.VMOD.VMBS)
{
    Name (STA, 0x0F)
    Name (_ADR, Zero)  // _ADR: Address
    Name (_DDN, "VMBUS")  // _DDN: DOS Device Name
    Name (_HID, "VMBus")  // _HID: Hardware ID
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
    {
	STA &= 0x0D
    }

    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
    {
	STA |= 0x0F
    }

    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
	Return (STA) /* \_SB_.VMOD.VMBS.STA_ */
    }

    Name (_PS3, Zero)  // _PS3: Power State 3
    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
	IRQ (Edge, ActiveHigh, Exclusive, )
	    {5}
    })
}

It seems to use just IRQ 5.

Maciej

