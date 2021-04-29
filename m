Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96336E763
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:52:41 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2PY-0001Si-Ot
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lc2Og-00012s-Oa
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:51:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lc2OZ-0004B0-Gy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:51:46 -0400
Received: by mail-yb1-xb30.google.com with SMTP id b131so2035768ybg.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tcUia/fHxLc5KpopokYl8pfooQFy07JRhf/E3qmJD6w=;
 b=goEI1egR1MojPwTandDupf1P3buZPiHmzwV/qdbsWejr24uYPeIzNOC3WMlF8jsEGE
 iXT+itwpIfjEHOGr9LrXsEw95s0LagyUaAup+QRpS1ugtRlQbiPdeNYOIZbuj7RrWKJg
 g0iqWhBSJRD1MvVUXdFAaO5pf0Z51tmdbKyTv8nFRG0gzU+gWhHqPdBEF7NNFfyC6gbj
 K/Bt8OicbMASAl481h+pcHJEVHNvNDxuhVqcBQ2Ki94q658bSyXKr/Lhve7Ak6fWmBmv
 CeBikieuY/UDkYWA6ZrUdfCJ3NfMVpywPDV6txIAnKPoCuMK2yHwf44+j+ccDIvSs6JJ
 GKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcUia/fHxLc5KpopokYl8pfooQFy07JRhf/E3qmJD6w=;
 b=lzewkKvHOkmTY+hx+/DbVqr7eAS0ZL+RjtNl6hQs94t4WfTdrg/C8rle+Z1GPSEPQ9
 DoaVrqrpDGIauBsInmreSWoWRFeDBcawUKeC6K6yVZK+SvL9emML9pEFwGWezC5/s3nM
 KeY6yvNrkCVsIsdb8s64i/g1e3WjRQMmtVt0FI52y3CkPY6GmkVfULU2F+hhq5GtT1wC
 Lbt7f6/ODzWNzYsUwAh5sx3KaeNZ0IYN7GGifwvpo/HF7Nr/TaWrcN49TiCbfBl9lA5u
 JM758GnF2T8sIJ1EWeO+6tS/l26+gLY9DqsJfL3ukHBvj4YF9wKvYMpUUVUf9+J8xqv8
 oRJQ==
X-Gm-Message-State: AOAM530JIjQNl1i6BhWT6SvCu2d00W7Q6xZ9HMREzQruKjWPs5lcT8Lu
 lLKuafU1B1kzyJ3k9nVqxufdUhaBFlTXepn92Iop8eZ3fMjmSA==
X-Google-Smtp-Source: ABdhPJwomwpmnmUU4jZbCjpOUWSfgVK/eMoN9N4UchW+yicEl0YDh04Sl/+vfqHS2aKy8ZwTjh6XhYpZ4EWSRFTjSfo=
X-Received: by 2002:a25:6d85:: with SMTP id
 i127mr33336296ybc.479.1619686295712; 
 Thu, 29 Apr 2021 01:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
 <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
In-Reply-To: <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 29 Apr 2021 11:51:24 +0300
Message-ID: <CAJ28CFQUzsYiBFVuE+zkNqV_AYy1=1MdkdT-6YE4kOtkjmx7yA@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004dcea305c1189a9c"
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

--0000000000004dcea305c1189a9c
Content-Type: text/plain; charset="UTF-8"

ping

On Thu, Apr 22, 2021 at 10:43 AM Konstantin Kostiuk <konstantin@daynix.com>
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

--0000000000004dcea305c1189a9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Apr 22, 2021 at 10:43 AM Konstantin Kostiu=
k &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Apr 5, 2021 at 4:14 PM Basil Salman &lt;<a href=
=3D"mailto:basil@daynix.com" target=3D"_blank">basil@daynix.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently Re=
quester freeze times out after 10 seconds, while<br>
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
</blockquote></div>

--0000000000004dcea305c1189a9c--

