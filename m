Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CCB417701
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:46:00 +0200 (CEST)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmSe-0000oI-1q
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTmQo-00005c-JY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTmQi-0007Tf-2F
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632494638;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQgjvs8RS4DsQPM3GDcBIMCn6EIFgKlBQaOjANlBZLM=;
 b=MuVgEWMOI7+lqWlrtSqjW1VMAhg4cweWB9gF0OPlxHdoV3Jhzyo7uzERA/7642ZCBpeZLZ
 P7aWXIHip2MILGotPkO/ED4TUPTXn275M08GoW5YehcNDH/CERMC3CafB90BIdH2w/aLJT
 W7xkVcrlzURAFhpfdHK66vQaUcMeUOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-A2_ZAtAcN763IkFSh2BakA-1; Fri, 24 Sep 2021 10:43:51 -0400
X-MC-Unique: A2_ZAtAcN763IkFSh2BakA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E191006AB1;
 Fri, 24 Sep 2021 14:43:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6510101E1C5;
 Fri, 24 Sep 2021 14:43:01 +0000 (UTC)
Date: Fri, 24 Sep 2021 15:42:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
Message-ID: <YU3j859R7riCP1Ja@redhat.com>
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
 <874kaarwou.fsf@dusky.pond.sub.org>
 <CAFEAcA8mMzzgKyDbUUTh+W0r=5C0_HJv+7MMZ3Rdx-E2vcsRZA@mail.gmail.com>
 <87sfxup03r.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87sfxup03r.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 03:35:52PM +0200, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Fri, 24 Sept 2021 at 13:21, Markus Armbruster <armbru@redhat.com> wrote:
> >> ... this isn't really *target*-specific, it's *device*-specific: some
> >> devices implement the event, some don't.
> >>
> >> Ideally, we'd just fix that.
> >
> > Would you want to tell the far end "this machine simply does
> > not have an RTC device at all (because the hardware it's emulating
> > doesn't have one) and so you won't get RTC_CHANGE events" ?
> 
> Well, RTC_CHANGE is "Emitted when the guest changes the RTC time."  If
> the guest doesn't *have* an RTC...
> 
> > A good first step for getting more devices to implement the
> > RTC_CHANGE support would be if there was any documentation on how
> > to do it. The JSON schema says the offset should be "offset between
> > base RTC clock (as specified by -rtc base), and new RTC clock value",
> > but there aren't any hints (either there or elsewhere) as to how a
> > device is supposed to determine that value, and there's no
> > documentation of what the behaviour or intent is of the
> > qemu_timedate_diff() function that the existing implementations
> > use to calculate the offset.
> 
> RTC_CHANGE is from the bad old times, I'm afraid:
> 
>     commit 80cd34787fc0fc31b1a341c7b8d8e729c1b6ea58
>     Author: Luiz Capitulino <lcapitulino@redhat.com>
>     Date:   Thu Feb 25 12:11:44 2010 -0300
> 
>         QMP: Introduce RTC_CHANGE event
> 
>         Emitted whenever the RTC time changes.
> 
>         Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
>         Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> 
> No hint at why or how to use it.
> 
> I figure this is the matching libvirt commit:
> 
>     commit 32e6ac9c2601e19715d18f743cf805a3466d3385
>     Author: Daniel P. Berrangé <berrange@redhat.com>
>     Date:   Thu Mar 18 18:28:15 2010 +0000
> 
>         Add support for an explicit  RTC change event
> 
>         This introduces a new event type
> 
>            VIR_DOMAIN_EVENT_ID_RTC_CHANGE
> 
>         This event includes the new UTC offset measured in seconds.
>         Thus there is a new callback definition for this event type
> 
>          typedef void (*virConnectDomainEventRTCChangeCallback)(virConnectPtr conn,
>                                                                 virDomainPtr dom,
>                                                                 long long utcoffset,
>                                                                 void *opaque);
> 
>         If the guest XML configuration for the <clock> is set to
>         offset='variable', then the XML will automatically be
>         updated with the new UTC offset value. This ensures that
>         during migration/save/restore the new offset is preserved.
> 
>         * daemon/remote.c: Dispatch RTC change events to client
>         * examples/domain-events/events-c/event-test.c: Watch for
>           RTC change events
>         * include/libvirt/libvirt.h.in: Define new RTC change event ID
>           and callback signature
>         * src/conf/domain_event.c, src/conf/domain_event.h,
>           src/libvirt_private.syms: Extend API to handle RTC change events
>         * src/qemu/qemu_driver.c: Connect to the QEMU monitor event
>           for RTC changes and emit a libvirt RTC change event
>         * src/remote/remote_driver.c: Receive and dispatch RTC change
>           events to application
>         * src/remote/remote_protocol.x: Wire protocol definition for
>           RTC change events
>         * src/qemu/qemu_monitor.c, src/qemu/qemu_monitor.h,
>           src/qemu/qemu_monitor_json.c: Watch for RTC_CHANGE event
>           from QEMU monitor
> 
> Suggests it might be needed for migration.
> 
> How today's libvirt uses RTC_CHANGE would be good to know.  I don't have
> the time to ferret it out myself.  Daniel, do you know?  If not, who
> else might?

Libvirt puts it into an event and emits it to client applications.

When booting a guest it is possible to give an RTC offset for the
guest.  If you shut it off and want to cold boot it again later,
you really want to preserve the RTC offset that the guest might
have updated.  Thus an application like oVirt listens for the
RTC change event and remembers this offset for subsequent boots.

This is especially important for Windows because they keep the
RTC in localtime, so twice a year they change the RTC and you
want to keep track of that.

> > Side side note: the JSON event doesn't seem to contemplate
> > the possibility that a machine might have more than one RTC...
> 
> Right.  It clearly needs an additional member @qom-path identifying the
> RTC device.

Are there (mainstream) machines with more than one RTC ?

The original use case only cared about x86 machines and my knowledge of
other targets is minimal.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


