Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62038DD59
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 23:45:58 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkvv2-0000m1-Fk
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 17:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1lkvtS-0008UV-Ff
 for qemu-devel@nongnu.org; Sun, 23 May 2021 17:44:18 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:38702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1lkvtP-0005bu-Qn
 for qemu-devel@nongnu.org; Sun, 23 May 2021 17:44:18 -0400
Received: by mail-ua1-x92d.google.com with SMTP id q8so4174644uap.5
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lithdew-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RXSF8Bb1repBj35GHaDQmVWJBT39DV1x/Dyz1cI++GA=;
 b=nA9rQr5xxqWIkYWjogAz/H8FRw/i0jP5x9Ok9ZCiqNbRjDGr4XczlTBctib+GmIoxG
 vOEtkcBQpYIn6ZtVTAaQAv0pfhnzGuQtbTthueNQcRTkGgErshQGIAVGgQUXz8rfim3F
 xvbmW3mzA2xuTkCxI0lX05Nn1foooY2Nm94vaSO6ty2t1xTUR9xaECfh66K30/vJkIW8
 6sbSrzUjXx5LFEeL6ltDsDkbWI5T2+7A5X7SWrR4TQDvU+SJgZicOfspw9AFSdDafDbT
 Ti/B0R20ywvWC33JgP1m3D71VbwHjgvWVmgQw6m9oaaZI7Q9OH15GkN3fxOdm9OwGkeK
 UIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RXSF8Bb1repBj35GHaDQmVWJBT39DV1x/Dyz1cI++GA=;
 b=FBhhv4cYKjJ/PsZCoRdg2j6OCgXgh/MNhOHgmxFHotkZtuT3uBXCIwjz16Uz2eQa8L
 dkw/9QvHYmoNavHFGY0XbXH/wI5EJsQp8E7X2nz/1kYmA0A5LZ1GUvHArmFcbvMg9VMx
 BMqIR2PgbMpG3vzFMUe5iL4HRF4kx6p3+kMHOX7LHf9nb1a1AE9BLRK7ige1hn+20w+j
 xYoKcUz1MpBxVgax8hd5AJx57T9siHYmihDqd89FRndd/lqZlSeerAIZR3PIg8IZc8iG
 jYMCRFA8VD9dHmro7fitasTi301hK6NY+daqIjugrd5Pbcf2h8+uo/k46LODV0PcHgNF
 ui/g==
X-Gm-Message-State: AOAM530lgh2t7Qtp8jsEWFkxAZKMIEDUX9LHrAD7KHSLZqAN+j8+rebD
 MLLzwCramwk3w0rIVtrYYiTZsUZBGIHuMtXTfaRZBgyWL7KFN2bDjnw=
X-Google-Smtp-Source: ABdhPJw8PXtiH3pDg0+vLNgFi3wRvCgEQNHnFT8WIC1J87wS/VjSLCi0n1ppKbo/AqoNCXM1gCQuzcUcVsfZXnoVoB0=
X-Received: by 2002:ab0:3256:: with SMTP id r22mr19512562uan.47.1621806254158; 
 Sun, 23 May 2021 14:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210516091536.1042693-1-kenta@lithdew.net>
 <aee50099-14a8-1c6b-6142-a4363f75812d@vivier.eu>
 <CAO4V76-aCeNq8OpTptSxywj+pV22EHNF-osWtR3onWMvGSSX+Q@mail.gmail.com>
In-Reply-To: <CAO4V76-aCeNq8OpTptSxywj+pV22EHNF-osWtR3onWMvGSSX+Q@mail.gmail.com>
From: Kenta Iwasaki <kenta@lithdew.net>
Date: Mon, 24 May 2021 06:44:03 +0900
Message-ID: <CAO4V76_bSBAqaiT7nRX1kRPUa62T55TjS68Y4n-a-Uur7tmXOg@mail.gmail.com>
Subject: Re: [PATCH] linux-user/syscall: zero-init msghdr in
 do_sendrecvmsg_locked
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000ac865f05c306313a"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=kenta@lithdew.net; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac865f05c306313a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Doing a ping for this patch.
https://patchew.org/QEMU/20210516091536.1042693-1-kenta@lithdew.net/

Best regards,
Kenta Iwasaki

On Sun, 16 May 2021 at 21:57, Kenta Iwasaki <kenta@lithdew.net> wrote:

> Sure,
>
> The bytes of `msghdr` need to be cleared because the `msghdr` struct
> layout specified in QEMU appears to generalize between the definitions of
> `msghdr` across different libc's and kernels. To appropriately generalize
> `msghdr` across libc's and kernels would either:
>
> 1. require specializing code in do_sendrecvmsg_locked() for each
> individual libc and kernel version, or
> 2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel versions
> may misinterpret the undefined padding bytes that come from misalignment =
in
> the struct as actual syscall params.
>
> The patch I provided would be going for route #2, given that it's a
> simpler fix for the underlying problem for the short term.
>
> What I believe is the background behind why the struct layout has been a
> problem is because, since the beginning, the Linux kernel has always
> specified the layout of `msghdr` differently from POSIX. Given that this
> implies incompatibility between kernels on how `msghdr` is specified,
> different libc projects such as musl and glibc provide different
> workarounds by laying out `msghdr` differently amongst one another.
>
> A few projects running tests/applications through QEMU have been bitten b=
y
> this, and a solution that one of the projects discovered was that patchin=
g
> QEMU to zero-initialize the bytes msghdr the same way my patch does allow
> for compatibility between different `msghdr` layouts across glibc, musl,
> and the Linux kernel:
> https://github.com/void-linux/void-packages/issues/23557#issuecomment-718=
392360
>
> For some additional useful context, here's a link pointing changes musl
> libc made to laying out `msghdr` b/c of Linux incorrectly laying out
> `msghdr` against the POSIX standard:
> http://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e=
3b39fbb021c5a64
>
> Also, here is a link to the `msghdr` struct layout in musl libc's bleedin=
g
> edge branch as of now:
> https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22
>
> As for my rationale for sending in this patch, it is because I'm currentl=
y
> implementing cross-platform networking in the standard library for the Zi=
g
> programming language, and have run into this exact same problem with
> EMSGSIZE being returned by sendmsg() when tests are run through QEMU on
> x86_64-linux-musl.
>
> My discussions with the Zig community about it alongside debug logs
> regarding the exact parameters being fed to the sendmsg() syscall can be
> found here:
> https://github.com/ziglang/zig/pull/8750#issuecomment-841641576
>
> Hope this gives enough context about the problem and patch, but please do
> let me know if there is any more information that I could provide which
> would help.
>
> Best regards,
> Kenta Iwasaki
>
>
> On Sun, 16 May 2021 at 19:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
>> Le 16/05/2021 =C3=A0 11:15, Kenta Iwasaki a =C3=A9crit :
>> > The mixing of libc and kernel versions of the layout of the `msghdr`
>> > struct causes EMSGSIZE to be returned by sendmsg if the `msghdr` struc=
t
>> > is not zero-initialized (such that padding bytes comprise of
>> > uninitialized memory).
>> >
>> > Other parts of the QEMU codebase appear to zero-initialize the `msghdr=
`
>> > struct to workaround these struct layout issues, except for
>> > do_sendrecvmsg_locked in linux-user/syscall.c.
>> >
>> > This patch zero-initializes the `msghdr` struct in
>> > do_sendrecvmsg_locked.
>> >
>> > Signed-off-by: Kenta Iwasaki <kenta@lithdew.net>
>> > ---
>> >  linux-user/syscall.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> > index 95d79ddc43..f60b7e04d5 100644
>> > --- a/linux-user/syscall.c
>> > +++ b/linux-user/syscall.c
>> > @@ -3337,7 +3337,7 @@ static abi_long do_sendrecvmsg_locked(int fd,
>> struct target_msghdr *msgp,
>> >                                        int flags, int send)
>> >  {
>> >      abi_long ret, len;
>> > -    struct msghdr msg;
>> > +    struct msghdr msg =3D { 0 };
>> >      abi_ulong count;
>> >      struct iovec *vec;
>> >      abi_ulong target_vec;
>> >
>>
>> It seems do_sendrecvmsg_locked() initializes all the fields of the
>> structure, I don't see why we
>> need to clear it before use.
>>
>> Could you explain more?
>>
>> Thanks,
>> Laurent
>>
>

--000000000000ac865f05c306313a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doing a ping for this patch.=C2=A0<a href=3D"https://patch=
ew.org/QEMU/20210516091536.1042693-1-kenta@lithdew.net/">https://patchew.or=
g/QEMU/20210516091536.1042693-1-kenta@lithdew.net/</a><div><br></div><div>B=
est regards,</div><div>Kenta Iwasaki</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 16 May 2021 at 21:57, Ken=
ta Iwasaki &lt;<a href=3D"mailto:kenta@lithdew.net">kenta@lithdew.net</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">Sure,<div><br></div><div>The bytes of `msghdr` need to be cleare=
d because the `msghdr` struct layout specified in QEMU appears to generaliz=
e between the definitions of `msghdr` across different libc&#39;s and kerne=
ls. To appropriately=C2=A0generalize `msghdr` across libc&#39;s and kernels=
 would either:</div><div><br></div><div>1. require specializing code in do_=
sendrecvmsg_locked() for each individual libc and kernel version, or</div><=
div>2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel versio=
ns may misinterpret the undefined padding bytes that come from misalignment=
 in the struct as actual syscall params.</div><div><br></div><div>The patch=
 I provided would be going for route #2, given that it&#39;s a simpler fix =
for the underlying problem for the short term.</div><div><br></div><div>Wha=
t I believe is the background behind why the struct layout has been a probl=
em is because, since the beginning, the Linux kernel has always specified t=
he layout of `msghdr` differently from POSIX. Given that this implies incom=
patibility between kernels on how `msghdr` is specified, different libc pro=
jects such as musl and glibc provide different workarounds by laying out `m=
sghdr` differently amongst one another.</div><div><br></div><div><div>A few=
 projects running tests/applications through QEMU have been bitten by this,=
 and a solution that one of the projects discovered was that patching QEMU =
to zero-initialize the bytes msghdr the same way my patch does allow for co=
mpatibility between different `msghdr` layouts across glibc, musl, and the =
Linux kernel: <a href=3D"https://github.com/void-linux/void-packages/issues=
/23557#issuecomment-718392360" target=3D"_blank">https://github.com/void-li=
nux/void-packages/issues/23557#issuecomment-718392360</a></div><div></div><=
/div><div><br></div><div>For some additional useful context, here&#39;s a l=
ink pointing changes musl libc made to laying out `msghdr` b/c of Linux inc=
orrectly laying out `msghdr` against the POSIX standard: <a href=3D"http://=
git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e3b39fbb02=
1c5a64" target=3D"_blank">http://git.musl-libc.org/cgit/musl/commit/?id=3D7=
168790763cdeb794df52be6e3b39fbb021c5a64</a></div><div><br></div><div>Also, =
here is a link to the `msghdr` struct layout in musl libc&#39;s bleeding ed=
ge branch as of now:=C2=A0<a href=3D"https://git.musl-libc.org/cgit/musl/tr=
ee/include/sys/socket.h#n22" target=3D"_blank">https://git.musl-libc.org/cg=
it/musl/tree/include/sys/socket.h#n22</a></div><div><br></div><div>As for m=
y rationale for sending in this patch, it is because I&#39;m currently impl=
ementing cross-platform networking in the standard library for the Zig prog=
ramming language, and have run into this exact same problem with EMSGSIZE b=
eing returned by sendmsg() when tests are run through QEMU on x86_64-linux-=
musl.</div><div><br></div><div>My discussions with the Zig community about =
it alongside debug logs regarding the exact parameters being fed to the sen=
dmsg() syscall can be found here:=C2=A0<a href=3D"https://github.com/ziglan=
g/zig/pull/8750#issuecomment-841641576" target=3D"_blank">https://github.co=
m/ziglang/zig/pull/8750#issuecomment-841641576</a></div><div><br></div><div=
>Hope this gives enough context about the problem and patch, but please do =
let me know if there is any more information that I could provide which wou=
ld help.</div><div><br></div><div>Best regards,</div><div>Kenta Iwasaki</di=
v><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, 16 May 2021 at 19:53, Laurent Vivier &lt;<a href=
=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 16/05/2=
021 =C3=A0 11:15, Kenta Iwasaki a =C3=A9crit=C2=A0:<br>
&gt; The mixing of libc and kernel versions of the layout of the `msghdr`<b=
r>
&gt; struct causes EMSGSIZE to be returned by sendmsg if the `msghdr` struc=
t<br>
&gt; is not zero-initialized (such that padding bytes comprise of<br>
&gt; uninitialized memory).<br>
&gt; <br>
&gt; Other parts of the QEMU codebase appear to zero-initialize the `msghdr=
`<br>
&gt; struct to workaround these struct layout issues, except for<br>
&gt; do_sendrecvmsg_locked in linux-user/syscall.c.<br>
&gt; <br>
&gt; This patch zero-initializes the `msghdr` struct in<br>
&gt; do_sendrecvmsg_locked.<br>
&gt; <br>
&gt; Signed-off-by: Kenta Iwasaki &lt;<a href=3D"mailto:kenta@lithdew.net" =
target=3D"_blank">kenta@lithdew.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/syscall.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; index 95d79ddc43..f60b7e04d5 100644<br>
&gt; --- a/linux-user/syscall.c<br>
&gt; +++ b/linux-user/syscall.c<br>
&gt; @@ -3337,7 +3337,7 @@ static abi_long do_sendrecvmsg_locked(int fd, st=
ruct target_msghdr *msgp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int f=
lags, int send)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abi_long ret, len;<br>
&gt; -=C2=A0 =C2=A0 struct msghdr msg;<br>
&gt; +=C2=A0 =C2=A0 struct msghdr msg =3D { 0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abi_ulong count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abi_ulong target_vec;<br>
&gt; <br>
<br>
It seems do_sendrecvmsg_locked() initializes all the fields of the structur=
e, I don&#39;t see why we<br>
need to clear it before use.<br>
<br>
Could you explain more?<br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div>
</blockquote></div>

--000000000000ac865f05c306313a--

