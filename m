Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4E6FBCE2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 04:10:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwCn0-00016c-Lg; Mon, 08 May 2023 22:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pwCmz-00016M-1U
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:09:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pwCmx-0007YY-5p
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:09:16 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50dba8a52dcso390a12.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683598150; x=1686190150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9FvaIq7UOkDYrO7XnNFs9bH2cY/9kAYddaGuinHiLk=;
 b=uP0NSUw2Cv7kpt3WnOUnw54sLI2jCiPJe5jCed+QNvQeBx14brzBXqLRwwL7mV8tIe
 +PrN/diPXwF7PmOu0i+2GPSnhcSbCBrHAVg8Y/k4csBBpn5xU3o9wqILunaaZILRpnjj
 oJHetn6G6WUYnsS/UcZgVIj96bVBcWhTi7JizKhI3DqYZaeiuYx6kts2RQebEenjOebi
 jPfE4GTVd6UOSq1708dESjqKDmvbSoP6jFCArPcU4XtBlvXfR9Es2/W2hLXBtjAlDjbe
 OYhwheliyoogKKH8l1Q9/OERCdBPisL9IKsTgwA2CyaIS7C0Xkk6NCsrfAzSu736nNbz
 V6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683598150; x=1686190150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9FvaIq7UOkDYrO7XnNFs9bH2cY/9kAYddaGuinHiLk=;
 b=ClacFGLl/SoF6MwgssC0IQ1Ub5CW5Rnv5PUXie+00v0ssiByCqgQFi6VgTP2/kQqbu
 Mp+C8D8hMiFPMt8ni5xUi9FIwvdt32AGludOWNSDx1vdM3XMvqhgVDcKnmN8ud+gZ+zv
 5d36gPwrVqQgRI9wqvODwjFb4X0XUHYfIn9O5fN/7MvumrkPZTrRwimHCX35wBqN/kBF
 SQo/CRnRCZpHAYR9M1xxnJ8Fwzmskm0GhQw9x/963b6O9V1l5SnA7nRmxfdLZ7JLuomt
 mx3CST252Tw82XMKMbtxGHmkLiJcPMCImaEcjNq0VWn9yWKVV/4FTw521K8OB8ORqgDV
 mGNg==
X-Gm-Message-State: AC+VfDxdqookd4dhz8Q6UjnzjbZQpfH6rOt1GIEBMOjvOnx67wdB6Jrd
 NWCJYNjzYiAKosZNju/mW+bqDq4+BfrNT5Dqs39pJxkyWbX6l6IZzZEdHQ==
X-Google-Smtp-Source: ACHHUZ72rJSfwiezmycVSph5+zEfyFYuN4Hwxtgcod31IzepYAqACPg5I893AUZLoGKwuNM5jY91SSCj3CrROp2LrE4=
X-Received: by 2002:a05:6402:5414:b0:501:d395:972c with SMTP id
 ev20-20020a056402541400b00501d395972cmr15493edb.5.1683598150371; Mon, 08 May
 2023 19:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxJzdsy6S_f64f1nXGMGU-ZSr01iRDwc1-EyT5Lj9p1Dg@mail.gmail.com>
In-Reply-To: <CAO=notxJzdsy6S_f64f1nXGMGU-ZSr01iRDwc1-EyT5Lj9p1Dg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 8 May 2023 19:08:59 -0700
Message-ID: <CAO=notw3-Hhqyr=w-zRbCn=_yNp+r5WYeMd=-3JP3j+MJvfg0w@mail.gmail.com>
Subject: Re: ssl fips self check fails with 7.2.0 on x86 TCG
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000b32b2505fb393df2"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=venture@google.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000b32b2505fb393df2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Verified it was https://gitlab.com/qemu-project/qemu/-/issues/1471

On Thu, May 4, 2023 at 12:03=E2=80=AFPM Patrick Venture <venture@google.com=
> wrote:

> Hi,
>
> I just finished rebasing my team onto 7.2.0 and now I'm seeing
> https://boringssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/s=
elf_check/self_check.c#361
> fail.
>
> I applied
> https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.html and
> it's still failing.
>
> Is anyone else seeing this issue or have suggestions on how to debug it?
>
> I haven't yet tried with 8.0.0 but that's my next step, although it also
> needs the float32_exp3 patch.
>
> Patrick
>

--000000000000b32b2505fb393df2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Verified it was=C2=A0<a href=3D"https://gitlab.com/qemu-pr=
oject/qemu/-/issues/1471">https://gitlab.com/qemu-project/qemu/-/issues/147=
1</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, May 4, 2023 at 12:03=E2=80=AFPM Patrick Venture &lt;<a href=3D=
"mailto:venture@google.com">venture@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br>=
</div><div>I just finished rebasing my team onto 7.2.0 and now I&#39;m seei=
ng=C2=A0<a href=3D"https://boringssl.googlesource.com/boringssl/+/master/cr=
ypto/fipsmodule/self_check/self_check.c#361" target=3D"_blank">https://bori=
ngssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/self_check/self=
_check.c#361</a> fail.</div><div><br></div><div>I applied=C2=A0<a href=3D"h=
ttps://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.html" target=
=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00260.=
html</a> and it&#39;s still failing.</div><div><br></div><div>Is anyone els=
e seeing this issue or have suggestions on how to debug it?</div><div><br><=
/div><div>I haven&#39;t yet tried with 8.0.0 but that&#39;s my next step, a=
lthough it also needs the float32_exp3 patch.</div><div><br></div><div>Patr=
ick</div></div>
</blockquote></div>

--000000000000b32b2505fb393df2--

