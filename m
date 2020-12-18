Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2712DE348
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:27:22 +0100 (CET)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFmz-0002Py-IG
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqFj8-0000jC-D7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:23:22 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqFj6-00010V-8L
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:23:22 -0500
Received: by mail-ej1-x630.google.com with SMTP id ce23so3161373ejb.8
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpMMPtKjs3OIC+OotyvUB1TnwpzrAV9r4Fq5rzMbhQE=;
 b=JhWX1fMFzUcruIoZaiP9WsWxAPF5KgWlDLW+CL8du5u4DYNbGZDRmAYf3CZVqke5Kx
 TOEkXcfbparCaJ7tg0TkhG6HIUR+QFIN78aKBpysIxCGH3RRkU5osWUyoX9havitU4z5
 CF4wIvActonxwaqTlgY3gtgdcMyArSB+Wp4vvVElProoqiUjSBCtPLi12UrQ8ohFPy1f
 3pnT1+CPkzzxkSFwvQGgmLX+cR67Vvh+QkvBVW/jxHnHSis2s8HnY49QxaPRzyX3Z/wp
 WgqsGKUEfU8DmF0YpvTG4Zn00vQ9UpRRAo2N1VFknOKjnej5Gf0C1/yBaXGl33bfjz3x
 0l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpMMPtKjs3OIC+OotyvUB1TnwpzrAV9r4Fq5rzMbhQE=;
 b=Itlvk+5C2OEhutvCtKiEKDbuHUB9xEM/Xjvr6BC3/EkvMbzSwkpMFVAmjCiyMZ9uZh
 +SFrzOzeVpcf/5GqK93PghPpT8gbtO0i1op7E8am3TzbbBpL3KI7uH7o84yyJCDSYhaB
 l9AwISNmvcTvpgENzk8gV6HDEot1ToR7kbfNYK1/QXV1Z2LHp2J4wZVqbz9CrAwL1wqy
 /6Hyf9i1Dy9QKpHaIzNcSYhoifjRV6ajkpfMFol0No4+gY2BaVcXRO3pT54gf0Ot8M4s
 U5304a2BFa47zXD6MlZmZAUp+WQChFEG2ogfcAMxQb5U+/Yq3vLj+yYCyzagGqsfQIR0
 zj+g==
X-Gm-Message-State: AOAM5329jXCg8VFHzr3nF+emG5WBcSDHIYFwPH//R+f2hiEKvSgXBabG
 Y2PnLvMTSDbRM7u5Dp5s9hulYG7X5Gs0E/lOPcU=
X-Google-Smtp-Source: ABdhPJwKfJxqlUP4Lvf1boTsikZnWBmQAiV/BuQWOzVMGP0ElChDeF3gUzQ61ycmUfmcQ522f2/Wcyzx7Jb28zV/ajA=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr3980114ejb.532.1608297798425; 
 Fri, 18 Dec 2020 05:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
 <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
 <7fc16ac5-d0c2-9475-abc8-bd415c6b2a73@redhat.com>
 <CAMxuvawOQc7sHoVV+eaAChwDb5RVRBHWPqzZ85xoovp+_nqtdg@mail.gmail.com>
In-Reply-To: <CAMxuvawOQc7sHoVV+eaAChwDb5RVRBHWPqzZ85xoovp+_nqtdg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Dec 2020 17:23:06 +0400
Message-ID: <CAJ+F1CJRLsFcH-ee0f8QcKruSp_a=-BvCZoh=+csRHDLDv54Gw@mail.gmail.com>
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f7e4e505b6bd0244"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f7e4e505b6bd0244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 18, 2020 at 5:03 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Thu, Dec 17, 2020 at 3:47 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>> On 17/12/20 12:32, Claudio Fontana wrote:
>> > Is the root cause elsewhere though?
>> >
>> > I don't like stubs very much, because often they are introduced as the
>> easy way out of a problem instead of doing the necessary refactoring,
>> > and they end up confusing the hell out of someone trying to understand
>> what is actually used where, never mind trying to debug the linker error=
s.
>> >
>> > There is already an bunch of #ifndef _WIN32, #else , ... in
>> util/main-loop.c (quite a bunch of them really),
>> > is that what actually needs reworking, and putting the pieces together
>> in the build system in a way that makes sense?
>>
>> qemu_fd_register is almost not needed at all, since we have
>>
>>          WSAEventSelect(node->pfd.fd, event, bitmask);
>>
>> in aio_set_fd_handler.  I think we can remove the call to
>> qemu_fd_register from qemu_try_set_nonblock, and that should fix the
>> issue as well.
>>
>
> That's tricky to say whether this won't introduce regression. For most fd=
s
> from qemu, if they use aio_set_fd_handler, that should be ok.
>
> But what about other fds? For examples, the ones from slirp? In fact, I
> don't understand how it could work today. We are passing socket() fd
> directly to g_poll(). But according to the documentation:
>
>  * On Win32, the fd in a GPollFD should be Win32 HANDLE (*not* a file
>  * descriptor as provided by the C runtime) that can be used by
>  * MsgWaitForMultipleObjects. This does *not* include file handles
>  * from CreateFile, SOCKETs, nor pipe handles. (But you can use
>  * WSAEventSelect to signal events when a SOCKET is readable).
>
> And MsgWaitForMultipleObjects doesn't mention SOCKET as being valid
> handles to wait for.
>
> But when I run qemu with slirp, with or without qemu_fd_register, I don't
> see any error or regression.
>
> Am I missing something?
>


I wrote a simple program to check the behaviour of WaitForMultipleObjects:

#include <winsock2.h>
#include <glib.h>

int main(int argc, char *argv[])
{
WSADATA Data;
WSAStartup(MAKEWORD(2, 0), &Data);
int fd =3D socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
g_print("sock fd %d\n", fd);

HANDLE handles[1] =3D { (HANDLE)fd };
DWORD res =3D WaitForMultipleObjects(1, handles, FALSE, 1000);
g_print("wait res %x\n", res);
return 0;
}

Indeed, it doesn not complain about SOCKET as HANDLE here. But it will
return immediately indicating that the socket has events.

We probably want to fix this. slirp should only fill pollfd with handles
that are acceptable for WaitFor API I suppose.

Correct?

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f7e4e505b6bd0244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 5:03 P=
M Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com"=
>marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Dec 17, 2020 at 3:47 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redha=
t.com" target=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 17/12/20 12:32, Claudio Font=
ana wrote:<br>
&gt; Is the root cause elsewhere though?<br>
&gt; <br>
&gt; I don&#39;t like stubs very much, because often they are introduced as=
 the easy way out of a problem instead of doing the necessary refactoring,<=
br>
&gt; and they end up confusing the hell out of someone trying to understand=
 what is actually used where, never mind trying to debug the linker errors.=
<br>
&gt; <br>
&gt; There is already an bunch of #ifndef _WIN32, #else , ... in util/main-=
loop.c (quite a bunch of them really),<br>
&gt; is that what actually needs reworking, and putting the pieces together=
 in the build system in a way that makes sense?<br>
<br>
qemu_fd_register is almost not needed at all, since we have<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WSAEventSelect(node-&gt;pfd.fd, event, bi=
tmask);<br>
<br>
in aio_set_fd_handler.=C2=A0 I think we can remove the call to <br>
qemu_fd_register from qemu_try_set_nonblock, and that should fix the <br>
issue as well.<br></blockquote><div><br></div><div>That&#39;s tricky to say=
 whether this won&#39;t introduce regression. For most fds from qemu, if th=
ey use aio_set_fd_handler, that should be ok.</div><div><br></div><div>But =
what about other fds? For examples, the ones from slirp? In fact, I don&#39=
;t understand how it could work today. We are passing socket() fd directly =
to g_poll(). But according to the documentation:</div><div><br></div><div>=
=C2=A0* On Win32, the fd in a GPollFD should be Win32 HANDLE (*not* a file<=
br>=C2=A0* descriptor as provided by the C runtime) that can be used by<br>=
=C2=A0* MsgWaitForMultipleObjects. This does *not* include file handles<br>=
=C2=A0* from CreateFile, SOCKETs, nor pipe handles. (But you can use<br>=C2=
=A0* WSAEventSelect to signal events when a SOCKET is readable).</div><div>=
<br></div><div>And MsgWaitForMultipleObjects doesn&#39;t mention SOCKET as =
being valid handles to wait for.</div><div><br></div><div>But when I run qe=
mu with slirp, with or without qemu_fd_register, I don&#39;t see any error =
or regression.<br></div><div><br></div><div>Am I missing something?<br></di=
v></div></div></blockquote><div><br></div><div><br></div><div>I wrote a sim=
ple program to check the behaviour of WaitForMultipleObjects:</div><div>=C2=
=A0</div></div>#include &lt;winsock2.h&gt;<br>#include &lt;glib.h&gt;<br><b=
r>int main(int argc, char *argv[])<br>{<br>	WSADATA Data;<br>	WSAStartup(MA=
KEWORD(2, 0), &amp;Data);<br>	int fd =3D socket(AF_INET, SOCK_STREAM, IPPRO=
TO_TCP);<br>	g_print(&quot;sock fd %d\n&quot;, fd);<br><br>	HANDLE handles[=
1] =3D { (HANDLE)fd };<br>	DWORD res =3D WaitForMultipleObjects(1, handles,=
 FALSE, 1000);<br>	g_print(&quot;wait res %x\n&quot;, res);<br>	return 0;<b=
r>}<br><br></div><div>Indeed, it doesn not complain about SOCKET as HANDLE =
here. But it will return immediately indicating that the socket has events.=
</div><div><br></div><div>We probably want to fix this. slirp should only f=
ill pollfd with handles that are acceptable for WaitFor API I suppose.</div=
><div><br></div><div>Correct?<br></div><div><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--000000000000f7e4e505b6bd0244--

