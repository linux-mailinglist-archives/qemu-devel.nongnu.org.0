Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AB64C9126
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:10:04 +0100 (CET)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP60h-0008RU-0j
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:10:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP5tx-0001DC-1j; Tue, 01 Mar 2022 12:03:05 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=40824
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP5tv-00027F-9t; Tue, 01 Mar 2022 12:03:04 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so23255365ooi.7; 
 Tue, 01 Mar 2022 09:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAW8uWlHO3P+TT49E3RTs+Atcv+TwhIodQ8PDeanbJ0=;
 b=WzNP/+y9CNHq1dz09dyeKvWz2u/PxPFAJL5x4LfW+d5S0UEIQEV/Va2CuAXx3V4EnY
 9VDhx4oCBFkuhCwMDmn24b5W/50V5sqesPh9Yr38TOUyvELOZhzyUuWb8sqwNbmBwEz4
 pwvs6HkIszZ4jqTWtsBNrWhSUiRJ6mxSB1h1hXVSckbhRSQyaQVPCLNeg1YGgdNMElBK
 9VKmVJC2PSA5yK/s9rnxQh0T1H2Kr/gu0jVPZZ7hQXmfYLl6x1XLToIlRgkZjH4KdtfQ
 zmw+gYShIi5WRiiUrLsu3Jk66bPlRihyv3W0CMDvkMDoiVBVPoCDHM6SbTf5qtpsLd8J
 mt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAW8uWlHO3P+TT49E3RTs+Atcv+TwhIodQ8PDeanbJ0=;
 b=ODI9x/P5G4PHy8JQXqTWd8Es6gUoelC997pT3sheVvg+r7dpoFsVLO4jb7UlAlKYqE
 AWxcqt5mfRXkVR8hBlwvm73EDuHQ50wHu84/yViY5I/GUrxIMXMCUt8HAeIiLF5I1/C9
 HOIOMy7BRhDWVwnLFMlFg4lKd3LHSKZZPg+id63qnuS+bckdYRFMFJouYsF+wctifBgZ
 I7NJRRV7cGyqbKy3nCydUjB5RrYPX2zTZcmVyC8NmScAs9l1dH3hTXIzmXBHHJ2izDl6
 cqJ6JkGY9eUN7+nBC2Y8vqWxdrPpHIVf9frV+WBZzMpNnY7i4eWguJgn53ltFBli9h4t
 eGKw==
X-Gm-Message-State: AOAM532YhWxQgOZZUgEixdBjVegS5J5iyyAydqfZdGUeJq71xG5Lb2y7
 t65Gvtc2gC1l4GuX8n9neBJKFrfAxml2deKjctU=
X-Google-Smtp-Source: ABdhPJwbcabozg7cTQIyLeotRTL326IWRQZuXUjmeKOMb7VXgQTnd4HGScZ/5EUwA4JkW/9MYC9oEsM+YfGNcOT5MDE=
X-Received: by 2002:a05:6870:3c11:b0:d8:2987:c6c7 with SMTP id
 gk17-20020a0568703c1100b000d82987c6c7mr421806oab.120.1646154180209; Tue, 01
 Mar 2022 09:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
 <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
 <9aeda35f-1bce-d8eb-9dba-4993dc6a605d@linaro.org>
 <CAEgyohW5KcOLYcYHP=oD7+6Bba6ueXv8bh136jFczwFky6BUFQ@mail.gmail.com>
 <7303f69a-d29c-42a5-a63d-a2d9c473e35d@redhat.com>
In-Reply-To: <7303f69a-d29c-42a5-a63d-a2d9c473e35d@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 1 Mar 2022 12:02:48 -0500
Message-ID: <CAEgyohWK=kJrkqhY70ebrnE4fzZ6ZVRA13LJ14ptQ7E=_bMauw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000282fb505d92b2397"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc2e.google.com
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
Cc: farman@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000282fb505d92b2397
Content-Type: text/plain; charset="UTF-8"

>On 28/02/2022 19.31, David Miller wrote:
> > Had it on my TODO list for this morning, thank you.

> Thanks! Please send it as additional patch on top of my s390x-next, since
I
> already sent a pull request for the other patches yesterday:
>
>  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

Partial misread yesterday,  I was on mobile and saw that you had modified
the patch to stage.

I will look at it now,  as soon as gitlab comes back up,  it's been
problematic lately.


- David Miller

--000000000000282fb505d92b2397
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:georgia,serif;font-size:small;color:#073763"><span class=3D"gmail-=
im" style=3D"color:rgb(80,0,80);font-family:Arial,Helvetica,sans-serif">&gt=
;On 28/02/2022 19.31, David Miller wrote:<br>&gt; &gt; Had it on my TODO li=
st for this morning, thank you.<br><br></span><span style=3D"color:rgb(34,3=
4,34);font-family:Arial,Helvetica,sans-serif">&gt; Thanks! Please send it a=
s additional patch on top of my s390x-next, since I</span><br style=3D"colo=
r:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"colo=
r:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">&gt; already sent a=
 pull request for the other patches yesterday:</span><br style=3D"color:rgb=
(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"color:rgb=
(34,34,34);font-family:Arial,Helvetica,sans-serif">&gt;=C2=A0</span><br sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><span sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">&gt;=C2=
=A0=C2=A0</span><a href=3D"https://gitlab.com/thuth/qemu/-/commits/s390x-ne=
xt/" rel=3D"noreferrer" target=3D"_blank" style=3D"font-family:Arial,Helvet=
ica,sans-serif">https://gitlab.com/thuth/qemu/-/commits/s390x-next/</a><br>=
</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-=
size:small;color:#073763"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:georgia,serif;font-size:small;color:#073763">Partial misread yes=
terday,=C2=A0 I was on mobile and saw that you had modified the patch to st=
age.</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;f=
ont-size:small;color:#073763"><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:#073763">I will look at=
 it now,=C2=A0 as soon as gitlab comes back up,=C2=A0 it&#39;s been problem=
atic lately.<br></div><div class=3D"gmail_default" style=3D"font-family:geo=
rgia,serif;font-size:small;color:#073763"><br></div><div class=3D"gmail_def=
ault" style=3D"font-family:georgia,serif;font-size:small;color:#073763"><br=
></div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font=
-size:small;color:#073763">- David Miller</div></div></div>

--000000000000282fb505d92b2397--

