Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0094D7285
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 06:01:34 +0100 (CET)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTGMH-00087S-7i
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 00:01:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTGKQ-0007Oy-KQ
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 23:59:38 -0500
Received: from [2607:f8b0:4864:20::e2a] (port=34307
 helo=mail-vs1-xe2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTGKO-0001pV-BS
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 23:59:38 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id v62so13756891vsv.1
 for <qemu-devel@nongnu.org>; Sat, 12 Mar 2022 20:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vKWcfyNZ1/fZmoGX8Xo7Qg20f03lcJew/PUGO6l+ng4=;
 b=wSdj7z9EJ20hx+eCDCsjTXF2EmzhmbE3HT6G0kDKSf0GWBVggqXzdZoWInbIx7EkPW
 MV8txezYKLQO3ViooRGyX/HzcM2eIHQwz0qxheQIv3fd0ZRZH3Fc5t2a3zCGI9Ve+90l
 lxvQ76sUy6vm/7VR8R7QPM0ru2LWLCz4Lmzx66iNmYU6EuvaYQhbU8W0NKIYO1eZX+IE
 zO2wwirUMQr2xkC9VqPwwUhH3b0uk32QG27wGpAVOIcmQCskzORrP3PdTu+ecszbHDSJ
 bFbz8qKVTnS6+TWkGZVGMslqQBdoHGzH5ZE54aqoVk/LVVmP0dR5phCypYjoKsWD0Ela
 WJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKWcfyNZ1/fZmoGX8Xo7Qg20f03lcJew/PUGO6l+ng4=;
 b=I+IYsZcCLCf8yq2N81mSgi3jrHfucTo9YN9ENkYAD7caY9K8PsGUqVEiSMPpqBat5a
 rC9Rn6UEccoUjn7Dp0PA2n1eSATyPY5mqB7RO50MaFP0PM22gE3k5CK7zXG2/bwKXPpw
 B4eKJWENAxofKoILoRAdsG/KSOBBBEDnygVHsPviQ+JCyLYu1NezDhwG95V6rDQilxEI
 AU719N4XMeWOSchavoNT3EIAGsA15lDsHDYK14o3zQDp47VG1VEmrrQSVxos4/F+OkP/
 fagrX8Y3tF9xJOUjxeNt9gpJ5fo3KavB7heSYJcDTgKdhXOYJYLxdFbNeSCmtDKJcTZc
 ShxA==
X-Gm-Message-State: AOAM530cPsBKz9RCnyhuye4HbcJyZIChnpgF70wzA1+tGdUmVq+au3bn
 Vl7CCLWQVnLe7+t9vwiP7Fx3JsZc/IANFGIDDbZwzQ==
X-Google-Smtp-Source: ABdhPJwXe2SbZeSoFnc0687GVKbaLWYHq0wXl3zDoFAVbUyzunkaBFFSsJZSqiJilGBfUfNl5OnYg640jLY2TP+0cco=
X-Received: by 2002:a05:6102:ed5:b0:322:ba55:d279 with SMTP id
 m21-20020a0561020ed500b00322ba55d279mr3816646vst.77.1647147574436; Sat, 12
 Mar 2022 20:59:34 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
In-Reply-To: <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 12 Mar 2022 21:59:25 -0700
Message-ID: <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
Subject: Re: Question about atomics
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000011380b05da126ef3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000011380b05da126ef3
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 9:29 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Tue, Mar 8, 2022 at 7:26 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>> On 3/8/22 15:09, Warner Losh wrote:
>> >
>> >     Yes, qatomic_foo is expected to work.  It's what we use across
>> >     threads, and it is expected to work "in kernel mode", i.e. within
>> cpu_loop().
>> >
>> > Even when the writers are done in the context of system calls to the
>> kernel?
>>
>> Yes.
>>
>> That said, for the similar syscall in Linux we just forward it to the
>> kernel (and the kernel obviously can only do an atomic---no
>> start_exclusive/end_exclusive involved).
>>
>
> OK. It seemed similar to futex, but I didn't know if that worked because
> it restricted itself, or because all atomics worked when used from the
> kernel :)
>

So how do you handle multiple writers? I think I've found a way they
can race, but I need a sanity check to make sure I'm understanding
correctly.

FreeBSD's pthread_mutex is shared between the kernel and user land.
So it does a compare and set to take the lock. Uncontested and unheld
locks will mean we've taken the lock and return. Contested locks
are kicked to the kernel to wait. When userland releases the lock
it signals the kernel to wakeup via a system call. The kernel then
does a cas to try to acquire the lock. It either returns with the lock
held, or goes back to sleep. This we have atomics operating both in
the kernel (via standard host atomics) and userland atomics done
via start/end_exclusive. So I'm struggling with how the start/end_exclsuive
interacts with the cas from the kernel. the kernel can modify the value
after tcg has read the old value before it's goes to set it thinking
that it's OK.

Basically. Lock is unlocked, so it has '0' in the owner field, which is
the oldval for the cas operation.

Thread 1 (tcg inside of start_exclusive)
     old = *(uint64_t *)g2h(cs, addr);
     if (old == oldval)
/*                  kernel does the cas here, finds it uncontested and
stores it's ownership */
         *(uint64_t *)g2h(cs, addr) = new; /* now the kernel value is
overwritten, two threads think they own the lock */

Or am I missing something there?

This doesn't need to necessarily work, but I'm trying to understand if I
understand
the race well enough (and if so, I'll need to do something else to implement
these things).

Warner


> > And if the system call does this w/o using
>> > the start_exclusive/end_exclusive stuff, is that a problem?
>>
>> If it does it without start_exclusive/end_exclusive they must use
>> qatomic_foo().
>
>
> So this answer is in the context *-user implementing a system call
> that's executed as a callout from cpu_loop()? Or does the kernel
> have to use the C11 atomics that qatomic_foo() is based on... I'm
> thinking the former based on the above, but want to make sure.
>
>
>> If it does it with start_exclusive/end_exclusive, they
>> can even write a compare-and-exchange as
>>
>>      old = *(uint64_t *)g2h(cs, addr);
>>      if (old == oldval)
>>          *(uint64_t *)g2h(cs, addr) = new;
>>
>
>  Nice.
>
> The test program that's seeing corrupted mutex state is just two threads.
> I've simplified
> it a bit (it's an ATF test, and there's a lot of boilerplate that I
> removed, including validating
> the return values). It looks pretty straight forward. Often it will work,
> sometimes, though
> it fails with an internal assertion in what implements pthread_mutex about
> state that's
> not possible w/o the atomics/system calls that implement the pthread_mutex
> failing to
> work.
>
> Warner
>
> P.S. Here's the code for reading purposes... W/o the headers it won't
> compile and the
> ATF stuff at the end comes from elsewhere...
>
> static pthread_mutex_t static_mutex = PTHREAD_MUTEX_INITIALIZER;
> static int global_x;
> bool thread3_started = false;
>
> static void *
> mutex3_threadfunc(void *arg) {
>         long count = *(int *)arg;
>
>         thread3_started = true;
>         while (count--) {
>                 pthread_mutex_lock(&static_mutex);
>                 global_x++;
>                 pthread_mutex_unlock(&static_mutex);
>         }
> }
>
> int main(int argc, char **argv) {
>         int count, count2;
>         pthread_t new;
>         void *joinval;
>
>         global_x = 0;
>         count = count2 = 1000;
>         pthread_mutex_lock(&static_mutex);
>         pthread_create(&new, NULL, mutex3_threadfunc, &count2);
>         while (!thread3_started) {
>                 /* Wait for thread 3 to start to increase chance of race */
>         }
>        pthread_mutex_unlock(&static_mutex);
>        while (count--) {
>                 pthread_mutex_lock(&static_mutex);
>                 global_x++;
>                 pthread_mutex_unlock(&static_mutex);
>         }
>
>         pthread_join(new, &joinval);
>         pthread_mutex_lock(&static_mutex);
>         ATF_REQUIRE_EQ_MSG(count, -1, "%d", count);
>         ATF_REQUIRE_EQ_MSG((long)joinval, -1, "%ld", (long)joinval);
>         ATF_REQUIRE_EQ_MSG(global_x, 1000 * 2, "%d vs %d", globaol_x,
>             1000 * 2);
> }
>

--00000000000011380b05da126ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 9:29 AM Warner=
 Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 7:26 AM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonz=
ini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 3/8/22 15:09, Warner Losh wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes, qatomic_foo is expected to work.=C2=A0 It&#39;=
s what we use across<br>
&gt;=C2=A0 =C2=A0 =C2=A0threads, and it is expected to work &quot;in kernel=
 mode&quot;, i.e. within cpu_loop().<br>
&gt; <br>
&gt; Even when the writers are done in the context of system calls to the k=
ernel?<br>
<br>
Yes.<br>
<br>
That said, for the similar syscall in Linux we just forward it to the <br>
kernel (and the kernel obviously can only do an atomic---no <br>
start_exclusive/end_exclusive involved).<br></blockquote><div><br></div><di=
v>OK. It seemed similar to futex, but I didn&#39;t know if that worked beca=
use</div><div>it restricted itself, or because all atomics worked when used=
 from the</div><div>kernel :)</div></div></div></blockquote><div><br></div>=
<div>So how do you handle multiple writers? I think I&#39;ve found a way th=
ey</div><div>can race, but I need a sanity check to make sure I&#39;m under=
standing</div><div>correctly.<br></div><div><br></div><div>FreeBSD&#39;s pt=
hread_mutex is shared between the kernel and user land.</div><div>So it doe=
s a compare and set to take the lock. Uncontested and unheld</div><div>lock=
s will mean we&#39;ve taken the lock and return. Contested locks</div><div>=
are kicked to the kernel to wait. When userland releases the lock</div><div=
>it signals the kernel to wakeup via a system call. The kernel then</div><d=
iv>does a cas to try to acquire the lock. It either returns with the lock</=
div><div>held, or goes back to sleep. This we have atomics operating both i=
n</div><div>the kernel (via standard host atomics) and userland atomics don=
e</div><div>via start/end_exclusive. So I&#39;m struggling with how the sta=
rt/end_exclsuive</div><div>interacts with the cas from the kernel. the kern=
el can modify the value</div><div>after tcg has read the old value before i=
t&#39;s goes to set it thinking</div><div>that it&#39;s OK.</div><div><br><=
/div><div>Basically. Lock is unlocked, so it has &#39;0&#39; in the owner f=
ield, which is</div><div>the oldval for the cas operation.<br></div><div><b=
r></div><div>Thread 1 (tcg inside of start_exclusive)</div><div>=C2=A0 =C2=
=A0=C2=A0 old =3D *(uint64_t *)g2h(cs, addr);<br>
=C2=A0 =C2=A0 =C2=A0if (old =3D=3D oldval)</div><div>/*=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 kernel does the cas here, finds it uncontested and stores it&#39;=
s ownership */<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 *(uint64_t *=
)g2h(cs, addr) =3D new; /* now the kernel value is overwritten, two threads=
 think they own the lock */</div><div><br></div><div>Or am I missing someth=
ing there?</div><div><br></div><div>This doesn&#39;t need to necessarily wo=
rk, but I&#39;m trying to understand if I understand</div><div>the race wel=
l enough (and if so, I&#39;ll need to do something else to implement</div><=
div>these things).<br>
</div><div><br></div><div>Warner<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; And if the system call does this w/o using<br>
&gt; the start_exclusive/end_exclusive stuff, is that a problem?<br>
<br>
If it does it without start_exclusive/end_exclusive they must use <br>
qatomic_foo().</blockquote><div><br></div><div>So this answer is in the con=
text *-user implementing a system call</div><div>that&#39;s executed as a c=
allout from cpu_loop()? Or does the kernel</div><div>have to use the C11 at=
omics that qatomic_foo() is based on... I&#39;m</div><div>thinking the form=
er based on the above, but want to make sure.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">If it does it with start_exclusi=
ve/end_exclusive, they <br>
can even write a compare-and-exchange as<br>
<br>
=C2=A0 =C2=A0 =C2=A0old =3D *(uint64_t *)g2h(cs, addr);<br>
=C2=A0 =C2=A0 =C2=A0if (old =3D=3D oldval)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(uint64_t *)g2h(cs, addr) =3D new;<br></=
blockquote><div><br></div><div>=C2=A0Nice.</div><div><br></div><div>The tes=
t program that&#39;s seeing corrupted mutex state is just two threads. I&#3=
9;ve simplified</div><div>it a bit (it&#39;s an ATF test, and there&#39;s a=
 lot of boilerplate that I removed, including validating</div><div>the retu=
rn values). It looks pretty straight forward. Often it will work, sometimes=
, though</div><div>it fails with an internal assertion in what implements p=
thread_mutex about state that&#39;s</div><div>not possible w/o the atomics/=
system calls that implement the pthread_mutex failing to</div><div>work.</d=
iv><div><br></div><div>Warner</div><div><br></div><div>P.S. Here&#39;s the =
code for reading purposes... W/o the headers it won&#39;t compile and the</=
div><div>ATF stuff at the end comes from elsewhere...</div><div><br></div><=
div>static pthread_mutex_t static_mutex =3D PTHREAD_MUTEX_INITIALIZER;<br><=
/div><div>static int global_x;</div><div>bool thread3_started =3D false;</d=
iv><div><br></div><div>static void *<br>mutex3_threadfunc(void *arg)=C2=A0{=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 long count =3D *(int *)arg;<br><br></div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread3_started =3D true;<br></div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 while (count--) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_mutex_lock(&amp;static_mutex);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 global_x++;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_mutex_unlock(&amp;=
static_mutex);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></div><div>}</div><div><=
br></div><div>int main(int argc, char **argv) {</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int count, count2;<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pth=
read_t new;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *joinval;<br></div><div><br=
></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 global_x =3D 0;<br></div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 count =3D count2 =3D 1000;<br></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pthread_mutex_lock(&amp;static_mutex);<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pthread_create(&amp;new, NULL, mutex3_threadfunc, &amp;co=
unt2);<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (!thread3_started) {=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Wait for thr=
ead 3 to start to increase chance of race */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_unlock(&amp;stati=
c_mutex);<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0while (count--) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_mutex_lock(&am=
p;static_mutex);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 global_x++;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pth=
read_mutex_unlock(&amp;static_mutex);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_join(new, &amp;joinval);<br></div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_mutex_lock(&amp;static_mutex);<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ATF_REQUIRE_EQ_MSG(count, -1, &quot;%d&quot;, c=
ount);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ATF_REQUIRE_EQ_MSG((long)joinval, -1,=
 &quot;%ld&quot;, (long)joinval);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ATF_REQUIR=
E_EQ_MSG(global_x, 1000 * 2, &quot;%d vs %d&quot;, globaol_x,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000 * 2);<br></div><div>}</div></div></div=
>
</blockquote></div></div>

--00000000000011380b05da126ef3--

