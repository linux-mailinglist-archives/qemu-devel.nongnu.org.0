Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA73E1A60
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:29:27 +0200 (CEST)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhBO-0007FI-CR
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBhAe-0006aJ-3o
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBhAa-0005Dd-KY
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628184514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHSVLAU2SMMIDcSqpRCV9b7+I6W0oYOC0RM5iMo9Gb4=;
 b=N7BjFXMQ0Eo8x72rqIFXq6oky7I6fNBzxO0LdFakEMSdPHxBQ0OiYggCSiqvLJ1zKIey6W
 NFz3BGTAzzut9PwCFSpN2Sg9FrjIHTZy4p1I4jllKRXRChlVgqgsPPmLoMDCDlJ+26adWv
 yjxeKQhtQoNOfKYyg523RV9ojPNBgm8=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-ItpPPVytMaugN9Sf4i8G3w-1; Thu, 05 Aug 2021 13:28:32 -0400
X-MC-Unique: ItpPPVytMaugN9Sf4i8G3w-1
Received: by mail-oo1-f70.google.com with SMTP id
 u64-20020a4a21430000b029026aefcb0601so2173287oou.10
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 10:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hHSVLAU2SMMIDcSqpRCV9b7+I6W0oYOC0RM5iMo9Gb4=;
 b=C/rG1FqIv8dmAX5X0oIaII3U8USiNPoSqvEFgVEAs7gzIDgZtnoxeI1pnI4pffaEVw
 4R4hyMlYVY3GT5SiIhsmlGjoYKkftTNCA8yN1gOJr7Tl1rkjWXuPdxYEId4iUhHTw9EA
 n09HXY80UqOH+SrZAlrcL6A5fRhzt+0HpPwmYPVN4l4wuDKgvFJqbxIZYm+lsVMI0YDu
 aWMXkage5MMYcj8aTTa/SRuqNnW6rPkRKJwpfC2AVrEdtfrn+pHqtkohotd/V+brG638
 vpP4aYW+BiYAZdn9pLrrls3952qOfAC9Idme2gjT0rHHe0pk89+0EpEd7nTCZCXfdj83
 nRxw==
X-Gm-Message-State: AOAM533huj/sKEgpomaHFySXy/eONodfitFU6atYiQv+41U2yDvxX15B
 oQY8T0ly4K28lE/NzX1JZEj1e9SXMnb+YXnsoP0Gi9XUhP/Hm9euiCNKMVrz5yJj+Qt5jcar1KZ
 kECrDiHwA5Y+n4Sr2WG/SieP8R4FCPuI=
X-Received: by 2002:a4a:2c96:: with SMTP id o144mr1032498ooo.50.1628184512097; 
 Thu, 05 Aug 2021 10:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC2nZw6vEUT0/wQBM06ICydvPXG91lq7CRprjnlKWnLvU9JZEv0z/Pu0tV/vYBvUwXpJLJwnoTbehSu1a2MyI=
X-Received: by 2002:a4a:2c96:: with SMTP id o144mr1032484ooo.50.1628184511909; 
 Thu, 05 Aug 2021 10:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-2-niteesh.gs@gmail.com>
In-Reply-To: <20210730201846.5147-2-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 13:28:21 -0400
Message-ID: <CAFn=p-Yk2rZLxfPwpT62kktSC0RPuyDu81B=Ojzjgx2Xc6GEZw@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] python/aqmp: Fix wait_closed work-around for
 python 3.6
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000076252c05c8d33f89"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000076252c05c8d33f89
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Before this patch the wait_closed work-around for python 3.6
> fails during disconnect.
> This is a temproray work around for which might be fixed in the
> future or will be completely removed when the minimum python
> version is raised to 3.7.
>
> This patch was originally written by John Snow <jsnow@redhat.com>
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  python/qemu/aqmp/util.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
> index de0df44cbd..eaa5fc7d5f 100644
> --- a/python/qemu/aqmp/util.py
> +++ b/python/qemu/aqmp/util.py
> @@ -134,7 +134,17 @@ def is_closing(writer: asyncio.StreamWriter) -> bool:
>
>      while not transport.is_closing():
>          await asyncio.sleep(0)
> -    await flush(writer)
> +
> +    # This is an ugly workaround, but it's the best I can come up with.
> +    sock = transport.get_extra_info('socket')
> +
> +    if sock is None:
> +        # Our transport doesn't have a socket? ...
> +        # Nothing we can reasonably do.
> +        return
> +
> +    while sock.fileno() != -1:
> +        await asyncio.sleep(0)
>
>
>  def asyncio_run(coro: Coroutine[Any, Any, T], *, debug: bool = False) ->
> T:
> --
> 2.17.1
>
>
Sorry for the trouble. This is now included in the v3 version of my series
and can be dropped. I hope.

--00000000000076252c05c8d33f89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Before this patch the wait_closed work-around for python 3.6<br>
fails during disconnect.<br>
This is a temproray work around for which might be fixed in the<br>
future or will be completely removed when the minimum python<br>
version is raised to 3.7.<br>
<br>
This patch was originally written by John Snow &lt;<a href=3D"mailto:jsnow@=
redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/util.py | 12 +++++++++++-<br>
=C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py<br>
index de0df44cbd..eaa5fc7d5f 100644<br>
--- a/python/qemu/aqmp/util.py<br>
+++ b/python/qemu/aqmp/util.py<br>
@@ -134,7 +134,17 @@ def is_closing(writer: asyncio.StreamWriter) -&gt; boo=
l:<br>
<br>
=C2=A0 =C2=A0 =C2=A0while not transport.is_closing():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0await asyncio.sleep(0)<br>
-=C2=A0 =C2=A0 await flush(writer)<br>
+<br>
+=C2=A0 =C2=A0 # This is an ugly workaround, but it&#39;s the best I can co=
me up with.<br>
+=C2=A0 =C2=A0 sock =3D transport.get_extra_info(&#39;socket&#39;)<br>
+<br>
+=C2=A0 =C2=A0 if sock is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Our transport doesn&#39;t have a socket? ...=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Nothing we can reasonably do.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 while sock.fileno() !=3D -1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)<br>
<br>
<br>
=C2=A0def asyncio_run(coro: Coroutine[Any, Any, T], *, debug: bool =3D Fals=
e) -&gt; T:<br>
-- <br>
2.17.1<br>
<br></blockquote><div><br></div><div>Sorry for the trouble. This is now inc=
luded in the v3 version of my series and can be dropped. I hope. <br></div>=
</div></div>

--00000000000076252c05c8d33f89--


