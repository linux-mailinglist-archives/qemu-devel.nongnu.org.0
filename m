Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B485715D2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:34:30 +0200 (CEST)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCHm-0003zd-4b
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBCEg-0000xm-LC
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBCEd-0005Yi-C7
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4QXkpRfSfStZPV+UvqnCbimj+iouYZXetKbLfzs8hGc=;
 b=FlO2APnu7TFhCXmmFJkrFuIMojU8jP3wt1bUVTQEpKNmKiwZ9PokfF8Qg6I36jwv2V8X9q
 1E+SPBGNOsYUis1n2bTW5hZhl/nS3VcfvnZ7vX2AIe2Se4C9mrF5w1z3VnozHfubIhg6zu
 LDVE6omwcaAbiaNYVESso+5emHte8EI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-BxzcGV6QNhGKd3bcqbcIGA-1; Tue, 12 Jul 2022 05:31:11 -0400
X-MC-Unique: BxzcGV6QNhGKd3bcqbcIGA-1
Received: by mail-yb1-f200.google.com with SMTP id
 t10-20020a5b07ca000000b0066ec1bb6e2cso5644783ybq.14
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QXkpRfSfStZPV+UvqnCbimj+iouYZXetKbLfzs8hGc=;
 b=pCw345YaSs7wNp6RAe2a/JDKVx1JCQuNejHKczljDc40OtcP/BAsMRKhLBTqCjEjbS
 mZK44cSRv0mW9rHgvGhCOMixO+YUgk6BwXblDdM+7G+FM+Tb0d+JeWkWr9vjjgR0BT5/
 EbJplbxEFW2yFJiB4tLUqIjZ8r8pe6QdFeGkIcCtZR7hL6Vuh2DTCJhyg4FmitdKhyH1
 4EkEMb/W3tev28086BI7CKJoLParLCJfE6akp/QDhx/sUjzy4TH6MOiDfXRmmI+ktrD9
 s65+X5i+KUTqGkWp/u8dIVYODPCoTHdxtztPuwVAGaVtgIdHdYybiXf+AQ/HDoXgzdLz
 Q0sA==
X-Gm-Message-State: AJIora8/IlElbQhNRRNvShjqeeUHdm4OrxwHGKPBtNVPTOQ7MVm2vgSY
 dWaYSv0EFIPemYCAQrdNF0cR4E01q9qJmxSmR9ezJidXBW82/NbpvIx/C5I8ssWxQp8KR9CAlIU
 WImF2D7GlnKlNf4R7uA2TCcWn/TYeAFo=
X-Received: by 2002:a81:a055:0:b0:31c:86f0:cd31 with SMTP id
 x82-20020a81a055000000b0031c86f0cd31mr24960354ywg.75.1657618270825; 
 Tue, 12 Jul 2022 02:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ts0c7npNo8QSZyDKCjk4P7cWRwaXwPDoacuQevCLAUPp0lYXzfNC3wiXYAV6eEecp12JBCZkKF7DAa6+4mYWY=
X-Received: by 2002:a81:a055:0:b0:31c:86f0:cd31 with SMTP id
 x82-20020a81a055000000b0031c86f0cd31mr24960337ywg.75.1657618270665; Tue, 12
 Jul 2022 02:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220707005602.696557-1-pizhenwei@bytedance.com>
In-Reply-To: <20220707005602.696557-1-pizhenwei@bytedance.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 12 Jul 2022 12:30:59 +0300
Message-ID: <CAPMcbCqPw_nh9Cu1U7t6VYV=3gKSa7q74r6iQ_kHmxZX+YmkuA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000032540f05e3985437"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000032540f05e3985437
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

On Thu, Jul 7, 2022 at 4:01 AM zhenwei pi <pizhenwei@bytedance.com> wrote:

> v3 -> v4:
> - Separate qapi script change from qga.
>
> v2 -> v3:
> - Rename 'GuestOsType' to 'GuestCpuStatsType'.
> - Add 'linux' into polluted_words, rename 'linuxos' to 'linux'. Remove
>   'windows' from 'GuestCpuStatsType', because currently we don't use it.
>
> v1 -> v2:
> - Konstantin & Marc-Andr=C3=A9 pointed out that the structure 'GuestCpuSt=
ats'
>   is too *linux style*, so re-define it to 'GuestLinuxCpuStats', and use
>   an union type of 'GuestCpuStats'.
>
> - Modify comment info from 'man proc', also add linux version infomation.
>
> - Test sscanf return value by '(i =3D=3D EOF)' (To Marc-Andr=C3=A9: name =
is declared
>   as 'char name[64];', so we can't test '!name').
>
> - Suggested by Marc-Andr=C3=A9, use 'int clk_tck =3D sysconf(_SC_CLK_TCK)=
;'
>   instead of hard code.
>
> v1:
> - Implement guest agent command 'guest-get-cpustats'
>
> Zhenwei Pi (2):
>   qapi: Avoid generating C identifier 'linux'
>   qga: add command 'guest-get-cpustats'
>
>  qga/commands-posix.c   | 89 ++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c   |  6 +++
>  qga/qapi-schema.json   | 81 ++++++++++++++++++++++++++++++++++++++
>  scripts/qapi/common.py |  2 +-
>  4 files changed, 177 insertions(+), 1 deletion(-)
>
> --
> 2.20.1
>
>

--00000000000032540f05e3985437
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div id=3D"gmail-:1hj" class=3D"gmail-a3s=
 gmail-aiL"><div dir=3D"ltr">Queued, thanks.<font color=3D"#888888"><br>
</font></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Jul 7, 2022 at 4:01 AM zhenwei pi &lt;<a href=3D=
"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">v3 -&gt; v4:<br>
- Separate qapi script change from qga.<br>
<br>
v2 -&gt; v3:<br>
- Rename &#39;GuestOsType&#39; to &#39;GuestCpuStatsType&#39;.<br>
- Add &#39;linux&#39; into polluted_words, rename &#39;linuxos&#39; to &#39=
;linux&#39;. Remove<br>
=C2=A0 &#39;windows&#39; from &#39;GuestCpuStatsType&#39;, because currentl=
y we don&#39;t use it.<br>
<br>
v1 -&gt; v2:<br>
- Konstantin &amp; Marc-Andr=C3=A9 pointed out that the structure &#39;Gues=
tCpuStats&#39;<br>
=C2=A0 is too *linux style*, so re-define it to &#39;GuestLinuxCpuStats&#39=
;, and use<br>
=C2=A0 an union type of &#39;GuestCpuStats&#39;.<br>
<br>
- Modify comment info from &#39;man proc&#39;, also add linux version infom=
ation.<br>
<br>
- Test sscanf return value by &#39;(i =3D=3D EOF)&#39; (To Marc-Andr=C3=A9:=
 name is declared<br>
=C2=A0 as &#39;char name[64];&#39;, so we can&#39;t test &#39;!name&#39;).<=
br>
<br>
- Suggested by Marc-Andr=C3=A9, use &#39;int clk_tck =3D sysconf(_SC_CLK_TC=
K);&#39;<br>
=C2=A0 instead of hard code.<br>
<br>
v1:<br>
- Implement guest agent command &#39;guest-get-cpustats&#39;<br>
<br>
Zhenwei Pi (2):<br>
=C2=A0 qapi: Avoid generating C identifier &#39;linux&#39;<br>
=C2=A0 qga: add command &#39;guest-get-cpustats&#39;<br>
<br>
=C2=A0qga/commands-posix.c=C2=A0 =C2=A0| 89 +++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qga/commands-win32.c=C2=A0 =C2=A0|=C2=A0 6 +++<br>
=C2=A0qga/qapi-schema.json=C2=A0 =C2=A0| 81 +++++++++++++++++++++++++++++++=
+++++++<br>
=C2=A0scripts/qapi/common.py |=C2=A0 2 +-<br>
=C2=A04 files changed, 177 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--00000000000032540f05e3985437--


