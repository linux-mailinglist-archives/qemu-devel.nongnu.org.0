Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE1367B50
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:45:29 +0200 (CEST)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZU1g-0004Bg-VV
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lZTzx-0002z2-PM
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:43:41 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lZTzu-00043R-Mt
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:43:41 -0400
Received: by mail-yb1-xb34.google.com with SMTP id v72so29594722ybe.11
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGYciGRWubKcQ3YvROzewCofBNP3Ibuerg3m/7Do6GE=;
 b=wXJByfX4SAh2h6DmCVwRzw/fshwYfIiXLJZySm5bFt4Mi0jkoox2ScFJTcSowalpba
 B1opRou75qGsv9R89CNRCBzWK1B/VOlki2cN2knCWpR0zRnvjcZ9mMAMlDRAFxdBACKj
 c8fKoSz2xC+Rf0gcQe6RD5v5sCadO4DqyziepfpSkE9TVaoWTC2k0nJWBJwu+I2SQuSo
 TFf8vth4MCnJUCfb6pDBMFqI+jw3H6DX+Ca07yXrZZalT57FvHps1fJeB37y+yXsaImD
 zh95xvwSJQ9KXAJCyT6EGOU0dIY+x/FZub0shdGSLCWdRbHqYL78U3DVLXUYjIFnvYvI
 RWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGYciGRWubKcQ3YvROzewCofBNP3Ibuerg3m/7Do6GE=;
 b=QceK9//apqgFrQvw0eVTF8wL13677v2V309oHPhUTM7gNTaane3oaAt4/SMRkcS5Xt
 Ao3mLCdvQtOkGHYs5SvDelBBU2l6RMshos+SNrtXXpARsKHuhxCRYTm7G5n6sVvwmYvK
 fmI2InoQQdbd0gh75fao0iGTLieeTgBUMmMUFT3CWb/PEOwe8Fj6HwJ801g6xf+eOksc
 CY19I2mcn5bbJ36rx58B7PkKpRmAqJwUOUfcvu2w013lJ7wddjsFtSJ3XgU0Je+LeFVo
 s4Q/JS2rDt3+cEOZIn3mF/TyOG21BZVATLx/+FLHGrIcJtXg98T2F/kJmGFPSSIvLihk
 8VyA==
X-Gm-Message-State: AOAM532N968NSnectQaGFCG40SA7DsBDC8DhArHx05gwNwIWGh6r8FaA
 Z/t7Xth6Do1rN/YjQ6rsIeNBi4ZFmiQvcZXJGdq+q5haCLSdVA==
X-Google-Smtp-Source: ABdhPJwYi+9g1Y5T408Z2vNNAeWgpRQ4UNLZFC1TnIQPPuMjwqtrrWH0mpBKBg4lxTt8f9of7bafHTsQGgUFork2wJE=
X-Received: by 2002:a05:6902:1144:: with SMTP id
 p4mr2858035ybu.510.1619077416175; 
 Thu, 22 Apr 2021 00:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
In-Reply-To: <20210405131420.598273-1-basil@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 22 Apr 2021 10:43:25 +0300
Message-ID: <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000415d3505c08ad6ac"
Received-SPF: none client-ip=2607:f8b0:4864:20::b34;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb34.google.com
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

--000000000000415d3505c08ad6ac
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

--000000000000415d3505c08ad6ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Apr 5, 2021 at 4:14 PM Basil Salman &lt;<a=
 href=3D"mailto:basil@daynix.com" target=3D"_blank">basil@daynix.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Current=
ly Requester freeze times out after 10 seconds, while<br>
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

--000000000000415d3505c08ad6ac--

