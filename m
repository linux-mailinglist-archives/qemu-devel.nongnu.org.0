Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BA6BD3B0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:30:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpY0-0004aO-L4; Thu, 16 Mar 2023 11:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcpXy-0004a8-G5; Thu, 16 Mar 2023 11:29:42 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcpXw-0007Jh-Nq; Thu, 16 Mar 2023 11:29:42 -0400
Received: by mail-pf1-x42e.google.com with SMTP id u20so912641pfk.12;
 Thu, 16 Mar 2023 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678980579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CeSNddIAqkslo1JvAN/dhyFDBh7yAtPinY4cxOnZJ6w=;
 b=Kh9iOtGtd8++PG5UompPtFq/MonY2v6RgEMy6Phvbn6YNjCvluKfkL2bXZoVkvq242
 hhjq/BhgsiyOXWk4HIxpwj/Dg75rDSA8NIXCAS7/f0ymqOpB1KQ9Udgo+M+Rtno4TkTh
 PkiCdx31YHyWyy++pbPEN1ZKfIHjIbBQk2VeUlSRQtUaOEfPegwNSzL3vXTxOGSHFuAn
 KWvjJ1uxzejmv9vv6X/6MARef0V9UF98wOwHv6rIHd4sliWe/p2JveB9IFqMppDCywn4
 YW5i5veO4siIpbE4dsSgARFIV37VsanmvuuPcKeNxvVmOLe7k38TT/boqCyn11qSecgi
 xPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678980579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CeSNddIAqkslo1JvAN/dhyFDBh7yAtPinY4cxOnZJ6w=;
 b=H4RhQAeqa04B/CDpJsRWhYAXZS5rF+EsX9PIF5m0TFz9Cb+3gP5aQxJ2INeYvE2L0J
 bvxElCF9Sq6BoaCVgNPD2MhjI6hMGnKBvRf5EJjfcYUDcp+v/0fcB3s+kXzCS6qrzN52
 NbhXy7y3dFK51vTq6r4FcEO4dEoA38WkY7XFhtwQlAgmJZULiVuTTcmgFjmbVDI6PRum
 U4Sha7KmnxgATIKhmHnmyCrI9xYnHtN8Eqh1eQ4kA/4xOBiYo8D6flM2Ae1MofJSsRLw
 qYeGg4RtquDwEOkjPftH83czTrezu8necSJPfy/y2ZcHIvQ29g7taAP0uI8OcebmrZtO
 BRpw==
X-Gm-Message-State: AO0yUKXaRAG84LZghbo0IPNTMMGqV6fNH7yMv9Wq8U91Aaa2OZQy3Sgy
 r2qiIMZ8GZ+0UJwmFR/tYk6PujPdlkcgVem+lJs=
X-Google-Smtp-Source: AK7set9sc4baTz8TcYs6limkMuRRlWwfiXxiGAx7+EVJkgEcln0lkxr8ILJwCicWYVqaKzebMx1ULRC+XKyJbNcGBYg=
X-Received: by 2002:a05:6a00:1792:b0:624:a3b6:bede with SMTP id
 s18-20020a056a00179200b00624a3b6bedemr1905985pfg.6.1678980578838; Thu, 16 Mar
 2023 08:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
 <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
 <ZBMNEdz9WnUsckd7@redhat.com>
 <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
 <0e06c704-40d7-b511-8353-0218c3d45d3b@redhat.com>
 <CANCZdfo3UHiAWXgS3MBXB3XRzVtX+HOgimMXAyNwTkJQR6=PjA@mail.gmail.com>
In-Reply-To: <CANCZdfo3UHiAWXgS3MBXB3XRzVtX+HOgimMXAyNwTkJQR6=PjA@mail.gmail.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 18:29:24 +0300
Message-ID: <CA+rFky7kcL=SCetUjbxOOsNS2sZ+Xt98H9erk7vUNY9TkoYo7A@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Warner Losh <imp@bsdimp.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fc8d7b05f7062007"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=randrianasulu@gmail.com; helo=mail-pf1-x42e.google.com
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

--000000000000fc8d7b05f7062007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 18:21 Warner Losh <imp@b=
sdimp.com>:

>
>
> On Thu, Mar 16, 2023 at 7:33=E2=80=AFAM Thomas Huth <thuth@redhat.com> wr=
ote:
>
>> If you'd followed the QEMU project, you'd know that there are very
>> helpful
>> people around, from all kind of companies, Linaro guys who help with
>> reviewing and merging non-ARM patches, Red Hatters who help with BSD
>
> and Haiku patches, etc.
>>
>
> Without this help, bsd-user would be dead. As it is, it is struggling wit=
h
> its own
> resource issues, but the kind help I've received from the QEMU project ha=
s
> motivated me to keep going in upstreaming what our fork has, as well as
> working to make the code better.
>
> I'll only add that FreeBSD's efforts to improve its CI story was derailed
> for two
> years by people like this, so it makes me happy to see lines being drawn
> in this thread.
>

Yeah, this. Just it seems we are ended up on different sides of said line.
But this is ok.


They aren't unreasonable, and look to me to be in the best
> interest of the QEMU project. You can't make everybody happy all the time=
.
> And while it's good to try sometimes, other times it bogs down real
> efforts to
> make things better. This is one of those times.
>
> Warner
>

--000000000000fc8d7b05f7062007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 18:=
21 Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Mar 16, 2023 at 7:33=E2=80=AFAM Thomas Huth &lt;<a href=3D"mai=
lto:thuth@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.com=
</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If you&#39;d followed the QEMU project, you&#39;d know that there are very =
helpful <br>
people around, from all kind of companies, Linaro guys who help with <br>
reviewing and merging non-ARM patches, Red Hatters who help with BSD=C2=A0<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> and Haiku pa=
tches, etc.<br></blockquote><div><br></div><div>Without this help, bsd-user=
 would be dead. As it is, it is struggling with its own</div><div>resource =
issues, but the kind help I&#39;ve received from the QEMU project has</div>=
<div>motivated me to keep going in upstreaming what our fork has, as well a=
s</div><div>working to make the code better.</div><div><br></div><div>I&#39=
;ll only add that FreeBSD&#39;s efforts to improve its CI story was deraile=
d for two</div><div>years by people like this, so it makes me happy to see =
lines being drawn</div><div>in this thread. </div></div></div></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah, this. Just =
it seems we are ended up on different sides of said line. But this is ok.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_quote"><div>They aren&#39;t unreasonable, and look t=
o me to be in the best</div><div>interest of the QEMU project. You can&#39;=
t make everybody happy all the time.</div><div>And while it&#39;s good to t=
ry sometimes, other times it bogs down real efforts to</div><div>make thing=
s better. This is one of those times.</div><div><br></div><div>Warner=C2=A0=
<br></div></div></div>
</blockquote></div></div></div>

--000000000000fc8d7b05f7062007--

