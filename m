Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E973C98B9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 08:18:06 +0200 (CEST)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3uhB-0003Ru-Cw
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 02:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1m3ufH-0001S2-EB
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:16:07 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1m3ufB-0002S7-JJ
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:16:05 -0400
Received: by mail-lf1-x134.google.com with SMTP id q16so7883691lfa.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=W92hsLqxZ5slFR6BVmr4ct/7j+NpVhmt0HDqOv0m2c8=;
 b=TaRtd4d8Q7OWeoy8D0vCAoVkGdnkvmuqKd287wF9rGzClYb/hnH7tBz03vteKWq3bd
 YTrTxRrSpaXGuHhCIUMhiult1tWAzi0Q9W7w05ZoirSo0lLOmQUfDTEBbr/eqPVYDvHn
 yHabfA/AmGMrmJD1Oi/d2FYGna5KiuY3GM3pPyrVZFMFPdS5xKGlM4d5B0h/VveZSjGo
 kmBZmwUA07ZxHeVeMiLPKe20XxtOt1X9iewLdHb5V991gr/Pg/17JYcAp0ajmhn95jc0
 ilmWcipRMy1yOFZMMrvODevqTaTFR5vAimslEu6756izYDUFQBLJUHaI4BXYtNjgYa6B
 58Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=W92hsLqxZ5slFR6BVmr4ct/7j+NpVhmt0HDqOv0m2c8=;
 b=siQ4H+AZNJqfWNr1GgLhAL4233T/s0oc4jKSLtah1weBrnXoJKTwcrDrpPG0ajPasM
 S6fbFAbHC55RGX8D0LT5PM5BZO8NAEuyplguRHsnVKi9+p881o6R1cLhhXpuCwcyYAvT
 z1m5uZCMNeclK325TapPm/2oEHgsWOsDM6tQiyXgzc+G1+RtevjitKlB8mv1DCQHArpc
 0pYpnKgDwA/xW/5flA3R2Vhh+nGedTGPwE8v2iLilLjQ1wrGVWMqiWooBnghoAgL8PHb
 gHZk4tERUQIm1KBOifEjJvTY888DZ9U9PCItxm9ft+07xX/m7F9M+EoahfoYhwJ1dCHD
 ybBQ==
X-Gm-Message-State: AOAM533IfZ7ui5R/Fl3Etzb031X8MckG3iYy4Rt2Zd5kb43ENd3iHkkP
 J2B6JLUVXoqkXVsLP3fTzcqtv5SETEqRYI/HIjr+
X-Google-Smtp-Source: ABdhPJwEHTAPbc82SC4wr3Z4JpUZ2Z71GD3wcf0jGR+IY4tX4XHkw3UEnqlPqQsxfKVs7Zj6fVwBKkyH3OGg6oDPkGI=
X-Received: by 2002:a19:ee1a:: with SMTP id g26mr1964301lfb.141.1626329756813; 
 Wed, 14 Jul 2021 23:15:56 -0700 (PDT)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jul 2021 02:15:54 -0400
Mime-Version: 1.0
In-Reply-To: <20210630082551.12956-1-chengjiayao@bytedance.com>
References: <20210630082551.12956-1-chengjiayao@bytedance.com>
From: =?UTF-8?B?5oiQ5a6255G2?= <chengjiayao@bytedance.com>
Date: Thu, 15 Jul 2021 02:15:54 -0400
Message-ID: <CAACWsD9PqdqHCwWN5nNgjnOozb29jL=NArrkmzhQ4jm3VQZ=hQ@mail.gmail.com>
Subject: Re: [PATCH] Fix CPUID_Fn8000001E_EBX for AMD
To: ehabkost@redhat.com, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="000000000000716b7505c7236789"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=chengjiayao@bytedance.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, pizhenwei@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000716b7505c7236789
Content-Type: text/plain; charset="UTF-8"

Hello,

I am Jade Cheng working for ByteDance, sending this email is aimed at ping
you guys to check the patch I submitted earlier, link is attached below:
https://patchew.org/QEMU/20210630082551.12956-1-chengjiayao@bytedance.com/

Please do me a favor to give it a review, and let me know if you have any
concerns.
Stay safe and have a nice day = )
Best,
Jiayao (Jade) Cheng
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

--000000000000716b7505c7236789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"appVersion:=E9=A3=9E=E4=B9=A6-4.4.2-edi=
torVersion:0.5.4"></div><div><div style=3D"line-height:1.68"><div style=3D"=
font-family:arial,helvetica,sans-serif;color:rgb(31,35,41);line-height:1.68=
"><div class=3D"" dir=3D"auto" style=3D"margin:4px 0px"><span class=3D" bac=
kgroundcolor fontweight  fontsize fontcolor " style=3D"background-color:rgb=
a(0,0,0,0);font-weight:400;font-size:14px;color:#1f2329">Hello,</span></div=
><div class=3D"" dir=3D"auto" style=3D"margin:4px 0px"><br></div><div class=
=3D"" dir=3D"auto" style=3D"margin:4px 0px"><span class=3D" backgroundcolor=
 fontweight  fontsize fontcolor " style=3D"background-color:rgba(0,0,0,0);f=
ont-weight:400;font-size:14px;color:#1f2329">I am Jade Cheng working for By=
teDance, sending this email is aimed at ping you guys to check the patch I =
submitted earlier, link is attached below:</span></div><div class=3D"" dir=
=3D"auto" style=3D"margin:4px 0px"><span class=3D"outer-u-container "><span=
 class=3D" hyperlink-href:https://patchew.org/QEMU/20210630082551.12956-1-c=
hengjiayao@bytedance.com/ backgroundcolor fontweight  fontsize fontcolor " =
style=3D"background-color:rgba(0,0,0,0);font-weight:400;font-size:14px;colo=
r:#1f2329"><a href=3D"https://patchew.org/QEMU/20210630082551.12956-1-cheng=
jiayao@bytedance.com/" rel=3D"noopener" target=3D"_blank" style=3D"text-dec=
oration:none;color:rgb(51,112,255)">https://patchew.org/QEMU/20210630082551=
.12956-1-chengjiayao@bytedance.com/</a></span></span></div><div class=3D"" =
dir=3D"auto" style=3D"margin:4px 0px"><br></div><div class=3D"" dir=3D"auto=
" style=3D"margin:4px 0px"><span class=3D" backgroundcolor fontweight  font=
size fontcolor " style=3D"background-color:rgba(0,0,0,0);font-weight:400;fo=
nt-size:14px;color:#1f2329">Please do me a favor to give it a review, and l=
et me know if you have any concerns.</span></div><div class=3D"" dir=3D"aut=
o" style=3D"margin:4px 0px"><span class=3D" backgroundcolor fontweight  fon=
tsize fontcolor " style=3D"background-color:rgba(0,0,0,0);font-weight:400;f=
ont-size:14px;color:#1f2329">Stay safe and have a nice day =3D )</span></di=
v><div class=3D"" dir=3D"auto" style=3D"margin:4px 0px"><span class=3D" bac=
kgroundcolor fontweight  fontsize fontcolor " style=3D"background-color:rgb=
a(0,0,0,0);font-weight:400;font-size:14px;color:#1f2329">Best,</span></div>=
<div class=3D"" dir=3D"auto" style=3D"margin:4px 0px"><span class=3D" backg=
roundcolor fontweight  fontsize fontcolor " style=3D"background-color:rgba(=
0,0,0,0);font-weight:400;font-size:14px;color:#1f2329">Jiayao (Jade) Cheng<=
/span></div></div></div></div><div style=3D"list-style-position:inside" id=
=3D"lark-mail-quote-162632975"><div style=3D"list-style-position:inside"><d=
iv style=3D"margin:12px 0px 0px;padding-left:12px;border-left:0.5px solid r=
gb(187,191,196)" class=3D"adit-html-block ignore-collect adit-html-block--c=
ollapsed"><div><div id=3D"lark-mail-quote-df39d0a19e8cd4d3865dcda61c589a5d"=
><div style=3D"color:rgb(187,191,196)" class=3D"adit-html-block__attr">On W=
ed, Jun 30, 2021, 16:26 &lt;<a style=3D"white-space:pre-wrap;word-break:bre=
ak-word;text-decoration:none;color:rgb(51,112,255)" href=3D"mailto:chengjia=
yao@bytedance.com">chengjiayao@bytedance.com</a>&gt; wrote:</div><div style=
=3D"margin-top:8px"><div style=3D"white-space:pre-wrap"><span>According to =
AMD64 Arch Programmer&#39;s Manual Appendix D,
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
2.24.3 (Apple Git-128)</span></div></div></div></div></div></div></div></bo=
dy></html>

--000000000000716b7505c7236789--

