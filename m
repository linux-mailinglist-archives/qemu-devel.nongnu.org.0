Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B56713DF3D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:51:18 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7QT-0000YF-4I
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is7MD-0003rn-Tq
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is7MA-0004Wx-DK
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32356
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is7MA-0004Wi-9o
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579189609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3HoVc7xv+KJtHHn6NKnlNPTo4XA5OiLoHvWdtECvAY=;
 b=K/SWG5ZKwtKHssJkZv3wAodFX5xyt6KTxGyfm1sTd5oq1v4dj4bz5HrmOFw1pqebwR+AJp
 dcGs1fm8mATIrL42CcDtsbSoKevG3ZQNLd8LNPkpZYcjDKd4Gpv0xeHgsFPoq2sMP7amXj
 34nH46kdrkkmEFsOy3YKFv7zwrQyViY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-DxwDH2JJMHaT9mRp2WIE_A-1; Thu, 16 Jan 2020 10:46:48 -0500
Received: by mail-wr1-f71.google.com with SMTP id w6so9339407wrm.16
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 07:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f2zYStu2ck5cR/8DK54YTy4pUS0R3HFqp+k6jgDDUMg=;
 b=NFtprwFGuwtc8Fx3C8/dMHqGecfiFgCCOxbVk77Pl98UlVqaIYQAYoRp2TDAoVh46y
 sqMpaUJIkAB1R2lOrvaYwZPEO8Uyay/W/g9iPquMJkQnyNyxVRbPLU6c01vbS8hPlIPf
 QqfspvRBdDeRtUsXOGLbVJKxBq9dvIwtJTc6LnLqxkrlfuC6o/Vaizyq268n0I0tM3dp
 442K/CFIvHE9HFFPWxMNFF+fzeUmErKGL1pjNUEcgLS2bFPedwnCrA2ieqnsEBZbLOD6
 J8NpJBt1Nb9kMZn4Y+SRqxec6Vc6sPax9+8wWz/3htDbNVAsQBFhcpw3/e8Y56CY1ZOn
 UkUg==
X-Gm-Message-State: APjAAAVsxTfOFEE64bTKqyRxiwfVEReRiU1pKbX5ytSGa0nwWSZT+UAo
 0OSJYP0PkfZI285dZahSFF856aqYOvjboILv9UsvDKmMx2U27Fi3/lrbylc72LQsf47b7GLKknH
 GqK+WaZjTNxtq1kU=
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr4715wmj.156.1579189607196;
 Thu, 16 Jan 2020 07:46:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsoXkzJzxjR7csly048TJkwlGLqewTS6nIM567gGRroFWR8I6foAlMt+bbIIj1FfmzFGqH2Q==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr4696wmj.156.1579189606984;
 Thu, 16 Jan 2020 07:46:46 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id x11sm810300wmg.46.2020.01.16.07.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 07:46:46 -0800 (PST)
Subject: Re: [PATCH] tests/qtest/vhost-user-test: Fix memory leaks
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20200116140736.9498-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cac2dc95-9010-f901-c697-659308ece831@redhat.com>
Date: Thu, 16 Jan 2020 16:46:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116140736.9498-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: DxwDH2JJMHaT9mRp2WIE_A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pan Nengyuan <pannengyuan@huawei.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/20 3:07 PM, Thomas Huth wrote:
> Do not allocate resources in case we return early, and make sure
> to free dest_cmdline at the end.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Reported-by: Pan Nengyuan <pannengyuan@huawei.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based on a similar patch by Pan Nengyuan:
>    https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02183.html
>   ... but that was causing some very weird problems in the gitlab CI
>   for unknown reasons. This version now works fine in the gitlab CI.

Odd...

>   =20
>   tests/qtest/vhost-user-test.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.=
c
> index 2324b964ad..9ee0f1e4fd 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -707,9 +707,9 @@ static void test_read_guest_mem(void *obj, void *arg,=
 QGuestAllocator *alloc)
>   static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
>   {
>       TestServer *s =3D arg;
> -    TestServer *dest =3D test_server_new("dest");
> -    GString *dest_cmdline =3D g_string_new(qos_get_current_command_line(=
));
> -    char *uri =3D g_strdup_printf("%s%s", "unix:", dest->mig_path);
> +    TestServer *dest;
> +    GString *dest_cmdline;
> +    char *uri;
>       QTestState *to;
>       GSource *source;
>       QDict *rsp;
> @@ -720,6 +720,10 @@ static void test_migrate(void *obj, void *arg, QGues=
tAllocator *alloc)
>           return;
>       }
>  =20
> +    dest =3D test_server_new("dest");
> +    dest_cmdline =3D g_string_new(qos_get_current_command_line());
> +    uri =3D g_strdup_printf("%s%s", "unix:", dest->mig_path);
> +
>       size =3D get_log_size(s);
>       g_assert_cmpint(size, =3D=3D, (256 * 1024 * 1024) / (VHOST_LOG_PAGE=
 * 8));
>  =20
> @@ -778,6 +782,7 @@ static void test_migrate(void *obj, void *arg, QGuest=
Allocator *alloc)
>       qtest_quit(to);
>       test_server_free(dest);
>       g_free(uri);
> +    g_string_free(dest_cmdline, true);

Simpler, good.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>   }
>  =20
>   static void wait_for_rings_started(TestServer *s, size_t count)
>=20


