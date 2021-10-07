Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0002425808
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:34:53 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWM8-0007Jp-UL
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYWFJ-00074I-Kz
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYWF9-0006IY-Ue
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633624058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmXvPjP5cVPj4DMm82l7XXfnA+1Rkk6diZ3cwWNoaSI=;
 b=AYId9CDN9BElGRr+hYWaNb47EhFtJfVLY9HYb0kCgLn/Erd3y4PdIcMgTNE6yiqmg7ZsFA
 eiCktHqbywDiCojAJrEIKaejYUp2Yz/ZetOFZFbAh1IWqxJKzHZY7FFY1lreAw2GiMXVJR
 X4p0AJbzooe9sjWDsXlYiZ1Xt+xclYg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-p1pSYT8JOKOqdlmWreEUFw-1; Thu, 07 Oct 2021 12:27:35 -0400
X-MC-Unique: p1pSYT8JOKOqdlmWreEUFw-1
Received: by mail-vk1-f199.google.com with SMTP id
 t14-20020a1faa0e000000b002a26761be40so1580149vke.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nmXvPjP5cVPj4DMm82l7XXfnA+1Rkk6diZ3cwWNoaSI=;
 b=0HkgGeD4/NChNP382/MyoAEZRXalXYpjKUYSs5qHD6eP1xjIQIHy9rTrFrpM2dxjSg
 c/EictzaE6znxMrOTzf5rB/CU0BG0TjAbdOkgLq4QC7W1wN3LGEatwMkxLSJO01WNqkf
 /7WKJVQ/TYuAGFzplbbgmmc912reK4BjG4c9IQn7U650VGXgCqXZhRoq4j5/riEzvlXm
 DdVOVMqjs3QUsYJoKLWIvnL18/oJFm7yt1L6Dxo2MKXdydXut+Bhimo6vEOcDq7zX5T9
 oomAHsVG2BWZRO4lo6MWkjKTiiKvDEgXMn5ICU8Yi9ua0Am8WH4tfJFQuZmyHvcnuGKN
 4Vew==
X-Gm-Message-State: AOAM5324HckVn+4qIykRofDbqOUuXkbPSzZFJZZvX8+9JHy+L5SDQRM5
 PsXEBK6y0EuBxYZY+S+Me+J6CiGmUFo6/kxQKU/fz/kPxVtBRlcMA6cUjxIhYekjLHjnJvjWaDs
 d+IwFxh7oJ3yVi+P8hJYas3kNuAczcow=
X-Received: by 2002:ab0:6f92:: with SMTP id f18mr5617463uav.50.1633624055449; 
 Thu, 07 Oct 2021 09:27:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVJkxuPjOS8xUPNAgL8MTdl2tGgcJmIo1whDT6ZuSPL9Sl27wIDvtnwTNjb/yVkkJxe1k9Co8sKjxdqUbGCVA=
X-Received: by 2002:ab0:6f92:: with SMTP id f18mr5617439uav.50.1633624055227; 
 Thu, 07 Oct 2021 09:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-5-jsnow@redhat.com>
 <20211007145214.ua7db2hwifhtawis@redhat.com>
In-Reply-To: <20211007145214.ua7db2hwifhtawis@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Oct 2021 12:27:24 -0400
Message-ID: <CAFn=p-bwAL5ZmGHHR+uC-vbb=AdgdoFoqY3aHCNV6CZdKxjcmA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] python/aqmp: add send_fd_scm
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000082387d05cdc5bd76"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082387d05cdc5bd76
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 7, 2021 at 10:52 AM Eric Blake <eblake@redhat.com> wrote:

> On Wed, Sep 22, 2021 at 08:49:25PM -0400, John Snow wrote:
> > The single space is indeed required to successfully transmit the file
> > descriptor to QEMU.
>
> Sending fds requires a payload of at least one byte, but I don't think
> that qemu cares which byte.  Thus, while your choice of space is fine,
> the commit message may be a bit misleading at implying it must be
> space.
>
>
OK, I'll rephrase. (Space winds up being useful in particular because it
doesn't mess with the parsing for subsequent JSON objects sent over the
wire.)

(Idle curiosity: Is it possible to make QEMU accept an empty payload here?
I understand that for compatibility reasons it wouldn't change much for the
python lib even if we did, but I'm curious.)


> >
> > Python 3.11 removes support for calling sendmsg directly from a
> > transport's socket. There is no other interface for doing this, our use
> > case is, I suspect, "quite unique".
> >
> > As far as I can tell, this is safe to do -- send_fd_scm is a synchronous
> > function and we can be guaranteed that the async coroutines will *not* be
> > running when it is invoked. In testing, it works correctly.
> >
> > I investigated quite thoroughly the possibility of creating my own
> > asyncio Transport (The class that ultimately manages the raw socket
> > object) so that I could manage the socket myself, but this is so wildly
> > invasive and unportable I scrapped the idea. It would involve a lot of
> > copy-pasting of various python utilities and classes just to re-create
> > the same infrastructure, and for extremely little benefit. Nah.
> >
> > Just boldly void the warranty instead, while I try to follow up on
> > https://bugs.python.org/issue43232
>
> Bummer that we have to do that, but at least you are documenting the
> problems and pursuing a remedy upstream.
>
>
Yeah. I suspect our use case is so niche that it's not likely to get
traction, but I'll try again. This sort of thing might make it harder to
use projects like pypy, so it does feel like a defeat. Still, where there's
a will, there's a way, right? :)

--js

--00000000000082387d05cdc5bd76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 10:52 AM Eric =
Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep=
 22, 2021 at 08:49:25PM -0400, John Snow wrote:<br>
&gt; The single space is indeed required to successfully transmit the file<=
br>
&gt; descriptor to QEMU.<br>
<br>
Sending fds requires a payload of at least one byte, but I don&#39;t think<=
br>
that qemu cares which byte.=C2=A0 Thus, while your choice of space is fine,=
<br>
the commit message may be a bit misleading at implying it must be<br>
space.<br>
<br></blockquote><div><br></div><div>OK, I&#39;ll rephrase. (Space winds up=
 being useful in particular because it doesn&#39;t mess with the parsing fo=
r subsequent JSON objects sent over the wire.)<br></div><div><br></div><div=
>(Idle curiosity: Is it possible to make QEMU accept an empty payload here?=
 I understand that for compatibility reasons it wouldn&#39;t change much fo=
r the python lib even if we did, but I&#39;m curious.)<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Python 3.11 removes support for calling sendmsg directly from a<br>
&gt; transport&#39;s socket. There is no other interface for doing this, ou=
r use<br>
&gt; case is, I suspect, &quot;quite unique&quot;.<br>
&gt; <br>
&gt; As far as I can tell, this is safe to do -- send_fd_scm is a synchrono=
us<br>
&gt; function and we can be guaranteed that the async coroutines will *not*=
 be<br>
&gt; running when it is invoked. In testing, it works correctly.<br>
&gt; <br>
&gt; I investigated quite thoroughly the possibility of creating my own<br>
&gt; asyncio Transport (The class that ultimately manages the raw socket<br=
>
&gt; object) so that I could manage the socket myself, but this is so wildl=
y<br>
&gt; invasive and unportable I scrapped the idea. It would involve a lot of=
<br>
&gt; copy-pasting of various python utilities and classes just to re-create=
<br>
&gt; the same infrastructure, and for extremely little benefit. Nah.<br>
&gt; <br>
&gt; Just boldly void the warranty instead, while I try to follow up on<br>
&gt; <a href=3D"https://bugs.python.org/issue43232" rel=3D"noreferrer" targ=
et=3D"_blank">https://bugs.python.org/issue43232</a><br>
<br>
Bummer that we have to do that, but at least you are documenting the<br>
problems and pursuing a remedy upstream.<br>
<br></blockquote><div><br></div><div>Yeah. I suspect our use case is so nic=
he that it&#39;s not likely to get traction, but I&#39;ll try again. This s=
ort of thing might make it harder to use projects like pypy, so it does fee=
l like a defeat. Still, where there&#39;s a will, there&#39;s a way, right?=
 :)</div><div><br></div><div>--js<br></div><div>=C2=A0</div></div></div>

--00000000000082387d05cdc5bd76--


