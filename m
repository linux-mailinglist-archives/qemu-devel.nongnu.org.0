Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B93941BA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 13:23:09 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmaa4-0007k6-GO
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 07:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lmaYr-0006zG-45
 for qemu-devel@nongnu.org; Fri, 28 May 2021 07:21:53 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:33606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lmaYo-0002md-K4
 for qemu-devel@nongnu.org; Fri, 28 May 2021 07:21:52 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id f84so5090171ybg.0
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=F4Sjy4d5W08UY15XmBOgUPcNX8IAyn8jJVCFVhQWiN0=;
 b=t7g6G7NWAnji3W7aKuMdNEwWyNaqf5JvSV3yZWjG9gxfFCH5EMvPtG5vG+/grlDspD
 /D8EF7J/4Odq0dphvCZQRZXB0b2GDhW52tuilXI0ADvvjDzIkEQgRzdNsr8nhPBOkIQj
 /U/k/Y71XxBuJ9aEiDq3FYiBbxVzGVnCM5F06n96+eEJv6sFPuiPLk8cUJIjj2mUyvJj
 WQS1V86tHqbYN13Pi4VEKMhLGViJMvVeW7S3edQyoLsGEV5KWqhAdrE34CYbWOMUYjaF
 plJQJhiectouf7JpNIQ9BqduRvzJUx2roIxkdVAQlZC4AQeC14UnGMVI3sKK3STiKpcZ
 upCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=F4Sjy4d5W08UY15XmBOgUPcNX8IAyn8jJVCFVhQWiN0=;
 b=mF9eikxc8vqvCut4f49fFnjvur0Id6AJnA+9VBGPnfdxj9CdZAkI7EOkTvvkDw6tQA
 dXGYpxFGxcFH3axk0s6lBJWy44d+Ly8KXl7gpKF3do3mOB89smIty0xUFtPaWH/u3BIK
 PBNm50SD7/kuBc4FcXH1/CovSFXDICwDVoizy3WKE/bGxV+zG3PtjE9qd2LorfFOdA/m
 6VGtjQr1lrxoDNEA/+9Ym5M83MBcO9nYDx3J3N7BFEmHpUEQYFJSSLjBGfr0q6jPdRiE
 glqjR5AoOiXx+0nhm4BhjRFGHxFoqrOGQRpRiFaRgwylC3zNqHgcD/1MxHBjo5Z1+zVG
 +S3A==
X-Gm-Message-State: AOAM533iWu9Al8lS0cOXi9Z4KBKyCTBKqvA/pNZIFRQVnXON7i9/1qSE
 3uNMRf9VIGJOMZ6Y2iZt3wy90UEllsGDBT4Q4jyx2E3g7ZIGGP+Y
X-Received: by 2002:a5b:392:: with SMTP id k18mt11727987ybp.180.1622200908427; 
 Fri, 28 May 2021 04:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
In-Reply-To: <20210405131420.598273-1-basil@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Fri, 28 May 2021 14:21:37 +0300
Message-ID: <CAJ28CFSF3_C_ar4=mvTLCy+g89Sr2AjS_UUS8XJgsVx7+UiT7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
Content-Type: multipart/alternative; boundary="000000000000e8484f05c36214b9"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Michael Roth <michael.roth@amd.com>,
 Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e8484f05c36214b9
Content-Type: text/plain; charset="UTF-8"

ping

On Mon, Apr 5, 2021 at 4:14 PM Basil Salman <basil@daynix.com> wrote:

> Currently Requester freeze times out after 10 seconds, while
> the default timeout for Writer Freeze is 60 seconds. according to
> VSS Documentation [1].
> [1]:
> https://docs.microsoft.com/en-us/windows/win32/vss/overview-of-processing-a-backup-under-vss
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1909073
>
> Signed-off-by: Basil Salman <bsalman@daynix.com>
> Signed-off-by: Basil Salman <basil@daynix.com>
> ---
>  qga/vss-win32/requester.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
> index 5378c55d23..940a2c8f55 100644
> --- a/qga/vss-win32/requester.cpp
> +++ b/qga/vss-win32/requester.cpp
> @@ -18,7 +18,7 @@
>  #include <inc/win2003/vsbackup.h>
>
>  /* Max wait time for frozen event (VSS can only hold writes for 10
> seconds) */
> -#define VSS_TIMEOUT_FREEZE_MSEC 10000
> +#define VSS_TIMEOUT_FREEZE_MSEC 60000
>
>  /* Call QueryStatus every 10 ms while waiting for frozen event */
>  #define VSS_TIMEOUT_EVENT_MSEC 10
> --
> 2.17.2
>
>

--000000000000e8484f05c36214b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Apr 5, 2021 at 4:14 PM Basil Salman &lt;<a=
 href=3D"mailto:basil@daynix.com">basil@daynix.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Currently Requester freez=
e times out after 10 seconds, while<br>
the default timeout for Writer Freeze is 60 seconds. according to<br>
VSS Documentation [1].<br>
[1]: <a href=3D"https://docs.microsoft.com/en-us/windows/win32/vss/overview=
-of-processing-a-backup-under-vss" rel=3D"noreferrer" target=3D"_blank">htt=
ps://docs.microsoft.com/en-us/windows/win32/vss/overview-of-processing-a-ba=
ckup-under-vss</a><br>
<br>
Buglink: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1909073" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.c=
gi?id=3D1909073</a><br>
<br>
Signed-off-by: Basil Salman &lt;<a href=3D"mailto:bsalman@daynix.com" targe=
t=3D"_blank">bsalman@daynix.com</a>&gt;<br>
Signed-off-by: Basil Salman &lt;<a href=3D"mailto:basil@daynix.com" target=
=3D"_blank">basil@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/requester.cpp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp<br>
index 5378c55d23..940a2c8f55 100644<br>
--- a/qga/vss-win32/requester.cpp<br>
+++ b/qga/vss-win32/requester.cpp<br>
@@ -18,7 +18,7 @@<br>
=C2=A0#include &lt;inc/win2003/vsbackup.h&gt;<br>
<br>
=C2=A0/* Max wait time for frozen event (VSS can only hold writes for 10 se=
conds) */<br>
-#define VSS_TIMEOUT_FREEZE_MSEC 10000<br>
+#define VSS_TIMEOUT_FREEZE_MSEC 60000<br>
<br>
=C2=A0/* Call QueryStatus every 10 ms while waiting for frozen event */<br>
=C2=A0#define VSS_TIMEOUT_EVENT_MSEC 10<br>
-- <br>
2.17.2<br>
<br>
</blockquote></div>

--000000000000e8484f05c36214b9--

