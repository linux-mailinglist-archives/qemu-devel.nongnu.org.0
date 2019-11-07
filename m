Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E2F39B0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 21:43:37 +0100 (CET)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSocy-0006CB-2d
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 15:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iSoaz-0005eX-2G
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 15:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iSoay-0006qE-4j
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 15:41:32 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iSoax-0006ok-TK
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 15:41:32 -0500
Received: by mail-wr1-x441.google.com with SMTP id b3so4573408wrs.13
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 12:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MYCNZvMvHw+U9wRBhIZFE3ITjh3aQYrpTRAHBmV7Q00=;
 b=ajmbPANx3RafJSkJRtTm4TqO64Q/LqxmJqedCilteLd9Uc5+dQY8XvQbhSjg6NWnRp
 u5qa3ZkWj5zDmr8URd5gdvIi5V+ZwAeUxqEOayUxqZHc2KhLYj9Myrq7BZBdcgbw7YH+
 DQ2aaDUbSv/wGEbZryt95tazpa/DLCcyr4w0B+5bgYV9RucEzjTRTljziXFOorXsPxvB
 w9aDCkum0kny0Jt1ksUVV8NcxLJxU0htD+8f5QTXcE1iyw2y7PRQPQlKD3fl6NrZzDZY
 B3g30q9gqnChpctgggB73U5mIEdp/Sj9UIzeUVQycwptsrh3gOliZcPDc0Gv9nj3h1nK
 Sjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MYCNZvMvHw+U9wRBhIZFE3ITjh3aQYrpTRAHBmV7Q00=;
 b=tFKLqHYCWtSiC7SMiy+Z+x5KQ1csXri0apJPceeTZX5Llw9zLyhAgRHXPjErWy8MeB
 x8+D+Zmtj3DPpezgdXcF+BK+nQJtSIyUTvX/X0y8rkQ5hRsW/TWaHQP0WMig8hFYyJt2
 zKQvwgm0IgEYsApulA5L58O7yef+BEV4im62weXKM3bnj/5rscny8izcHCh5PfX4E1ZZ
 z54/eSUy2rrx3kAf83NJWxrFTUKvh+86jC5gXu42xEyaeYJOplxjvMdl8g39nmXtJOJy
 uhTifvkyyZbG7JWwSJPk58tyylTHYh1NQrIppbjpberPS56DHh4iCZJA/IAkQdnzhZoD
 5yRA==
X-Gm-Message-State: APjAAAXHh2d2jDm/QWNIiMuDNMIDCfrpPW/vVSYIYmyEkZz+zo5sBvCt
 NCK+dPYVZ/VJX9TFxSIcU8QrcKUbhSksiIDMWag=
X-Google-Smtp-Source: APXvYqzjObFfeImlhCE4Pst/3+asUm5TwwskLHocEqOH2a1wr3z1JlfPQKB8luMEh2YqwZbNM2By9/f9bPOta40SogY=
X-Received: by 2002:adf:ef0f:: with SMTP id e15mr4548351wro.312.1573159290338; 
 Thu, 07 Nov 2019 12:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20191107192731.17330-1-marcandre.lureau@redhat.com>
 <20191107192731.17330-3-marcandre.lureau@redhat.com>
 <c700e47c-3142-4ad8-1582-f2f8045addf6@redhat.com>
In-Reply-To: <c700e47c-3142-4ad8-1582-f2f8045addf6@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Nov 2019 00:41:16 +0400
Message-ID: <CAJ+F1CKhQir_bFfzzdB_sj8ED04VPvfjdjXP-mParYpGeZN4gw@mail.gmail.com>
Subject: Re: [PATCH 2/3] qtest: fix qtest_qmp_device_add leak
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Nov 8, 2019 at 12:31 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 07/11/2019 20:27, Marc-Andr=C3=A9 Lureau wrote:
> > Spotted by ASAN.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/libqtest.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/libqtest.c b/tests/libqtest.c
> > index 3706bccd8d..91e9cb220c 100644
> > --- a/tests/libqtest.c
> > +++ b/tests/libqtest.c
> > @@ -1274,6 +1274,7 @@ void qtest_qmp_device_add(QTestState *qts, const =
char *driver, const char *id,
> >      qdict_put_str(args, "id", id);
> >
> >      qtest_qmp_device_add_qdict(qts, driver, args);
> > +    qobject_unref(args);
> >  }
> >
> >  static void device_deleted_cb(void *opaque, const char *name, QDict *d=
ata)
> >
>
> Stupid question: where is the qobject_ref()?

The initial ref is from qobject_from_vjsonf_nofail() constructor


--=20
Marc-Andr=C3=A9 Lureau

