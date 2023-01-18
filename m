Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306A671C14
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:32:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7bX-0001G9-RK; Wed, 18 Jan 2023 07:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pI7bV-0001Fi-UN
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:31:45 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pI7bT-0004nd-Nb
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:31:45 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-4d19b2686a9so337328747b3.6
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XdDLDFCIaZnZ/VgSFrDRTmY9Ul1DIk2bFM4HZyH2Yv0=;
 b=ClqLCuWfkNA/4Rs9wpHoat+8nwOfgIfxQvky9JX0G+z3EUWb2vFlyVL19gl10q4W+Z
 fpemyrYGFjcdHn5H1d07WkZqcgYNX1xZbxKeHDjgjBy/5rV8HyqzSIfLX54fwP8BJ2JU
 f1eVhSjt53qgcHDowyC6COp7KKoCgBr1KoTf4rJNd5c/rKJkod98tvc6IYf/PnIKQZ5E
 HkA/Q/2OIicaT3nTBCqdeJTvFfzVnbcE8ihTQmSe9DhuIl1DbRYnHT0uEpmtyIY541ls
 8YGgBR1lx35FnGvGIeF7gxrHuhk4D9WlkLtYGKLnsTfxQSa6ujRkK/3Ljsh6Zdvx7GHH
 IIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XdDLDFCIaZnZ/VgSFrDRTmY9Ul1DIk2bFM4HZyH2Yv0=;
 b=i2P++Va2FKGImDY8Hvc0tOmjFGiTe9AZVxOmw/5tmuweqMWXvXKkb8ax53CwdM161v
 EoWh17L7YrdWhA38JoaWPmhonFgkwGbX2qzeztOhLgMIzr4WPS4ogT20dnansEn/UQJY
 itmvxAaMHdF7Cdc9M0rAacELzqI3VhTZRlbcmPrWn07OmWtfYbzGrkBm0YxGM7d+uja5
 NCJfvhlnbQWc/D9QDr+t7AoRFyM/uKNa/GnJzHCpQjnEj4pX20AvwbNNXIs8jpSLxc7D
 zpOEgA/vE2vwYNu0uq4g7x6G2buAaTXMxJ78G2COJMGuwMkal7cGCZ46Yccs9WJUH6Z7
 MhpQ==
X-Gm-Message-State: AFqh2kr7Km+oqzGZdhVSJZcZgsl4OAVMX3bt6LKVQtmqXKTOdeJrA4X2
 8LTt+EW9PoIAKBgd7KbPB3nfQx4pG1pUuvYuoiI=
X-Google-Smtp-Source: AMrXdXvjmrALaggimNMfRZ5eBlrkKA3DP54Anr0n0yhAUjeOa00E/Kn6Oj7ka4+CP7jtnEzc22lY9l4PYuf7VzKV3Nc=
X-Received: by 2002:a81:d346:0:b0:4dd:d43e:3c8c with SMTP id
 d6-20020a81d346000000b004ddd43e3c8cmr903074ywl.206.1674045101863; Wed, 18 Jan
 2023 04:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
 <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
 <Y8bYI4RgV4F5b1ht@redhat.com>
 <CAJSP0QUedwNbm1cXdU90TSgCmdiV4=Fi0THXg7u6yVhDegtQEA@mail.gmail.com>
 <Y8e4jMqs3wR0lgpn@redhat.com>
In-Reply-To: <Y8e4jMqs3wR0lgpn@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 18 Jan 2023 07:31:31 -0500
Message-ID: <CAJSP0QV2mC8G8cvzF++6Vs5e-mC0aNpcEp2hhY_=v_txE1G=CQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
To: Kevin Wolf <kwolf@redhat.com>
Cc: Warner Losh <imp@bsdimp.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a2774b05f288ff3f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000a2774b05f288ff3f
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023, 04:15 Kevin Wolf <kwolf@redhat.com> wrote:

> Am 17.01.2023 um 21:43 hat Stefan Hajnoczi geschrieben:
> > On Tue, 17 Jan 2023 at 12:17, Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:
> > > > On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > > >
> > > > > Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> > > > > > On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> > > > > > eesposit@redhat.com> wrote:
> > > > > >
> > > > > > > QEMU does not compile when enabling clang's thread safety
> analysis
> > > > > > > (TSA),
> > > > > > > because some functions create wrappers for pthread mutexes but
> do
> > > > > > > not use any TSA macro. Therefore the compiler fails.
> > > > > > >
> > > > > > > In order to make the compiler happy and avoid adding all the
> > > > > > > necessary macros to all callers (lock functions should use
> > > > > > > TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to
> allusers of
> > > > > > > pthread_mutex_lock/pthread_mutex_unlock),
> > > > > > > simply use TSA_NO_TSA to supppress such warnings.
> > > > > >
> > > > > > I'm not sure I understand this quite right. Maybe a clarifying
> question
> > > > > > will help me understand: Why is this needed for bsd-user but not
> > > > > > linux-user? How are they different here?
> > > > >
> > > > > FreeBSD's pthread headers include TSA annotations for some
> functions
> > > > > that force us to do something about them (for now: suppress the
> warnings
> > > > > in their callers) before we can enable -Wthread-safety for the
> purposes
> > > > > where we really want it. Without this, calling functions like
> > > > > pthread_mutex_lock() would cause compiler errors.
> > > > >
> > > > > glibc's headers don't contain such annotations, so the same is not
> > > > > necessary on Linux
> > > > >
> > > >
> > > > Thanks Kevin. With that explanation, these patches and their
> explanation
> > > > make perfect sense now. Often when there's a patch to bsd-user but
> not
> > > > linux-user, it's because bsd-user needs to do more in some way
> (which I try
> > > > to keep up on).
> > > >
> > > > In this case, it's because FreeBSD's libc is a bit ahead of the
> curve. So I
> > > > understand why it's needed, and what I need to do next (though I
> think that
> > > > I may have to wait for the rest of qemu to be annotated)...
> > >
> > > I assume that the bsd-user part is actually sufficiently independent
> > > that you could do proper annotations there if you want.
> > >
> > > However, be aware that TSA has some serious limitations with C, so you
> > > can't express certain things, and it isn't as strict as it could be (in
> > > particular, function pointers bypass it). As long as you have global
> > > locks (as opposed to locks in structs), it kind of works, though.
> > > Certainly better than nothing.
> >
> > What are the limitations on locks in structs (a common case)?
>
> TSA_GUARDED_BY() can't refer to a mutex in the same struct in C. You
> would have to have something like 'this', but it just doesn't exist. (I
> think in C++ you don't actually need 'this' because name resolution
> automatically starts at the struct or something - I neither know C++
> well enough nor TSA with it, so take this with a grain of salt.)
>
> You can still annotate functions for such structs in C, because then you
> have a name for the struct, like this:
>
> void lock(Foo *foo) TSA_REQUIRES(foo->mutex);
>

Thanks for the explanation!

Stefan

>

--000000000000a2774b05f288ff3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jan 18, 2023, 04:15 Kevin Wolf &lt;<a href=3D"=
mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Am 17.01.2023 um 21:43 hat Stefan Hajnoczi geschriebe=
n:<br>
&gt; On Tue, 17 Jan 2023 at 12:17, Kevin Wolf &lt;<a href=3D"mailto:kwolf@r=
edhat.com" target=3D"_blank" rel=3D"noreferrer">kwolf@redhat.com</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:<br>
&gt; &gt; &gt; On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf &lt;<a href=3D"ma=
ilto:kwolf@redhat.com" target=3D"_blank" rel=3D"noreferrer">kwolf@redhat.co=
m</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:<br>
&gt; &gt; &gt; &gt; &gt; On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe =
Esposito &lt;<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:eesposit@redhat.com" target=3D"_=
blank" rel=3D"noreferrer">eesposit@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; QEMU does not compile when enabling clang&#39=
;s thread safety analysis<br>
&gt; &gt; &gt; &gt; &gt; &gt; (TSA),<br>
&gt; &gt; &gt; &gt; &gt; &gt; because some functions create wrappers for pt=
hread mutexes but do<br>
&gt; &gt; &gt; &gt; &gt; &gt; not use any TSA macro. Therefore the compiler=
 fails.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; In order to make the compiler happy and avoid=
 adding all the<br>
&gt; &gt; &gt; &gt; &gt; &gt; necessary macros to all callers (lock functio=
ns should use<br>
&gt; &gt; &gt; &gt; &gt; &gt; TSA_ACQUIRE, while unlock TSA_RELEASE, and th=
is applies to allusers of<br>
&gt; &gt; &gt; &gt; &gt; &gt; pthread_mutex_lock/pthread_mutex_unlock),<br>
&gt; &gt; &gt; &gt; &gt; &gt; simply use TSA_NO_TSA to supppress such warni=
ngs.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m not sure I understand this quite right. Ma=
ybe a clarifying question<br>
&gt; &gt; &gt; &gt; &gt; will help me understand: Why is this needed for bs=
d-user but not<br>
&gt; &gt; &gt; &gt; &gt; linux-user? How are they different here?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; FreeBSD&#39;s pthread headers include TSA annotations f=
or some functions<br>
&gt; &gt; &gt; &gt; that force us to do something about them (for now: supp=
ress the warnings<br>
&gt; &gt; &gt; &gt; in their callers) before we can enable -Wthread-safety =
for the purposes<br>
&gt; &gt; &gt; &gt; where we really want it. Without this, calling function=
s like<br>
&gt; &gt; &gt; &gt; pthread_mutex_lock() would cause compiler errors.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; glibc&#39;s headers don&#39;t contain such annotations,=
 so the same is not<br>
&gt; &gt; &gt; &gt; necessary on Linux<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks Kevin. With that explanation, these patches and their=
 explanation<br>
&gt; &gt; &gt; make perfect sense now. Often when there&#39;s a patch to bs=
d-user but not<br>
&gt; &gt; &gt; linux-user, it&#39;s because bsd-user needs to do more in so=
me way (which I try<br>
&gt; &gt; &gt; to keep up on).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In this case, it&#39;s because FreeBSD&#39;s libc is a bit a=
head of the curve. So I<br>
&gt; &gt; &gt; understand why it&#39;s needed, and what I need to do next (=
though I think that<br>
&gt; &gt; &gt; I may have to wait for the rest of qemu to be annotated)...<=
br>
&gt; &gt;<br>
&gt; &gt; I assume that the bsd-user part is actually sufficiently independ=
ent<br>
&gt; &gt; that you could do proper annotations there if you want.<br>
&gt; &gt;<br>
&gt; &gt; However, be aware that TSA has some serious limitations with C, s=
o you<br>
&gt; &gt; can&#39;t express certain things, and it isn&#39;t as strict as i=
t could be (in<br>
&gt; &gt; particular, function pointers bypass it). As long as you have glo=
bal<br>
&gt; &gt; locks (as opposed to locks in structs), it kind of works, though.=
<br>
&gt; &gt; Certainly better than nothing.<br>
&gt; <br>
&gt; What are the limitations on locks in structs (a common case)?<br>
<br>
TSA_GUARDED_BY() can&#39;t refer to a mutex in the same struct in C. You<br=
>
would have to have something like &#39;this&#39;, but it just doesn&#39;t e=
xist. (I<br>
think in C++ you don&#39;t actually need &#39;this&#39; because name resolu=
tion<br>
automatically starts at the struct or something - I neither know C++<br>
well enough nor TSA with it, so take this with a grain of salt.)<br>
<br>
You can still annotate functions for such structs in C, because then you<br=
>
have a name for the struct, like this:<br>
<br>
void lock(Foo *foo) TSA_REQUIRES(foo-&gt;mutex);<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the explanation!=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a2774b05f288ff3f--

