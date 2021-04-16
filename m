Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E28C361A6B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:21:22 +0200 (CEST)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXIn2-0001Ng-U8
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXIlq-0000eA-To
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:20:06 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXIlp-000237-Cw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:20:06 -0400
Received: by mail-io1-xd2a.google.com with SMTP id k25so26788931iob.6
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADiw8Cb9kGFadSJO6r6KTURpqHVJjIh40dMqKiduRdY=;
 b=CXcxxOCsbzoDs2xl4c7PgQJ6lYh615ooW9hfMZpzod9e85jx+B8piNIhbOb5KZo7vm
 sjP7eRONIwekT7Bv3yMfud4T3ymAXODgFYxmiwPT1IfOwUIEUSqMq+uc+iW+21KW9jtF
 wljMDMjAujrfOefGXN3lG3fM9EgVUDNVsDAnd1Docr195Yht2+v+/r1Mgx4gAQxzQy+1
 pJTcc/cRh8ofcDGgVSnV/O5x/sXQ3NSLKRmKZkXAU2TFcyslvDv5fGCK8J05CHMYJCLd
 sdmso8VR8/RSU6scuKeNq+jHZ359XpJs/8IJr/X1b8dKKs7jRIOuHoCPov9a9JOI8bXs
 svvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADiw8Cb9kGFadSJO6r6KTURpqHVJjIh40dMqKiduRdY=;
 b=O0W/oLuyAEo0O0Orv9GtuJqcFnbnMT4MJhw1wpLaR/Yu1YpbaKrAYdB+RJp6LgmPP7
 eU/vMaw+jpC27sk8oa7+rnfgdyG/Jd3Taw+yLktJoKsyaU3WsQXvcRPwANzPhZ3ar2eG
 KQfsgnH98ahrgSqVXdlcPEwKEKd1n0X7JXHyyVRWeFYUt5eZYwrDHaX6ZWeDVGpqny/t
 uXq8oEUGsdhIicEy7ZdFLONqCUF3oNwJR0tHJt083hFROxrhv/BIXZChpbHxnRvztdCG
 nAaTivgBKhpsG926jZmAYqF4Dl42pPigzOnHrxREmlZV8I/O3BfXh0Epe48RiLvb+5mG
 S1dQ==
X-Gm-Message-State: AOAM530zKYAtPj9YL53+E53qUa92XetYU31d23w/RdLTxc/W996pZXZP
 emRoIGt/Sj5HbrbNq8NRgcA7gxGrRw7YDaHct0Q4oQsdMzM=
X-Google-Smtp-Source: ABdhPJwB+mI8n/p/WeawAG2KG37Av6JV+wtCMNgpAn+JApp9TfPUuQCC26eEb26chzkpaKFZCWmlqd7j6HMYdSYEYm0=
X-Received: by 2002:a05:6638:258e:: with SMTP id
 s14mr2900028jat.28.1618557603841; 
 Fri, 16 Apr 2021 00:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210415151849.26740-1-ma.mandourr@gmail.com>
 <CAD-LL6h1Q5QuccmPoR9jTesM8axLFRN2Hy+Hm85fcXYRPR0KTw@mail.gmail.com>
In-Reply-To: <CAD-LL6h1Q5QuccmPoR9jTesM8axLFRN2Hy+Hm85fcXYRPR0KTw@mail.gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Fri, 16 Apr 2021 09:19:53 +0200
Message-ID: <CAD-LL6jDxVBx_Cj9=FydPrOWfXs3aJCNnkKuvWMQLfc+1=8LuA@mail.gmail.com>
Subject: Re: [PATCH] plugins/syscall: Added a table-like summary output
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000068a9f05c011cf6d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000068a9f05c011cf6d
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 16, 2021 at 8:54 AM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> On Thu, Apr 15, 2021 at 5:20 PM Mahmoud Mandour <ma.mandourr@gmail.com>
> wrote:
>
>>
>> Hello. I just realized that this hunk:
>
> static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
>>                               int64_t num, int64_t ret)
>> +{
>> +        // ......
>> +        if (!syscall_entry) {
>> +            qemu_plugin_outs(g_strdup_printf("%" PRIi64 "\n", num));
>> +        }
>>
>
> Is completely superfluous. I think I had it for debugging purposes.
> Should I resend without it or can you omit it from the patch?
>
>
Nevermind, I sent a v2 patch.

Yours,
Mahmoud

--000000000000068a9f05c011cf6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 16, 2021 at =
8:54 AM Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.man=
dourr@gmail.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Apr 15, 2021 at 5:20 PM Mahmoud Mandour &lt;<a href=3D"m=
ailto:ma.mandourr@gmail.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></b=
lockquote><div>Hello. I just realized that this hunk:=C2=A0</div><div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">static void vcp=
u_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t num, int64_t ret)<br>
+{<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // ......<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!syscall_entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(g_strdup_printf=
(&quot;%&quot; PRIi64 &quot;\n&quot;, num));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Is compl=
etely superfluous. I think I had it for debugging purposes.</div></div><div=
>Should I resend without it or can you omit it from the patch?</div><div><b=
r></div></div></div></div></div></div></div></blockquote><div>=C2=A0<br></d=
iv>Nevermind, I sent a v2 patch.<div><br></div><div>Yours,</div><div>Mahmou=
d=C2=A0</div></div></div></div>

--000000000000068a9f05c011cf6d--

