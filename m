Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BF41931F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:31:03 +0200 (CEST)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoqc-00065s-8W
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUonW-0004Vy-2R
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:27:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUonU-0001Ud-9X
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632742067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VsNGT+GxGBgggMft1N/YuNhIjuglkkVNPsBi27EoQfw=;
 b=XIJj3IeOSf8Nz7oPYvkcc1/eRbhuHFn/Ydq6Waptsd/FHBpqMbcBzAngFS+92phhOVkfgc
 ohQrcOZMgXBtKXXbxsaDGzoz8l4uYlN7s2EYaI9ShpSmEOKaLa864staqHRGHmu9cpA0U/
 QEKsyAbM0ZX9OqgVYTl9ylLyTKbDp0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-O8JgRm3jPxqlDyQFzr-wLA-1; Mon, 27 Sep 2021 07:27:44 -0400
X-MC-Unique: O8JgRm3jPxqlDyQFzr-wLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D637802921;
 Mon, 27 Sep 2021 11:27:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B1060938;
 Mon, 27 Sep 2021 11:27:36 +0000 (UTC)
Date: Mon, 27 Sep 2021 13:27:34 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Message-ID: <YVGqptZGZ6PhqixP@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
 <CAFEAcA-Paf0+BvdFrT=B_jfzCNzGB6w4-7hjBeXWt0sJJYJs-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Paf0+BvdFrT=B_jfzCNzGB6w4-7hjBeXWt0sJJYJs-Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Krempa <pkrempa@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2021 um 11:00 hat Peter Maydell geschrieben:
> On Fri, 24 Sept 2021 at 10:14, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > We want to switch both from QemuOpts to the keyval parser in the future,
> > which results in some incompatibilities, mainly around list handling.
> > Mark the non-JSON version of both as unstable syntax so that management
> > tools switch to JSON and we can later make the change without breaking
> > things.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> > +Stable non-JSON ``-device`` and ``-object`` syntax (since 6.2)
> > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +If you rely on a stable interface for ``-device`` and ``-object`` that doesn't
> > +change incompatibly between QEMU versions (e.g. because you are using the QEMU
> > +command line as a machine interface in scripts rather than interactively), use
> > +JSON syntax for these options instead.
> > +
> > +There is no intention to remove support for non-JSON syntax entirely, but
> > +future versions may change the way to spell some options.
> 
> As it stands, this is basically saying "pretty much anybody
> using the command line, your stuff may break in future, instead
> use some other interface you've never heard of, which doesn't
> appear to be documented in the manual and which none of the
> documentation's examples use".

The documentation is a valid criticism. We need to document the JSON
interfaces properly (which will really mostly be a pointer to the
existing QMP documentation at least for -object, but it's important to
tell people where to look for the details).

> Is there some more limited deprecation we can do rather than "the
> entire commandline for almost all users" ?

I don't think "almost all" users is true. I see three groups of users:

1. Using a management tool that is probably using libvirt. This is
   likely the vast majority of users. They won't notice a difference
   because libvirt abstracts it away. libvirt developers are actively
   asking us for JSON (and QAPI) based interfaces because using the same
   representation to describe configurations in QMP and on the CLI makes
   their life easier.

2. People starting QEMU on the command line manually. This is
   essentially the same situation as HMP: If something changes, you get
   an error message, you look up the new syntax, done. Small
   inconvenience, but that's it. This includes simple scripts that just
   start QEMU and are only used to store a long command line somewhere.

3. People writing more complex scripts or applications that invoke QEMU
   manually instead of using libvirt. They may actually be hurt by such
   changes. They should probably be using a proper machine interface,
   i.e. JSON mode, so the deprecation notice is for them to change
   their code. This is probably a small minority and not "almost all
   users".

Yes, we could in theory do a more limited deprecation. The planned
change from my side is just going from QemuOpts to the keyval parser,
which doesn't change anything in the vast majority of cases.

But we have the separation in the monitor between QMP and HMP for a good
reason: Requirements for a good machine interface are different from a
good human interface. The same is true for the command line.

So it seems to make a lot of sense to me to have both a machine
interface (JSON based) and a human interface (non-JSON) on the command
line, too, and take the same liberties for evolving the human interface
as we already do in HMP - which means that it's technically an unstable
interface where compatibility doesn't prevent improvements, but not that
it looks completely different in every QEMU version.

Kevin


