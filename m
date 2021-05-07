Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8040376849
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:50:07 +0200 (CEST)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2ju-0002fl-Uy
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lf2hW-0002EP-Pk
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:47:39 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lf2hU-0007Cl-8j
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:47:38 -0400
Received: by mail-ua1-x936.google.com with SMTP id 33so2958484uaa.7
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV6BvWI8Ieo5HF2jakrZnuhCWW5Ar9UjzS9PZh1RWKk=;
 b=kk74+FYm7SmhInKPHdvFxn4NclEUypjuGy9UYqhXR8oCz9HC7xXZr1NXttWirwUo/0
 U+nvjJMrGkPW1IbwZTYNs4Su6peC5jkUmqsEWJ+0WvHiQXTx/v906QNXj6/Fr81ElwrX
 AVZ2CztvvXcCkRvz5mQKvqOAT7UXkSowXEghKb/Ww02r9CMFBb0oQbE/3jyky2HicpXi
 CBcQaKdKcXHslB8hYJ4AxBtoXGWHOeS43oUvvSDvNDo7TnURXbb/ztHnIphLq3z5Hky4
 6hXiSPO9faGaUJSa+hFFiPLKen2flrzufwiDXBgP6vDGmWLJpJnkVX8KyhzxrYOXNj49
 0Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV6BvWI8Ieo5HF2jakrZnuhCWW5Ar9UjzS9PZh1RWKk=;
 b=nSWitWAaiK7JSkK5PRPBtDyoZ5nrrAkz6qUaVem6fW+V0DlMVqpG3hHe9ZcgEyZb8m
 Xpuau6p4RjD9ZsSlfXvhPOcTq5bTf+2lNBnz6OFQlyl5QWr59acKL25JwIoRW0IIYMsn
 yofqWZvWJPwGMUj+0SOG2Eznx2iAzdaxDVtasoTmyfzjyav9hrJE6sCEHDmmuxW5xoy2
 CHR9i08R81VqlMsxvuE7qGiJ8npke5yYLlKoM827bL4SDTmAkn4+8BV8PU+uPq9KLKbL
 LuQ2vM3+wUreiMg9Ep+iXi9lPTu/u9NhNdGNJ3MUS114WgxT0pOhe7DjhQOB5eWmXfpA
 eJBg==
X-Gm-Message-State: AOAM5316FkH1oVDWHRV56HSxZPKHosnd2lC9goruWKmys8GnDU80nKA7
 /gBQdRUEI9OFv2pPyVh/hLcWwp7NKxVhk5FDLDtwlw==
X-Google-Smtp-Source: ABdhPJybGJJGksdCm7XYtXivn0t97nxqnYin6sNY6+F91aUK35s5QgFEpjXuGSPOZue1rVy3GGUChHo/U+ZuxIq13yA=
X-Received: by 2002:ab0:596f:: with SMTP id o44mr9751766uad.8.1620402454101;
 Fri, 07 May 2021 08:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-2-dje@google.com>
 <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Fri, 7 May 2021 08:46:57 -0700
Message-ID: <CADPb22Ta2YXj51_2xTV2JD=Nv1z3KF9qCftRbtQ5xF1aUpayZg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ac2e7d05c1bf587f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=dje@google.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac2e7d05c1bf587f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau <marcandre.lureau@gma=
il.com>
wrote:

> Hi
>
> [...]
>>
>>
>> Changes from v5:
>>
>> 1/4 slirp: Advance libslirp submodule to current master
>> NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>> maintainer takes on advancing QEMU's libslirp to libslirp's master.
>> Beyond that, I really don't know what to do except submit this patch as
>> is currently provided.
>>
>>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> It can do, but it should rather be a diff of the commits that are new,
> those that were not in the stable branch.
>


Can you elaborate?
E.g., Should a new libslirp release be made first, and then update
qemu-master to that new release?

--000000000000ac2e7d05c1bf587f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau &lt;<a =
href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com</a>&g=
t; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><b=
r><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><span class=3D"gmail_default" style=3D"font-size:small">[...]</span><br=
><br>
<br>
Changes from v5:<br>
<br>
1/4 slirp: Advance libslirp submodule to current master<br>
NOTE TO REVIEWERS: It may be a better use of everyone&#39;s time if a<br>
maintainer takes on advancing QEMU&#39;s libslirp to libslirp&#39;s master.=
<br>
Beyond that, I really don&#39;t know what to do except submit this patch as=
<br>
is currently provided.<br>
<br></blockquote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lure=
au &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">mar=
candre.lureau@redhat.com</a>&gt;<br></div></div><br></div><div class=3D"gma=
il_quote">It can do, but it should rather be a diff of the commits that are=
 new, those that were not in the stable branch.</div></div></blockquote><di=
v><br></div><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Can you elaborate?</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">E.g., Should a new libslirp=C2=A0release be made first, and then=
 update qemu-master to that new release?</div></div></div>

--000000000000ac2e7d05c1bf587f--

