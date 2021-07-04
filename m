Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A323BABA4
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 07:53:49 +0200 (CEST)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzv4d-00070t-VG
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 01:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lzv3a-0005ue-By
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 01:52:42 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lzv3Y-0005C8-NN
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 01:52:42 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r135so23739172ybc.0
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 22:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Et98sgK7DpOPtOfmqoN5aer9iZ+HcL3F+ea/iGu78R0=;
 b=zsX8Iay8NvS0lcYrl/lk4JZvSBNPJNv5rWPUL3QYLW4UK4iucLyavCt72+w8tmU5U6
 7FB+MoKvlPaHZexS3x8YYyhGPkpu/Zm2Qy4X1CQoLyB7vpWNrFKAxOPd8pvFXlpvPmF0
 djRYO06LO5hlY1++/L7kddPhNyWp8Er6ziOc7RrUIS9x81u2Z+14189o1SNfVxN08A6k
 jMd4APfYCUHokrP1Qh5IBVnflTh1++2sIsV/6N0w8IYSS7BehTXbo263iG4Hd9fhvT3J
 ruaaN3P65Zki2otp1aRDVjkybi2soSApIup8j8cthU6yy73F3h7pBQyoRRwsqYsfD6Nt
 qsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Et98sgK7DpOPtOfmqoN5aer9iZ+HcL3F+ea/iGu78R0=;
 b=gqdx8ss7XvTupW97MU7R0bz/d3zPXZ8kQdDrDhCgsJtWxXeb6qxL04d6R84jc1w0r7
 K6zqxc4uNcsX0jeVaeUfY1o0vXYckeKOcnVxE8fK7AmFPbDbLsR1WL+4fuPQ3efgJAQK
 D60twiHGbT0VXUKybcI0Iwb+/3lElomgDcvWJhjKwxTkBxYJ4O8SLINKX9ZbCbbyJ21H
 +M8VBqrlAuvTfqac7RCwsGcsIDm76nbXfcqVQbztbuRd6T4l3h/PVTqChAUXk8uzTCN4
 BWy36EJpuHIPDsUfDzEvfsqfo5XIqmSwV2XmjDPhkpvn4okSgRiy5RRpUGvbTl+3fdMW
 hrZw==
X-Gm-Message-State: AOAM530UTY2zDckVVWdZYFriVTJ26oi2zx6fbVJyE1FwFi4rM6Q0ZWFJ
 p5GMb10/D29x2IfbQJjWU0NAB9GpiapPOR+Qjm9NocgJwMx+Xw==
X-Google-Smtp-Source: ABdhPJy7xNYAO5+BCm8KBoQGYCMeKK5zKHz8xUQhWquzl9ji3OdWJZjYoGoiYdSvnzEJBHvn3HBNjtfUD3amBXiIwUM=
X-Received: by 2002:a25:587:: with SMTP id 129mr9531657ybf.379.1625377959405; 
 Sat, 03 Jul 2021 22:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
In-Reply-To: <20210405131420.598273-1-basil@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Sun, 4 Jul 2021 08:52:28 +0300
Message-ID: <CAJ28CFS4W7b7cZn_jsNPqHLS1ohKfnhHZNx8d-=QQY9wk+Ed0Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e57ad805c645cb56"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2c.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e57ad805c645cb56
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

--000000000000e57ad805c645cb56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ping<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Apr 5, 2021 at 4:14 PM Basil Salman &=
lt;<a href=3D"mailto:basil@daynix.com">basil@daynix.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Currently Requester =
freeze times out after 10 seconds, while<br>
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
</blockquote></div></div>

--000000000000e57ad805c645cb56--

