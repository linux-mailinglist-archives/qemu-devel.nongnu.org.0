Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A748A0D1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 21:18:59 +0100 (CET)
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7186-0004vt-C8
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 15:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n716G-0003z7-7c
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 15:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n716B-00062U-MG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 15:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641845813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmveGQ554ba6/rqrjdNkmCITVg3v22d8v3EwjyNcmBM=;
 b=KZJs5QrCS2MBG+GFehrisnfIGVP+dn+j8VLA7rbv7s0snIvpX8gXp29brWy0aGsyav1pPR
 PyjDICDbY1DiNTtguYtwhJHyz5gB2uNejkmCv1iUOGet6rtxb3Rorcvbf9UbKq/QnF2SIq
 32qxvhosIS2em49NjOOOKD5c62yPsb0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-BZjODle6PceIdsEmIqYp0A-1; Mon, 10 Jan 2022 15:16:51 -0500
X-MC-Unique: BZjODle6PceIdsEmIqYp0A-1
Received: by mail-vk1-f197.google.com with SMTP id
 r15-20020a1fa80f000000b003133230d1e1so3120187vke.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 12:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LmveGQ554ba6/rqrjdNkmCITVg3v22d8v3EwjyNcmBM=;
 b=mAuPzBnN/h9w/Pxo22qlP/M4wdrdJf1q7PgkBYA6Aa3hdTb4T7/7YqmbGXqqK95lNj
 1ECQvfMO4Cz0L+XDLOWc7IFUzyiDYh6oOlVxGQ99KECP7XcVl/P+Sz9SMIINXcZWF62r
 LLPcI3uTIxFjNb9A7yAoN806WZRSHqdnIeP2fkRooYjIzQ9wW3Ak6sAfhsY9cSKzYCyZ
 IGrn0ZAaXn5PWcNiwcpbvjebDUUhZS1lNEJE54qvXgbe9i3fJlyz3WUqVuuJMpOYF6no
 VwBnhCqkC9l8AeSt2BWiMf50zMz8Z5Vzui4jess9Mdk1e8iRjl1qVZjR6WMSKwa0fkDI
 g5zA==
X-Gm-Message-State: AOAM5313trGxl32s9SPIUeRVBLNbPht49PYkyzVI/sKT2oT8To2wKW7P
 UOySfgJ5C9oCb0XqA7Xi+3jfgvVnhTJIIacD6khvIDY+aSCzPDAwGNRnWD/2J2AwZww7DZBwHzf
 SwlBT/ktlWmFOEMZi57R8mU/dABwsqeY=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr644131uak.79.1641845810953;
 Mon, 10 Jan 2022 12:16:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIZoncR/4HAuLndqiUwiwzd6EdOipCJ/kjvsk4IqEtE6U9349cKPP3TDkUPByratw4Rkb4uxMy8jyykWUBEPM=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr644124uak.79.1641845810778;
 Mon, 10 Jan 2022 12:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20211220174418.84977-1-louiswpf@gmail.com>
In-Reply-To: <20211220174418.84977-1-louiswpf@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 10 Jan 2022 15:16:39 -0500
Message-ID: <CAFn=p-Y5_=R9Z6ofk6FTvYFRp+o19DvS7JLb5D5K0ZoDPOfaOg@mail.gmail.com>
Subject: Re: [PATCH] python/qom: Fix qom-set failure
To: Wang Bing-hua <louiswpf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000053f37605d54004e6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000053f37605d54004e6
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 20, 2021 at 12:46 PM Wang Bing-hua <louiswpf@gmail.com> wrote:

> Fix the following failure by interpreting 'value' argument as 'int'.
>
>
Thanks for the patch. Do you use the qom tools often? I wasn't sure anybody
did ...


> $ scripts/qmp/qom-set -s /tmp/qmp-socket
> /machine/unattached/device[6].temperature 0
> QMPResponseError: Invalid parameter type for 'temperature', expected:
> integer
>
> Fixes: c750c02891a8 ("python/qmp: Add qom script rewrites")
> Signed-off-by: Wang Bing-hua <louiswpf@gmail.com>
> ---
>  python/qemu/qmp/qom.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
> index 8ff28a8343..0b77dc6aa3 100644
> --- a/python/qemu/qmp/qom.py
> +++ b/python/qemu/qmp/qom.py
> @@ -72,6 +72,7 @@ def configure_parser(cls, parser:
> argparse.ArgumentParser) -> None:
>          cls.add_path_prop_arg(parser)
>          parser.add_argument(
>              'value',
> +            type=int,
>              metavar='<value>',
>              action='store',
>              help='new QOM property value'
> --
> 2.34.1
>
>
Is this always going to be correct, though? QOM property values aren't
*always* integers. Won't this break other cases?

The old qom-set script did this [1]:
> print(srv.command('qom-set', path=path, property=prop, value=value))

which looks an awful lot like the old qom-set just passed a string along,
too.

Two ideas:

(1) try qom-get on the same property and just take note of what type it is
that you get back from the server. e.g.

rsp = self.qmp.command('qom-get', path=self.path, property=self.prop)
if isinstance(rsp, int):
    # Property we are setting must be an int
else:
    # It's something else.

(2) use a query to just determine the type. qom-list with
path=/tmp/qmp-socket /machine/unattached/device[6] will return a list of
dicts; filter out for the one where "name" is "temperature", then use the
"type" value to know what type we should expect from the user.

--js

[1]
https://gitlab.com/jsnow/qemu/-/blob/553032db17440f8de011390e5a1cfddd13751b0b/scripts/qmp/qom-set#L66

--00000000000053f37605d54004e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 20, 2021 at 12:46 PM Wang=
 Bing-hua &lt;<a href=3D"mailto:louiswpf@gmail.com">louiswpf@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fix t=
he following failure by interpreting &#39;value&#39; argument as &#39;int&#=
39;.<br>
<br></blockquote><div><br></div><div>Thanks for the patch. Do you use the q=
om tools often? I wasn&#39;t sure anybody did ...<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
$ scripts/qmp/qom-set -s /tmp/qmp-socket /machine/unattached/device[6].temp=
erature 0<br>
QMPResponseError: Invalid parameter type for &#39;temperature&#39;, expecte=
d: integer<br>
<br>
Fixes: c750c02891a8 (&quot;python/qmp: Add qom script rewrites&quot;)<br>
Signed-off-by: Wang Bing-hua &lt;<a href=3D"mailto:louiswpf@gmail.com" targ=
et=3D"_blank">louiswpf@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/qmp/qom.py | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py<br>
index 8ff28a8343..0b77dc6aa3 100644<br>
--- a/python/qemu/qmp/qom.py<br>
+++ b/python/qemu/qmp/qom.py<br>
@@ -72,6 +72,7 @@ def configure_parser(cls, parser: argparse.ArgumentParser=
) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls.add_path_prop_arg(parser)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.add_argument(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;value&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type=3Dint,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metavar=3D&#39;&lt;value&gt=
;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0action=3D&#39;store&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;new QOM propert=
y value&#39;<br>
-- <br>
2.34.1<br>
<br></blockquote><div><br></div><div>Is this always going to be correct, th=
ough? QOM property values aren&#39;t *always* integers. Won&#39;t this brea=
k other cases?</div><div><br></div><div>The old qom-set script did this [1]=
:<br></div><div>&gt; print(srv.command(&#39;qom-set&#39;, path=3Dpath, prop=
erty=3Dprop, value=3Dvalue))</div><div><br></div><div>which looks an awful =
lot like the old qom-set just passed a string along, too.</div></div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Two ideas:</div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">(1) try qom-=
get on the same property and just take note of what type it is that you get=
 back from the server. e.g.</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">rsp =3D self.qmp.command(&#39;qom-get&#39;, path=3Dse=
lf.path, property=3Dself.prop)</div><div class=3D"gmail_quote">if isinstanc=
e(rsp, int):</div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 # Property =
we are setting must be an int</div><div class=3D"gmail_quote">else:</div><d=
iv class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 # It&#39;s something else.</div=
><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">(2) use a =
query to just determine the type. qom-list with path=3D/tmp/qmp-socket /mac=
hine/unattached/device[6] will return a list of dicts; filter out for the o=
ne where &quot;name&quot; is &quot;temperature&quot;, then use the &quot;ty=
pe&quot; value to know what type we should expect from the user.</div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">--js<br><br><div=
>[1] <a href=3D"https://gitlab.com/jsnow/qemu/-/blob/553032db17440f8de01139=
0e5a1cfddd13751b0b/scripts/qmp/qom-set#L66">https://gitlab.com/jsnow/qemu/-=
/blob/553032db17440f8de011390e5a1cfddd13751b0b/scripts/qmp/qom-set#L66</a><=
br></div><div><br></div></div></div>

--00000000000053f37605d54004e6--


