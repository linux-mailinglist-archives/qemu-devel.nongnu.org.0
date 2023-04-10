Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81C6DC9D3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 19:13:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plv4Y-0003JU-OR; Mon, 10 Apr 2023 13:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plv4S-0003Iy-Pj
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:12:50 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plv4L-0003Z8-4o
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:12:47 -0400
Received: by mail-ej1-x62f.google.com with SMTP id sh8so13920883ejc.10
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681146759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o7MxOhvSlDmfBDdtVJu0g3CZJhuNuCjqZ3/X29rv4Ms=;
 b=C7DhUKYJdw5VRkIqIHnGyEpGBWG3TnxsXzMbCr1eiX/DtjRtj74rGTIm2I9AEsQoOp
 m2ELrJmxhgQi6bV7VGuDCjH3kuUhZJ6eMmEvqeaMyE3QSfZome+nLprAe5D2HaFOQWGz
 bNv/YXrpWejlxId2BQaSBzJ46+7ovNbMaJylIrk2dlmM4APhQ0OyeO0RUsBjn8O2lHYI
 MqdocZNK6NZy+75BF+NkDS/JTL4f4OQfpgHFdIYuWhfKu7wxHxIDzQROLCctKtex6IWR
 p2/Q/OFULpwGkqU+4BLSAAVfDqLd3ZVNstEF7b5BgPZKUVppzv5zscYzDXSjcPrNxI8W
 DKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681146759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7MxOhvSlDmfBDdtVJu0g3CZJhuNuCjqZ3/X29rv4Ms=;
 b=jv1scXz2XZweUz6luWnT3DB7Jdo9eulJP5qPfE/jpdK+R9SPc0zqG+I+X7OnylQJ5T
 13zv4o4PM+Gu9x2A3YE5tF3XMhEJPHkauhK0mHR04NmvkkIcyIZP4izOz+lwZV/saTKc
 zbEqPXjQjb+gH9cD62wIKdgzxF11dpwsz5ULym2naKFqbTwFdALgXtJ9SdzoZ4Xlr4Pl
 ysTq6SvPy4B3w+QDcKZ5hpykx3XdL8038XjyBWGe2z5cCl900KO9MiIhY9UNAyz3ZUMR
 a/pSofHLWoz0vQ4B47+HPaRbswwdZHrV6Gb3gxQxZXvOeLyiy7zae9j+Wd2LtG67QK7u
 BTaA==
X-Gm-Message-State: AAQBX9d9n+pkyXPYSeeja44oNhPcyds8x9XuBtM2o0vZXgZzCjvjawZ9
 7azGJGYN2HcMoBSbmupKZZDdIs+njKzGgoZn4NfjjA==
X-Google-Smtp-Source: AKy350aZa9qCBxgwMOPJzJTGJs2P6DcwcBb19n7/E0wngUXN7ZDI1P5quEUyhR+RgWmznQPI28edVc++Xu7cOY7vkAQ=
X-Received: by 2002:a17:907:a707:b0:932:da0d:9375 with SMTP id
 vw7-20020a170907a70700b00932da0d9375mr4163898ejc.4.1681146759467; Mon, 10 Apr
 2023 10:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-8-imp@bsdimp.com>
 <b9355660-1869-971d-afe6-d4a206232645@linaro.org>
In-Reply-To: <b9355660-1869-971d-afe6-d4a206232645@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 10 Apr 2023 11:12:28 -0600
Message-ID: <CANCZdfqtx5kDmVK7C_8pBDTMu88u1BeZQaS9RyjG9_GzsuBPoA@mail.gmail.com>
Subject: Re: [PATCH 07/16] bsd-user: Move system call include to os-syscall.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, reinoud@netbsd.org, riastradh@netbsd.org, 
 ryoon@netbsd.org, jrtc27@jrtc27.com, kevans@freebsd.org, 
 Brad Smith <brad@comstyle.com>
Content-Type: multipart/alternative; boundary="00000000000069e9d205f8fe7b73"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000069e9d205f8fe7b73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 8, 2023 at 1:08=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/5/23 14:36, Warner Losh wrote:
> > @@ -98,11 +75,9 @@ struct target_iovec {
> >    * sys/timex.h
> >    */
> >
> > -typedef abi_long target_freebsd_suseconds_t;
> > -
> >   /* compare to sys/timespec.h */
> >   struct target_freebsd_timespec {
> > -    target_freebsd_time_t   tv_sec;     /* seconds */
> > +    target_time_t   tv_sec;     /* seconds */
> >       abi_long                tv_nsec;    /* and nanoseconds */
> >   #if !defined(TARGET_I386) && TARGET_ABI_BITS =3D=3D 32
> >       abi_long _pad;
> > @@ -120,8 +95,8 @@ struct target_freebsd__umtx_time {
> >   };
> >
> >   struct target_freebsd_timeval {
> > -    target_freebsd_time_t       tv_sec; /* seconds */
> > -    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
> > +    target_time_t       tv_sec; /* seconds */
> > +    target_suseconds_t  tv_usec;/* and microseconds */
>
> Did I miss where target_suseconds_t got defined?
> With the context provided, you remove target_freebsd_suseconds_t but don'=
t
> replace it.
>

At the very end of the first file bsd-user/freebsd/os-syscall.h I define it=
.

Warner

--00000000000069e9d205f8fe7b73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 8, 2023 at 1:08=E2=80=AFP=
M Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ric=
hard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 4/5/23 14:36, Warner Losh wrote:<br>
&gt; @@ -98,11 +75,9 @@ struct target_iovec {<br>
&gt;=C2=A0 =C2=A0 * sys/timex.h<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -typedef abi_long target_freebsd_suseconds_t;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0/* compare to sys/timespec.h */<br>
&gt;=C2=A0 =C2=A0struct target_freebsd_timespec {<br>
&gt; -=C2=A0 =C2=A0 target_freebsd_time_t=C2=A0 =C2=A0tv_sec;=C2=A0 =C2=A0 =
=C2=A0/* seconds */<br>
&gt; +=C2=A0 =C2=A0 target_time_t=C2=A0 =C2=A0tv_sec;=C2=A0 =C2=A0 =C2=A0/*=
 seconds */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0abi_long=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tv_nsec;=C2=A0 =C2=A0 /* and nanoseconds */<br>
&gt;=C2=A0 =C2=A0#if !defined(TARGET_I386) &amp;&amp; TARGET_ABI_BITS =3D=
=3D 32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0abi_long _pad;<br>
&gt; @@ -120,8 +95,8 @@ struct target_freebsd__umtx_time {<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct target_freebsd_timeval {<br>
&gt; -=C2=A0 =C2=A0 target_freebsd_time_t=C2=A0 =C2=A0 =C2=A0 =C2=A0tv_sec;=
 /* seconds */<br>
&gt; -=C2=A0 =C2=A0 target_freebsd_suseconds_t=C2=A0 tv_usec;/* and microse=
conds */<br>
&gt; +=C2=A0 =C2=A0 target_time_t=C2=A0 =C2=A0 =C2=A0 =C2=A0tv_sec; /* seco=
nds */<br>
&gt; +=C2=A0 =C2=A0 target_suseconds_t=C2=A0 tv_usec;/* and microseconds */=
<br>
<br>
Did I miss where target_suseconds_t got defined?<br>
With the context provided, you remove target_freebsd_suseconds_t but don&#3=
9;t replace it.<br></blockquote><div><br></div><div>At the very end of the =
first file bsd-user/freebsd/os-syscall.h I define it.</div><div><br></div><=
div>Warner=C2=A0</div></div></div>

--00000000000069e9d205f8fe7b73--

