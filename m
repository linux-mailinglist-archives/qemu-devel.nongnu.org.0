Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982CD6BD28E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcood-0000Qw-Mg; Thu, 16 Mar 2023 10:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcooa-0000QY-32
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcooX-0005S8-2U
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678977764;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PqIydS09eW4ZFtFm/dDLo36XIiZrEgu8CTwXxs2vEv8=;
 b=YSidn5E9EMyw/IqB8OvV/abqaov8vAxbsCsND5PNN08+/f1RRlKkzS07pxdXJ154ZgJAkN
 xDjL9X+BwQgyD4vd22AY/EdvwyzI6PtDdtvZdsrwAkyiuN1wDIZTdYhGsam7UJ7REbZAfK
 SiOOKiVK8w+BB61AwaaqX40+xtUa9+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-6dbsGjduOEiD-hfuJ9sgig-1; Thu, 16 Mar 2023 10:42:40 -0400
X-MC-Unique: 6dbsGjduOEiD-hfuJ9sgig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 324BA1C00AB0;
 Thu, 16 Mar 2023 14:42:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 800FA1121319;
 Thu, 16 Mar 2023 14:42:37 +0000 (UTC)
Date: Thu, 16 Mar 2023 14:42:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
Message-ID: <ZBMq20Lpgr1Rzx7B@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org> <ZBMfosr0JDyfjhqs@redhat.com>
 <87lejwlpz4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lejwlpz4.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 16, 2023 at 03:39:59PM +0100, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
> >> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> >> 
> >> > Per the C++ standard, empty enum are ill-formed. Do not generate
> >> > them in order to avoid:
> >> >
> >> >   In file included from qga/qga-qapi-emit-events.c:14:
> >> >   qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
> >> >      20 | } qga_QAPIEvent;
> >> >         | ^
> >> >
> >> > Reported-by: Markus Armbruster <armbru@redhat.com>
> >> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >> 
> >> Two failures in "make check-qapi-schema" (which is run by "make check"):
> >> 
> >> 1. Positive test case qapi-schema-test
> >> 
> >>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/qapi-schema-test.out
> >>     +++ 
> >>     @@ -19,7 +19,6 @@
> >>          member enum2: EnumOne optional=True
> >>          member enum3: EnumOne optional=False
> >>          member enum4: EnumOne optional=True
> >>     -enum MyEnum
> >>      object Empty1
> >>      object Empty2
> >>          base Empty1
> >> 
> >>    You forgot to update expected test output.  No big deal.
> >> 
> >> 2. Negative test case union-empty
> >> 
> >>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/union-empty.err
> >>     +++ 
> >>     @@ -1,2 +1,2 @@
> >>     -union-empty.json: In union 'Union':
> >>     -union-empty.json:4: union has no branches
> >>     +union-empty.json: In struct 'Base':
> >>     +union-empty.json:3: member 'type' uses unknown type 'Empty'
> >>     stderr:
> >>     qapi-schema-test FAIL
> >>     union-empty FAIL
> >> 
> >>    The error message regresses.
> >> 
> >>    I can see two ways to fix this:
> >> 
> >>    (A) You can't just drop empty enumeration types on the floor.  To not
> >>        generate code for them, you need to skip them wherever we
> >>        generate code for enumeration types.
> >> 
> >>    (B) Outlaw empty enumeration types.
> >> 
> >> I recommend to give (B) a try, it's likely simpler.
> >
> > Possible trap-door with (B), if we have any enums where *every*
> > member is conditionalized on a CONFIG_XXX rule, there might be
> > certain build scenarios where an enum suddenly becomes empty.
> 
> Do we have an example for this?
> Because it looks really weird.  I would expect that the "container" unit
> of that enumeration is #ifdef out of compilation somehow.

I'm not sure if such an example physically exists. I know the  audio
code gets close, with all but 2 options conditional:

{ 'enum': 'AudiodevDriver',
  'data': [ 'none',
            { 'name': 'alsa', 'if': 'CONFIG_AUDIO_ALSA' },
            { 'name': 'coreaudio', 'if': 'CONFIG_AUDIO_COREAUDIO' },
            { 'name': 'dbus', 'if': 'CONFIG_DBUS_DISPLAY' },
            { 'name': 'dsound', 'if': 'CONFIG_AUDIO_DSOUND' },
            { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
            { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
            { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
            { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
            { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
            { 'name': 'spice', 'if': 'CONFIG_SPICE' },
            'wav' ] }

Just wanted to warn that we shouldn't assume empty enums can't
exist, because it would be quite easy to add 2 extra conditionals
to this audio example, and the enum wouldn't appear empty at a
glance, but none the less could be empty in some compile scenarios

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


