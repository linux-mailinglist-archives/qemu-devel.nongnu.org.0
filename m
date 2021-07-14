Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F363C80D6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 10:57:11 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3aha-00049W-7y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3agf-0002w6-C4
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3agd-0001bq-Fm
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626252970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9QuxlHiyq9t3ixn7iK1vNT94VOAr/cRXsALoQrhh44=;
 b=IS7HFzQjN8YOyLWMHNpoqzotDSArXS3LQCqodSqWvamTyzzLM+GSOQUFY20tXmtCE0e8eN
 MdyTsSvaLb78vPrKd/Mx1qW6pDEXEtnS/QsxHFSfe4eOz+fQvb3E+eZqk9vWVvFzTZX1y4
 xeHDR+S8TnBNAr/FxE+q1L5ucdd29w0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-tVBWKhiOPUKOEgTebAgHGw-1; Wed, 14 Jul 2021 04:56:08 -0400
X-MC-Unique: tVBWKhiOPUKOEgTebAgHGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE6A107AD82;
 Wed, 14 Jul 2021 08:56:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D46DB5DA61;
 Wed, 14 Jul 2021 08:56:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3844C113865F; Wed, 14 Jul 2021 10:56:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/7] docs: State QEMU version and license in all HTML
 footers
References: <20210705095547.15790-1-peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 10:56:05 +0200
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 5 Jul 2021 10:55:40 +0100")
Message-ID: <87eec1l1ei.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset is an effort to fix something up which I promised
> Markus I would do after we got the initial conversion to Sphinx
> done. The old QAPI reference documentation noted the documentation
> license in the texinfo source (but not in the generated HTML or
> in the generated manpages); Sphinx generated docs currently don't.
>
> The patchset starts with some tidyup that is possible now that
> we have a single combined HTML manual rather than five separate ones.
> Rather than putting common-to-all-QEMU info like the deprecation,
> build and license pages into the "system" manual, we can move them
> out to a new top level section which I have called "About". So that
> the manual doesn't now start too abruptly, I've also added some
> actual "about" text here (mostly cribbed or adapted from our website
> or from other parts of the manual).
>
> Secondly, it uses the Sphinx template-override functionality to
> add more text to the footer added to each HTML page, which will
> now read:
>
> # =C2=A9 Copyright 2021, The QEMU Project Developers.
> #
> # Built with Sphinx using a theme provided by Read the Docs.
> #
> # This documentation is for QEMU version 6.0.50.
> #
> # QEMU and this manual are released under the GNU General Public License,=
 version 2.
>
> where the last line is a hyperlink to the about/license page.
>
> I'm open to suggestions on:
>  * name of the new top-level section

"About" sounds good to me.

>  * text wording

Since Daniel reviewed already, I'd prefer to pass.

>  * whether we need to have the version number in the footer
>    (it's already in the sidebar under the QEMU logo, but this
>    seemed a bit too inconspicious, so I added it to the footer
>    since I was messing with it anyway)

No objection.

> You can find a built version of the docs at:
> https://pm215.gitlab.io/-/qemu/-/jobs/1399259647/artifacts/public/index.h=
tml

Lovely improvements overall.

> I had a look at getting our manpages to also state the license,
> but this is tricky due to various deficiencies in Sphinx.
> (We never have stated the license in our manpages, so this isn't
> a regression compared to the old texinfo setup.)

Leaving further improvement for later is okay.

> Markus: do you feel this series is sufficient that we can remove
> the TODO lines in docs/interop/qemu-ga-ref.rst,
> docs/interop/qemu-qmp-ref.rst and docs/interop/qemu-storage-daemon-qmp-re=
f.rst
> as now being done?

These:

    ..
       TODO: the old Texinfo manual used to note that this manual
       is GPL-v2-or-later. We should make that reader-visible
       both here and in our Sphinx manuals more generally.

    ..
       TODO: display the QEMU version, both here and in our Sphinx manuals
       more generally.

Copyright, license information and version are all visible in the page
footers.  The TODOs can go.

In the old Texinfo manual, copyright and license information was also
visible in the source, like this

    @copying
    This is the QEMU QMP reference manual.
   =20
    Copyright @copyright{} 2016 The QEMU Project developers
   =20
    @quotation
    This manual is free documentation: you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation, either version 2 of the
    License, or (at your option) any later version.
   =20
    This manual is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    General Public License for more details.
   =20
    You should have received a copy of the GNU General Public License
    along with this manual.  If not, see http://www.gnu.org/licenses/.
    @end quotation
    @end copying

Such per-file notices are not strictly required, but we habitually have
them in files holding source code.  I'm okay with omitting them in these
.rst files.

However, we got a bunch of .rst files with per-file copyright and
license notices, like this:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Vhost-user Protocol
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    :Copyright: 2014 Virtual Open Systems Sarl.
    :Copyright: 2019 Intel Corporation
    :Licence: This work is licensed under the terms of the GNU GPL,
              version 2 or later. See the COPYING file in the top-level
              directory.

Rendered to HTML, the page has *two* blocks of copyright and license
information: the above inline, and the footer.  This is confusing.
Worse, the license information is contradictory in places, e.g. with the
above, the inline license is GPLv2 or later, but the footer is GPLv2
exactly.  I know the intent (footer applies to QEMU as a whole, inline
just to this page), but legalese should be as clear as we can make it.

Can we downgrade the inline notices to comments?

This is a separate issue we can address on top for 6.1, so:
Acked-by: Markus Armbruster <armbru@redhat.com>


