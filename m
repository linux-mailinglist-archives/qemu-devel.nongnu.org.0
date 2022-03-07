Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE44CEF4C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:03:57 +0100 (CET)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2j5-00021w-PT
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2hz-0000ph-8v; Sun, 06 Mar 2022 21:02:47 -0500
Received: from [2607:f8b0:4864:20::c35] (port=38676
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2hx-0005qK-GI; Sun, 06 Mar 2022 21:02:46 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 o7-20020a056820040700b003205d5eae6eso15533388oou.5; 
 Sun, 06 Mar 2022 18:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bnAz3IEP07r2S60u0C104xGqLMwliUETR/r4ChlJiYo=;
 b=PPlayVu0PO4b54caK9cb3BdhFBMgaComxTrZtwHMFE1pkMqmTAqAP8byfCTrL1pdNy
 sskxVNCNthKEPtAmR7gbGs0caZo0DRQrAjwk3kIdz0TYlMDKKVMSKfuUF7GOt5hOy1ua
 WMhb29laHSaGDXOtTJCf7ItD20KwGKtbjOe6GNVx8Gf2mS3rpPPX/dwdv3pX/g51pFjl
 in3+nicbB3QVhyRTZOAJ26u8gzo0Yrr46xlKBS+zNBAt/F9mfM3i6nswwKAcPYArLdJ5
 IWGfSXz9J5Urw7m0f7d5YJGyfimsnF7/tUsNlKup32f5jBcYArld6FGR5LAxWTaQgQ4P
 NHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnAz3IEP07r2S60u0C104xGqLMwliUETR/r4ChlJiYo=;
 b=bhi16UijVoKpyFIBdltiCxKBCNLheZSDgAnUye13xBGmalS4X7XrcZoHNC2wShSdhy
 HATvJVueUQHnzII+OGSIxqQBe69xdqtsilp/ojpCiJHYKX3DM4tcs19rIDeHUSlMp//n
 jrXjnvF8ceq7POmWwWS99wQTC0eTSl12n4h0+XyyyoSAM3xYOS+sNKovs1Pb/IUQtzxv
 61ytfJFH74+X5c+tD9fW9AYhIYJpU7joy6Uwt0lnS9KKJ6e1MnEjWhYfhyL0TPtQOT/W
 CIr+6hUlouk6RIWdkNZzUfrw6Bi9boqsFOFI9sIZPlBkWmd52Wrkbw5b3g8gv0ra6kb8
 JJKA==
X-Gm-Message-State: AOAM532+w70rhe4p9fd2zsNGPI5UwuheTZDpsWdeZOoFCjFUp9YPx2tm
 CMd+UZF4IK+lzHa7WKRRlfkjgsATWvyiBS706SQ=
X-Google-Smtp-Source: ABdhPJwP6pkeBbvIPDjHet8DJeDi/n2/k6foH7hKtsQaDFHxSkJFTGtDVFNSYeKsNBQPaZLALHArqJU9mON77MzuyOI=
X-Received: by 2002:a05:6870:4346:b0:da:b3f:2b23 with SMTP id
 x6-20020a056870434600b000da0b3f2b23mr5176991oah.194.1646618563729; Sun, 06
 Mar 2022 18:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20220303032219.17631-1-dmiller423@gmail.com>
 <20220303032219.17631-2-dmiller423@gmail.com>
 <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
 <CAEgyohXjXw-aZJX0qm3dReAUkMax-SmS9oAfR90XFX_q2i1msQ@mail.gmail.com>
 <9fa82035-b273-9c44-16e4-c859a6de5b6b@linaro.org>
 <CAEgyohUZjHp0b5Ku9AvmNM48WRCaQWeji49OMXdT9euBn63rHQ@mail.gmail.com>
 <64fe466b-f374-60f6-92dd-3d6caaf892ee@redhat.com>
In-Reply-To: <64fe466b-f374-60f6-92dd-3d6caaf892ee@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Sun, 6 Mar 2022 21:02:31 -0500
Message-ID: <CAEgyohXrJmKeqcAiYykN3mesUuvekBg_gkfSWDVD21CoiU-gng@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility
 2 for s390x
To: David Hildenbrand <david@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000925bac05d9974259"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000925bac05d9974259
Content-Type: text/plain; charset="UTF-8"

> Just use a little-endian load: MO_LE | es.
> While we use MO_TE all over, it's no secret that it's always big-endian.

> And everywhere else you do load then swap, or swap then store.

This is not working as expected...
I tried it in two places, both with a swap [removed] after and the tests
failed.

I'm submitting the split patches with whitespace fixes.
I hope it's not a dealbreaker,  seeing as it matches the rest of the file
this way anyhow.
If it is,  I will spend some more time looking into it tomorrow.

Thanks,
- David Miller


On Thu, Mar 3, 2022 at 1:04 PM David Hildenbrand <david@redhat.com> wrote:

> On 03.03.22 19:01, David Miller wrote:
> >
> > Makes sense,  thanks for the quick reply.
> > Last question,  the patches can depend on others in the same set right?
> > IE:  all of the additions to insn-data.def in one, implementations in
> > separate patches.
>
> For bisectability, each patch should be self-contained and can only
> depend on earlier patches in the series.
>
> See my VX patches to get an idea of how it could look like, e.g.,
>
>
> commit e58de341d948d12cb36bbc5aa4866b7412581880
> Author: David Hildenbrand <david@redhat.com>
> Date:   Wed Apr 10 22:45:35 2019 +0200
>
>     s390x/tcg: Implement VECTOR SUM ACROSS WORD
>
>     Similar to VECTOR SUM ACROSS DOUBLEWORD.
>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>
> commit 8dc69a196eb2e3e8ab1d033b378e4f5a5efaa219
> Author: David Hildenbrand <david@redhat.com>
> Date:   Wed Apr 10 22:40:01 2019 +0200
>
>     s390x/tcg: Implement VECTOR SUM ACROSS QUADWORD
>
>     Similar to VECTOR SUM ACROSS DOUBLEWORD, however without a loop and
>     using 128-bit calculations.
>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>
> commit fe2be36d26b3d3e86246c88bb09a9613b99dc6c9
> Author: David Hildenbrand <david@redhat.com>
> Date:   Wed Apr 10 22:48:25 2019 +0200
>
>     s390x/tcg: Implement VECTOR SUM ACROSS DOUBLEWORD
>
>     Perform the calculations without a helper. Only 16 bit or 32 bit values
>     have to be added.
>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>
> commit bc725e65152c57d42f19eec134c99940114d6362
> Author: David Hildenbrand <david@redhat.com>
> Date:   Tue Apr 9 23:26:47 2019 +0200
>
>     s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW COMPUTE BORROW
> INDICATION
>
>     Mostly courtesy of Richard H.
>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>
> commit 48390a7c2716a128155b872d5316cda5f55dcfa9
> Author: David Hildenbrand <david@redhat.com>
> Date:   Wed Apr 10 22:15:07 2019 +0200
>
>     s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW INDICATION
>
>     Fairly easy as only 128-bit handling is required. Simply perform the
>     subtraction and then subtract the borrow.
>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>
>
>
> --
> Thanks,
>
> David / dhildenb
>
>

--000000000000925bac05d9974259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#073763"><span class=3D"gmail-im" style=3D"colo=
r:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif"><br></span><span sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">&gt; Just=
 use a little-endian load: MO_LE | es.</span><br style=3D"color:rgb(34,34,3=
4);font-family:Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,3=
4);font-family:Arial,Helvetica,sans-serif">&gt; While we use MO_TE all over=
, it&#39;s no secret that it&#39;s always big-endian.</span><br style=3D"co=
lor:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><br style=3D"colo=
r:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"colo=
r:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">&gt; And everywhere=
 else you do load then swap, or swap then store.</span><br></div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:#073763"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sa=
ns-serif"><br></span></div><div class=3D"gmail_default" style=3D"font-size:=
small">This is not working as expected...</div><div class=3D"gmail_default"=
 style=3D"font-size:small">I tried it in two places, both with a swap [remo=
ved] after and the tests failed.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">I&#39;m submitting the split patches with whitespace fixes.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">I hope it&#39;s not a =
dealbreaker,=C2=A0 seeing as it matches the rest of the file this way anyho=
w.</div><div class=3D"gmail_default" style=3D"font-size:small">If it is,=C2=
=A0 I will spend some more time looking into it tomorrow.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Thanks,</div><div class=3D"gmail_default=
" style=3D"font-size:small">- David Miller</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 3, 2022 at 1:04 PM David =
Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 03.0=
3.22 19:01, David Miller wrote:<br>
&gt; <br>
&gt; Makes sense, =C2=A0thanks for the quick reply.<br>
&gt; Last question, =C2=A0the patches can depend on others in the same set =
right?<br>
&gt; IE: =C2=A0all of the additions to insn-data.def in one, implementation=
s in<br>
&gt; separate patches.<br>
<br>
For bisectability, each patch should be self-contained and can only<br>
depend on earlier patches in the series.<br>
<br>
See my VX patches to get an idea of how it could look like, e.g.,<br>
<br>
<br>
commit e58de341d948d12cb36bbc5aa4866b7412581880<br>
Author: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D=
"_blank">david@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Apr 10 22:45:35 2019 +0200<br>
<br>
=C2=A0 =C2=A0 s390x/tcg: Implement VECTOR SUM ACROSS WORD<br>
<br>
=C2=A0 =C2=A0 Similar to VECTOR SUM ACROSS DOUBLEWORD.<br>
<br>
=C2=A0 =C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt=
;<br>
=C2=A0 =C2=A0 Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@=
redhat.com" target=3D"_blank">david@redhat.com</a>&gt;<br>
<br>
commit 8dc69a196eb2e3e8ab1d033b378e4f5a5efaa219<br>
Author: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D=
"_blank">david@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Apr 10 22:40:01 2019 +0200<br>
<br>
=C2=A0 =C2=A0 s390x/tcg: Implement VECTOR SUM ACROSS QUADWORD<br>
<br>
=C2=A0 =C2=A0 Similar to VECTOR SUM ACROSS DOUBLEWORD, however without a lo=
op and<br>
=C2=A0 =C2=A0 using 128-bit calculations.<br>
<br>
=C2=A0 =C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt=
;<br>
=C2=A0 =C2=A0 Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@=
redhat.com" target=3D"_blank">david@redhat.com</a>&gt;<br>
<br>
commit fe2be36d26b3d3e86246c88bb09a9613b99dc6c9<br>
Author: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D=
"_blank">david@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Apr 10 22:48:25 2019 +0200<br>
<br>
=C2=A0 =C2=A0 s390x/tcg: Implement VECTOR SUM ACROSS DOUBLEWORD<br>
<br>
=C2=A0 =C2=A0 Perform the calculations without a helper. Only 16 bit or 32 =
bit values<br>
=C2=A0 =C2=A0 have to be added.<br>
<br>
=C2=A0 =C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt=
;<br>
=C2=A0 =C2=A0 Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@=
redhat.com" target=3D"_blank">david@redhat.com</a>&gt;<br>
<br>
commit bc725e65152c57d42f19eec134c99940114d6362<br>
Author: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D=
"_blank">david@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Apr 9 23:26:47 2019 +0200<br>
<br>
=C2=A0 =C2=A0 s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW COMPUTE BORR=
OW<br>
INDICATION<br>
<br>
=C2=A0 =C2=A0 Mostly courtesy of Richard H.<br>
<br>
=C2=A0 =C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt=
;<br>
=C2=A0 =C2=A0 Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@=
redhat.com" target=3D"_blank">david@redhat.com</a>&gt;<br>
<br>
commit 48390a7c2716a128155b872d5316cda5f55dcfa9<br>
Author: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D=
"_blank">david@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Apr 10 22:15:07 2019 +0200<br>
<br>
=C2=A0 =C2=A0 s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW INDICATION<b=
r>
<br>
=C2=A0 =C2=A0 Fairly easy as only 128-bit handling is required. Simply perf=
orm the<br>
=C2=A0 =C2=A0 subtraction and then subtract the borrow.<br>
<br>
=C2=A0 =C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt=
;<br>
=C2=A0 =C2=A0 Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@=
redhat.com" target=3D"_blank">david@redhat.com</a>&gt;<br>
<br>
<br>
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div>

--000000000000925bac05d9974259--

