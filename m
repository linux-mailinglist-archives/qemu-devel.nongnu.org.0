Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB6166209
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 17:14:06 +0100 (CET)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4oSj-00047p-Ht
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 11:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j4oP2-0006PE-Vi
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j4oP1-0006H6-Ul
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:10:16 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:44733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j4oP1-0006Ge-L3; Thu, 20 Feb 2020 11:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=BoDL3CgYKgqz4ieNJwO3dh8eKsf9metfbWNPjj37t0o=; 
 b=XtdssM47q2yPOM3sx2U4vFJpAXbqBBgSpR+KL1SGOj0Y4W2pjl+8W4qFi51ki93Gws9C4S5nAIfho3dnV+TmuKwnWQPzgw67vimcrOSmNBgrIHQVBNh610Jgp138i8AZBGJ+ackUV3smz5teP2q6u3EKyPql3wX3cuLNrcTBrsHFWx6vdhG+W8te2Uhb5lsm4dhzeIb1kZmRUznNhp2+SQH2QLrDF6Ht/ONsU8fXbZT1PDpqbjEDxTCKaB1DPLBVtRJNkHb8InUMcLDYYpxa9q8mN8RTiDRZLapZynpyUB2seAIPBB++6FZWOvTNHWIOmMXS+lHpk87iE4eis3ThLg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j4oOz-0005UI-Df; Thu, 20 Feb 2020 17:10:13 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j4oOz-0006cX-4J; Thu, 20 Feb 2020 17:10:13 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v3 05/27] qcow2: Document the Extended L2 Entries
 feature
In-Reply-To: <e559107b-b0c1-a2be-4fc2-29f050cced34@redhat.com>
References: <cover.1577014346.git.berto@igalia.com>
 <0b884ddcd0ac3a3c0b8cdd9d09c74566ac107c9a.1577014346.git.berto@igalia.com>
 <e559107b-b0c1-a2be-4fc2-29f050cced34@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 20 Feb 2020 17:10:13 +0100
Message-ID: <w51eeupb5p6.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 20 Feb 2020 03:33:57 PM CET, Eric Blake wrote:
>>   Given an offset into the virtual disk, the offset into the image file can be
>>   obtained as follows:
>>   
>> -    l2_entries = (cluster_size / sizeof(uint64_t))
>> +    l2_entries = (cluster_size / sizeof(uint64_t))        [*]
>>   
>>       l2_index = (offset / cluster_size) % l2_entries
>>       l1_index = (offset / cluster_size) / l2_entries
>> @@ -447,6 +455,8 @@ obtained as follows:
>>   
>>       return cluster_offset + (offset % cluster_size)
>>   
>> +    [*] this changes if Extended L2 Entries are enabled, see next section
>
>> +The size of an extended L2 entry is 128 bits so the number of entries per table
>> +is calculated using this formula:
>> +
>> +    l2_entries = (cluster_size / (2 * sizeof(uint64_t)))
>
> Is it worth unifying these statements by writing:
>
> l2_entries = (cluster_size / ((1 + extended_l2) * sizeof(uint64_t)))
>
> or is that too confusing?

I think it's too confusing...

Berto

