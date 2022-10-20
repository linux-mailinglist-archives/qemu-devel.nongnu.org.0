Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CFC6059A1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 10:23:58 +0200 (CEST)
Received: from localhost ([::1]:39436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQqL-00037M-Gd
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:23:57 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQcD-00078R-7W
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1olQO3-0005jn-8P
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 03:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1olQO0-0005Fo-F1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 03:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666252479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ngJ0RxoA5FCgL3TcV2t6B9BGy/iWovR1aIhXASB6sg=;
 b=gwBOaYfcMprYwQrSvslkdFYHaJ3tsyKnPyrBxhAvvdfY/Nb+GU5pIRQT42YfNifkyeRSz9
 N3YqK8tJ2/OQ2OlEH6caqOC6NwJR9lmBHM2YNPVOxZ5kd5F3ueF0O+YOW2IXNGjg16zR6d
 hsnqMPvYUVrAWjYAxDb+soP5iipS9Wo=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-9YgdVs_5OdmPOJPut8yL4Q-1; Thu, 20 Oct 2022 03:54:37 -0400
X-MC-Unique: 9YgdVs_5OdmPOJPut8yL4Q-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13aeef5b55aso762693fac.22
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 00:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ngJ0RxoA5FCgL3TcV2t6B9BGy/iWovR1aIhXASB6sg=;
 b=gydej0hCa6JoBlqRwB3qhskL/81/QG0cJm90TUdD4vn3tq7tL56qZd9Bn1UpbbVTqu
 DahoU0dFKBE8et297/lr/C9Ewm/pT2urtoGyW26qyjLBsnyvG0sAhm5UOh/1nha7vRtX
 394HC34eNExr7xyKsKPXaFOf5vXzD9p1DP8nhEkkLE6WRs6HpHiEchMb0vN7F/03P0r8
 C0mJIP6EsbcMUpQokzsn8+n3diND4KfmVWr8I0QslWcfAhzDgWsslsNN/FweSAMjUrh9
 o9rFmqlKQbHIDgQVl35DmYbX3qUxMbZvmF2rm0K7nd6QFBqKPEGRvoqvpJMhMLs5iX3b
 t2wA==
X-Gm-Message-State: ACrzQf3yFC3rBjwUIMiJZNIovO15WefPOL9/ap0zRJOwQWFXaF3Nohg0
 87z/yOxSolSOpv3IYU6ABS7ONYuFJ9DDt499mUGksSDQ/xPcS6MUpsq8O4TugQmGHrLovmOPVRj
 avXRwaMfBQcetBfq4sfs7k0FsNHlqECM=
X-Received: by 2002:a05:6870:e40c:b0:132:8577:98da with SMTP id
 n12-20020a056870e40c00b00132857798damr25238318oag.205.1666252476605; 
 Thu, 20 Oct 2022 00:54:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM595hDRrGqG+lPAnj0wcbDJGOICRsKb4s2fSSmKTcE1L2j37+ZdvTnx+O6QhMmlnVBKC7fRDAJ8woBgadnXpWo=
X-Received: by 2002:a05:6870:e40c:b0:132:8577:98da with SMTP id
 n12-20020a056870e40c00b00132857798damr25238314oag.205.1666252476417; Thu, 20
 Oct 2022 00:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221019235948.656411-1-viktor.prutyanov@redhat.com>
In-Reply-To: <20221019235948.656411-1-viktor.prutyanov@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 20 Oct 2022 11:54:25 +0400
Message-ID: <CAMxuvawLNRKnzSN-r=h1s3p2a5gZEjXXKB_vt_YAVMhDPqwjfw@mail.gmail.com>
Subject: Re: [PATCH] dump/win_dump: limit number of processed PRCBs
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Cc: qemu-devel@nongnu.org, yan@daynix.com
Content-Type: multipart/alternative; boundary="000000000000f6a18605eb72a2cf"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f6a18605eb72a2cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 20, 2022 at 3:59 AM Viktor Prutyanov <
viktor.prutyanov@redhat.com> wrote:

> When number of CPUs utilized by guest Windows is less than defined in
> QEMU (i.e., desktop versions of Windows severely limits number of CPU
> sockets), patch_and_save_context routine accesses non-existent PRCB and
> fails. So, limit number of processed PRCBs by NumberProcessors taken
> from guest Windows driver.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
>

Assuming the used CPUs are in the same order. Or is there a way to query it
instead?

lgtm otherwise
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  dump/win_dump.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index fd91350fbb..f20b6051b6 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -273,6 +273,13 @@ static void patch_and_save_context(WinDumpHeader *h,
> bool x64,
>          uint64_t Context;
>          WinContext ctx;
>
> +        if (i >=3D WIN_DUMP_FIELD(NumberProcessors)) {
> +            warn_report("win-dump: number of QEMU CPUs is bigger than"
> +                        " NumberProcessors (%u) in guest Windows",
> +                        WIN_DUMP_FIELD(NumberProcessors));
> +            return;
> +        }
> +
>          if (cpu_read_ptr(x64, first_cpu,
>                  KiProcessorBlock + i * win_dump_ptr_size(x64),
>                  &Prcb)) {
> --
> 2.35.1
>
>

--000000000000f6a18605eb72a2cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 20, 2022 at 3:59 AM Vik=
tor Prutyanov &lt;<a href=3D"mailto:viktor.prutyanov@redhat.com">viktor.pru=
tyanov@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">When number of CPUs utilized by guest Windows is less than=
 defined in<br>
QEMU (i.e., desktop versions of Windows severely limits number of CPU<br>
sockets), patch_and_save_context routine accesses non-existent PRCB and<br>
fails. So, limit number of processed PRCBs by NumberProcessors taken<br>
from guest Windows driver.<br>
<br>
Signed-off-by: Viktor Prutyanov &lt;<a href=3D"mailto:viktor.prutyanov@redh=
at.com" target=3D"_blank">viktor.prutyanov@redhat.com</a>&gt;<br></blockquo=
te><div><br></div><div>Assuming the used CPUs are in the same order. Or is =
there a way to query it instead?<br></div><div><br></div><div>lgtm otherwis=
e<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/win_dump.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/dump/win_dump.c b/dump/win_dump.c<br>
index fd91350fbb..f20b6051b6 100644<br>
--- a/dump/win_dump.c<br>
+++ b/dump/win_dump.c<br>
@@ -273,6 +273,13 @@ static void patch_and_save_context(WinDumpHeader *h, b=
ool x64,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t Context;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WinContext ctx;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D WIN_DUMP_FIELD(NumberProcessors)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;win-dump: numb=
er of QEMU CPUs is bigger than&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot; NumberProcessors (%u) in guest Windows&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 WIN_DUMP_FIELD(NumberProcessors));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_read_ptr(x64, first_cpu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KiProcessorBl=
ock + i * win_dump_ptr_size(x64),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;Prcb)) {=
<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div></div>

--000000000000f6a18605eb72a2cf--


