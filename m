Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63A2C5447
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:55:53 +0100 (CET)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGoS-0004yJ-OI
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kiGke-0001h1-Jd
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kiGkc-0007v2-4J
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606395111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBSBwpwrlxch+u+msWxty4QlJ2njwoaJnKQNbIHdzKA=;
 b=f4Gof2FuG0H5qxrz2L/8GvN/IMI9es9v+ZzCduQJMuHKjUuZiD73/trAiuyBnFTa4P2EbL
 cFmNN2ZURtL8ez127DnNc9vd+MfY/3yYcYxlqYyweT+SWScO2s8dTQpdfl9ntDqRCkzMs8
 SP2qyHNnN4dLznQ+wfKQW85dSaT3rVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-ErZZCeksOSud7VEvP-57sw-1; Thu, 26 Nov 2020 07:51:50 -0500
X-MC-Unique: ErZZCeksOSud7VEvP-57sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22FE81E7DD;
 Thu, 26 Nov 2020 12:51:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-34.ams2.redhat.com
 [10.36.113.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACD3A1349A;
 Thu, 26 Nov 2020 12:51:44 +0000 (UTC)
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields to
 be set.
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Antoine Damhet <antoine.damhet@blade-group.com>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0d63ed0e-4dae-9f7e-9512-45c94e1968f0@redhat.com>
Date: Thu, 26 Nov 2020 13:51:43 +0100
MIME-Version: 1.0
In-Reply-To: <20201126051838-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/20 12:09, Michael S. Tsirkin wrote:
> On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
>> On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
>>> On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
>>>> On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
>>>>> Hello,
>>>>>
>>>>> We recently found out that some softwares are effectively crashing
>>>>> when they detect qemu's `OEM ID` or `OEM table ID` in the ACPI tables.
>>>>>
>>>>> I see no reason not to expose the setting to the user/command-line. A
>>>>> previous patch has been submitted in 2015[1] but did not get through
>>>>> because (if I understand correctly) using the IDs on the `SLIC`, `BXPC`
>>>>> and `RSDT` tables were enough at the time.
>>>>>
>>>>> If you agree, I am willing to forward port the patches of M. Jones but I
>>>>> need to ask how it would work `Signed-Off`-wise ?
>>>>
>>>> On this point, the patch I sent was actually written by
>>>> Michael Tokarev, I was only trying to get them upstream.
>>>>
>>>> Rich.
>>>
>>> I think at least one of the issues is that e.g. UEFI at least
>>> seems to assume unique OEM table IDs e.g. for SSDTs.
>>>
>>> So let's try to be more specific please, which software
>>> crashes, what does it want to see and in which table.
>>
>> I'm sorry I cannot give you the name of the crashing software due to a
>> company policy. But I can tell you that if either `BOCHS ` or `BXPC` is
>> present in any of the tables it will crash. Any (or at least the few
>> that I threw at it) other string will work so it seems it's some kind
>> of DRM-related hypervisor detection.
> 
> Hmm I'm not sure how far we want to go with this. If software vendors
> want to detect a hypervisor there will always be a way.
> How are we sure we are not starting an arms race here?
> 
> Also which of the IDs matter?  OEMID? OEM Table ID? Creator ID?
> 
> 
>> As for the uniqueness of the table IDs, I guess it would be sane to keep
>> the same pattern (id+table sig) but allowing the first 4 bytes to be
>> overridden.
>>
>> [...]
> 
> It's certainly possible, it's just very specific to just this DRM scheme.
> Not sure what's a better way to do it:
>   qemu -acpidefault oem_id=ABCD,oem_table_id=EFGHIJKL
> is probably going too far since then table IDs are not unique.
> 
> Also I'd probably use machine properties for this, the need here
> is baroque enough that we don't want a dedicated option.

Minimally, I dislike the partial overlap with the existent "-acpitable"
switch.

Thanks
Laszlo

> 
>>
>> -- 
>> Antoine 'xdbob' Damhet
> 


