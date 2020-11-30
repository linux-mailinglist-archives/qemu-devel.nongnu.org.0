Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A62C8808
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:33:04 +0100 (CET)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlAl-0007ag-QH
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjl9e-0006dS-Ow
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:31:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjl9b-0004eb-GK
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606750308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4TWgCZsg1eSTq8R9SUojc/K2qHMRL0PTpzigfL2Im8=;
 b=io7kqo7YHTwrsf30V2TgjeB1MNuZhLQOzhZ54w4Ej0qNmBuPolSd4BVIAQI59qZ+uwgy6Q
 QOFCD0KxkdU3ssGfL/ENLblimPqDZVXE+PjewrzO/DCSI5ZAPEw+uCSGdgMlSYdUOs8oh6
 prVatOcmTWRGZRy4/uJ2l2owLlD5fxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-KO9-_h1FPD6mVJ4EJPi3Fg-1; Mon, 30 Nov 2020 10:31:46 -0500
X-MC-Unique: KO9-_h1FPD6mVJ4EJPi3Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCEF81052081;
 Mon, 30 Nov 2020 15:30:54 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8449A5D6A8;
 Mon, 30 Nov 2020 15:30:50 +0000 (UTC)
To: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
 <20201127121809.GB105758@angien.pipo.sk> <87h7paoldm.fsf@dusky.pond.sub.org>
 <20201127163013.GD105758@angien.pipo.sk>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <09cae514-9ba1-6569-9d51-42d4bcc57f3c@redhat.com>
Date: Mon, 30 Nov 2020 09:30:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127163013.GD105758@angien.pipo.sk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 10:30 AM, Peter Krempa wrote:
> On Fri, Nov 27, 2020 at 16:44:05 +0100, Markus Armbruster wrote:
>> Peter Krempa <pkrempa@redhat.com> writes:
>>
>>> On Fri, Nov 27, 2020 at 14:45:12 +0300, Roman Bolshakov wrote:
>>>> On Fri, Nov 27, 2020 at 12:21:54PM +0100, Peter Krempa wrote:
> 
>  [...]
> 
>>> As you can see this has an issue when we have to add support for a
>>> unreleased interface, which may change during the dev cycle or plainly
>>> forget that something got deprecated as we've already added an override.
>>>
>>> This mainly comes from libvirt trying to keep on top of the changes so
>>> we refresh the QMP schema during qemu's dev cycle multiple times.
>>>
>>> Obviously the argument that we try to depend on unreleased functionality
>>> can be used, but that would be to detrement of progress IMO.
>>
>> I understand your concerns.
>>
>> We have a somewhat similar problem in QEMU: there's nothing to remind us
>> later on that the old interface still needs to be deprecated.
> 
> Oh, yes. That's basically the same thing.
> 
> The thing is that changes to the new interface are very rare, but very
> real. Since I don't really want to increase the burden for any normal
> scenario.

Case in point: our last-minute changes to block-export-add in qemu
commit cbad81ce.  The original deprecation of nbd-server-add occurred
much earlier in the 5.2 devel cycle, in qemu 443127e8, and also forgot
to tell libvirt
(https://www.redhat.com/archives/libvir-list/2020-October/msg00855.html);
then in my efforts to improve qemu-nbd, I made more changes to
block-export-add, but didn't cc libvirt on v1.  We eventually got
everything coordinated with libvirt in cc, but it did lead to some last
minute churn in libvirt to avoid a parity mismatch between versions
(https://www.redhat.com/archives/libvir-list/2020-October/msg01369.html).

> 
> I'd also very much like to keep libvirt pulling in snapshots of qemu's
> capabilities/qapi schema etc throughout the development cycle. It allows
> us to adapt faster and develop features simultaneously.
> 
> This unfortunately undermines my own arguments partially as libvirt
> regularly develops features on top of unreleased qemu features so we are
> regularly risking very similar circumstances. The small but important
> difference though is, that releasing a broken feature is not as bad as
> breaking an existing feature.
> 
> As a conclusion of the above I'd basically prefer a sort of gentleman's
> agreement, that new APIs become 'somewhat' stable at the moment the
> commit deprecating the old interface hits upstream.

Yes, moving towards this goal makes sense.  And because we've called
attention to the fact, I'll try harder to remember in my qapi reviews
any time where a new interface exists _because_ it has replaced an
interface we already marked as deprecated.

> 
> The 'somewhat'-stable API would mean that any changes to the new API
> should be consulted with libvirt so that we can either give a go-ahead
> that we didn't adapt yet, disable the adaptation until the changes can
> be done, or another compromise depending on what's the state.
> 
> I know it's hard to enforce, but probably the cheapest in terms of
> drawbacks any other solution would be.
> 
> I'll probably keep notifying patchsets which implement and deprecate old
> api at the same time to keep in mind that we need to be kept in touch,
> but I really don't want to impose any kind of extra process to
> development on either side.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


