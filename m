Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1973A3C6B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:57:29 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrb6e-0003fT-DX
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrb5Z-0002zd-VP
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:56:22 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrb5X-0003yx-EB
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:56:21 -0400
Received: by mail-yb1-xb31.google.com with SMTP id b13so2917781ybk.4
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8GTs786ZWvgc8M9oaKPmp0arKHtW4boj5rYf5WSwn8=;
 b=KidulLF2gJL9Yh8w1X0ppLYARDSLSPKXl9QfN57hS8lm0Kln4+yjfvLubPx62t5rJe
 S6N9n8Ee/qbWw8xAOMs1+LXb4GltSTqoV0Y7+OQBJ6UgOJrYBAq5Uh2EeBjhUb6H/5k/
 w/D0VGiQundrsa3T/IV87tVxQlaAilBZBbstmIzVHehknceyJpy5Z7P5Pu/HRYmYuqE9
 nav+4nsT26UtFsEvPwEEnfXkPXWUO5Yr3RJI9xwATZQrCB59LWpIspUx5+BCrrG4QRl0
 4Z99ccLw/YPn6abo+53jUiIF9LTxZU49ux6O9jU1J+buMgBZQoi43mw3HrqXGsg4J6il
 VSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8GTs786ZWvgc8M9oaKPmp0arKHtW4boj5rYf5WSwn8=;
 b=b8uM8XIZF8DZxIjqueB15viMz89sIqcl7KhxBcIV8hnsbIXY0W/940n1e+haXbe0cY
 9FVGnm50mkMg/xY8T7PkhyeAXVeLe/LFdNIgwx7k7a/A/iUZ4aAflf4s0Kk5yBTBv/w6
 X/hWwbVCySecsfG7wM4hivAjnc7tuOEziWHLB50N/wv0N5wSdFT01lmOaMvMpg5F2W5q
 /pd86mccfoWsTHjcZoUHEoXCT/Y1HIM6Sz/4iH/7Fxvn7TzL702x2ynuT8atmrrEG33D
 Et7b+XGfnoNxnESDw77zH4+wI7sO5vsP4XVRFllqOnjXuHySlfDObaTvcicPo3deUIgs
 w+jQ==
X-Gm-Message-State: AOAM5307a6qMVRHY2S1zpDvpa42GLQD7wCp4Ts+XbystmoHQpsV8DmCm
 CfG3bP0dPT7laDN+K4SBa47+leHIRYWCDm2HcV7NevKbEgQcLBi0
X-Google-Smtp-Source: ABdhPJxavKCTXTp8+PO3VjjFMHi2ioyGbcoHC9rzyscxIZyuzLpfKPzLJQ1upO3Yz1sasWV4OTknKhBaL1ffKvNgbeY=
X-Received: by 2002:a25:b74d:: with SMTP id e13mr3768153ybm.372.1623394578100; 
 Thu, 10 Jun 2021 23:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
In-Reply-To: <20210405131420.598273-1-basil@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Fri, 11 Jun 2021 09:56:05 +0300
Message-ID: <CAJ28CFQPkZ=GwhKTFUZJg3Qpwr2PW-uT+HAvUDX6LsqyihVjVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002883b505c47801f4"
Received-SPF: none client-ip=2607:f8b0:4864:20::b31;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb31.google.com
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

--0000000000002883b505c47801f4
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

--0000000000002883b505c47801f4
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

--0000000000002883b505c47801f4--

