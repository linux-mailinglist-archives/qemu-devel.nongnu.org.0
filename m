Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00759693568
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 01:42:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pR0Qa-0005u5-Q6; Sat, 11 Feb 2023 19:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pR0QX-0005th-QM
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:41:09 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pR0QS-0005x6-IL
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:41:09 -0500
Received: by mail-ed1-x534.google.com with SMTP id r3so8631800edq.13
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 16:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mh1SjHdiyqgYjTgJeKZOxPyq0HwyUSGrK3ztV6kGNnw=;
 b=V0qyt3WNP0W8Q2V2HQh89yW9Wb3pDYCth1zvkhrnc8eH20i4e7AGsN9jBaqUWHb8E9
 bL0BgijdxF6/3+N1pMEZC5WhcGZevxbW2QqW9KCWOmN1k5FfSx1w7pZ416pjg/vbOFNT
 OebUrqnN5xkuF9fBY0ojptlAuEzHPQPzan78EjhKpMr5HlT3F+taLeoMqeQkDVO9ZE3C
 A2REDcGJ3X/e/z7MutGtYz6vj48mcctuMfAJR9+DFm8K0hbwk+G8kG+Ak83CjfJ8BTpX
 GyLTTsd439OJE42oS9tJoNpn0XKA6Uu5yqUdB+i0ZPmZJaKK1IjfoDdGjhh5ZVxxENDV
 64FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mh1SjHdiyqgYjTgJeKZOxPyq0HwyUSGrK3ztV6kGNnw=;
 b=ka0+PTw2VP5PoIufZEI1hhE3Tpf50QenDaeDZfTmeBOB0LioA6EJgV8u5pD6VZBJ9P
 l33blk9wucrhm3mC5IPLno3D5spJvfR3XTMwOmF2VQeXjOx2Kggj/bsT5Mz0pVTEYWEn
 Cb1L3FstOEk4k8j8ZmWZFp1iauiGW6vzTb25IFf9n+jE45HjqXlMoO6zN9nOPhM1QvTX
 J9R61dmC2h86mAsW5zkWHVJ6zDQgGDByRcuX1UU+xPU7WdUJOG8nMn019lvTB1VfE2rw
 9caeoZ4LL5PIg1A7LWSE1xqOyCP54S93EROK8DUpMiLzey/OJnh48FIhfvQdpLVoVcBg
 iEvw==
X-Gm-Message-State: AO0yUKUnjgB36ZanjiivbWQF0RmySctcmYy7s4PFgf5NMEPQag0Z0HxS
 j12Jos1469KZLeDRX5pM5bGnBoZN8hDJhL+DFND0WA==
X-Google-Smtp-Source: AK7set/jsX7qXVA1c4Bv0h/A3FKqZWM4pZ+B0DwjaQAXUQYWI+XW5VjxznZOYOuqQM2R5bIKJ0oMkJzo12uABcaOSe0=
X-Received: by 2002:a50:bb08:0:b0:4ab:44de:76ef with SMTP id
 y8-20020a50bb08000000b004ab44de76efmr2160738ede.0.1676162462205; Sat, 11 Feb
 2023 16:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-7-imp@bsdimp.com>
 <b56a7205-0c22-16aa-f73b-267576b9950e@linaro.org>
 <CANCZdfp394rACvjVDdEao626pSdin1yPvYHW9sf0mNbVwoyeVg@mail.gmail.com>
 <30289ed3-7cf4-d50e-59a6-603ee15cf5e9@linaro.org>
In-Reply-To: <30289ed3-7cf4-d50e-59a6-603ee15cf5e9@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 11 Feb 2023 17:40:54 -0700
Message-ID: <CANCZdfr=fFU8w6wEPWR77qTCAXe+a+HMj-Ubnsv=04Y3+qDX+Q@mail.gmail.com>
Subject: Re: [PATCH 6/9] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>, 
 Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000255fd005f475fc3f"
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x534.google.com
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

--000000000000255fd005f475fc3f
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 4:59 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/11/23 13:40, Warner Losh wrote:
> > maxmem is defined earlier in this patch:
> >
> > +#if TARGET_ABI_BITS != HOST_LONG_BITS
> > +    const abi_ulong maxmem = -0x100c000;
> >
> > but I'm not at all sure how that number was arrived at...
> > It's a little less than ULONG_MAX is all I can say for
> > sure.
> >
> > As to why it's a special case only sometimes, I believe that it's there
> for 32-bit
> > targets running on 64-bit hosts so that we return a sane amount of
> memory because
> > 64-bit hosts can have > 4GB of ram... I'm not 100% sure of this, and it
> would
> > likely be wrong for 32-bit host and 64-bit target, but that case isn't
> supported at
> > all by the bsd-user project (though in the past it may have been, we no
> longer
> > built even 32 on 32 target/host emulation).
>
> Perhaps you're looking for reserved_va?  I.e. the max va the guest is
> limited to?
>
> Or, given this is a system-wide number of pages, not per-process, and
> given the types
> involved, cap at UINT32_MAX?
>

I think that I'll use UINT32_MAX - <magic number> + 1 here. I'll explain
that <magic number>
was empirically determined. I'm looking at all repos to see if there's a
better explanation there.


> >     I would expect a 64-bit guest to rescale the result for
> TARGET_PAGE_SIZE != getpagesize().
> >
> >
> > I would too. I suspect that the reason this is here like this is that an
> attempt
> > was being made to handle it, but since TARGET_PAGE_SIZE == getpagesize()
> on
> > all hosts / target pairs until very recently (with the 16k arm64
> kernels), this was
> > a latent bug in the code and I should fix it before my next submission.
> And aarch64
> > hosts for this are quite rare (most people use bsd-user on amd64 hosts
> to build for
> > all the other architectures).
>
> Ok.  When you do this, remember muldiv64.
>

I was going to do something like:

+    if (host_page_size != TARGET_PAGE_SIZE) {
+        if (host_page_size > TARGET_PAGE_SIZE) {
+            /* Scale up */
+            pages *= host_page_size / TARGET_PAGE_SIZE;
+        } else {
+            /* Scale down with truncation */
+            pages /= TARGET_PAGE_SIZE / host_page_size;
+        }
+    }

in a helper function. Does multdiv64 replace that? It's currently unused in
both linux-user
and bsd-user. The above does things in a known-good order (or at least
that's my belief,
even after 30 years C surprises me).

Warner

--000000000000255fd005f475fc3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 4:59 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/11/23 13:40, Warner Losh wrote:<br>
&gt; maxmem is defined earlier in this patch:<br>
&gt; <br>
&gt; +#if TARGET_ABI_BITS !=3D HOST_LONG_BITS<br>
&gt; +=C2=A0 =C2=A0 const abi_ulong maxmem =3D -0x100c000;<br>
&gt; <br>
&gt; but I&#39;m not at all sure how that number was arrived at...<br>
&gt; It&#39;s a little less than ULONG_MAX is all I can say for<br>
&gt; sure.<br>
&gt; <br>
&gt; As to why it&#39;s a special case only sometimes, I believe that it&#3=
9;s there for 32-bit<br>
&gt; targets running on 64-bit hosts so that we return a sane amount of mem=
ory because<br>
&gt; 64-bit hosts can have &gt; 4GB of ram... I&#39;m not 100% sure of this=
, and it would<br>
&gt; likely be wrong for 32-bit host and 64-bit target, but that case isn&#=
39;t supported at<br>
&gt; all by the bsd-user project (though in the past it may have been, we n=
o longer<br>
&gt; built even 32 on 32 target/host emulation).<br>
<br>
Perhaps you&#39;re looking for reserved_va?=C2=A0 I.e. the max va the guest=
 is limited to?<br>
<br>
Or, given this is a system-wide number of pages, not per-process, and given=
 the types <br>
involved, cap at UINT32_MAX?<br></blockquote><div><br></div><div>I think th=
at I&#39;ll use UINT32_MAX - &lt;magic number&gt; + 1 here. I&#39;ll explai=
n that &lt;magic number&gt;</div><div>was empirically determined. I&#39;m l=
ooking at all repos to see if there&#39;s a better explanation there.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0I would expect a 64-bit guest to rescale the result=
 for TARGET_PAGE_SIZE !=3D getpagesize().<br>
&gt; <br>
&gt; <br>
&gt; I would too. I suspect that the reason this is here like this is that =
an attempt<br>
&gt; was being made to handle it, but since TARGET_PAGE_SIZE =3D=3D getpage=
size() on<br>
&gt; all hosts / target pairs until very recently (with the 16k arm64 kerne=
ls), this was<br>
&gt; a latent bug in the code and I should fix it before my next submission=
. And aarch64<br>
&gt; hosts for this are quite rare (most people use bsd-user on amd64 hosts=
 to build for<br>
&gt; all the other architectures).<br>
<br>
Ok.=C2=A0 When you do this, remember muldiv64.<br></blockquote><div><br></d=
iv><div>I was going to do something like:</div><div><br></div><div>+ =C2=A0=
 =C2=A0if (host_page_size !=3D TARGET_PAGE_SIZE) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (host_page_size &gt; TARGET_PAGE_SIZE) {<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Scale up */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pages *=3D host_page_size / TARGET_PAGE_SIZE;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Scale down with truncation */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pages /=3D TARGET_PAGE_SIZE / host_page_size;<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>+ =C2=A0 =C2=A0}<br>=C2=A0</div><div>in a helper function. Does =
multdiv64 replace that? It&#39;s currently unused in both linux-user</div><=
div>and bsd-user. The above does things in a known-good order (or at least =
that&#39;s my belief,</div><div>even after 30 years C surprises me).</div><=
div><br></div><div>Warner<br></div></div></div>

--000000000000255fd005f475fc3f--

