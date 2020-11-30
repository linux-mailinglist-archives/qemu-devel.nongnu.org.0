Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3D2C80EA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:25:11 +0100 (CET)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfQk-00069f-6S
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kjfN3-0002eE-P3
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kjfN0-0006lZ-Fy
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606728077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aFSzAzL7WFnt98Z4lDSMc/4TSaRyYfo4N4Gm6Jx4MSY=;
 b=OU4iXVCXBGMbIQcprWaQiGFZLvDg5UAlSKdH4VJxUciqTxiOIAfaI3BQpV4Ln4LWTeruzV
 rt0GZMY+WdwMuXIP6M8A6dq5+0SsBbgPAofhLwhXz8ArX4M36Wr+C5vZsMF8TMQKaaM32X
 7FavOSMnY+KuEYl1Nvez4oMaApnwLHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-QoasWxiHNnGws7SJr76kNw-1; Mon, 30 Nov 2020 04:21:14 -0500
X-MC-Unique: QoasWxiHNnGws7SJr76kNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F6CF100C660;
 Mon, 30 Nov 2020 09:21:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7D7360C4D;
 Mon, 30 Nov 2020 09:21:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B618113864E; Mon, 30 Nov 2020 10:21:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
 <20201127121809.GB105758@angien.pipo.sk>
 <87h7paoldm.fsf@dusky.pond.sub.org>
 <20201127163013.GD105758@angien.pipo.sk>
Date: Mon, 30 Nov 2020 10:21:08 +0100
In-Reply-To: <20201127163013.GD105758@angien.pipo.sk> (Peter Krempa's message
 of "Fri, 27 Nov 2020 17:30:13 +0100")
Message-ID: <87zh2zi4jf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Krempa <pkrempa@redhat.com> writes:

> On Fri, Nov 27, 2020 at 16:44:05 +0100, Markus Armbruster wrote:
>> Peter Krempa <pkrempa@redhat.com> writes:
>> 
>> > On Fri, Nov 27, 2020 at 14:45:12 +0300, Roman Bolshakov wrote:
>> >> On Fri, Nov 27, 2020 at 12:21:54PM +0100, Peter Krempa wrote:
>
>  [...]
>
>> > As you can see this has an issue when we have to add support for a
>> > unreleased interface, which may change during the dev cycle or plainly
>> > forget that something got deprecated as we've already added an override.
>> >
>> > This mainly comes from libvirt trying to keep on top of the changes so
>> > we refresh the QMP schema during qemu's dev cycle multiple times.
>> >
>> > Obviously the argument that we try to depend on unreleased functionality
>> > can be used, but that would be to detrement of progress IMO.
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
>
> The 'somewhat'-stable API would mean that any changes to the new API
> should be consulted with libvirt so that we can either give a go-ahead
> that we didn't adapt yet, disable the adaptation until the changes can
> be done, or another compromise depending on what's the state.
>
> I know it's hard to enforce, but probably the cheapest in terms of
> drawbacks any other solution would be.

We can and should try.  

Can we flag problematic interface changes automatically?  Semantic
changes, no.  What about changes visible in query-qmp-schema?

> I'll probably keep notifying patchsets which implement and deprecate old
> api at the same time to keep in mind that we need to be kept in touch,
> but I really don't want to impose any kind of extra process to
> development on either side.

Thanks!


