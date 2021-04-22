Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BD368255
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:18:28 +0200 (CEST)
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZa9z-0008NM-Cb
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZa7c-0007OZ-9a
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZa7U-00017w-JI
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619100951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPDnwoyYxYSNc1iOYZmP6KQucRGk59Ib/Htb1QatXPI=;
 b=CN9l6V95pLXwakUeddMtSlSbbd68mMk/g1uedpGXTwXbOcOoXuMRFg6+nLa5VqPMvzWxga
 vUBwy8tTG/po8oMU/atSBF9af+DbbaS8+AmHWBba32qughsc1E1Q5t9g68PRmaXjuq2HAy
 H/tiUab7Ix7CmYkNWLIfjZ/IVgUPnsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-OL3bB16fP0yhe-w5r3TVKQ-1; Thu, 22 Apr 2021 10:15:46 -0400
X-MC-Unique: OL3bB16fP0yhe-w5r3TVKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3554100A27E;
 Thu, 22 Apr 2021 14:13:59 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-151.ams2.redhat.com
 [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B71460C05;
 Thu, 22 Apr 2021 14:13:57 +0000 (UTC)
Subject: Re: firmware selection for SEV-ES
To: Pavel Hrdina <phrdina@redhat.com>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
 <YIARw09TcakElBco@antique-laptop>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
Date: Thu, 22 Apr 2021 16:13:57 +0200
MIME-Version: 1.0
In-Reply-To: <YIARw09TcakElBco@antique-laptop>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/21/21 13:51, Pavel Hrdina wrote:
> On Wed, Apr 21, 2021 at 11:54:24AM +0200, Laszlo Ersek wrote:
>> Hi Brijesh, Tom,
>>
>> in QEMU's "docs/interop/firmware.json", the @FirmwareFeature enumeration
>> has a constant called @amd-sev. We should introduce an @amd-sev-es
>> constant as well, minimally for the following reason:
>>
>> AMD document #56421 ("SEV-ES Guest-Hypervisor Communication Block
>> Standardization") revision 1.40 says in "4.6 System Management Mode
>> (SMM)" that "SMM will not be supported in this version of the
>> specification". This is reflected in OVMF, so an OVMF binary that's
>> supposed to run in a SEV-ES guest must be built without "-D
>> SMM_REQUIRE". (As a consequence, such a binary should be built also
>> without "-D SECURE_BOOT_ENABLE".)
>>
>> At the level of "docs/interop/firmware.json", this means that management
>> applications should be enabled to look for the @amd-sev-es feature (and
>> it also means, for OS distributors, that any firmware descriptor
>> exposing @amd-sev-es will currently have to lack all three of:
>> @requires-smm, @secure-boot, @enrolled-keys).
>>
>> I have three questions:
>>
>>
>> (1) According to
>> <https://libvirt.org/formatdomain.html#launch-security>, SEV-ES is
>> explicitly requested in the domain XML via setting bit#2 in the "policy"
>> element.
>>
>> Can this setting be used by libvirt to look for such a firmware
>> descriptor that exposes @amd-sev-es?
> 
> Hi Laszlo and all,
> 
> Currently we use only <launchSecurity type='sev'> when selecting
> firmware to make sure that it supports @amd-sev. Since we already have a
> place in the VM XML where users can configure amd-sev-as we can use that
> information when selecting correct firmware that should be used for the
> VM.

Thanks!

Should we file a libvirtd Feature Request (where?) for recognizing the
@amd-sev-es feature flag?

Cheers
Laszlo

> 
> Pavel
> 
>> (2) "docs/interop/firmware.json" documents @amd-sev as follows:
>>
>> # @amd-sev: The firmware supports running under AMD Secure Encrypted
>> #           Virtualization, as specified in the AMD64 Architecture
>> #           Programmer's Manual. QEMU command line options related to
>> #           this feature are documented in
>> #           "docs/amd-memory-encryption.txt".
>>
>> Documenting the new @amd-sev-es enum constant with very slight
>> customizations for the same text should be possible, I reckon. However,
>> "docs/amd-memory-encryption.txt" (nor
>> "docs/confidential-guest-support.txt") seem to mention SEV-ES.
>>
>> Can you guys propose a patch for "docs/amd-memory-encryption.txt"?
>>
>> I guess that would be next to this snippet:
>>
>>> # ${QEMU} \
>>>    sev-guest,id=sev0,policy=0x1...\
>>
>>
>> (3) Is the "AMD64 Architecture Programmer's Manual" the specification
>> that we should reference under @amd-sev-es as well (i.e., same as with
>> @amd-sev), or is there a more specific document?
>>
>> Thanks,
>> Laszlo
>>


