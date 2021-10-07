Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1234250A9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:04:43 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQGX-0001m3-Sv
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYQE4-0000y6-Ck
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYQDx-0001s0-GW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633600919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ir2PYgDS7E/HsgfbxfYJmhA97ZSzSb2b703avJccg6g=;
 b=FQ0rHkz+Sh3jf6uFIVRGCsKo0anpxEfSwc6/gs2d9SGayFS/T6q//rH9Hxflv6pmwL7utw
 HJDSFvWt3AbSWSW65HUMgaCYbhYMrKy1BqZ5ib9UmaQKd9rEdDM1ysWSf28O596O8gea/A
 r1z60UiKX7qPo5e3eSoYqN6myNrcCvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-idatI4dNNQWJIJSutqkK8g-1; Thu, 07 Oct 2021 06:01:56 -0400
X-MC-Unique: idatI4dNNQWJIJSutqkK8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4411802C92
 for <qemu-devel@nongnu.org>; Thu,  7 Oct 2021 10:01:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D10811017CE4;
 Thu,  7 Oct 2021 10:01:44 +0000 (UTC)
Date: Thu, 7 Oct 2021 12:01:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QAPI sync meeting
Message-ID: <YV7Fh2DihM65rgnN@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ee97y3q5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.09.2021 um 14:18 hat Markus Armbruster geschrieben:
> > I'm proposing a one-off here just for some initial discussion and planning.
> > (We didn't have a QAPI BoF at KVM Forum and I'd like something similar
> > now.) I don't expect we'll really "finish" plotting out a roadmap in a
> > single 60 minute meeting, but it will probably give us good, targeted
> > discussions on the ML to follow. If more meetings are desired to discuss
> > specific topics, I'm not against scheduling them as-needed.
> 
> Let's have one now, and then more as needed.
> 
> Jumping into the meeting unprepared, then spending half of the alloted
> time listening to people explaining where they want to take QAPI seems
> like a bad use of our time.  Better: write it up and post it, so we can
> all read before we meet.  Do not reply, except perhaps to ask for
> clarification.  Discuss in the meeting.
> 
> I can see such posts from Marc-Andre, Kevin, and Daniel.  Some of them
> could use a bit more detail, perhaps.

To be a bit more specific and give more details about what I'm currently
working on:

* The larger theme is command line QAPIfication, with the eventual goals
  of having introspection and a config file.

* Support for member aliases: This provides a way to bridge much of the
  gap between command line and QMP syntax. Markus tells me that it's
  unclear yet whether we want this in both QMP and CLI (unlikely for
  now), just CLI or not at all.

  First posted in November 2020, latest version is v4:
  https://patchew.org/QEMU/20210917161320.201086-1-kwolf@redhat.com/

  * Does anyone apart from myself have additional uses for aliases that
    should be considered in the evaluation of the feature?

  * -chardev: I have patches that QAPIfy the option based on aliases,
    getting rid of the old handwritten parser that is inconsistent with
    QMP in non-obvious ways and replacing it with translation to QMP
    (both using aliases and a little C code) that makes the differences
    obvious.

    First posted in November 2020, more details in the cover letter:
    https://patchew.org/QEMU/20201112175905.404472-1-kwolf@redhat.com/

    Later versions (not yet posted as a series because I'm waiting for
    aliases) also make -chardev accept JSON syntax, which is what
    libvirt really wants to use.

  * Came up during the discussion of the patches:
    Maybe we should actually start defining some command line options in
    the schema now, even if many options will still have to defer to the
    old parsing code. But it would be a start, could set an example for
    any new options and provides a clear path to incrementally convert
    everything. If we don't even start, we're sure to never finish it.

* -object: First part is done, we have a full QAPI schema of all
  user-creatable objects. object-add and --object in tools go through
  pure QAPI paths. System emulator -object is still based on QemuOpts
  because of compatibility concerns with list hacks (affects one single
  property of one object), but JSON syntax has been added that goes
  straight to QAPI.

  Next part is actual integration of QOM with QAPI so that the
  configuration isn't duplicated between QOM code and the schema, but
  user-creatable QOM classes are defined and QOM boilerplate is
  generated from the schema. I've started looking into this, but still
  in an early stage.

* -device/device-add: This is in a terrible state all around. Even QMP
  device-add is based on QemuOpts, and libvirt makes use of this by
  passes everything as strings instead of the proper types.

  Peter Krempa is working on using the proper types in libvirt.

  I sent patches to at least add a JSON variant for the command line
  option -device which is a non-QemuOpts code path. It also tried to fix
  device-add to be type safe, but until libvirt is fixed, we must stay
  bug compatible. So for this and other reasons this is not ready yet
  and needs a v2.
  https://patchew.org/QEMU/20210924090427.9218-1-kwolf@redhat.com/

  Full QAPIfication with a schema and introspection will still take a
  while. The QOM/QAPI integration work mentioned above is a dependency
  there. A schema like for object-add, with a big union of all possible
  devices, just doesn't scale.

  Having JSON CLI and a non-QemuOpts QMP command allow us to make the
  traditional syntax unstable (HMP-like support) and should be very
  helpful when we eventually do get to do proper QAPIfication.

  * Should we have a general rule that for command line options that
    accept both JSON and a human format, only JSON is considered a
    stable API and the human format works more like HMP?

Also one non-technical topic that may or may not be worth discussing:

* Patches to QAPI tend to take a long time to be merged (or rejected).
  This is understandable as a lot of things are going on and QAPI is an
  external interface with compatibility promises, so we need to be
  careful. Can we still still do anything to improve the situation? For
  example, can the load be spread across more people?

Kevin


