Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0AA394FE8
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 08:47:30 +0200 (CEST)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnFEP-0005d2-D4
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 02:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnFBt-0004mV-MJ
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:44:53 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnFBs-0008Vd-0y
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:44:53 -0400
Received: by mail-io1-xd35.google.com with SMTP id a8so8655780ioa.12
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 23:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgwShcemOtX0BVy1q/tyuiadVzWUjcA0MZ7ig1eIS5A=;
 b=SONH6tJ/fiEla5CRRc4grMQ2Qf1af+AvrtCfl2gIQHddLo2IiCM75syQI+qmlCKEOP
 +OWE71pYwhyh7SmyFQqwiHBSl1/ugI5FkUGd2aDGJORb1K/CNxlXnvzx+2xyeQzzgFyC
 xHwOnxpBcaV6m5M9A2CqeaBOGiazg5WktB/KBh/peS+UAR9zJCdgUN5R0gSKYb2JxnV7
 6xNarNKqbnwDt7V0PSxsnDDud7lXWSq0sYWeiV7m7BZA4neyNI6FYXWM1zKhm5CkwPQ8
 +PUCNXdZQDtSLpi169FZRQHihCsJqCE/JILCEYzl87AhvVqIMF5k+wQHMTXirBRVwTPI
 7T/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgwShcemOtX0BVy1q/tyuiadVzWUjcA0MZ7ig1eIS5A=;
 b=EK913msEwUOczIzAP7mQl8aIlrRfwi++JhgkzmNmcf5aLPQYrXHNhKc4Dgv82qqVYH
 8mAez0BKtL+UcFhi0hnUlkd18+CgcjiU2w8z339fXowp0k2jAHxx6czcU0L+TIBDYSmf
 hHMd8h4QI/GwS5CQir1MWUfhWwaluVFwHwvyLnbDQTSngXTunxEsgt0NfLNtPJgdyAli
 rOCUpM3E0y2TCHBEET/8LCBgWMF3imBgtKWVK+e/JW4hQKLUnjZqWrON46s1Vo3dksQV
 B7sSKp9Scu6rAoapGDm9XSW+IOLFtsPB7bahqWb3pBBk2/boDzp05LVJFLb2ygQD30Fo
 y3Xg==
X-Gm-Message-State: AOAM532Vfsq3Dqi+55Bc9yOAVXTq95vg0p5tW3LgGf3HgazhUM3Tzu26
 TpkO99czNXYTHKl1/SPOi5GsXhsuAluvBn9EPW41Y4TJGm2Yng==
X-Google-Smtp-Source: ABdhPJxMWmKHQvMX7PB2OkVS1M27C+XlNGaDI5iVmFo9+AJJ7ZFrfjFvPl4gbvXPXQDvKiOj9gWzs0AA9iARZdxM13A=
X-Received: by 2002:a5d:9a0b:: with SMTP id s11mr1278889iol.166.1622357089151; 
 Sat, 29 May 2021 23:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
In-Reply-To: <20210530063712.6832-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Sun, 30 May 2021 08:44:38 +0200
Message-ID: <CAD-LL6g_01fm+WuAgRCsaO0hxowgfDYGgUN1OY1ix9QJbTgALA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Cache modelling TCG plugin
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ff721a05c386716d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: "Emilio G. Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff721a05c386716d
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 8:37 AM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> In this RFC patch series, I propose an initial cache modelling TCG
> plugin. As of now, it models separate L1 data cache and L1 instruction
> cache. It supports three eviction policies: LRU, random, and FIFO. Once
> a policy is chosen, it's used for both instruction and data caches.
>
> v1 -> v2: Unlocked dmtx on early return in vcpu_mem_access & removed a
>           (probably?) bad InsnData free.
>           This is probably still problematic since it does not free the
>           ``idata`` allocated for the vcpu_mem_access callback even
>           once, but if it's placed, it would double-free it.
>           How do I mitigate this? I need to free the InsnData passed to
>           vcpu_mem_access only once if we find out that it's an IO
>           access since we do not need it anymore and it will early
>           return every time.
>
> Mahmoud Mandour (3):
>   plugins: Added a new cache modelling plugin
>   plugins: cache: Enabled parameterization and added trace printing
>   plugins: cache: Added FIFO and LRU eviction policies.
>
>  contrib/plugins/Makefile |   1 +
>  contrib/plugins/cache.c  | 595 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 596 insertions(+)
>  create mode 100644 contrib/plugins/cache.c
>
> --
> 2.25.1
>
>

--000000000000ff721a05c386716d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 30, 2021 at 8:37 AM Mahmoud Mandour &lt;<a=
 href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In this RFC pat=
ch series, I propose an initial cache modelling TCG<br>
plugin. As of now, it models separate L1 data cache and L1 instruction<br>
cache. It supports three eviction policies: LRU, random, and FIFO. Once<br>
a policy is chosen, it&#39;s used for both instruction and data caches.<br>
<br>
v1 -&gt; v2: Unlocked dmtx on early return in vcpu_mem_access &amp; removed=
 a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (probably?) bad InsnData free.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is probably still problematic since=
 it does not free the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ``idata`` allocated for the vcpu_mem_acc=
ess callback even<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 once, but if it&#39;s placed, it would d=
ouble-free it.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 How do I mitigate this? I need to free t=
he InsnData passed to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu_mem_access only once if we find out=
 that it&#39;s an IO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 access since we do not need it anymore a=
nd it will early<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return every time.<br>
<br>
Mahmoud Mandour (3):<br>
=C2=A0 plugins: Added a new cache modelling plugin<br>
=C2=A0 plugins: cache: Enabled parameterization and added trace printing<br=
>
=C2=A0 plugins: cache: Added FIFO and LRU eviction policies.<br>
<br>
=C2=A0contrib/plugins/Makefile |=C2=A0 =C2=A01 +<br>
=C2=A0contrib/plugins/cache.c=C2=A0 | 595 +++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A02 files changed, 596 insertions(+)<br>
=C2=A0create mode 100644 contrib/plugins/cache.c<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000ff721a05c386716d--

