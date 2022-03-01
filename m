Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C54C96D7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:25:58 +0100 (CET)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP94H-0002By-W6
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:25:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP91J-0000Y6-G9; Tue, 01 Mar 2022 15:22:54 -0500
Received: from [2607:f8b0:4864:20::329] (port=39931
 helo=mail-ot1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP91I-0007nL-4g; Tue, 01 Mar 2022 15:22:53 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 j3-20020a9d7683000000b005aeed94f4e9so13175537otl.6; 
 Tue, 01 Mar 2022 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cnq69asC/OnBz5aaepAEavHtgKCtmjU6hN7Tk1oVuSU=;
 b=kJxZaMy+Kckaq5GSfneV0eFOE1AILQRNtd45SzZ7Vn3bS3W+9sw9ilgrJ4qTTlI/MN
 NmxSOqwiEU0TNXM2kOGqKDb6UP/y9lF/zOjFnYZjlpoFW6IZPCT6Gw4itcszmgDTmL9N
 dG3MMNCtsY6/SrkPahfLWW7Q4elzy/3RV4cyUbQTns9oteXyfGnu3Gw5HyYcXfgByBy9
 l33Bu6FPD75mcD+i+xXHGbYkfjXCOklaQ6Zh6bP6VdzijdM2IX7HMeWd9F8GUz6ISs9L
 4O7HofOmSTWCRXsAgU4uBku33poeI+a7fizQ65gOUTm0qsfiegkaweJnKAZw+nl16GxK
 qt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cnq69asC/OnBz5aaepAEavHtgKCtmjU6hN7Tk1oVuSU=;
 b=BSgEY78XtinDATdzJwnWeG4Ui7Bqotif+tROfT0ABDlcQTfyleUDvc2GCQr1rRePTt
 hQS6VkL6RcTCyZfIxnEqZdF974nhvD7e+mvq29KI2wLYUY0WiqWUoNkHrSN7XIG0mMIf
 9zuHc1rJiuhoaoLX+lvBsAx7MZA3BehPdzXZ5ulYBRoLFTv4hbZwiml1F0unIICKKS6/
 6aziW9pJjV/nsBRA0V33GQBoYGA1ncQ4cnQShMVc4mZxhKtEQYhdpVA9chHTLoSbJuV5
 9J6sToWVjWJyEXp7m/x5ODLWog3AM6k2x3RccJ0ciWJSVrQuC5KR42yAiGuDuEEuFnu9
 RJFw==
X-Gm-Message-State: AOAM5304cgp4TdHfHUOhrMwhYsVY713HfBnITutVRu6ldJAqaT44jncu
 GYOrbWbhODSUez31hqW0S8VfelscoMQ5cWgHu3w=
X-Google-Smtp-Source: ABdhPJwJTLDj+9QVdgo4sPOzg5cwglfd4cVJNGhkbUi7uOpFmb16UZzSarkGrkI587A4IK2JUITJ/jD5gk8a/XXyrgA=
X-Received: by 2002:a05:6830:90b:b0:5ad:3891:b0a4 with SMTP id
 v11-20020a056830090b00b005ad3891b0a4mr13462716ott.58.1646166169719; Tue, 01
 Mar 2022 12:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20220301195933.1500-1-dmiller423@gmail.com>
 <234dc90d-7e7a-8281-d0db-14c8c4c6efea@linaro.org>
 <CAEgyohUvQVfNGYfhmiOONGxstZ+MEy7Wx=e5uC2ee_reQaNakA@mail.gmail.com>
In-Reply-To: <CAEgyohUvQVfNGYfhmiOONGxstZ+MEy7Wx=e5uC2ee_reQaNakA@mail.gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 1 Mar 2022 15:22:38 -0500
Message-ID: <CAEgyohWeLd1Wn6FmEKpgFHFskAiMfcpu778Re2ZHr5-zBq70Zg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/tcg/s390x: Cleanup of mie3 tests.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c9989505d92ded63"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::329
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dmiller423@gmail.com; helo=mail-ot1-x329.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c9989505d92ded63
Content-Type: text/plain; charset="UTF-8"

However the constraint must be wrong there.
Sorry about split message.

On Tue, Mar 1, 2022 at 3:21 PM David Miller <dmiller423@gmail.com> wrote:

> I used
>
>
> #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> {                       \
>     uint64_t res = 0;   \
> asm volatile (          \
>     "ltgr %[c], %[c]\n" \
>     ASM                 \
>     "stg %[c], %[res] " \
>     : [res] "=&r" (res) \
>     : [a] "r" (a),      \
>       [b] "r" (b),      \
>       [c] "r" (c)       \
> );                      \
>     return res;         \
> }
>
>
>

--000000000000c9989505d92ded63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#073763">However the constraint must be wrong t=
here.</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;=
font-size:small;color:#073763">Sorry about split message.</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar =
1, 2022 at 3:21 PM David Miller &lt;<a href=3D"mailto:dmiller423@gmail.com"=
>dmiller423@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D=
"font-family:georgia,serif;font-size:small;color:rgb(7,55,99)">I used=C2=A0=
<br><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,ser=
if;font-size:small;color:rgb(7,55,99)"><pre style=3D"background-color:rgb(0=
,0,0);color:rgb(255,255,255);font-family:&quot;Fira Code&quot;,monospace;fo=
nt-size:12pt"><br><span style=3D"color:rgb(187,181,41)">#define </span>Fi3(=
S<span style=3D"color:rgb(204,120,50)">, </span>ASM) uint64_t S(uint64_t a<=
span style=3D"color:rgb(204,120,50)">, </span>uint64_t b<span style=3D"colo=
r:rgb(204,120,50)">, </span>uint64_t c) \<br>{                       \<br> =
   uint64_t res <span style=3D"color:rgb(255,102,0)">=3D </span><span style=
=3D"color:rgb(51,153,153)">0</span><span style=3D"color:rgb(204,120,50)">; =
  </span>\<br><span style=3D"color:rgb(255,102,0)">asm volatile </span>(   =
       \<br>    <span style=3D"color:rgb(102,255,0);font-weight:bold">&quot=
;ltgr %[c], %[c]\n&quot; </span>\<br>    ASM                 \<br>    <span=
 style=3D"color:rgb(102,255,0);font-weight:bold">&quot;stg %[c], %[res] &qu=
ot; </span>\<br>    <span style=3D"color:rgb(255,102,0)">: </span>[res] <sp=
an style=3D"color:rgb(102,255,0);font-weight:bold">&quot;=3D&amp;r&quot; </=
span>(res) \<br>    <span style=3D"color:rgb(255,102,0)">: </span>[a] <span=
 style=3D"color:rgb(102,255,0);font-weight:bold">&quot;r&quot; </span>(a)<s=
pan style=3D"color:rgb(204,120,50)">,      </span>\<br>      [b] <span styl=
e=3D"color:rgb(102,255,0);font-weight:bold">&quot;r&quot; </span>(b)<span s=
tyle=3D"color:rgb(204,120,50)">,      </span>\<br>      [c] <span style=3D"=
color:rgb(102,255,0);font-weight:bold">&quot;r&quot; </span>(c)       \<br>=
)<span style=3D"color:rgb(204,120,50)">;                      </span>\<br> =
   <span style=3D"color:rgb(255,102,0)">return </span>res<span style=3D"col=
or:rgb(204,120,50)">;         </span>\<br>}</pre><pre style=3D"background-c=
olor:rgb(0,0,0);color:rgb(255,255,255);font-family:&quot;Fira Code&quot;,mo=
nospace;font-size:12pt"><br></pre></div></div>
</blockquote></div>

--000000000000c9989505d92ded63--

