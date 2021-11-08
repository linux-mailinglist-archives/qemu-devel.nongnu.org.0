Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737F447CC1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:26:21 +0100 (CET)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0uy-0007BN-Ik
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mk0tI-0005Js-UL
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mk0tG-0002zi-Ue
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636363474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHOosZ2kMKUQ4jEgih1lEA03JC3f7ooM35j2w8GgmWw=;
 b=J23GCfSCIShI92lyQ4U0+DAgdItqa6c7aDL+tvfRIRd8vBYxxEhOQFvPOsdwdihjVR7QQ2
 qycspTIfiL5vRRzYkYzSOXYIVpaGzgHHAbg/BxqgcrkSpaymSxpaJCV5Inn5YuyF4M+QXq
 1uF4jun8o5gdI6gcGgv1qUa/UobQWzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-YlsiA1RyPFeXY8ZDj988Ug-1; Mon, 08 Nov 2021 04:24:33 -0500
X-MC-Unique: YlsiA1RyPFeXY8ZDj988Ug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BFA804142;
 Mon,  8 Nov 2021 09:24:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B45960BE5;
 Mon,  8 Nov 2021 09:24:16 +0000 (UTC)
Date: Mon, 8 Nov 2021 09:24:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
Message-ID: <YYjsvY3W27a1jUCD@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 libvir-list@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 08:59:51AM +0100, Thomas Huth wrote:
> On 05/11/2021 16.53, Willian Rampazzo wrote:
> > This introduces a new `make` target, `check-avocado`, and adds a
> > deprecation message about the `check-acceptance` target. This is
> > a preparation for renaming the `tests/acceptance` folder to
> >   `tests/avocado`.
> > 
> > The plan is to remove the call to the `check-avocado` target one
> > or two months after the release and leave the warning to force
> > people to move to the new `check-avocado` target.
> > 
> > Later, the `check-acceptance` target can be removed. The intent
> > is to avoid a direct impact during the current soft freeze.
> > 
> > Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >   docs/about/deprecated.rst | 13 +++++++++++++
> >   tests/Makefile.include    | 17 ++++++++++++-----
> >   2 files changed, 25 insertions(+), 5 deletions(-)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 56f9ad15ab..7bf8da8325 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -410,3 +410,16 @@ nanoMIPS ISA
> >   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
> >   As it is hard to generate binaries for it, declare it deprecated.
> > +
> > +Testing
> > +-------
> > +
> > +Renaming of the acceptance folder to avocado
> > +''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +The ``tests/acceptance`` folder was never used to store acceptance tests
> > +in terms of software engineering. This naming can confuse developers
> > +adding tests using the Avocado Framework to this folder. The folder
> > +name change to ``tests/avocado`` also changed the ``make`` target from
> > +``check-acceptance`` to ``check-avocado``. In this case, the use of the
> > +``check-acceptance`` target is deprecated.
> 
> Not sure whether we need  to document this in deprecated.rst, too, since
> we're normally only listing the things here that affect the users of the
> qemu binaries, not the people who want to recompile and run the tests...
> OTOH, I don't mind too much either if we list it here... Anybody else got an
> opinion on this?

Deprecations are only things for user facing changes in the apps.

For build system changes we don't bother with any deprecation cycle.
Just make the change immediately and document it in the release notes.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


