Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E470D3C3E52
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 19:27:08 +0200 (CEST)
Received: from localhost ([::1]:41196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2dER-0000Ua-W5
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 13:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m2d6k-0005m6-3B
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:19:11 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:42630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m2d6i-00010D-BD
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:19:09 -0400
Received: by mail-yb1-xb30.google.com with SMTP id o139so24267296ybg.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=az4x/NZQPedt9oyyzTiOfa/v1AM4VnIkb/fpSblOvOU=;
 b=indUt9uj48vr8zSIwmgSzljkISLvBkQS7MnxeN44nkhkINuhHTdKAWGuEUcXH6CJv2
 zGort0WoxQL8Sf0SUVjN5+w/7Tjh/naJa8y2lRra1gYcEgZTwmMoWgWUWtDo++I0brs3
 xHuTjWVeapJQzbBbCAuIubQOb7DV7bNmeg3cx/Biy+bQTiCRg05lGLGlX6RI8Z/Ewbwb
 tY3RNL++SLD5edqvzZfULuD2YsJyYsXm1ckx8Ni+vEUoINWaA9pHwX3nramxO8suQ856
 ph0tB5uU9oMNwtduBoK/k0x2vz0YEzbpoGA+EMr/q4Km6WLJEserYwADk7kktRiNnLBW
 DO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=az4x/NZQPedt9oyyzTiOfa/v1AM4VnIkb/fpSblOvOU=;
 b=mtGDwXHaO9RrPDiGKyqKEtg24mXf/v0Mb8hVPRHO6VaE41wLeUgo7GtDss26q0KNFS
 oleue0vT3fqri/hn169/YArV/4nVaxWQuBWZrk0H8/sWZFYeENZWwTZWkK1BSigHVkm0
 OUb5MkXu/xX0jd+u8wSik2FAxWSw+xCDTXP5AnVkv12nXtMnPuiuplATzdKC1dj7FBpO
 h6uL7wxYaSJH2/auI0fncRylQBBiODTB0U9da6tVv8Ap/vWWJcsop220cMgDr3hp0nGC
 l+9wHPIQ8EHT5gJWUlMXyrWNjgjoss83G5ahCb9nA0eMREuAuRsEQg/LkqTmIHAV0P8I
 oPzg==
X-Gm-Message-State: AOAM533MpnselujtMxxxPvAE7DlgpbrPD2Qi0H+YjWnTR5pPCIvPZqB6
 uCoVSDBJ5OrNKc/94fUwxexYAIcMS6HvCI8hzIe2Y5Esu4s=
X-Google-Smtp-Source: ABdhPJyhMJF+3qhYPZgYaTbcpMfMnIVmqoVtnBDZhEctctVKlF1+KiYJQLv3sF5EUgPRwGrewXpOsHRyL30MSfw4ozM=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr59591713ybm.345.1626023947477; 
 Sun, 11 Jul 2021 10:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
 <CAJ28CFS4W7b7cZn_jsNPqHLS1ohKfnhHZNx8d-=QQY9wk+Ed0Q@mail.gmail.com>
In-Reply-To: <CAJ28CFS4W7b7cZn_jsNPqHLS1ohKfnhHZNx8d-=QQY9wk+Ed0Q@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Sun, 11 Jul 2021 20:18:56 +0300
Message-ID: <CAJ28CFQujONx+6e8Z0mv8Cc+RDxfrMsKnNvq7BR2ViAisd_HGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c9360c05c6dc3380"
Received-SPF: none client-ip=2607:f8b0:4864:20::b30;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb30.google.com
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

--000000000000c9360c05c6dc3380
Content-Type: text/plain; charset="UTF-8"

ping

On Sun, Jul 4, 2021 at 8:52 AM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

> ping
>
> On Mon, Apr 5, 2021 at 4:14 PM Basil Salman <basil@daynix.com> wrote:
>
>> Currently Requester freeze times out after 10 seconds, while
>> the default timeout for Writer Freeze is 60 seconds. according to
>> VSS Documentation [1].
>> [1]:
>> https://docs.microsoft.com/en-us/windows/win32/vss/overview-of-processing-a-backup-under-vss
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1909073
>>
>> Signed-off-by: Basil Salman <bsalman@daynix.com>
>> Signed-off-by: Basil Salman <basil@daynix.com>
>> ---
>>  qga/vss-win32/requester.cpp | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
>> index 5378c55d23..940a2c8f55 100644
>> --- a/qga/vss-win32/requester.cpp
>> +++ b/qga/vss-win32/requester.cpp
>> @@ -18,7 +18,7 @@
>>  #include <inc/win2003/vsbackup.h>
>>
>>  /* Max wait time for frozen event (VSS can only hold writes for 10
>> seconds) */
>> -#define VSS_TIMEOUT_FREEZE_MSEC 10000
>> +#define VSS_TIMEOUT_FREEZE_MSEC 60000
>>
>>  /* Call QueryStatus every 10 ms while waiting for frozen event */
>>  #define VSS_TIMEOUT_EVENT_MSEC 10
>> --
>> 2.17.2
>>
>>

--000000000000c9360c05c6dc3380
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, Jul 4, 2021 at 8:52 AM Konstantin Kostiuk =
&lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Apr 5, 2021 at 4:14 PM Basil Salman &lt;<a hr=
ef=3D"mailto:basil@daynix.com" target=3D"_blank">basil@daynix.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently =
Requester freeze times out after 10 seconds, while<br>
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
</blockquote></div>

--000000000000c9360c05c6dc3380--

