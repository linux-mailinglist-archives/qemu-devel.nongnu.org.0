Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A893359950
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:36:06 +0200 (CEST)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnYb-0006tl-86
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUnWo-0006Ee-4C
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUnWd-0001D1-RU
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617960841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPthS+tjLnK/dpUmrwnUfVql7JLcM2BbaK4Rshpta9M=;
 b=S08Fbub0lP6VkRzQA0vop0I/Nr3rhIBcxXypdf0vW7ge09bDpVmh3/SAD6Alp1fhWThtvq
 gm0IcrG46veUL+WU1NKuPVsR5r8kfXAPtX1ux2PohU/mKdrvz8zypVCQqBUEp4ZLeOaw3/
 NC9WSQDz/3Yq6bssvZR79RnmGfZKkdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-P1gFoShCNqeUlyW0jMqbsA-1; Fri, 09 Apr 2021 05:33:59 -0400
X-MC-Unique: P1gFoShCNqeUlyW0jMqbsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA05107ACCA;
 Fri,  9 Apr 2021 09:33:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C97B26E406;
 Fri,  9 Apr 2021 09:33:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48826113525D; Fri,  9 Apr 2021 11:33:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for
 comments and docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
 <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
 <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
 <YG7FpVcY72KhQbBJ@redhat.com>
Date: Fri, 09 Apr 2021 11:33:56 +0200
In-Reply-To: <YG7FpVcY72KhQbBJ@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 8 Apr 2021 09:58:13 +0100")
Message-ID: <87lf9r3ipn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Mar 26, 2021 at 04:44:25PM +0000, Peter Maydell wrote:
>> On Fri, 26 Mar 2021 at 16:33, John Snow <jsnow@redhat.com> wrote:
>> > Being less terse about it: Mostly, I don't like how it enforces this
>> > column width even for indented structures. Generally, we claim that 72
>> > columns is "comfortable to read" and I agree.
>> >
>> >                                     However, when we start in a margin=
, I
>> >                                     am not convinced that this is
>> >                                     actually more readable than the
>> >                                     alternative. We aren't using our f=
ull
>> >                                     72 characters here.
>>=20
>> I agree, and I don't see any strong reason to hold our Python
>> code to a different standard to the rest of our codebase as
>> regards line length and comment standards.
>
> There's one small difference with python vs the rest of the codebase when
> it comes to API doc strings specifically. eg we have a docstring API comm=
ent
> in python/qemu/machine.py:
>
> class QEMUMachine:
>     """
>     A QEMU VM.
>
>     Use this object as a context manager to ensure
>     the QEMU process terminates::
>
>         with VM(binary) as vm:
>             ...
>         # vm is guaranteed to be shut down here
>     """
>
> This formatting, including line breaks, is preserved as-is when a user
> requests viewing of the help:
>
>>>> print(help(qemu.machine.QEMUMachine))
>
> Help on class QEMUMachine in module qemu.machine:
>
> class QEMUMachine(builtins.object)
>  |  QEMUMachine(binary: str, args: Sequence[str] =3D (), wrapper: Sequenc=
e[str] =3D (), name: Optional[str] =3D None, test_dir: str =3D '/var/tmp', =
monitor_address: Union[Tuple[str, str], str, NoneType] =3D None, socket_scm=
_helper: Optional[str] =3D None, sock_dir: Optional[str] =3D None, drain_co=
nsole: bool =3D False, console_log: Optional[str] =3D None)
>  | =20
>  |  A QEMU VM.
>  | =20
>  |  Use this object as a context manager to ensure
>  |  the QEMU process terminates::
>  | =20
>  |      with VM(binary) as vm:
>  |          ...
>  |      # vm is guaranteed to be shut down here
>  | =20
>  |  Methods defined here:
>  | =20
>
>
> IOW, while we as QEMU maintainers may not care about keeping to a narrow
> line width, with API docstrings, we're also declaring that none of the
> users of the python APIs can care either. These docstrings are never
> reflowed, so they can end up wrapping if the user's terminal is narrow
> which looks very ugly.
>
>
> So this python API docstring scenario is slightly different from our
> main codebase, where majority of comments are only ever going to be seen
> by QEMU maintainers, and where C API doc strings don't preserve formattin=
g,
> because they're turned into HTML and re-flowed.
>
> Having said all that, I still don't think we need to restrict ourselves
> to 72 characters. This is not the 1980's with people using text terminals
> with physical size constraints. I think it is fine if we let python
> docstrings get larger - especially if the docstrings are already indented
> 4/8/12 spaces due to the code indent context, because the code indent is
> removed when comments are displayed. I think a 100 char line limit would
> be fine and still not cause wrapping when using python live help().

The trouble with long lines is not text terminals, it's humans.  Humans
tend to have trouble following long lines with their eyes (I sure do).
Typographic manuals suggest to limit columns to roughly 60 characters
for exactly that reason[*].

Most doc strings are indented once (classes, functions) or twice
(methods).  72 - 8 is roughly 60.

With nesting, doc strings can become indented more.  Nesting sufficient
to squeeze the doc string width to column 72 under roughly 60 is pretty
rare.  Going beyond 72 colums to keep such doc strings readable is
exactly what PEP 8 wants you to do.

Again, I see no reason to deviate from PEP 8.


[*] https://en.wikipedia.org/wiki/Column_(typography)#Typographic_style


