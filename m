Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1234C21F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 05:06:12 +0200 (CEST)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQiEF-00024H-MF
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 23:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lQiCG-0001cv-Aj
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:04:08 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:2598
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lQiCE-0003bE-9z
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:04:08 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4F7yBw1KbGz8PbN;
 Sun, 28 Mar 2021 23:06:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=from:to
 :date:message-id:in-reply-to:references:subject:mime-version
 :content-type; s=default; bh=dy1voTqSNlsIBnnBhjNi6JgH4Ak=; b=aw/
 Tv4tUqMH9chi42zNFz45W5CDKKNHAn1lNJae5n1rEBj4L0vdIDqImueKl0RcMLuQ
 nzIuzFUH1bz05MEcavTJPSyMD9S7Wl0otczq8THf1rW2dFfUifTN+8QkpNOh/dzZ
 lwzx5xBJ62IKCHRP3Kv9M3/Jqp72AcXKhGapxHDE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=from:to:date
 :message-id:in-reply-to:references:subject:mime-version
 :content-type; q=dns; s=default; b=gBqoXVGrz0bKEnG6CnwW8lYW4WbsT
 hQplot8qRESY42Y6EYkJlRKbbuCHC46tGW7fQN/5G+sDFPEpOyCY8GYfVETacIr3
 Rb+SRIx28oN4aAm5w4eru+BvFqKRY0m1Istma5XvCQfrKLev+zDkvamh2qVdMcGb
 UfS3wmvQwnGYkw=
Received: from [192.168.3.33]
 (bras-base-toroon2719w-grc-39-142-114-123-227.dsl.bell.ca [142.114.123.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4F7yBw0Wrwz8PbK;
 Sun, 28 Mar 2021 23:06:00 -0400 (EDT)
From: Brad Smith <brad@comstyle.com>
To: Jason Wang <jasowang@redhat.com>, <qemu-devel@nongnu.org>
Date: Sun, 28 Mar 2021 23:03:54 -0400
Message-ID: <1787bf01190.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
In-Reply-To: <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
References: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
 <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
User-Agent: AquaMail/1.28.1-1760 (build: 102800003)
Subject: Re: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----------1787bf013227c7b27f3c8a13a5"
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
------------1787bf013227c7b27f3c8a13a5
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It very much is correct. We don't care about such releases anymore.

On March 28, 2021 10:24:51 p.m. Jason Wang <jasowang@redhat.com> wrote:

> =E5=9C=A8 2021/3/27 =E4=B8=8A=E5=8D=887:49, Brad Smith =E5=86=99=E9=81=93=
:
>> OpenBSD added support for tap(4) 10 releases ago.
>>
>> Remove the special casing for older releases.
>>
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>
>> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
>> index 77aaf674b1..59dfcdfae0 100644
>> --- a/net/tap-bsd.c
>> +++ b/net/tap-bsd.c
>> @@ -35,10 +35,6 @@
>> #include <net/if_tap.h>
>> #endif
>>
>> -#if defined(__OpenBSD__)
>> -#include <sys/param.h>
>> -#endif
>> -
>> #ifndef __FreeBSD__
>> int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>>       int vnet_hdr_required, int mq_required, Error **errp)
>> @@ -59,11 +55,7 @@ int tap_open(char *ifname, int ifname_size, int *vn=
et_hdr,
>>  if (*ifname) {
>>      snprintf(dname, sizeof dname, "/dev/%s", ifname);
>>  } else {
>> -#if defined(__OpenBSD__) && OpenBSD < 201605
>
>
> I am not sure this sis correct. My understanding is that we still need
> to use tun for old OpenBSD release.
>
> Thanks
>
>
>> -            snprintf(dname, sizeof dname, "/dev/tun%d", i);
>> -#else
>>      snprintf(dname, sizeof dname, "/dev/tap%d", i);
>> -#endif
>>  }
>>  TFR(fd =3D open(dname, O_RDWR));
>>  if (fd >=3D 0) {


Sent with Aqua Mail for Android
https://www.mobisystems.com/aqua-mail

------------1787bf013227c7b27f3c8a13a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">It very much is correct. We don't care about such release=
s anymore.</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On March 28, 2021 10:24:51 p.m. Jason Wang &lt;jasowang@r=
edhat.com&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">=E5=9C=A8 2021/3/27 =E4=B8=8A=E5=8D=887:49, Brad Smith =
=E5=86=99=E9=81=93:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">OpenBSD added support for tap(4) 10 releases ago.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Remove the special casing for older releases.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Brad Smith &lt;brad@comstyle.com&gt;</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/net/tap-bsd.c b/net/tap-bsd.c</div>
<div dir=3D"auto">index 77aaf674b1..59dfcdfae0 100644</div>
<div dir=3D"auto">--- a/net/tap-bsd.c</div>
<div dir=3D"auto">+++ b/net/tap-bsd.c</div>
<div dir=3D"auto">@@ -35,10 +35,6 @@</div>
<div dir=3D"auto">#include &lt;net/if_tap.h&gt;</div>
<div dir=3D"auto">#endif</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">-#if defined(__OpenBSD__)</div>
<div dir=3D"auto">-#include &lt;sys/param.h&gt;</div>
<div dir=3D"auto">-#endif</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">#ifndef __FreeBSD__</div>
<div dir=3D"auto">int tap_open(char *ifname, int ifname_size, int *vnet_hdr=
,</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp;int vnet_hdr_required, int mq_=
required, Error **errp)</div>
<div dir=3D"auto">@@ -59,11 +55,7 @@ int tap_open(char *ifname, int ifname_=
size, int *vnet_hdr,</div>
<div dir=3D"auto">&nbsp; if (*ifname) {</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; snprintf(dname, sizeof dname, "/dev/=
%s", ifname);</div>
<div dir=3D"auto">&nbsp; } else {</div>
<div dir=3D"auto">-#if defined(__OpenBSD__) &amp;&amp; OpenBSD &lt; 201605<=
/div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I am not sure this sis correct. My understanding is that =
we still need&nbsp;</div>
<div dir=3D"auto">to use tun for old OpenBSD release.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(dname=
, sizeof dname, "/dev/tun%d", i);</div>
<div dir=3D"auto">-#else</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; snprintf(dname, sizeof dname, "/dev/=
tap%d", i);</div>
<div dir=3D"auto">-#endif</div>
<div dir=3D"auto">&nbsp; }</div>
<div dir=3D"auto">&nbsp; TFR(fd =3D open(dname, O_RDWR));</div>
<div dir=3D"auto">&nbsp; if (fd &gt;=3D 0) {</div>
<div dir=3D"auto"><br></div>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div>
<div style=3D"color: black;">
<p style=3D"margin: 0 0 1em 0; color: black; font-family: sans-serif;">Sent=
 with <a href=3D"https://play.google.com/store/apps/details?id=3Dorg.kman.A=
quaMail">Aqua Mail for Android</a><br>
<a href=3D"https://www.mobisystems.com/aqua-mail">https://www.mobisystems.c=
om/aqua-mail</a></p>
</div>
</body>
</html>

------------1787bf013227c7b27f3c8a13a5--


