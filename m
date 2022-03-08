Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9F4D1D31
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:31:11 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRcju-0002Go-Iv
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nRci5-00018E-K0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:29:19 -0500
Received: from [2607:f8b0:4864:20::e32] (port=46077
 helo=mail-vs1-xe32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nRci3-0000Et-0t
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:29:16 -0500
Received: by mail-vs1-xe32.google.com with SMTP id d64so15556573vsd.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1gFQZaxAPfl1/6Ja/NBXJphgqXfhF1WayGKiuc52I2k=;
 b=sleEEZ8UJ4p93PUU8wMOUi7/TnS3EuVIMIr3+oNEjzCnU4DNAHNrP4x40Dt1N087wW
 NGgKfNeDrRdXuFH0Yn0/EbMaGrT/IaBDbGAtukxvD8cZYe4BGVoTaKEiMxzmEhLi3hsk
 sfVI+RVssipyGbNVTWAOELwg4+zIVKqdjlbbJd0OiLSKcqEq4xRK+8oxARqXxA82NoFe
 91x1eQWdELLb5DRznc75apFR1Jj+QWf8p+NK2E+vnlWi4Fuxt25a9ZbDas/eSVllwlRs
 rDToVpQYdaK1GeGbHRuFIZasgtnqCghZSXSZ34nTqSqK0pxEZ1KXCKQj6Ildxprd5zDp
 n0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1gFQZaxAPfl1/6Ja/NBXJphgqXfhF1WayGKiuc52I2k=;
 b=RXI6QDHW/GXY69I2DUYLkksSfISWw88CVGI3VOvC7Cf1DOFoNzQYpjJOt7V9MmfqwL
 bMxBgLsUEL65rHkWEeiK9OBrys0LDZc2tmXS0aB3iyjMs0o9MSWuDi3nCLMk25Jo/yem
 PmhbUgYzEAoKl17S3Kqf8YZOHszsTr7NvHqc7N8jE+DmL2ClvlbxzUV2WM5g2W0IAB4Y
 YSzp/NkgFALjXL5Uyy3daofACAhKAokTBdj+G45gQiEstu0mSaAI5n57UOb+c/6GdtMu
 rB3tjOAocGa2hYA5j4vx4Giyg7gFrQlvIvmVfmVFJ+Qk3htj8Fv5h8BW4Qj7cg45gKa9
 fBpw==
X-Gm-Message-State: AOAM533UsEiX679wlijG8ZULpuOrJyrklBBV8S8IBpbj5hiDSHy88Wap
 4nOEl6mIk27jSOGl1BuwL9jfeT8VTZM5dQQ8J34hFg==
X-Google-Smtp-Source: ABdhPJzp+4K6k1q69RLfS+c8ChyFqXJ1eqSS3Y7Ujd7icA/OAYLoDqQxh/N/HIQ/lV+Hz/UzHlhXYXFrp8MUeH07dg0=
X-Received: by 2002:a05:6102:2139:b0:320:cf2a:4f3c with SMTP id
 f25-20020a056102213900b00320cf2a4f3cmr3957335vsg.13.1646756953654; Tue, 08
 Mar 2022 08:29:13 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
In-Reply-To: <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 8 Mar 2022 09:29:02 -0700
Message-ID: <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
Subject: Re: Question about atomics
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041162705d9b77bf1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::e32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe32.google.com
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

--00000000000041162705d9b77bf1
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 7:26 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 3/8/22 15:09, Warner Losh wrote:
> >
> >     Yes, qatomic_foo is expected to work.  It's what we use across
> >     threads, and it is expected to work "in kernel mode", i.e. within
> cpu_loop().
> >
> > Even when the writers are done in the context of system calls to the
> kernel?
>
> Yes.
>
> That said, for the similar syscall in Linux we just forward it to the
> kernel (and the kernel obviously can only do an atomic---no
> start_exclusive/end_exclusive involved).
>

OK. It seemed similar to futex, but I didn't know if that worked because
it restricted itself, or because all atomics worked when used from the
kernel :)


> > And if the system call does this w/o using
> > the start_exclusive/end_exclusive stuff, is that a problem?
>
> If it does it without start_exclusive/end_exclusive they must use
> qatomic_foo().


So this answer is in the context *-user implementing a system call
that's executed as a callout from cpu_loop()? Or does the kernel
have to use the C11 atomics that qatomic_foo() is based on... I'm
thinking the former based on the above, but want to make sure.


> If it does it with start_exclusive/end_exclusive, they
> can even write a compare-and-exchange as
>
>      old = *(uint64_t *)g2h(cs, addr);
>      if (old == oldval)
>          *(uint64_t *)g2h(cs, addr) = new;
>

 Nice.

The test program that's seeing corrupted mutex state is just two threads.
I've simplified
it a bit (it's an ATF test, and there's a lot of boilerplate that I
removed, including validating
the return values). It looks pretty straight forward. Often it will work,
sometimes, though
it fails with an internal assertion in what implements pthread_mutex about
state that's
not possible w/o the atomics/system calls that implement the pthread_mutex
failing to
work.

Warner

P.S. Here's the code for reading purposes... W/o the headers it won't
compile and the
ATF stuff at the end comes from elsewhere...

static pthread_mutex_t static_mutex = PTHREAD_MUTEX_INITIALIZER;
static int global_x;
bool thread3_started = false;

static void *
mutex3_threadfunc(void *arg) {
        long count = *(int *)arg;

        thread3_started = true;
        while (count--) {
                pthread_mutex_lock(&static_mutex);
                global_x++;
                pthread_mutex_unlock(&static_mutex);
        }
}

int main(int argc, char **argv) {
        int count, count2;
        pthread_t new;
        void *joinval;

        global_x = 0;
        count = count2 = 1000;
        pthread_mutex_lock(&static_mutex);
        pthread_create(&new, NULL, mutex3_threadfunc, &count2);
        while (!thread3_started) {
                /* Wait for thread 3 to start to increase chance of race */
        }
       pthread_mutex_unlock(&static_mutex);
       while (count--) {
                pthread_mutex_lock(&static_mutex);
                global_x++;
                pthread_mutex_unlock(&static_mutex);
        }

        pthread_join(new, &joinval);
        pthread_mutex_lock(&static_mutex);
        ATF_REQUIRE_EQ_MSG(count, -1, "%d", count);
        ATF_REQUIRE_EQ_MSG((long)joinval, -1, "%ld", (long)joinval);
        ATF_REQUIRE_EQ_MSG(global_x, 1000 * 2, "%d vs %d", globaol_x,
            1000 * 2);
}

--00000000000041162705d9b77bf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 7:26 AM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/=
8/22 15:09, Warner Losh wrote:<br>
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
 from the</div><div>kernel :)</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
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

--00000000000041162705d9b77bf1--

