Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9B3E83FD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:56:25 +0200 (CEST)
Received: from localhost ([::1]:49400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXrM-0006RE-Kl
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mDXpv-0005cD-UA
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:54:55 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mDXpp-0005ba-Fp
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:54:55 -0400
Received: by mail-io1-xd36.google.com with SMTP id n19so587769ioz.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SiES0b2rPh4tQjlJNHAPgs7CNR/v+HzcSGQ8J/WE6eA=;
 b=Bwd2lWX29TVgC/Qe+3T5BIb0URpD/CwwRyufvTz1FaLzmrpATyKJNDTGS7hzNr5ZDG
 0jPrkllOrVPwoamUc+cegTUH1VxiYUIwu8PgbyXWOmu3I3u9l//Ynbd36Gc87mK6UBoW
 oEnsCSrYKZzLRBHjd2W751sz4KTKfB+IWxszlRmQ7rqK4V9gN58hO5H+OQEcemWL/xVL
 E3cvI3u40WbwD8I4axN4mS9/sH1+OarWbBR6s/QJqmDZ2xaT99AM4dM6/SKDp2sfDRZ+
 FJUELmbOgMJjBaIXMYWteTwBLnqTt6T2w4duj5r6mhjn2DvgqwSB18empsrO1k8CmhSY
 Tmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SiES0b2rPh4tQjlJNHAPgs7CNR/v+HzcSGQ8J/WE6eA=;
 b=llMM9uhij4LeK1LvHFYfeU9C2zwE+uIpFuo0DZZ+OnMpfZzxBgzC5KnWcLgej1fvWG
 0K2t0HCpQN7S+9qI/PrT3Pu2Gz2iDnDadjaqKMZP81dW98puuW9MAyHNe0k1aAfGxGxH
 p7W8usdfO5FPdV1KpsVz9oM8PW5c3uHKsZ0gLjvP0VXYDpJ+U1EJJ0+s9w4id4O4lFnK
 +MvK0O+hfbesHEFX3uu3EY/0BDd4Xg69gfzyyDmw+onAtPyJyq9IrbtIySig+pTqbXS0
 MCMiKZrjbn2j4jy5QleUqOphHcGSzbU3IxNxyICMkiIggP7fOhkxJ1U8qVczk7xOKRDE
 wu0A==
X-Gm-Message-State: AOAM531XfrhIMDYWfi9c++wHFSKmQHlBr1NI2xT6n2F61UbqyKk/TAKV
 WM/U88dgAtpK1+sbSaV1qVRrtCaVL09M4a9W0ck=
X-Google-Smtp-Source: ABdhPJx+oTBmX4OHl/I0B5VNgknvmcsU/HH+W8InqcVNEUWGfcBq09kAB7DvQDM4iPyhBT4WbNgBfuddweWXPryp820=
X-Received: by 2002:a5d:9e19:: with SMTP id h25mr361033ioh.25.1628625288149;
 Tue, 10 Aug 2021 12:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-2-niteesh.gs@gmail.com>
 <CAFn=p-Yk2rZLxfPwpT62kktSC0RPuyDu81B=Ojzjgx2Xc6GEZw@mail.gmail.com>
In-Reply-To: <CAFn=p-Yk2rZLxfPwpT62kktSC0RPuyDu81B=Ojzjgx2Xc6GEZw@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 11 Aug 2021 01:24:21 +0530
Message-ID: <CAN6ztm9D3N=uoUKETQ5aRQcx8rDLaf3PSU8KpmTufVbzkZma1g@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] python/aqmp: Fix wait_closed work-around for
 python 3.6
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c5de6d05c939dfc7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000c5de6d05c939dfc7
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 5, 2021 at 10:58 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Before this patch the wait_closed work-around for python 3.6
>> fails during disconnect.
>> This is a temproray work around for which might be fixed in the
>> future or will be completely removed when the minimum python
>> version is raised to 3.7.
>>
>> This patch was originally written by John Snow <jsnow@redhat.com>
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/util.py | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
>> index de0df44cbd..eaa5fc7d5f 100644
>> --- a/python/qemu/aqmp/util.py
>> +++ b/python/qemu/aqmp/util.py
>> @@ -134,7 +134,17 @@ def is_closing(writer: asyncio.StreamWriter) -> bool:
>>
>>      while not transport.is_closing():
>>          await asyncio.sleep(0)
>> -    await flush(writer)
>> +
>> +    # This is an ugly workaround, but it's the best I can come up with.
>> +    sock = transport.get_extra_info('socket')
>> +
>> +    if sock is None:
>> +        # Our transport doesn't have a socket? ...
>> +        # Nothing we can reasonably do.
>> +        return
>> +
>> +    while sock.fileno() != -1:
>> +        await asyncio.sleep(0)
>>
>>
>>  def asyncio_run(coro: Coroutine[Any, Any, T], *, debug: bool = False) ->
>> T:
>> --
>> 2.17.1
>>
>>
> Sorry for the trouble. This is now included in the v3 version of my series
> and can be dropped. I hope.
>
Thanks. I'll remove this in the upcoming v4

--000000000000c5de6d05c939dfc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 10:58 PM John Snow &lt;<a hr=
ef=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu &lt;<a href=3D"m=
ailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Before th=
is patch the wait_closed work-around for python 3.6<br>
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
luded in the v3 version of my series and can be dropped. I hope.</div></div=
></div></blockquote><div><span class=3D"gmail_default" style=3D"font-size:s=
mall">Thanks. I&#39;ll remove this in the upcoming v4</span>=C2=A0</div></d=
iv></div>

--000000000000c5de6d05c939dfc7--

