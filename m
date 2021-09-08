Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBD4039AE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:23:54 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwcL-00038g-EW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mNwX3-00068y-Q3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mNwX2-0004JE-3q
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YCk/amKK+0gqnBI2YYcCQbuSs9jDS/mpz8P15GUl6jA=;
 b=XAyaYI/Z6unSaNWtLGU75Hfxhdg1VDWRg2FoKYgHXhooJT00/y6kmoDgyY7s4DbeywrKn2
 Bicf0KKUzxc76pShYDJqyKdnURKWAQMrh4RcOqC3S2BGs7hBHmNAyanfv6Xz/D3S08yCN4
 I/39BxpyYNxtunEMHsor1XnwbGgHaBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-GIzC9RzqPGukfdbWiRxZVw-1; Wed, 08 Sep 2021 08:18:17 -0400
X-MC-Unique: GIzC9RzqPGukfdbWiRxZVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D2D84A5E6
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:18:16 +0000 (UTC)
Received: from fedora (unknown [10.43.2.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4BF77F29;
 Wed,  8 Sep 2021 12:18:13 +0000 (UTC)
Date: Wed, 8 Sep 2021 14:18:11 +0200
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
Message-ID: <YTiqA/wEW7yWwyD3@fedora>
References: <20210908103711.683940-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908103711.683940-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C9V52uVl5p53u+RN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--C9V52uVl5p53u+RN
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Wednesday in 2021, Daniel P. Berrang=E9 wrote:
>We are still adding HMP commands without any QMP counterparts. This is
>done because there are a reasonable number of scenarios where the cost
>of designing a QAPI data type for the command is not justified.
>
>This has the downside, however, that we will never be able to fully
>isolate the monitor code from the remainder of QEMU internals. It is
>desirable to be able to get to a point where subsystems in QEMU are
>exclusively implemented using QAPI types and never need to have any
>knowledge of the monitor APIs.
>
>The way to get there is to stop adding commands to HMP only. All
>commands must be implemented using QMP, and any HMP implementation
>be a shim around the QMP implementation.
>
>We don't want to compromise our supportability of QMP long term though.
>
>This series proposes that we relax our requirements around fine grained
>QAPI data design, but with the caveat that any command taking this
>design approach is mandated to use the 'x-' name prefix.
>
>This tradeoff should be suitable for any commands we have been adding
>exclusively to HMP in recent times, and thus mean we have mandate QMP
>support for all new commands going forward.
>
>This series illustrates the concept by converting the "info registers"
>HMP to invoke a new 'x-query-registers' QMP command. Note that only
>the i386 CPU target is converted to work with this new approach, so
>this series needs to be considered incomplete. If we go forward with
>this idea, then a subsequent version of this series would need to
>obviously convert all other CPU targets.
>
>After doing that conversion the only use of qemu_fprintf() would be
>the disas.c file. Remaining uses of qemu_fprintf and qemu_printf
>could be tackled in a similar way and eventually eliminate the need
>for any of these printf wrappers in QEMU.
>
>NB: I added docs to devel/writing-qmp-commands.rst about the two
>design approaches to QMP. I didn't see another good place to put
>an explicit note that we will not add any more HMP-only commands.
>Obviously HMP/QMP maintainers control this in their reviews of
>patches, and maybe that's sufficient ?
>
>NB: if we take this approach we'll want to figure out how many
>HMP-only commands we actually have left and then perhaps have
>a task to track their conversion to QMP. This could possibly
>be a useful task for newbies if we make it clear that they
>wouldn't be required to undertake complex QAPI modelling in
>doing this conversion.
>
>Daniel P. Berrang=E9 (5):
>  docs/devel: document expectations for QAPI data modelling for QMP
>  hw/core: introduce 'format_state' callback to replace 'dump_state'
>  target/i386: convert to use format_state instead of dump_state
>  qapi: introduce x-query-registers QMP command
>  monitor: rewrite 'info registers' in terms of 'x-query-registers'
>
> docs/devel/writing-qmp-commands.rst |  25 +++
> hw/core/cpu-common.c                |  15 ++
> hw/core/machine-qmp-cmds.c          |  28 +++
> include/hw/core/cpu.h               |  13 +-
> monitor/misc.c                      |  25 ++-
> qapi/machine.json                   |  37 ++++
> target/i386/cpu-dump.c              | 325 +++++++++++++++-------------
> target/i386/cpu.c                   |   2 +-
> target/i386/cpu.h                   |   2 +-
> 9 files changed, 307 insertions(+), 165 deletions(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--C9V52uVl5p53u+RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAmE4qgMACgkQAk1z5KIM
l5TiZAgAn8cPcB8dX7B6/Mckhv+2d13FyGD1j8pZHDsFDuth1nuuWRTX9oSrSaeQ
6Bk4KPMMkH93QWALvQ+F47JGLE5FBsTjvRhlW7llsnY2QcelsiJrvuVVWbGu/I/h
q8AShTx0uZITcssg7vEb/VY7Qt8iuRXlALOX3K/3yDbKOe7ONc0LTz1lNieB2YB8
61o75UGF1h8VROsQN4onsCN/sFkH8BOAjEqdsXctonwjEUbP22WPbzpPIftvIitr
xMFMGmKNYERxoOn4ECfw23z/f7LNVGjX6F3VunVWMlL8aI9V7ajVr731sHjAQZnB
w9CKydJlr17QSpFr//NipUto4XAh7g==
=c3Ep
-----END PGP SIGNATURE-----

--C9V52uVl5p53u+RN--


