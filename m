Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B784D43BBD3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:47:54 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTMP-00039Z-Rs
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTJM-000254-Rv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTJI-0002Mp-K2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EMVAHeufflVrKk+S8YdyoEJhRVm1bI9op8JghzxCmkU=;
 b=coMCJToEC1YwiqaTcYjx/R6+wzjHmH6JSR2pWYwDJ3QGIx80Gh4w7UKcMamTdYIMCXarlS
 XoFBs1pVEx+TMip0Wu/owsb3xtIdTmWgEtBKDrQ88u35BuOwTKYmNYZ3ryfjTP7eNrSn0u
 OdAH0eFIw/Fv54QRX9qgTC5HIxV/J/w=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-UlipKg6_O16ZQtZuxs3VuA-1; Tue, 26 Oct 2021 16:44:36 -0400
X-MC-Unique: UlipKg6_O16ZQtZuxs3VuA-1
Received: by mail-ua1-f71.google.com with SMTP id
 e5-20020ab04985000000b002cad81164cbso210566uad.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EMVAHeufflVrKk+S8YdyoEJhRVm1bI9op8JghzxCmkU=;
 b=m9Oiqrhs4A9UbAJRj7A4Qtf6i4ZQW1Ut3dJZxy/ryFDg1/bq+DKrfBMfdrFnBWTX/m
 RJivtRqSXGMGkydH3g8SKikrY7EXDyOQbsMtnypLbUt2vRU65le1tiXYt6PWGBORF/GO
 nnOWEMed9MMAPBc2vkxSsZCOrTKArjFqubJuV0rop6LporBuUyyuHOYzM6tTZnZiz8mr
 S1nl5UM8cYe5UU8Rx0MXeW5qv/g6hJbxaiexmHjdmgDQRZzBP3fQ5WId5go+IIjWGKIF
 nobjF+I1d7vqhaeGMv80S6gduM3TO3Veik6J2pqX2UMkfcSUk7aBkWBa0+NMAWdiSXh3
 FccA==
X-Gm-Message-State: AOAM531+iIecR4y9dN2N/fATpLB7Q/RWRmfw988pp4w18q8lAoJCOjjt
 yvqSQUWdCvcIcOL8/jgvYzZ/yS4LgoNLst9QwXvp2FPtb6WOL9aEHJZt+cBB+dLxDu3fB+wQQqi
 cvo06RpaRRbroOVQcTMdnzj3FpECCd9U=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr2167272vkd.10.1635281075715; 
 Tue, 26 Oct 2021 13:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGRJA3EGFQKsaCYMp0H4eHMuTt7vowZG+u4m36eR1r+sDGfpqQfc2vBpUzLj4KuBQStWBonrUrWcFUFbKj+ZA=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr2167253vkd.10.1635281075536; 
 Tue, 26 Oct 2021 13:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-2-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-2-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 16:44:24 -0400
Message-ID: <CAFn=p-bQueEX7N+JuAXVUsYazsHvrvxnuFHCshjoOgM=1FsfUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] qapi: Enable enum member introspection to show
 more than name
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009d9b6605cf478b0c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, libvir-list@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, mdroth@linux.vnet.ibm.com,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009d9b6605cf478b0c
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 12:24 AM Markus Armbruster <armbru@redhat.com>
wrote:

> The next commit will add feature flags to enum members.  There's a
> problem, though: query-qmp-schema shows an enum type's members as an
> array of member names (SchemaInfoEnum member @values).  If it showed
> an array of objects with a name member, we could simply add more
> members to these objects.  Since it's just strings, we can't.
>
> I can see three ways to correct this design mistake:
>
> 1. Do it the way we should have done it, plus compatibility goo.
>
>    We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
>    changing @values would be a compatibility break, add a new member
>    @members instead.
>
>    @values is now redundant.  In my testing, output of
>    qemu-system-x86_64's query-qmp-schema grows by 11% (18.5KiB).
>
>    We can deprecate @values now and drop it later.  This will break
>    outmoded clients.  Well-behaved clients such as libvirt are
>    expected to break cleanly.
>
> 2. Like 1, but omit "boring" elements of @member, and empty @member.
>
>    @values does not become redundant.  @members augments it.  Somewhat
>    cumbersome, but output of query-qmp-schema grows only as we make
>    enum members non-boring.
>
>    There is nothing to deprecate here.
>
> 3. Versioned query-qmp-schema.
>
>    query-qmp-schema provides either @values or @members.  The QMP
>    client can select which version it wants.  There is no redundant
>    output.
>
>    We can deprecate old versions and eventually drop them.  This will
>    break outmoded clients.  Breaking cleanly is easier than for 1.
>
>    While 1 and 2 operate within the common rules for compatible
>    evolution apply (section "Compatibility considerations" in
>    docs/devel/qapi-code-gen.rst), 3 bypasses them.  Attractive when
>    operating within the rules is just too awkward.  Not the case here.
>
> This commit implements 1.  Libvirt developers prefer it.
>
> Deprecate @values in favour of @members.  Since query-qmp-schema
> compatibility is pretty fundamental for management applications, an
> extended grace period is advised.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Peter Krempa <pkrempa@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
>

Reviewed-by: John Snow <jsnow@redhat.com>

--0000000000009d9b6605cf478b0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 12:24 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 next commit will add feature flags to enum members.=C2=A0 There&#39;s a<br=
>
problem, though: query-qmp-schema shows an enum type&#39;s members as an<br=
>
array of member names (SchemaInfoEnum member @values).=C2=A0 If it showed<b=
r>
an array of objects with a name member, we could simply add more<br>
members to these objects.=C2=A0 Since it&#39;s just strings, we can&#39;t.<=
br>
<br>
I can see three ways to correct this design mistake:<br>
<br>
1. Do it the way we should have done it, plus compatibility goo.<br>
<br>
=C2=A0 =C2=A0We want a [&#39;SchemaInfoEnumMember&#39;] member in SchemaInf=
oEnum.=C2=A0 Since<br>
=C2=A0 =C2=A0changing @values would be a compatibility break, add a new mem=
ber<br>
=C2=A0 =C2=A0@members instead.<br>
<br>
=C2=A0 =C2=A0@values is now redundant.=C2=A0 In my testing, output of<br>
=C2=A0 =C2=A0qemu-system-x86_64&#39;s query-qmp-schema grows by 11% (18.5Ki=
B).<br>
<br>
=C2=A0 =C2=A0We can deprecate @values now and drop it later.=C2=A0 This wil=
l break<br>
=C2=A0 =C2=A0outmoded clients.=C2=A0 Well-behaved clients such as libvirt a=
re<br>
=C2=A0 =C2=A0expected to break cleanly.<br>
<br>
2. Like 1, but omit &quot;boring&quot; elements of @member, and empty @memb=
er.<br>
<br>
=C2=A0 =C2=A0@values does not become redundant.=C2=A0 @members augments it.=
=C2=A0 Somewhat<br>
=C2=A0 =C2=A0cumbersome, but output of query-qmp-schema grows only as we ma=
ke<br>
=C2=A0 =C2=A0enum members non-boring.<br>
<br>
=C2=A0 =C2=A0There is nothing to deprecate here.<br>
<br>
3. Versioned query-qmp-schema.<br>
<br>
=C2=A0 =C2=A0query-qmp-schema provides either @values or @members.=C2=A0 Th=
e QMP<br>
=C2=A0 =C2=A0client can select which version it wants.=C2=A0 There is no re=
dundant<br>
=C2=A0 =C2=A0output.<br>
<br>
=C2=A0 =C2=A0We can deprecate old versions and eventually drop them.=C2=A0 =
This will<br>
=C2=A0 =C2=A0break outmoded clients.=C2=A0 Breaking cleanly is easier than =
for 1.<br>
<br>
=C2=A0 =C2=A0While 1 and 2 operate within the common rules for compatible<b=
r>
=C2=A0 =C2=A0evolution apply (section &quot;Compatibility considerations&qu=
ot; in<br>
=C2=A0 =C2=A0docs/devel/qapi-code-gen.rst), 3 bypasses them.=C2=A0 Attracti=
ve when<br>
=C2=A0 =C2=A0operating within the rules is just too awkward.=C2=A0 Not the =
case here.<br>
<br>
This commit implements 1.=C2=A0 Libvirt developers prefer it.<br>
<br>
Deprecate @values in favour of @members.=C2=A0 Since query-qmp-schema<br>
compatibility is pretty fundamental for management applications, an<br>
extended grace period is advised.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br>
Tested-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=3D=
"_blank">pkrempa@redhat.com</a>&gt;<br>
Acked-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=3D"=
_blank">pkrempa@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Revi=
ewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com=
</a>&gt;<br></div><div>=C2=A0</div></div></div>

--0000000000009d9b6605cf478b0c--


