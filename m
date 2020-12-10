Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E42D55A1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:49:05 +0100 (CET)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHdI-0002Fp-R3
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1knHbM-0001iM-6D
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1knHbI-0004Ee-Ae
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607590018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cCVEo4WJK8HWfvjbmTSJaM8xh0fUdoFkrRYJo+RhgI=;
 b=CqCo46rlsN10M64/okFWVLn+K8q8Ty2P84oNREkZBjzHw86m3r4PIe0RhPQioLYGf2OU1f
 KoMX2ExMdqpYlNHLb1StV0VQtfiwKJ+bJQj6ffRcFJKL3WqhdEf58vtHiPVjHYdt4IbRB7
 NFd3c4YSEMNK3vZ2D76aMCspzNvENnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-mDI1ltknP36qBmpXz_4fag-1; Thu, 10 Dec 2020 03:46:53 -0500
X-MC-Unique: mDI1ltknP36qBmpXz_4fag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64FB110054FF
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:46:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2F45C626;
 Thu, 10 Dec 2020 08:46:45 +0000 (UTC)
Subject: Re: [PATCH] smbios: entry-point-type option
To: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <20201208212023.1560846-1-ehabkost@redhat.com>
 <20201209094225.GE3214234@redhat.com> <20201209181626.GU1289986@habkost.net>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d647702c-341d-8433-31c9-b97f4a7581dd@redhat.com>
Date: Thu, 10 Dec 2020 09:46:44 +0100
MIME-Version: 1.0
In-Reply-To: <20201209181626.GU1289986@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/09/20 19:16, Eduardo Habkost wrote:
> On Wed, Dec 09, 2020 at 09:42:25AM +0000, Daniel P. Berrangé wrote:
>> On Tue, Dec 08, 2020 at 04:20:23PM -0500, Eduardo Habkost wrote:
>>> Add command-line option that lets the SMBIOS entry point type to
>>> be configured.
>>>
>>> SMBIOS 3.0 support is necessary to allow us to support more
>>> than 720 VCPUs in x86_64, due to SMBIOS 2.1 table size limits.
>>>
>>> Note that it's still up to firmware to decide whether to generate
>>> SMBIOS 2.1 and/or 3.0 entry points for the guest, using the
>>> information contained in etc/smbios/smbios-anchor.  OVMF, for
>>> example, is able to generate both entry points, depending on the
>>> value of PcdSmbiosEntryPointProvideMethod.
>>>
>>> The SMBIOS 3.0 entry point won't be enabled by default because it
>>> is not supported yet by Seabios.  This may be changed once
>>> Seabios starts supporting SMBIOS 3.0 entry points.
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> ---
>>> Laszlo, Philippe: do you know how exactly the value of
>>> PcdSmbiosEntryPointProvideMethod is chosen when running OVMF?
>>
>> Laszlo proides alot of detail in my original proposal for
>> selecting SMBIOS entry point here:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03347.html
> 
> Thanks!
> 
>>
> [...]
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 104632ea34..d2a973f8a7 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -2294,7 +2294,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>>>      "                specify SMBIOS type 11 fields\n"
>>>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
>>>      "               [,asset=str][,part=str][,speed=%d]\n"
>>> -    "                specify SMBIOS type 17 fields\n",
>>> +    "                specify SMBIOS type 17 fields\n"
>>> +    "-smbios entry-point-type=2.1|3.0\n"
>>> +    "                specify SMBIOS entry point type\n",
>>
>> My previous patch:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03027.html
>>
>> exposed the entry point version as a property on the PC machine
>> rather than the -smbios arg, principally because it is the machin
>> setup code that currently defines what version is used via the calls
>> to smbios_set_defaults().
>>
>> IIUC from Laszlo's reply,  SMBIOS 2.1 is not valid for AArch64
>> at all - they only support 3.0.  So there's a small benefit from
>> configuring this against the PC machine types, because it prevents
>> ability to select 2.1 for ARM SMBIOS which would be invalid.
> 
> Good point.  It would also make it easier to change the machine
> type default in the future.
> 
> I will submit something based on your patches, instead.
> 

Thank you, Daniel, for finding that write-up; I've got it completely
paged-out by now :) I don't have anything to add here, just confirming
that I've read this thread quickly. Eduardo, if you have questions wrt.
OVMF, please let me know; I'll try to find the time.

Thanks!
Laszlo


