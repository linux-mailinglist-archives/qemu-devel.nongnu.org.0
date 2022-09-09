Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5165B3B0B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 16:48:35 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWfJ4-0002gU-HC
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 10:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oWfGD-0000nU-TH
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oWfG5-0006nt-1n
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662734727;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0vPOSuQb7bnMmjbgAsDENwk7+lOSK9AsuBZcIhASlE=;
 b=ddjD2R+LXFlA+YJ/KOe/BR4OtJV4Eg8D5fl92ZGq91nxEwgceCCbb1ytf3TQO29jYDzMgl
 z4LSEqbFPrJDfvQDwHb9qJq0e3yQfA+BRwemCjl8cB3yDFyt6fL+YT5GOSpEM5BV4f8Yl0
 kVz53J1j/8E9LhhgigxugyM8bgBNlO0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-HrlvqRgNPoqX1slQKHttSA-1; Fri, 09 Sep 2022 10:45:22 -0400
X-MC-Unique: HrlvqRgNPoqX1slQKHttSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D8F63810D2B;
 Fri,  9 Sep 2022 14:45:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58A0C1410F36;
 Fri,  9 Sep 2022 14:45:19 +0000 (UTC)
Date: Fri, 9 Sep 2022 15:45:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
Message-ID: <YxtRfYZWuOYC40cU@redhat.com>
References: <20220908093936.19280-1-pbonzini@redhat.com>
 <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
 <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
 <490c7ed8-53be-31de-1065-14b2fec492b2@suse.de>
 <YxtEkdBkYgiwMJyB@redhat.com>
 <17ef7456-9652-6105-b81d-7a92ee9a6ced@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17ef7456-9652-6105-b81d-7a92ee9a6ced@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 09, 2022 at 04:27:34PM +0200, Claudio Fontana wrote:
> On 9/9/22 15:50, Daniel P. Berrangé wrote:
> > On Fri, Sep 09, 2022 at 03:41:22PM +0200, Claudio Fontana wrote:
> >> On 9/9/22 00:05, Paolo Bonzini wrote:
> >>> Il gio 8 set 2022, 15:47 Claudio Fontana <cfontana@suse.de> ha scritto:
> >>>
> >>>> On 9/8/22 11:39, Paolo Bonzini wrote:
> >>>>> Queued, thanks.
> >>>>>
> >>>>> Paolo
> >>>>>
> >>>>>
> >>>>
> >>>> Thanks. When it comes to programmatic checks about what QEMU supports in
> >>>> terms of audio,
> >>>>
> >>>> is there something that can be done with QMP?
> >>>>
> >>>> I checked the QMP manual at:
> >>>>
> >>>>
> >>>> https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2948
> >>>>
> >>>> but in the "Audio" section there is a bunch of Objects and enums defined,
> >>>> but no command to query them...
> >>>>
> >>> No, there's nothing yet.
> > 
> > You're now reminding me of the patch I sent a while ago for reporting
> > audiodev backends and then completely forgot to followup on
> > 
> >   https://mail.gnu.org/archive/html/qemu-devel/2021-03/msg00656.html
> > 
> > 
> >> Interesting. What about Display (ie ui-*) ? I mean how do I figure out from, say, libvirt,
> >> everything that QEMU can do in terms of display, which drivers are actually installed?
> >>
> >> Same for block...
> >>
> >> with the increasing modularization of QEMU we should I presume strengthen the discoverability of QEMU capabilities right?
> >> This way we can configure once, and install just what is needed to match the user requirements, or distro variant.
> >>
> >> As Markus mentioned maybe a more general solution would be to have these things as qom objects so that a
> >>
> >> qom-list-types
> >> can be used to get all 'audiodev' types, or all 'display' types, or all 'block' types and solve the problem this way?
> > 
> >> Is there a more general problem / solution that I am not seeing?
> > 
> > In an idealized world (where we can ignore the reality of our
> > existing legacy codebase) I think all backends would simply
> > be QOM objects, and created with -object, avoiding the need for
> > any backend type specific CLI args like -audiodev / -netdev / etc.
> > 
> > This would actually also extend to frontends, devices, cpus,
> > machine types etc all being objects, ought to be creatable via
> > -object, not requiring -device, -machine.
> > 
> > If we lived in the world where everything was a QOM Object,
> > then qom-list-types would serve as the universal detection
> > mechanism for everything.
> > 
> > Back in our current reality of pre-existing legacy code though,
> > we have to be a little more pragmattic. If we can make things
> > into QOM objects that work with -object / qom-list-types that's
> > great, but if it is too much work we'll just have to create other
> > QMP commands for querying, such as the query-audiodev patch.
> > 
> > 
> > With regards,
> > Daniel
> 
> Hmm the patch I am seeing though says that it
> 
> "reflects back the list of configured -audiodev command line options".
> 
> Maybe we are saying the same thing, but maybe we aren't,
> what we are actually trying to achieve is to probe which audiodev drivers are available, either built-in or loaded as modules.
> Same for display, block, etc.
> 
> You are instead trying to fetch the command line options?

Sort of, its a gross hack. By adding query-audiodev for querying the
config of -audiodev command line options, the audiodefv backend types
get added to the QMP schema. You can thus query for whether a backend
exists using query-qmp-schema'


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


