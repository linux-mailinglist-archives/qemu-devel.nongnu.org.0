Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3935165AD58
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 06:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCDqE-0007pC-Th; Mon, 02 Jan 2023 00:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue@cmd.nu>) id 1pCDqC-0007ot-O3
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 00:58:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <blue@cmd.nu>) id 1pCDqB-00032d-0J
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 00:58:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id c17so38698312edj.13
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 21:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=okKFVAedMeVEaGFHWvDPT2pduyNCPP8jaXchDgplmD0=;
 b=UkB3jX+d0AupdDqG7S6eaj1tkKV0d4c/fNiBYT6eExVBTHMzwC9oYX/dqPW1U8zVTZ
 Z4NWdFXNr+bWmXtf1ZAN3dyizn51LNfH5TB1vSwbwAE1aEhvAl/OVlaLAwOpUbYLq0Dh
 d/jE+RYKAxr8VmyAR9Lzd0H0yBOva/r7z7Se0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=okKFVAedMeVEaGFHWvDPT2pduyNCPP8jaXchDgplmD0=;
 b=wBxfVlcNNG2s5BQD2/f2ocRtK5K0SYIDLvaJ43ef9nwWkIc6pqfwoOF0CriCL84Nud
 JRc1AkBPgW8ozAYzOpVO8HQw7MO7gEm53ucpXjeDJcdxqokFbJTTUnKN4NDi+obMKXpL
 fBXAPB8eZ2YHLibikdjArSAm46kYn9AqQ+c/eiyGYOjuzJwT+rkbBl2bB+ZrcoOpm7gG
 tBT3mKZELk/Hp3k8RU/UcoA/nzSsa39fl7rZlIgYa+LRV/X3HwJUpfM4x1o7B8BWD1U6
 0Dkh9hfzd+f2xWYa0tPMDDyJRss+kxf5Fn88o59ErBG0N0I49vW4ZYWbZwJPGl7BQCKV
 uNSg==
X-Gm-Message-State: AFqh2kpF5EkXJ7XyN7wr+E1H4i5wPDHFUTOOO+f2k6YDJP7TCBY2xsE7
 RFQZ844F8xPbug88qM5FfvY7wJmVh64OkZ094aSg+Q==
X-Received: by 2002:a50:fe18:0:b0:483:9ad4:3435 with SMTP id
 f24-20020a50fe18000000b004839ad43435mt3794553edt.301.1672639108504; Sun, 01
 Jan 2023 21:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20221230202710.115187-1-blue@cmd.nu>
In-Reply-To: <20221230202710.115187-1-blue@cmd.nu>
From: Christian Svensson <blue@cmd.nu>
Date: Mon, 2 Jan 2023 06:58:18 +0100
Message-ID: <CADiuDARG-zoaPHHL6iyBu_Np2MwJ4_=wF4oes=Puy_UStFqEuQ@mail.gmail.com>
Subject: Re: [PATCH] net: Increase L2TPv3 buffer to fit jumboframes
Cc: Jason Wang <jasowang@redhat.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e7f94405f141a393"
Received-SPF: pass client-ip=2a00:1450:4864:20::536; envelope-from=blue@cmd.nu;
 helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e7f94405f141a393
Content-Type: text/plain; charset="UTF-8"

+qemu-trivial

On Fri, Dec 30, 2022, 21:27 Christian Svensson <blue@cmd.nu> wrote:

> Increase the allocated buffer size to fit larger packets.
> Given that jumboframes can commonly be up to 9000 bytes the closest
> suitable
> value seems to be 16 KiB.
>
> Tested by running qemu towards a Linux L2TPv3 endpoint and pushing
> jumboframe traffic through the interfaces.
>
> Signed-off-by: Christian Svensson <blue@cmd.nu>
> ---
>  net/l2tpv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index 5852e42738..3d5c6d11d3 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -42,7 +42,7 @@
>   */
>
>  #define BUFFER_ALIGN sysconf(_SC_PAGESIZE)
> -#define BUFFER_SIZE 2048
> +#define BUFFER_SIZE 16384
>  #define IOVSIZE 2
>  #define MAX_L2TPV3_MSGCNT 64
>  #define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)
> --
> 2.36.2
>
>

--000000000000e7f94405f141a393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>+qemu-trivial<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 30, 2022, 21:27 Christian Sve=
nsson &lt;<a href=3D"mailto:blue@cmd.nu">blue@cmd.nu</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Increase the allocated buffer size to fit =
larger packets.<br>
Given that jumboframes can commonly be up to 9000 bytes the closest suitabl=
e<br>
value seems to be 16 KiB.<br>
<br>
Tested by running qemu towards a Linux L2TPv3 endpoint and pushing<br>
jumboframe traffic through the interfaces.<br>
<br>
Signed-off-by: Christian Svensson &lt;<a href=3D"mailto:blue@cmd.nu" target=
=3D"_blank" rel=3D"noreferrer">blue@cmd.nu</a>&gt;<br>
---<br>
=C2=A0net/l2tpv3.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>
index 5852e42738..3d5c6d11d3 100644<br>
--- a/net/l2tpv3.c<br>
+++ b/net/l2tpv3.c<br>
@@ -42,7 +42,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#define BUFFER_ALIGN sysconf(_SC_PAGESIZE)<br>
-#define BUFFER_SIZE 2048<br>
+#define BUFFER_SIZE 16384<br>
=C2=A0#define IOVSIZE 2<br>
=C2=A0#define MAX_L2TPV3_MSGCNT 64<br>
=C2=A0#define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)<br>
-- <br>
2.36.2<br>
<br>
</blockquote></div></div></div>

--000000000000e7f94405f141a393--

