Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31B6BD35D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpQI-0000w0-1i; Thu, 16 Mar 2023 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pcpQE-0000v3-QQ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:21:42 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pcpQC-0005LV-Up
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:21:42 -0400
Received: by mail-ed1-x52a.google.com with SMTP id ek18so9097227edb.6
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1678980097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bbuD5VXV2CdnEJZBCujs32rLvwOfAwviQYlxquNi6do=;
 b=6Ho0G2ERoRoG9i/gvP600NcuijjPXL0smXgK+rTQhvuHD5uEI4xipa4Vh7+ki9h6zc
 8jQmuyOmHxddie26gG6KFrKOeJcoD9etlBVV1IX1HEXXLMjefVEeG+sLGjLqxDmpCsRy
 vrSi/cPw+MTPLjPl1ZgtYhsQb0RLJczsPgJmpq9jkbdIHam1N0apiapPO0Rao66XREle
 MKW2XxxieMXVyyw4tK0nQ5jp5d0QTjrMpazgma1sS1dkeE4+46H/PgIWDneFe72nAfmD
 /7Xr/2EFz09PUezCfDKd/9JBqPlplQW1oC3nrtauKtLgtd5NdiD1vuG/JnjwjBS36pDk
 BHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678980097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbuD5VXV2CdnEJZBCujs32rLvwOfAwviQYlxquNi6do=;
 b=4c8eTi4mErmtzgVqnPfj7pv5dKQqLS0ml0S59Xk5ER+cAaA2kbvPZHfWwVyo5Gaore
 l82PJTqDfLpQS27TYsKjiEfokIwqql9J3UHz0dIeUWFqRCWRSpuK75yYglnzuMppx0Hx
 HLD/lkEVHdhezwmNqaI+y7/pFlluz+waG6g7+Fa4CW7ZK+dtSDU48YVQiD8viUM/t65i
 ddQ5djRZgZj189KAAt2nXEQWnCb5T2G56qJTwaUdeOpHzEuKBBwFzXAdvdCLss9aQDpW
 ZM5UskqDwwLyMTr/nDFCX0wB9HSNsBjFhP45yqMUIw2PRf440cxrqqYWz2AxuscKSJjj
 gx6g==
X-Gm-Message-State: AO0yUKXn79XM7A0rp7FqWADZyCdg+V7EqJh6qmzvQWExLJrpRu9neTu1
 4SAnImj7Xju32rtQxekvxaCt8Z7x3jZxbC/2MroXoQ==
X-Google-Smtp-Source: AK7set9KvW6V6f62Yt2sTvAl89oDRyk2Td1o3DIluHvu5OLoaOsFq5/KKDq0qmnz8GXICZE4r3Ug35aBeHkObuJwmsA=
X-Received: by 2002:a17:906:55d4:b0:930:af80:5ba8 with SMTP id
 z20-20020a17090655d400b00930af805ba8mr1019105ejp.2.1678980096858; Thu, 16 Mar
 2023 08:21:36 -0700 (PDT)
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
In-Reply-To: <0e06c704-40d7-b511-8353-0218c3d45d3b@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 16 Mar 2023 09:21:25 -0600
Message-ID: <CANCZdfo3UHiAWXgS3MBXB3XRzVtX+HOgimMXAyNwTkJQR6=PjA@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Thomas Huth <thuth@redhat.com>
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000422c2d05f70604cf"
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

--000000000000422c2d05f70604cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 7:33=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:

> If you'd followed the QEMU project, you'd know that there are very helpfu=
l
> people around, from all kind of companies, Linaro guys who help with
> reviewing and merging non-ARM patches, Red Hatters who help with BSD

and Haiku patches, etc.
>

Without this help, bsd-user would be dead. As it is, it is struggling with
its own
resource issues, but the kind help I've received from the QEMU project has
motivated me to keep going in upstreaming what our fork has, as well as
working to make the code better.

I'll only add that FreeBSD's efforts to improve its CI story was derailed
for two
years by people like this, so it makes me happy to see lines being drawn
in this thread. They aren't unreasonable, and look to me to be in the best
interest of the QEMU project. You can't make everybody happy all the time.
And while it's good to try sometimes, other times it bogs down real efforts
to
make things better. This is one of those times.

Warner

--000000000000422c2d05f70604cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 16, 2023 at 7:33=E2=80=AF=
AM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>=
&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
lines being drawn</div><div>in this thread. They aren&#39;t unreasonable, a=
nd look to me to be in the best</div><div>interest of the QEMU project. You=
 can&#39;t make everybody happy all the time.</div><div>And while it&#39;s =
good to try sometimes, other times it bogs down real efforts to</div><div>m=
ake things better. This is one of those times.</div><div><br></div><div>War=
ner=C2=A0<br></div></div></div>

--000000000000422c2d05f70604cf--

