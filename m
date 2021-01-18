Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A732F97E4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:40:18 +0100 (CET)
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KSn-0003KE-TU
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l1KQn-0000wj-9Z
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:38:13 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l1KQl-0001W7-8e
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:38:13 -0500
Received: by mail-qk1-x736.google.com with SMTP id 19so17522197qkm.8
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEaO1DRc1Z6Azf9BkeMMoR74Gzw49kHvwAN7Mxn5u0M=;
 b=1TKGEJEOze16/pK+YaDP5qNgDuWC4s2sF8ntUH020jwwNMAdXPTLj5ImwZqWhiqkqj
 1UZF3zaxo5DNm6uW1hmcqIGW5t3KCk7+E7Y5KTrMST9S2nz27VNkZ7xo2wfklyfsX3mP
 EWJ3uJYgkckvoAzKUzbpgXILcowm+23ZKzr1qCOFuZqX9hJqMTBH6RnRJ6gBsZHxlEDI
 p39Um+Q/H2rOVgnxYvvz0ESrhCnkyIEoiwAjeUgF3BGmIfOvhfY48GdhfG/B/pspg9Fw
 yRuCMISRz3ZeimslFTCH9tDNovdZO9NtALjdtpjEDlOvpoQ1Tlepz5sA0huaaQyK0J/d
 fV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEaO1DRc1Z6Azf9BkeMMoR74Gzw49kHvwAN7Mxn5u0M=;
 b=TUrgZ/zdgBlNRYB4547sw4Abd8ME8kv6KiWGbfX4Ub6KjCXn5B7pRcOL1bF65y5NWb
 9Hmnd4LOZWLka2TGbAHEBFQb83VwPkElpQcxlgXEuwa6FFFpndwbaWeSgHi0CpQEnKks
 /oZeUNZZBNVjB97Lp5eShIiDAg8cWoM7R/4xOM9mcm3BNfU30/VKKf7Fe2L1ia96Ls2q
 Iml3xlIL54rPamCdkXkCSMdCvY6roAIzk3TWXdfkBSqlO0xRRY77MQ5UcHm6D8jlyfHa
 fdH4+Ent0GpQvRAV6Wu0+aXHKB682uNMB/pg8zknMPJFwmdXY5Z3GD4PYRI1wWQ3Kjio
 BG/w==
X-Gm-Message-State: AOAM531Z0Crnj0xC9ThIt7CYRk3DIrB1nMjfanVLSbqJ4b3xi1FPgtwl
 Z2L8T5e01FJ0ET7MCbJ9hO9e4EVXfeIBObOSNMQYxA==
X-Google-Smtp-Source: ABdhPJyE92c1u0QhUXzI5G3hlatV50RTkn+veJYBN1e2ZnyHjXCtPUY7vVSM7AT9PjdMzAYYnOBFTXoAJ20JYdbQoP0=
X-Received: by 2002:a37:83c2:: with SMTP id
 f185mr21861095qkd.206.1610937489256; 
 Sun, 17 Jan 2021 18:38:09 -0800 (PST)
MIME-Version: 1.0
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
In-Reply-To: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 17 Jan 2021 19:37:57 -0700
Message-ID: <CANCZdfoeNh91tEKQB2-AnCrd8RT3tedy67N5JXDFe7kUSkuySg@mail.gmail.com>
Subject: Re: [PATCH V4 0/4] bsd-user: Fix some code style problems
To: shiliyang <shiliyang@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000cd89df05b9239cf0"
Received-SPF: none client-ip=2607:f8b0:4864:20::736;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cd89df05b9239cf0
Content-Type: text/plain; charset="UTF-8"

Please submit these via http://github.com/qemu-bsd-user/

On Sun, Jan 17, 2021, 7:17 PM shiliyang <shiliyang@huawei.com> wrote:

> This patch series fixes error style problems found by checkpatch.pl.
>
> V3->V4:
> Fix code style problems with branch bsd-user-rebase-3.1.
>
> V2->V3:
> Make the patch into a series.
>
> V1->V2:
> Add cover letter message.
> Fix some style error in patch file before.
>
> Liyang Shi (4):
>   bsd-user: "foo * bar" should be "foo *bar"
>   bsd-user: suspect code indent for conditional statements
>   bsd-user: do not use C99 // comments
>   bsd-user: space required after semicolon
>
>  bsd-user/bsdload.c |  4 ++--
>  bsd-user/elfload.c | 32 ++++++++++++++++----------------
>  bsd-user/mmap.c    | 25 +++++++++++++------------
>  3 files changed, 31 insertions(+), 30 deletions(-)
>
> --
> 2.29.1.59.gf9b6481aed
>

--000000000000cd89df05b9239cf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please submit these via <a href=3D"http://github.com/qemu=
-bsd-user/">http://github.com/qemu-bsd-user/</a></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 17, 2021, 7:17 =
PM shiliyang &lt;<a href=3D"mailto:shiliyang@huawei.com">shiliyang@huawei.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch series=
 fixes error style problems found by <a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer noreferrer" target=3D"_blank">checkpatch.pl</a>.<br>
<br>
V3-&gt;V4:<br>
Fix code style problems with branch bsd-user-rebase-3.1.<br>
<br>
V2-&gt;V3:<br>
Make the patch into a series.<br>
<br>
V1-&gt;V2:<br>
Add cover letter message.<br>
Fix some style error in patch file before.<br>
<br>
Liyang Shi (4):<br>
=C2=A0 bsd-user: &quot;foo * bar&quot; should be &quot;foo *bar&quot;<br>
=C2=A0 bsd-user: suspect code indent for conditional statements<br>
=C2=A0 bsd-user: do not use C99 // comments<br>
=C2=A0 bsd-user: space required after semicolon<br>
<br>
=C2=A0bsd-user/bsdload.c |=C2=A0 4 ++--<br>
=C2=A0bsd-user/elfload.c | 32 ++++++++++++++++----------------<br>
=C2=A0bsd-user/mmap.c=C2=A0 =C2=A0 | 25 +++++++++++++------------<br>
=C2=A03 files changed, 31 insertions(+), 30 deletions(-)<br>
<br>
-- <br>
2.29.1.59.gf9b6481aed<br>
</blockquote></div>

--000000000000cd89df05b9239cf0--

