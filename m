Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B33FC8A8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:48:06 +0200 (CEST)
Received: from localhost ([::1]:43226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL47R-0006pJ-NU
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mL41q-0007d6-6B
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:42:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mL41j-0007KH-OT
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630417330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XECjskz2AmwJMDt9pC94qtUn9cGrTtYzJZT8ntVlaJI=;
 b=HFBEHkDKs/rxxPQ19T5zXpuXEwf0KYnVlYAoT/MIetZt5mKHdU2VJG/Ar1BgnKDdHUVbhe
 SCAEMkjn2uaGZ2IC0V8RqEHYYN1pputmnsKaSqUheC1IIK6lpHInJYMYsOZ7+Nmi0Ab+fu
 1MEQgK1umt1oDSjB+VbPwfOKJ+ZlPQs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-tgTSfRGmP_C_SF2FUOitZw-1; Tue, 31 Aug 2021 09:42:09 -0400
X-MC-Unique: tgTSfRGmP_C_SF2FUOitZw-1
Received: by mail-pf1-f199.google.com with SMTP id
 b10-20020a056a0002ca00b003e1bfef6c57so5931pft.13
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 06:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XECjskz2AmwJMDt9pC94qtUn9cGrTtYzJZT8ntVlaJI=;
 b=qFN7jVfyzBbjWO/YAGE/bDeDFuUv+pBc1jKbzKPyzHUx3RmXek1tBp07S87+ltFjwv
 Gn9Ox0B1fzK4J/U0KgQy0CAH6L6/8lJ4WHhmwbeBcBtVHf5u5RN2XSVMypCVmfegkgpd
 gneVs2dzlqFdMIJujEcERUJQc7Bdp2Nmlcm//VYe4H16tNgelrOfzT6wMKxnMHIWF9uQ
 IhIleHyDJu74zhY2P+KF/Nvp4m4TOOK9gXb5wGzwcVjk7oTpuKSHU6HFPwVcj8x1QpgJ
 iLpKczmuw6xHw2Nk0ci7mCWVYFeIL6OyLOL7jsdeRF3uOFTFFSxA+nRADbI3jE1Gf5yP
 gk+A==
X-Gm-Message-State: AOAM533cqOhsxsQ8zlJNTVy4bFQoIoCx9aKwphwyECStE8fNnfIBkIMN
 1JgprwvpI/g4FIVraTTNN0Gd2hJoZzpn3M7PSKgW4TgADxGnTYJc76iwYIPnqjT4kdMjqfa3xg2
 gXUrx5BI6I42dkj3QAjUcB02x0CpBR7Q=
X-Received: by 2002:a63:d017:: with SMTP id z23mr11306711pgf.108.1630417327907; 
 Tue, 31 Aug 2021 06:42:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy22v/RZ9ZEx9qd4TnQI4yXIvpUyOoBayGK9u4kIWfAiK9pa7hH1okEQZiedeNmQ+6T0GsMdbkbspeny1Fwqrc=
X-Received: by 2002:a63:d017:: with SMTP id z23mr11306681pgf.108.1630417327537; 
 Tue, 31 Aug 2021 06:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210831123809.1107782-1-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 31 Aug 2021 17:41:56 +0400
Message-ID: <CAMxuvaxLTknvV3k_J4OtTWB2MjL6tj_2AH-0=NV7QbZLwFwOWA@mail.gmail.com>
Subject: Re: [PATCH 00/12] qapi: Fixes and cleanups for recent work (mostly)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a4d94205cadb1df5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4d94205cadb1df5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 4:38 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Markus Armbruster (12):
>   qapi: Simplify QAPISchemaIfCond's interface for generating C
>   qapi: Simplify how QAPISchemaIfCond represents "no condition"
>   tests/qapi-schema: Correct two 'if' conditionals
>   tests/qapi-schema: Demonstrate broken C code for 'if'
>   qapi: Fix C code generation for 'if'
>   qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()
>   qapi: Avoid redundant parens in code generated for conditionals
>   qapi: Use "not COND" instead of "!COND" for generated documentation
>   qapi: Use re.fullmatch() where appropriate
>   tests/qapi-schema: Hide OrderedDict in test output
>   qapi: Tweak error messages for missing / conflicting meta-type
>   qapi: Tweak error messages for unknown / conflicting 'if' keys
>
>  scripts/qapi/common.py                  | 51 ++++++++++++++-----------
>  scripts/qapi/expr.py                    | 32 +++++++---------
>  scripts/qapi/gen.py                     |  6 +--
>  scripts/qapi/introspect.py              |  6 +--
>  scripts/qapi/schema.py                  | 12 +++++-
>  scripts/qapi/types.py                   | 22 +++++------
>  scripts/qapi/visit.py                   | 14 +++----
>  tests/qapi-schema/bad-if-key.err        |  2 +-
>  tests/qapi-schema/bad-if-keys.err       |  2 +-
>  tests/qapi-schema/doc-good.json         |  2 +-
>  tests/qapi-schema/doc-good.out          |  6 +--
>  tests/qapi-schema/doc-good.txt          |  8 ++--
>  tests/qapi-schema/double-type.err       |  4 +-
>  tests/qapi-schema/enum-if-invalid.err   |  2 +-
>  tests/qapi-schema/missing-type.err      |  2 +-
>  tests/qapi-schema/qapi-schema-test.json |  9 +++--
>  tests/qapi-schema/qapi-schema-test.out  | 31 ++++++++-------
>  tests/qapi-schema/test-qapi.py          | 11 +++++-
>  18 files changed, 118 insertions(+), 104 deletions(-)
>
>
The first patch, you should apply isort (we should have a check for that
and linters I suppose).

Series:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
> 2.31.1
>
>

--000000000000a4d94205cadb1df5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 4:38 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mark=
us Armbruster (12):<br>
=C2=A0 qapi: Simplify QAPISchemaIfCond&#39;s interface for generating C<br>
=C2=A0 qapi: Simplify how QAPISchemaIfCond represents &quot;no condition&qu=
ot;<br>
=C2=A0 tests/qapi-schema: Correct two &#39;if&#39; conditionals<br>
=C2=A0 tests/qapi-schema: Demonstrate broken C code for &#39;if&#39;<br>
=C2=A0 qapi: Fix C code generation for &#39;if&#39;<br>
=C2=A0 qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()<=
br>
=C2=A0 qapi: Avoid redundant parens in code generated for conditionals<br>
=C2=A0 qapi: Use &quot;not COND&quot; instead of &quot;!COND&quot; for gene=
rated documentation<br>
=C2=A0 qapi: Use re.fullmatch() where appropriate<br>
=C2=A0 tests/qapi-schema: Hide OrderedDict in test output<br>
=C2=A0 qapi: Tweak error messages for missing / conflicting meta-type<br>
=C2=A0 qapi: Tweak error messages for unknown / conflicting &#39;if&#39; ke=
ys<br>
<br>
=C2=A0scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 51 ++++++++++++++-----------<br>
=C2=A0scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 32 +++++++---------<br>
=C2=A0scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
=C2=A0scripts/qapi/introspect.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +--<br>
=C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 12 +++++-<br>
=C2=A0scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 22 +++++------<br>
=C2=A0scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 14 +++----<br>
=C2=A0tests/qapi-schema/bad-if-key.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
 +-<br>
=C2=A0tests/qapi-schema/bad-if-keys.err=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
 +-<br>
=C2=A0tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 +--<br>
=C2=A0tests/qapi-schema/doc-good.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 8 ++--<br>
=C2=A0tests/qapi-schema/double-type.err=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 +-<br>
=C2=A0tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0tests/qapi-schema/missing-type.err=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A0tests/qapi-schema/qapi-schema-test.json |=C2=A0 9 +++--<br>
=C2=A0tests/qapi-schema/qapi-schema-test.out=C2=A0 | 31 ++++++++-------<br>
=C2=A0tests/qapi-schema/test-qapi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11=
 +++++-<br>
=C2=A018 files changed, 118 insertions(+), 104 deletions(-)<br>
<br></blockquote><div><br></div><div>The first patch, you should apply isor=
t (we should have a check for that and linters I suppose).</div><div><br></=
div><div>Series:</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000a4d94205cadb1df5--


