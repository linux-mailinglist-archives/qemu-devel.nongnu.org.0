Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599D5971C5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:52:28 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKPD-0006LN-A5
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oOKMI-0004l1-5x
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:49:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oOKMG-00046O-Ad
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:49:25 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gb36so24904461ejc.10
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SBeJNsw2PRaI7Ab/K7fxtlb8nOOPTjHCFdopDPzDEpw=;
 b=abTJcesX8+wdWR+ljD/VK8Qq+40G5T1dkkIQFlmBe70zR0sLFGe++CH7Xg5oC5mMb0
 b5ZMZhgTZXlIBBxu6SJRBrP2+XsP26iPkospI74ra7Bs5B5MR9jVyGUNaqNkUQXWlfN2
 hhqkzYcNPhoLmey9oq/zTIUpJS4U7tWADh0zkqVcj1L4TNGJ4Vjkj/yJzFMSPeADcUu2
 kjKIcJVNxaZBjoqpUxcKzOERjvCa9aax+YfdZ1TMITPWd69VCy19gjiYef8+43b0b1mU
 1amzGUvJ9wMVrqfetPqqEMM9uEQ4P7nM15Rz605+oeJcsFBXTY8cuD4uTK6ndQTpqDGa
 ZAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SBeJNsw2PRaI7Ab/K7fxtlb8nOOPTjHCFdopDPzDEpw=;
 b=PGvwd86UVRIT0jcoY0oSdlDA4BRezwi9kgPNZeX9LoMmbMYtB8LLKEYLfFrsKLkcBC
 Bt+J+vcBbVqbz4v7xqqqwYJFdVA/91rZcNOOdJxqFyKL2Ke1lj5qO6KYYiFqspvTrt1A
 omX8A9PQ059XgZg+1v28zPqyytc5fFxwYcjJ6ghzFLDTUuZyySTb1bT1jbsic/i1kzZ9
 kpfdvfgQV+6H8I2UpaLQlXh8ONzJG/PGjEf8gLSKxUEFHNKVzINg9+HLHbd4y8i4zNBp
 3hpUw9LpK9Lji8vOHf9SLVjU20m8vCcEsHTDL8Q4p2P3im4s+5y/wT18o7BvOizOpcph
 esZQ==
X-Gm-Message-State: ACgBeo2IqEHziPUKxJRKC2ZpqrD7fGIkizwUM0gS6XW43RxO+kVsa/Tr
 5zlX9Dh82ohZfpmZlgdXMmRPAyCsHp1DEt10UX3buA==
X-Google-Smtp-Source: AA6agR6JsaQFK2a71CG6IHTXNkSlaePogz+Sg8rtDtaMcdMkwKogJ8WtQr7I/s328CfatxaQjWCjgftAVIrzLccS46o=
X-Received: by 2002:a17:906:cc5e:b0:730:cf6d:5451 with SMTP id
 mm30-20020a170906cc5e00b00730cf6d5451mr16950126ejb.725.1660747756553; Wed, 17
 Aug 2022 07:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org> <3206015.kY3CcG7ZbH@silver>
 <7218690.D19hzYb2mh@silver> <87mtcen7bz.fsf@pond.sub.org>
 <CAAJ4Ao9rqmMjR2CGHBUKE8VH3pC0iuAJhUXv5Vqo5koGodt=jw@mail.gmail.com>
 <CAAJ4Ao_77mWH34V6GvrCP6suW0FPTV539C2amAm4EXbMyaLK6w@mail.gmail.com>
 <CAAJ4Ao__fJraFsh4=D-+2DfEe2B8y18yd3zOBwJ5d++x2aWQGA@mail.gmail.com>
 <CAFEAcA9bCqGRZ=oYCmmnaxkNfftRDdFk4d2wfHfW-Je_apb3Ww@mail.gmail.com>
In-Reply-To: <CAFEAcA9bCqGRZ=oYCmmnaxkNfftRDdFk4d2wfHfW-Je_apb3Ww@mail.gmail.com>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 17 Aug 2022 17:49:05 +0300
Message-ID: <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000017692505e670f8ff"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000017692505e670f8ff
Content-Type: text/plain; charset="UTF-8"

Well...

What exactly is still under discussion? In my perspective, the main
pitfalls have been resolved:

0. All possible places where TFR() macro could be applied are covered.
1. Macro has been renamed in order to be more transparent. The name has
been chosen in comparison with a similar glibc macro.
2. The macro itself has been refactored, in order to replace it entirely
with glibc alternative.
3. Problems with statement/expressions differences in qemu and glibc
implementation have been resolved.

Is there any room for improvement?


On Wed, Aug 17, 2022 at 5:17 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 17 Aug 2022 at 15:06, Nikita Ivanov <nivanov@cloudlinux.com>
> wrote:
> >
> > Hi! Are there any updates? I have not received any comments since the
> last email.
>
> Looking at the thread, I don't think we (yet) have consensus on the
> right thing to do here...
>
> thanks
> -- PMM
>


-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--00000000000017692505e670f8ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well...<br><br>What exactly is still under discussion? In =
my perspective, the main pitfalls have been resolved:<br><br>0. All possibl=
e places where TFR() macro could be applied are covered.<br>1. Macro has be=
en renamed in order to be more transparent. The name has been chosen in com=
parison with a similar glibc macro.<br>2. The macro itself has been refacto=
red, in order to replace it entirely with glibc alternative.<br>3. Problems=
 with statement/expressions differences in qemu and glibc implementation ha=
ve been resolved.<br><br>Is there any room for improvement?<br><br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Aug 17, 2022 at 5:17 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 17 Aug 2022 at 15:06, Nikita Iva=
nov &lt;<a href=3D"mailto:nivanov@cloudlinux.com" target=3D"_blank">nivanov=
@cloudlinux.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi! Are there any updates? I have not received any comments since the =
last email.<br>
<br>
Looking at the thread, I don&#39;t think we (yet) have consensus on the<br>
right thing to do here...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iva=
nov</b> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><di=
v><div><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div>

--00000000000017692505e670f8ff--

