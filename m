Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469864C9667
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:23:34 +0100 (CET)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP91w-0000HH-PK
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:23:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP908-0007p2-9h; Tue, 01 Mar 2022 15:21:40 -0500
Received: from [2607:f8b0:4864:20::232] (port=33411
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP907-0007V2-05; Tue, 01 Mar 2022 15:21:39 -0500
Received: by mail-oi1-x232.google.com with SMTP id x193so17345118oix.0;
 Tue, 01 Mar 2022 12:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFWIlV7Xoqa/yUvpgWHLB/Cxk80OTtGxlRNrRpBjtj8=;
 b=mhKRApOwxQdCvldzsj6AeQAsqX170MPhw1V6DF7CBceQrLdW5zrRtxmly8jqMSR8Qd
 /I8XXq3XTQuUc+BeIz+xB1Q5uOwUkREsWTsjyaUxEttbkHD8NbO97W4beLpmmQj5BnhE
 a35dhhTcm6sHy1BbF36s466tJYWpjASvC2vnB6w3CBmgESJhRTk8OSVGnXQIVc/CqtfZ
 kCGlmBQ6Ldae0qKUA+nfy36mpgIY7hyD9IdPjG/m4rWT/x6OKWkj41MHq9M2/XLLqnV2
 4tYyCrIUReQp9gZKL+19qL15/r9FX5MVHdvUNj7sc8h1aNaGbXtIcdenGo85ZmYmY1bL
 HQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFWIlV7Xoqa/yUvpgWHLB/Cxk80OTtGxlRNrRpBjtj8=;
 b=1yHnPpT62qcwskWDodXU98gmNmbuC2ckOTpQprrQ+7b9mCMIeJAZgTozL6vlXNZnIh
 Dt1FWbxcTo7QOkcA89SnZRZfOtKAA5F26v1J3AWdpw+RqslZ0n/OGcow3zO0+zgGsIgq
 kNLVFtpP0FJJhBRv59cBs0HIRdUUSKEr+rxKf/sTKYAygRfM+JqoelRpeHX9+czfQwos
 A3fUTPgDi07HjWmZbNDIFuxEB6i+3YfHvfxAptRyxUnJ60DB2PSLIumFu6HQzb2ga0d9
 P1iJfiHqqtUNP0sZuB018Cb9lC0N134Mmjo7OFpRk+7IH58RT6/ceE/DTRyoTO/5hVfk
 uN0Q==
X-Gm-Message-State: AOAM532yEyw1zpcU9FTvWBGeSCGMlX47eKEl7ez8/w6DoV2e9ipaBPvo
 PeiNzOtY+IZT/PmS4mD7NP7wfjMQZe6VUKMqMa0=
X-Google-Smtp-Source: ABdhPJy94BsAKZP2k7elLaoI87U3asbvVP33qJA6fTsS8SukWV4MkmzBm36AFojG7kXK7g1WihfifB2aG2r806jzeN0=
X-Received: by 2002:aca:6187:0:b0:2d5:427b:50fd with SMTP id
 v129-20020aca6187000000b002d5427b50fdmr14553056oib.153.1646166097763; Tue, 01
 Mar 2022 12:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20220301195933.1500-1-dmiller423@gmail.com>
 <234dc90d-7e7a-8281-d0db-14c8c4c6efea@linaro.org>
In-Reply-To: <234dc90d-7e7a-8281-d0db-14c8c4c6efea@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 1 Mar 2022 15:21:26 -0500
Message-ID: <CAEgyohUvQVfNGYfhmiOONGxstZ+MEy7Wx=e5uC2ee_reQaNakA@mail.gmail.com>
Subject: Re: [PATCH v2] tests/tcg/s390x: Cleanup of mie3 tests.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007fa0b605d92de9ce"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x232.google.com
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

--0000000000007fa0b605d92de9ce
Content-Type: text/plain; charset="UTF-8"

I used


#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
{                       \
    uint64_t res = 0;   \
asm volatile (          \
    "ltgr %[c], %[c]\n" \
    ASM                 \
    "stg %[c], %[res] " \
    : [res] "=&r" (res) \
    : [a] "r" (a),      \
      [b] "r" (b),      \
      [c] "r" (c)       \
);                      \
    return res;         \
}

--0000000000007fa0b605d92de9ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#073763">I used=C2=A0<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:#073763"><pre style=3D"background-color:rgb(0,0,0);color:rgb(255,255,255);=
font-family:&quot;Fira Code&quot;,monospace;font-size:12pt"><br><span style=
=3D"color:rgb(187,181,41)">#define </span>Fi3(S<span style=3D"color:rgb(204=
,120,50)">, </span>ASM) uint64_t S(uint64_t a<span style=3D"color:rgb(204,1=
20,50)">, </span>uint64_t b<span style=3D"color:rgb(204,120,50)">, </span>u=
int64_t c) \<br>{                       \<br>    uint64_t res <span style=
=3D"color:rgb(255,102,0)">=3D </span><span style=3D"color:rgb(51,153,153)">=
0</span><span style=3D"color:rgb(204,120,50)">;   </span>\<br><span style=
=3D"color:rgb(255,102,0)">asm volatile </span>(          \<br>    <span sty=
le=3D"color:rgb(102,255,0);font-weight:bold">&quot;ltgr %[c], %[c]\n&quot; =
</span>\<br>    ASM                 \<br>    <span style=3D"color:rgb(102,2=
55,0);font-weight:bold">&quot;stg %[c], %[res] &quot; </span>\<br>    <span=
 style=3D"color:rgb(255,102,0)">: </span>[res] <span style=3D"color:rgb(102=
,255,0);font-weight:bold">&quot;=3D&amp;r&quot; </span>(res) \<br>    <span=
 style=3D"color:rgb(255,102,0)">: </span>[a] <span style=3D"color:rgb(102,2=
55,0);font-weight:bold">&quot;r&quot; </span>(a)<span style=3D"color:rgb(20=
4,120,50)">,      </span>\<br>      [b] <span style=3D"color:rgb(102,255,0)=
;font-weight:bold">&quot;r&quot; </span>(b)<span style=3D"color:rgb(204,120=
,50)">,      </span>\<br>      [c] <span style=3D"color:rgb(102,255,0);font=
-weight:bold">&quot;r&quot; </span>(c)       \<br>)<span style=3D"color:rgb=
(204,120,50)">;                      </span>\<br>    <span style=3D"color:r=
gb(255,102,0)">return </span>res<span style=3D"color:rgb(204,120,50)">;    =
     </span>\<br>}</pre><pre style=3D"background-color:rgb(0,0,0);color:rgb=
(255,255,255);font-family:&quot;Fira Code&quot;,monospace;font-size:12pt"><=
br></pre></div></div>

--0000000000007fa0b605d92de9ce--

