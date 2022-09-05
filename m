Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BC5AD18D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:28:12 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAGx-0005fI-Nu
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVA8m-0006jw-HA
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:19:47 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVA8k-0007fU-Ly
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:19:44 -0400
Received: by mail-lj1-x236.google.com with SMTP id b26so8859790ljk.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=05EgdphVnDH8gFqa9XwPi0/tE8U/gDj+tBeR7Nk5XR0=;
 b=iPe0fwq2Oxfsh4c6W7meP0kB7PT26uxepcpTM3mCCd9ukkNObEAK0w4Ue59O+vdATo
 LVb/ow1WcP6VF2UJ5r+Qq66rBY5Cml15wv/o0ACZWPluZhgGUpKoKaGQSgWix+7D1bLJ
 Cf0ik3UmOARGonUkzuCJJfiH2i/IzrtehVXiEIAU45SJkNYoU1L421JcnO44k9rUMTlw
 ueQRIfagyYtAwIgqd+J7H16wkF5lBwMYlsLToZUTIt9C9q4yGC/RDo2yocRVuSmu6x+b
 4VPFOFLtp2qEU6VeWUXBe+xa05UWUNhIIarPhTTGGdCIZ20VIaNxuhSr7wHDXsymAY7A
 fMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=05EgdphVnDH8gFqa9XwPi0/tE8U/gDj+tBeR7Nk5XR0=;
 b=iJIMOYVvxwHABTlHjFuo3wMS/A1AdH1kUlF1oN1O3u9Jd/Ospe54mXQCtq4fLSaDz0
 CMBWYMCjuX/7t4HxtKbvQ5IF4XiSAWbLPzWa8cMPh4PJiSM5yvx3Dvt1vWD+oFoh/RKl
 +BmmK873oZvVWCz/noKsudUxi0qoUvAQDRrnpDEZ58f17OCUbtBzf2FxgJHB7Mh16x4/
 Fo1xO94mYVcubOCQOS3RpSCZCkkNNEQwBpkzcj7sbYUwVSH1kFJzFIbT/uyBYR6RG/Nm
 6Lh3eRvmc/EP2HYWf6alfv5qOlbzH/JjEnD8ftCy2wNGJvC9X4e+NDbhr/s4SZySeRJv
 LfOQ==
X-Gm-Message-State: ACgBeo099C2WmypMKYf/It/kKiwjbmLdhxVjKJ6grMfYvWLMA6MprC6I
 CKz9QupgxITFOY+xp0O0TZWJyQN9p/42aJJ8prs=
X-Google-Smtp-Source: AA6agR586928UTOIp+ie/2clzAkDudkwFOjCfyM34V/yUe4ScD2rGv8Yf/HMy1NuDcDdn8z+E0cnAY46JOIbjJ2Hru4=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr13688376ljh.267.1662376780638; Mon, 05
 Sep 2022 04:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661240709.git.tugy@chinatelecom.cn>
In-Reply-To: <cover.1661240709.git.tugy@chinatelecom.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 15:19:29 +0400
Message-ID: <CAJ+F1CL7G+RGGH1Qt6TwX0fHRjNxtyfg27HyuZJnGh49KdXaGg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] introduce qemu_socketpiar()
To: tugy@chinatelecom.cn
Cc: peter.maydell@linaro.org, f4bug@amsat.org, qemu_oss@crudebyte.com, 
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com, 
 kraxel@redhat.com, qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007e324f05e7ec41d6"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007e324f05e7ec41d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 23, 2022 at 12:00 PM <tugy@chinatelecom.cn> wrote:

> From: Guoyi Tu <tugy@chinatelecom.cn>
>
> Introduce qemu_socketpair() to create socket pair fd, and
> set the close-on-exec flag at default as with the other type
> of socket does.
>
> besides, the live update feature is developing, so it's necessary
> to do that.
>
> Guoyi Tu (2):
>   oslib-posix: Introduce qemu_socketpair()
>   vhost-user: Call qemu_socketpair() instead of socketpair()
>

Looks like a good idea to me. We will eventually extend the support for
win32 (as discussed in "[PATCH 19/51] tests/qtest: Build
test-filter-{mirror, redirector} cases for posix only").

There are other places where you can replace existing socketpair() calls in
the code base. Why not do it?

Current patches lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007e324f05e7ec41d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022 at 12:00 PM &l=
t;<a href=3D"mailto:tugy@chinatelecom.cn" target=3D"_blank">tugy@chinatelec=
om.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: Guoyi Tu &lt;<a href=3D"mailto:tugy@chinatelecom.cn" target=3D"_=
blank">tugy@chinatelecom.cn</a>&gt;<br>
<br>
Introduce qemu_socketpair() to create socket pair fd, and<br>
set the close-on-exec flag at default as with the other type<br>
of socket does.<br>
<br>
besides, the live update feature is developing, so it&#39;s necessary<br>
to do that.<br>
<br>
Guoyi Tu (2):<br>
=C2=A0 oslib-posix: Introduce qemu_socketpair()<br>
=C2=A0 vhost-user: Call qemu_socketpair() instead of socketpair()<br></bloc=
kquote><div><br></div><div>Looks like a good idea to me. We will eventually=
 extend the support for win32 (as discussed in &quot;[PATCH 19/51] tests/qt=
est: Build test-filter-{mirror, redirector} cases for posix only&quot;).</d=
iv></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Th=
ere are other places where you can replace existing socketpair() calls in t=
he code base. Why not do it?</div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">Current patches lgtm</div><div class=3D"gmail_quote"=
>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div class=3D"gmail_q=
uote"><br></div><div class=3D"gmail_quote">-- <br></div><div dir=3D"ltr">Ma=
rc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007e324f05e7ec41d6--

