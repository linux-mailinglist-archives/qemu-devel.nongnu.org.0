Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E193AA2E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:08:23 +0200 (CEST)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZxd-0001mM-OS
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltZv1-0000CE-Cq
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltZuy-00034q-9n
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623866735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+cSUoYd9O5GQQKS+K6HKZPIBNSNKwMcDimwZAm9ZRo=;
 b=SAyoa0RgCIMnk0STUVKVhq2GKqmOuJr4jdo7sYviVVK4IwTiJv6YVDUtIBP8yc/g9b4G1M
 UW8Fk8M3GC9K6cSUEdXYxxHXcxU6CHpBvlmmIIpnteTFvJAEfz3Nyr3SLwMWqhi1KMXtju
 72Y3Zoxcq5do55CKB6hmR43TcKNnNFk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-fgsms5oTP-G8b43_g5aD4w-1; Wed, 16 Jun 2021 14:05:33 -0400
X-MC-Unique: fgsms5oTP-G8b43_g5aD4w-1
Received: by mail-pl1-f198.google.com with SMTP id
 x22-20020a1709028216b0290112042155c8so833755pln.14
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+cSUoYd9O5GQQKS+K6HKZPIBNSNKwMcDimwZAm9ZRo=;
 b=AMBb3TEns6UtMipFxirf51M9N5e72DZ/LfpD72uY90jyd4kaYJbVRv9GfME9XYhLwx
 9C8f2i06lHUwdKtm+SoMqqhmW5gqImMgXO7DPNwBCIFZEq93/gQx5PZCN2VPnLo2zFGO
 1SqSaWuJYBKBYisi+oOWfEcluq+NvT/9CgLc/chc2ABbRbBpB3kwZRXJdLfSE2bhYnc9
 NVlwUak/6m0f+xHl5TEwD9Y+LsHhD3DdhER30BXjWbJuVOPN1bGRGS2Kj/JqC3mob+lc
 1v7DeeRIr3gsb5c4+YpKCIehk6IN0tnXw6nVxrSv7QRdhTsEUpsg4ZK04P2AgDEIDYvq
 3KKA==
X-Gm-Message-State: AOAM530dQ1+Gp0jZK0D4dnBb7KTtB4d442RB21vWLN+IXDhLICYRv7TO
 vF0sbyUaS9+YOCJiSQttdR3Ej2NLAP0eUMdX9DMhnGqoNl5ywUX9SqU4yI3KPmkb2m3A3X7JErV
 viMplvgShl5x81izU1rN8b2hBgQS8ZwY=
X-Received: by 2002:a17:90b:33c6:: with SMTP id
 lk6mr12304473pjb.6.1623866732619; 
 Wed, 16 Jun 2021 11:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwFNCLEOUEz0lY70oAvN28erEqupdgjrv9U/Jn7YsrqXkAIUOt6seP79mRTFzDVTmyzwV7ybcTk4aTblpY6YY=
X-Received: by 2002:a17:90b:33c6:: with SMTP id
 lk6mr12304443pjb.6.1623866732361; 
 Wed, 16 Jun 2021 11:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-4-pbonzini@redhat.com>
 <87zgvpaoky.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgvpaoky.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 16 Jun 2021 20:05:19 +0200
Message-ID: <CABgObfa7N+WtrHuHomHigJoGkQiJnY=hmo4LdcTfkjm-O01Jbg@mail.gmail.com>
Subject: Re: [PATCH 03/11] keyval: introduce keyval_parse_into
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bed6f405c4e5ef6e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "P. Berrange, Daniel" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bed6f405c4e5ef6e
Content-Type: text/plain; charset="UTF-8"

Il mer 16 giu 2021, 16:09 Markus Armbruster <armbru@redhat.com> ha scritto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > Allow parsing multiple keyval sequences into the same dictionary.
> > This will be used to simplify the parsing of the -M command line
> > option, which is currently a .merge_lists = true QemuOpts group.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Straightforward.  Thanks for adjusting the contract for
> keyval_parse_into().
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> It's too hot & humid for me to figure out why you need both
> keyval_merge() and keyval_parse_into().
>

I don't need both, but I do need keyval_merge() which is the complex one;
and keyval_parse_into() is straightforward enough to be worth the simpler
code in vl.c.

Paolo


>

--000000000000bed6f405c4e5ef6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 16 giu 2021, 16:09 Markus Armbruster &lt;<a hre=
f=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Paolo Bonzini &lt;<a href=3D"mailto:pbonz=
ini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a=
>&gt; writes:<br>
<br>
&gt; Allow parsing multiple keyval sequences into the same dictionary.<br>
&gt; This will be used to simplify the parsing of the -M command line<br>
&gt; option, which is currently a .merge_lists =3D true QemuOpts group.<br>
&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
<br>
Straightforward.=C2=A0 Thanks for adjusting the contract for<br>
keyval_parse_into().<br>
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt;<br>
<br>
It&#39;s too hot &amp; humid for me to figure out why you need both<br>
keyval_merge() and keyval_parse_into().<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I don&#39;t need both, but I do need=
 keyval_merge() which is the complex one; and keyval_parse_into() is straig=
htforward enough to be worth the simpler code in vl.c.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000bed6f405c4e5ef6e--


