Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5F3F06C5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 16:33:25 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGMd5-0000hf-49
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 10:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGMbP-0008R6-1E
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGMbN-0008OT-DQ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629297092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6RZt60zXM9x/+49Dp7OVs0723FER1oIyc0sHnPwBQ8=;
 b=EJBmsaQLXWF5ZK5kc4esTFZqgvu0KIrUAkJ//GEq1LxXrSI65zmA1A4Mf587p9vk8ZvhQj
 aeXehbl07L1esJSgOTKAoIAeBYAMmqR9MwJYEhBZgrKTIqmve7mUVUkbPOaTjEVih0p9TE
 OsS1OR8JQA8DU4eC5inMYJvNWUwH9mM=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-riYqu3BkOe-Mx5IAtcskag-1; Wed, 18 Aug 2021 10:31:29 -0400
X-MC-Unique: riYqu3BkOe-Mx5IAtcskag-1
Received: by mail-oo1-f72.google.com with SMTP id
 x23-20020a4a3f570000b029028b2f4da5c9so1058563ooe.21
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 07:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6RZt60zXM9x/+49Dp7OVs0723FER1oIyc0sHnPwBQ8=;
 b=IdTc+YORAkDoBoB0tI9XGQMvLp5YfSsn1OlBRPfR1jznFKuO1ksTz1ACjqfbP1IZCp
 SPUMAvJ8AVff4c6uaAyZydjLebbe20gycTcHuwVdpdRBO3/t3r93twYZ2j/Rf7sjpai2
 SN2ABTJmDtSy5nNIkXHbSUeFFw2P+8k6HQgudGWKMd5bGHvmn1KwC1m22xgQBgd2/4jc
 ynKHvD6+50fnXDuEJO6WUVJ53ePkeEZz80ZfiU99Y9fSZE7qWjIHGaUsgyW6O04RK/Ns
 VcrUNxkspqarjBRd09BN3KQuPpCldEO6vCnJyGrAH2CsfhqapVu2pPbUES+oSg+chNdV
 BTbQ==
X-Gm-Message-State: AOAM530+TeiynRqi0RAQ+NmURk0T7Pzsh1Bt33TU+GpOgqWUx9PBCmtA
 kCA6hxAgh3AZetmYA5z91wDxdyjR55df+/+LuK+23eHqyChL0vUFA6iSk6Lcg5WJMc5+emsx05A
 NU0kcKNqCRS84i5KP6qgH7MnVJqc8Wy4=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr7069955oiw.112.1629297088191; 
 Wed, 18 Aug 2021 07:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcfIP5yLX+icB/dyxhr5KtJxWfVfyLl/GO19z/kRR5pW8rLuDhhwn8XHdfLRPZiwAkyKPKefwnyxh8nSxAVA8=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr7069932oiw.112.1629297088026; 
 Wed, 18 Aug 2021 07:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-14-jsnow@redhat.com>
 <20210817194758.4i5lujt7kefp3dmk@redhat.com>
In-Reply-To: <20210817194758.4i5lujt7kefp3dmk@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 18 Aug 2021 10:31:17 -0400
Message-ID: <CAFn=p-Z0=20Zntj2_OrGfw-aE3OssQSZ8RtYewVpUUoeTQ0NFw@mail.gmail.com>
Subject: Re: [PATCH v3 13/25] python/aqmp: add QMP Message format
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002a6d6305c9d64a8b"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a6d6305c9d64a8b
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 3:48 PM Eric Blake <eblake@redhat.com> wrote:

> On Tue, Aug 03, 2021 at 02:29:29PM -0400, John Snow wrote:
> > The Message class is here primarily to serve as a solid type to use for
> > mypy static typing for unambiguous annotation and documentation.
> >
> > We can also stuff JSON serialization and deserialization into this class
> > itself so it can be re-used even outside this infrastructure.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/__init__.py |   4 +-
> >  python/qemu/aqmp/message.py  | 209 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 212 insertions(+), 1 deletion(-)
> >  create mode 100644 python/qemu/aqmp/message.py
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>

Thanks!

--0000000000002a6d6305c9d64a8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 3:48 PM Eric =
Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug=
 03, 2021 at 02:29:29PM -0400, John Snow wrote:<br>
&gt; The Message class is here primarily to serve as a solid type to use fo=
r<br>
&gt; mypy static typing for unambiguous annotation and documentation.<br>
&gt; <br>
&gt; We can also stuff JSON serialization and deserialization into this cla=
ss<br>
&gt; itself so it can be re-used even outside this infrastructure.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/aqmp/__init__.py |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 python/qemu/aqmp/message.py=C2=A0 | 209 ++++++++++++++++++++++++=
+++++++++++<br>
&gt;=C2=A0 2 files changed, 212 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/message.py<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Thank=
s! <br></div></div></div>

--0000000000002a6d6305c9d64a8b--


