Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA573E5994
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:00:41 +0200 (CEST)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQQx-0007R4-2Q
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mDQPL-0006hW-Mh
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:58:59 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mDQPI-0002mF-Ih
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:58:59 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 o17-20020a4a64110000b0290263e1ba7ff9so5257533ooc.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GMD3hha9hBjumfDyrr3h+BTZzFh+rM00lHojk5FR+PQ=;
 b=H5/vZqm8X37pM5kr7ksFAl+jLo9JNduH/e17RgChYjOtw8BYTiB8yirwEMiCN3LriL
 JHnajup7bftPrumWFGGiIq3XPrteXb4stk27qLKVPMmTConpLpYMoTPJnDXFKFYeGCjv
 R/by443t3+8k3zZpBXSCQgaCdpI+rM16m2LAuVRDO60pF38ZBIkKC6aEUm3WcA6JyIeM
 thZ0bcBbEIwVS/WHom8GKm7XZmNH9DuyzwMStD9Q5vQxjdmOEx61Ez5Rmfg5qbwgq99O
 qVMuLWsjN8EYZsfyzqX7dzP2Vg2c+8TXWf4QD+f9pXw6cX6F+1jX9uiYX6uSANk8+iHJ
 o/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GMD3hha9hBjumfDyrr3h+BTZzFh+rM00lHojk5FR+PQ=;
 b=nCKMRP/Sz2P0i74/ymihLW9IJUyPdAY/cQJnw1BjHx88d4A3aqmvDpl4gZnv83h73h
 40otmKay+gDiYd+sux6ng5Td0Q1pew9A+oDS4Z3fM0OM2aPQGa8BBiTgY4CM9xNcyFkv
 LWAXm6Iub8FeSp/zaZ9zdp9ySGJxN67Bta67OsXVEKd3FYw3ECRcyqKgmZzIYCfsdvNQ
 v3j0sUTmPhwkbapHizIe0XSVR4GsdHy5z0Wv36bbpE06BVtgbGk1nTjPPVPCuFZR7V5L
 ipCKZKPU3PXZAzpkaNqnclo6goZml/8Y7nB2cKD6cB6+JFma99dE1zYgb8GuKnzeQrZ+
 vQhQ==
X-Gm-Message-State: AOAM532zgaw6/ngKZ2GX6W2vmaVh6TqBHH7ECshWhrPf2cFhWTPEqmqR
 maEq6rn8Z+22Z+9ehBwNRpvCfbaIk6qPkAzg+WHwJw==
X-Google-Smtp-Source: ABdhPJyV3xrZjO3YO0tMf9k6UmtIRFyrhO1RaYU+BOiHm1DrMpTWTiin0xV/mbtv1RWkDkS2HBjRqw+XPNoWe/Hrjc0=
X-Received: by 2002:a4a:4c55:: with SMTP id a82mr18506208oob.66.1628596731928; 
 Tue, 10 Aug 2021 04:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
In-Reply-To: <87y29dct4m.fsf@dusky.pond.sub.org>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Tue, 10 Aug 2021 14:58:41 +0300
Message-ID: <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b0779a05c93339f6"
Received-SPF: none client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=andrew@daynix.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b0779a05c93339f6
Content-Type: text/plain; charset="UTF-8"

Hi,

> The helper may or may not be installed at the path compiled into QEMU.
>
Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
or use "in-qemu" RSS.

What happens when you use the wrong helper?
>
UB - in most cases, eBPF program will work with wrong configurations.
That's why the stamp was added.

query-helper-paths checks the stamp only for RSS helper.

On Sat, Aug 7, 2021 at 3:54 PM Markus Armbruster <armbru@redhat.com> wrote:

> Andrew Melnychenko <andrew@daynix.com> writes:
>
> > New qmp command to query ebpf helper.
> > It's crucial that qemu and helper are in sync and in touch.
> > Technically helper should pass eBPF fds that qemu may accept.
> > And different qemu's builds may have different eBPF programs and helpers.
> > Qemu returns helper that should "fit" to virtio-net.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>
> [...]
>
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 156f98203e..9aaf8fbcca 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -519,3 +519,36 @@
> >   'data': { '*option': 'str' },
> >   'returns': ['CommandLineOptionInfo'],
> >   'allow-preconfig': true }
> > +
> > +##
> > +# @HelperPath:
> > +#
> > +# Name of the helper and binary location.
> > +##
> > +{ 'struct': 'HelperPath',
> > +  'data': {'name': 'str', 'path': 'str'} }
> > +
> > +##
> > +# @query-helper-paths:
> > +#
> > +# Query helper paths. Initially, this command was added for
> > +# qemu-ebpf-rss-helper. The qemu would check "the stamp" and
> > +# returns proper helper.
> > +#
> > +# Returns: list of object that contains name and path for helper.
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-helper-paths" }
> > +# <- { "return": [
> > +#        {
> > +#          "name": "qemu-ebpf-rss-helper",
> > +#          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
> > +#        }
> > +#      ]
> > +#    }
> > +#
> > +##
> > +{ 'command': 'query-helper-paths', 'returns': ['HelperPath'] }
>
>
> Hmm.
>
> I understand the desire to help management applications to use the right
> helper.  But I'm not sure this command is actually useful.  The helper
> may or may not be installed at the path compiled into QEMU.
>
> What happens when you use the wrong helper?
>
> Even if we conclude this is the right approach for this helper, we still
> need to review the other helpers to see which of them we should have
> query-helper-paths cover.
>
>

--000000000000b0779a05c93339f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>The helper
may or may not be installed at the path compiled into QEMU.</div></blockquo=
te><div>Yes, so the helper will not be called - QEMU will try to initiate e=
BPF RSS or use &quot;in-qemu&quot; RSS.</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div> What happens when you use the wron=
g helper?</div></blockquote><div>UB - in most cases, eBPF program will work=
 with wrong configurations.</div><div>That&#39;s why the stamp was added.</=
div><div><br></div><div>query-helper-paths checks the stamp only for RSS he=
lper.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Aug 7, 2021 at 3:54 PM Markus Armbruster &lt;<a hre=
f=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Andrew Melnychenko &lt;<a h=
ref=3D"mailto:andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt=
; writes:<br>
<br>
&gt; New qmp command to query ebpf helper.<br>
&gt; It&#39;s crucial that qemu and helper are in sync and in touch.<br>
&gt; Technically helper should pass eBPF fds that qemu may accept.<br>
&gt; And different qemu&#39;s builds may have different eBPF programs and h=
elpers.<br>
&gt; Qemu returns helper that should &quot;fit&quot; to virtio-net.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt; diff --git a/qapi/misc.json b/qapi/misc.json<br>
&gt; index 156f98203e..9aaf8fbcca 100644<br>
&gt; --- a/qapi/misc.json<br>
&gt; +++ b/qapi/misc.json<br>
&gt; @@ -519,3 +519,36 @@<br>
&gt;=C2=A0 =C2=A0&#39;data&#39;: { &#39;*option&#39;: &#39;str&#39; },<br>
&gt;=C2=A0 =C2=A0&#39;returns&#39;: [&#39;CommandLineOptionInfo&#39;],<br>
&gt;=C2=A0 =C2=A0&#39;allow-preconfig&#39;: true }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @HelperPath:<br>
&gt; +#<br>
&gt; +# Name of the helper and binary location.<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;HelperPath&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {&#39;name&#39;: &#39;str&#39;, &#39;path&#39;=
: &#39;str&#39;} }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @query-helper-paths:<br>
&gt; +#<br>
&gt; +# Query helper paths. Initially, this command was added for<br>
&gt; +# qemu-ebpf-rss-helper. The qemu would check &quot;the stamp&quot; an=
d<br>
&gt; +# returns proper helper.<br>
&gt; +#<br>
&gt; +# Returns: list of object that contains name and path for helper.<br>
&gt; +#<br>
&gt; +# Since: 6.1<br>
&gt; +#<br>
&gt; +# Example:<br>
&gt; +#<br>
&gt; +# -&gt; { &quot;execute&quot;: &quot;query-helper-paths&quot; }<br>
&gt; +# &lt;- { &quot;return&quot;: [<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;qemu-ebpf=
-rss-helper&quot;,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;/usr/loca=
l/libexec/qemu-ebpf-rss-helper&quot;<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; +#=C2=A0 =C2=A0 }<br>
&gt; +#<br>
&gt; +##<br>
&gt; +{ &#39;command&#39;: &#39;query-helper-paths&#39;, &#39;returns&#39;:=
 [&#39;HelperPath&#39;] }<br>
<br>
<br>
Hmm.<br>
<br>
I understand the desire to help management applications to use the right<br=
>
helper.=C2=A0 But I&#39;m not sure this command is actually useful.=C2=A0 T=
he helper<br>
may or may not be installed at the path compiled into QEMU.<br>
<br>
What happens when you use the wrong helper?<br>
<br>
Even if we conclude this is the right approach for this helper, we still<br=
>
need to review the other helpers to see which of them we should have<br>
query-helper-paths cover.<br>
<br>
</blockquote></div>

--000000000000b0779a05c93339f6--

