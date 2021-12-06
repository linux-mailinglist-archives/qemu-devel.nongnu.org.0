Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F546A4C7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 19:39:03 +0100 (CET)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muItB-00020C-Qe
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 13:39:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIrV-0001Aj-Ki
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 13:37:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIrT-0005rA-1y
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 13:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638815834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQq47maOE6yw/nkDK3UFOC/Mv4YSdrSKVVz7MCltpuE=;
 b=bXPAcYxsVaAJyGPnOI0Ex6Yf9Hhc+8UlzZxCduv1e1iVZhuXmG7XxrFoTSfXVGKQLk/g3G
 HxQ36saj4acOd7wYaQQ71jnzQfGgcfQEMnNVAE2ukjAVTZbP4iPB/cXIBlPuXFgT0baBxQ
 E/yIWqp3gvzezQq9r5+gIzpXBX50s7c=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-6t5R8XAVPsSSa9H2rif7Zg-1; Mon, 06 Dec 2021 13:37:13 -0500
X-MC-Unique: 6t5R8XAVPsSSa9H2rif7Zg-1
Received: by mail-vk1-f199.google.com with SMTP id
 s12-20020a1ff40c000000b002fa86937165so4544132vkh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 10:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQq47maOE6yw/nkDK3UFOC/Mv4YSdrSKVVz7MCltpuE=;
 b=y2dIrkVX6OROquTgfJynNmFyiflxyW0bVXGH2pJSUJMuUFogr2gFKNwgGV0nh1hrGx
 6w9dsJec5cBkvQmVgMy3rZ+idmOubQv64YJoXZu5XoHgZdrsMakcqtpz1oKzP18WHjDQ
 UxAVXbEdpL0GEG+5gN7llu2QKj5Od6nmPnzt5GOg1N4JqC9KH7jWJGEix77tilF5PPia
 ElSkqZS31u6zXsRav9iIjrurMdAJcPLTLHkNr6uNRgiKgoqxNX530kctukcW10AWKb1H
 L1HIzjsANAlq9SA2de8/jwN73npSNBRho+0SZ84fk7q93eD+ukaEm4or0kgJtsJSAEle
 fxqQ==
X-Gm-Message-State: AOAM53022zTRb/fX3VRDDIDBB5Xw1S0C/Af6ofajSZpeYGll+S+DYsPp
 YZHAb/9pUBT5dJEBERRTulp03gBypcH03jX0nRjsfyTv7QaucRWb7NzgVF8ZlTzKk2uPB58rPf3
 AMGc5xI9ftz3bhxvUPxlfPfzJrvSTQ8E=
X-Received: by 2002:ab0:35d2:: with SMTP id x18mr41953673uat.32.1638815832324; 
 Mon, 06 Dec 2021 10:37:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcYxGbrckfBkE26v50GkhFdo7c0p1/vpVt6a7EW4YKcHtrgVv7ZJWHlAvmkaiizlqfQ6uHq6FWs+tH27pUajU=
X-Received: by 2002:ab0:35d2:: with SMTP id x18mr41953599uat.32.1638815831782; 
 Mon, 06 Dec 2021 10:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
In-Reply-To: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Dec 2021 13:37:01 -0500
Message-ID: <CAFn=p-bsY_QWNoRWp928_dwmNyXXcDQ7Bi+0P9ObAsxGTYyiBA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iotests: multiprocessing!!
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000818dc005d27e8bc8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Kevin Wolf <kwolf@redhat.com>, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000818dc005d27e8bc8
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Hi all!
>
> Finally, I can not stand it any longer. So, I'm happy to present
> multiprocessing support for iotests test runner.
>
> testing on tmpfs:
>
> Before:
>
> time check -qcow2
> ...
> real    12m28.095s
> user    9m53.398s
> sys     2m55.548s
>
> After:
>
> time check -qcow2 -j 12
> ...
> real    2m12.136s
> user    12m40.948s
> sys     4m7.449s
>
>
VERY excellent. And this will probably flush a lot more bugs loose, too.
(Which I consider a good thing!)
We could look into utilizing it for 'make check', but we'll have to be
prepared for a greater risk of race conditions on the CI if we do. But...
it's seriously hard to argue with this kind of optimization, very well done!


>
> Hmm, seems -j 6 should be enough. I have 6 cores, 2 threads per core.
> Anyway, that's so fast!
>
> Vladimir Sementsov-Ogievskiy (3):
>   iotests/testrunner.py: add doc string for run_test()
>   iotests/testrunner.py: move updating last_elapsed to run_tests
>   iotests: check: multiprocessing support
>
>  tests/qemu-iotests/check         |  4 +-
>  tests/qemu-iotests/testrunner.py | 86 ++++++++++++++++++++++++++++----
>  2 files changed, 80 insertions(+), 10 deletions(-)
>
> --
> 2.31.1
>
>

--000000000000818dc005d27e8bc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 7:22 AM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi all!<br>
<br>
Finally, I can not stand it any longer. So, I&#39;m happy to present<br>
multiprocessing support for iotests test runner.<br>
<br>
testing on tmpfs:<br>
<br>
Before:<br>
<br>
time check -qcow2<br>
...<br>
real=C2=A0 =C2=A0 12m28.095s<br>
user=C2=A0 =C2=A0 9m53.398s<br>
sys=C2=A0 =C2=A0 =C2=A02m55.548s<br>
<br>
After:<br>
<br>
time check -qcow2 -j 12<br>
...<br>
real=C2=A0 =C2=A0 2m12.136s<br>
user=C2=A0 =C2=A0 12m40.948s<br>
sys=C2=A0 =C2=A0 =C2=A04m7.449s<br>
<br></blockquote><div><br></div><div>VERY excellent. And this will probably=
 flush a lot more bugs loose, too. (Which I consider a good thing!)</div><d=
iv>We could look into utilizing it for &#39;make check&#39;, but we&#39;ll =
have to be prepared for a greater risk of race conditions on the CI if we d=
o. But... it&#39;s seriously hard to argue with this kind of optimization, =
very well done!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Hmm, seems -j 6 should be enough. I have 6 cores, 2 threads per core.<br>
Anyway, that&#39;s so fast!<br>
<br>
Vladimir Sementsov-Ogievskiy (3):<br>
=C2=A0 iotests/testrunner.py: add doc string for run_test()<br>
=C2=A0 iotests/testrunner.py: move updating last_elapsed to run_tests<br>
=C2=A0 iotests: check: multiprocessing support<br>
<br>
=C2=A0tests/qemu-iotests/check=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +=
-<br>
=C2=A0tests/qemu-iotests/testrunner.py | 86 ++++++++++++++++++++++++++++---=
-<br>
=C2=A02 files changed, 80 insertions(+), 10 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000818dc005d27e8bc8--


