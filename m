Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B33D56D1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:50:23 +0200 (CEST)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xFe-00067d-JY
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1m7xEY-0005O7-It
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:49:14 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:46727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1m7xET-0004HC-EY
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:49:12 -0400
Received: by mail-lj1-x235.google.com with SMTP id b21so10543578ljo.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:date:message-id:subject:to:cc;
 bh=HTRP+YHiTMOIO3M28kMXMs390wLrMz9z8eY3NkqKX2s=;
 b=XX9jHg8OIXD7bTYhL6GZmJKa4l63Vr0s2/r26tru/QDjr1Y6Ac/v8OteuBuc93nu9M
 4Bk7Wc371r5kOWhfPtv8ixhWA2cqPhFZVIQ11T5kr/MUYStzAqfRZ1WmimHLhrIPEUai
 4pHt/3Oa5+xd5lKEHqJN+5jLnKNjAbmXeTbIvjfy/1kuM85LolTm1d8TsFkmRwm70npT
 Asv0OCj9u4IABB2pNXZqp13fgPMlcsVpBmKpRt3m/9/gruFmlhFSdaGTVfHnccENYSRc
 IVaQ2R/rrkenKgMadguwNbCQ5RY1Ph3KT1JZlM8mxWYYLmniB3wrctsgLG7Kt1IDyl1M
 qf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
 bh=HTRP+YHiTMOIO3M28kMXMs390wLrMz9z8eY3NkqKX2s=;
 b=Mlo8mKo77ofY4itn1obSHFBNd6uCEw5r0tXM3nEO3geF5DBW+/DeoXaw+MO9VgsCSO
 mYnL4Ybsz4t05mkI3tCA6mqwXlkqyYtvRUBpJBEsMFi8svC+AYpYOlnhI/ncwuIJXRyh
 qgv1YWoLO8+gq4JXQSr8UnNjSI1Ey3I5QhmJgsAyM5/Axi1Sh0iy6x0PpiAwtQzJ083s
 B9gDvXhqs/M6AZyBmKHvy9pCjm/6t/pTub6md6+sjNiX1iEVl1mWc2Q4nivyejHk8fd3
 XVkd8RCNQq9wWyVMGQZU9DEOaHw5lkcIfudm3it66VsLc3CqZBk8C+q7Omr/0vKmSZpA
 IS5A==
X-Gm-Message-State: AOAM531Lq3k9m+z7FERYLc1UrY7vZrYDACxtQ+y/9lApj70369Waod/g
 Eci/sYAjoWizpYTBNdfRYXzMWTeQKDf+xZP4zK76
X-Google-Smtp-Source: ABdhPJyFW4QEElJEuA1HNg/geEktp4o8bzNy054zP8MFBDakUXOMX4RqmtgNMC49WbW2Z0F+YKwbfDtjMWmrWkBFgsQ=
X-Received: by 2002:a2e:890f:: with SMTP id d15mr11425277lji.37.1627292946140; 
 Mon, 26 Jul 2021 02:49:06 -0700 (PDT)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 02:49:05 -0700
From: Jade Cheng <chengjiayao@bytedance.com>
Mime-Version: 1.0
Date: Mon, 26 Jul 2021 02:49:05 -0700
Message-ID: <CAACWsD-mzUrZhvyBevWqPZe8zxFGP3ykDD6CWUHZWt4gppgVag@mail.gmail.com>
Subject: ping Re: [PATCH] Fix CPUID_Fn8000001E_EBX for AMD
To: ehabkost <ehabkost@redhat.com>, pbonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000006ab905c803aa38"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=chengjiayao@bytedance.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, pizhenwei@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000006ab905c803aa38
Content-Type: text/plain; charset="UTF-8"

ping.
On Wed, Jun 30, 2021, 16:26 <chengjiayao@bytedance.com> wrote:
According to AMD64 Arch Programmer's Manual Appendix D, bits 7:0 in
Fn8000_001E_EBX should be physical core(s) per logical processor, not per
die. Signed-off-by: Jade Cheng <chengjiayao@bytedance.com> ---
target/i386/cpu.c | 8 +++++++- 1 file changed, 7 insertions(+), 1
deletion(-) diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
a9fe1662d3..417f5ba81f 100644 --- a/target/i386/cpu.c +++
b/target/i386/cpu.c @@ -381,7 +381,13 @@ static void
encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info, * NOTE:
CoreId is already part of apic_id. Just use it. We can * use all the 8 bits
to represent the core_id here. */ - *ebx = ((topo_info->threads_per_core -
1) << 8) | (topo_ids.core_id & 0xFF); + uint32_t core_id =
topo_ids.core_id; + + if (IS_AMD_CPU(&cpu->env)) { + core_id =
topo_ids.core_id + topo_ids.die_id * topo_info->cores_per_die; + } + + *ebx
= ((topo_info->threads_per_core - 1) << 8) | (core_id & 0xFF); /* *
CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId) -- 2.24.3 (Apple Git-128)

--000000000000006ab905c803aa38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"appVersion:=E9=A3=9E=E4=B9=A6-4.5.1-edi=
torVersion:0.6.4"></div><div><div style=3D"line-height:1.68"><div style=3D"=
font-family:arial,helvetica,sans-serif;color:rgb(31,35,41);line-height:1.68=
"><div class=3D"" dir=3D"auto" style=3D"margin:4px 0px"><span class=3D" fon=
tsize " style=3D"font-size:14px">ping.</span></div></div></div></div><div s=
tyle=3D"list-style-position:inside" id=3D"lark-mail-quote-162729294"><div s=
tyle=3D"margin:12px 0px 0px;padding-left:12px;border-left:0.5px solid rgb(1=
87,191,196)" class=3D"adit-html-block ignore-collect adit-html-block--colla=
psed"><div><div id=3D"lark-mail-quote-613a18e940a24b38e6004b365d420355"><di=
v style=3D"color:rgb(187,191,196)" class=3D"adit-html-block__attr">On Wed, =
Jun 30, 2021, 16:26 &lt;<a style=3D"white-space:pre-wrap;word-break:break-w=
ord;text-decoration:none;color:rgb(51,112,255)" href=3D"mailto:chengjiayao@=
bytedance.com">chengjiayao@bytedance.com</a>&gt; wrote:</div><div style=3D"=
margin-top:8px"><div style=3D"white-space:pre-wrap"><span>According to AMD6=
4 Arch Programmer&#39;s Manual Appendix D,
bits 7:0 in Fn8000_001E_EBX should be physical core(s) per logical processo=
r, not per die.

Signed-off-by: Jade Cheng &lt;<a href=3D"mailto:chengjiayao@bytedance.com" =
target=3D"_blank">chengjiayao@bytedance.com</a>&gt;
---
 target/i386/cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d3..417f5ba81f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -381,7 +381,13 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86=
CPUTopoInfo *topo_info,
      *  NOTE: CoreId is already part of apic_id. Just use it. We can
      *  use all the 8 bits to represent the core_id here.
      */
-    *ebx =3D ((topo_info-&gt;threads_per_core - 1) &lt;&lt; 8) | (topo_ids=
.core_id &amp; 0xFF);
+    uint32_t core_id =3D topo_ids.core_id;
+
+    if (IS_AMD_CPU(&amp;cpu-&gt;env)) {
+        core_id =3D topo_ids.core_id + topo_ids.die_id * topo_info-&gt;cor=
es_per_die;
+    }
+
+    *ebx =3D ((topo_info-&gt;threads_per_core - 1) &lt;&lt; 8) | (core_id =
&amp; 0xFF);
=20
     /*
      * CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId)
--=20
2.24.3 (Apple Git-128)</span></div></div></div></div></div></div></body></h=
tml>

--000000000000006ab905c803aa38--

