Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374BF5EB627
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 02:18:36 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocyJ0-0005s6-1Q
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 20:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocyHk-0004Ok-AP; Mon, 26 Sep 2022 20:17:16 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:33310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocyHi-0002Vb-M2; Mon, 26 Sep 2022 20:17:16 -0400
Received: by mail-qt1-x832.google.com with SMTP id ay9so5203261qtb.0;
 Mon, 26 Sep 2022 17:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Mszleyk4Hu6DrKr/d/FbFuzBxfXd1JzkSfdx/iPufcM=;
 b=VmbJxLJWtGoj2xaFUSOO1IQ9vcTP1JyAknPYUEfHZaR/8BuF8AmzMXIyRuvs0xv3UN
 +dEdFqXvhYPcp4yL34lZefBsGSYI5/2LxIpjs2emIJCfSXeVy1/vSS2etqD219MYr4Z6
 Fzi2hZH/6X3J5/V7J5CKUbrngOVporJkRFjLXd3ZBTpfOIpHI+aJPWNbPuhncCrBV3iu
 F4JTGLYtNxd2jgJ1VgKHqQI0PXNPNu/C7Hs8atxzuIWhgaiAGfOB/Lk68ELZ0FNx9AWU
 X7cXDGFLmn4xlgbUb6ikxC9lq8R6YXs2u/TtvVDFvUu3BesVReJhHGE/y4NI1xtEKbWx
 QYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Mszleyk4Hu6DrKr/d/FbFuzBxfXd1JzkSfdx/iPufcM=;
 b=jL4I1aaszuQIo9RnSFxLqj7OYRc3IxoZG5YxVAjkg25OPJBWwuMxkxGnRJfxbIg1/V
 KZKqvByjW5I7jWSeRrHPfku3AtSoxI9imUfqC7dU6W8V9Aob3MK/sgNQFRY3yCHe+JnB
 8UYOMl3NmIMIV5uAnV/Ciqe6uIinNOFyHbEuye23zNKqpcXGP2mgp7dwCEstxP1SwzNo
 T+YyiGjvOoigSltQcF1P0kTGDFQLIFBSEn0G3+p72okBqk69xResogTF5RTHpstyvJTn
 mfRyIHlBj/YQcLVk5xCn0YMbk7SqF0DGYqoMYlbKUQZN9m+/o0p+FqM2nIgWHqYqidi0
 bWyQ==
X-Gm-Message-State: ACrzQf0FgTGyEy84EvgI66WLmEv9tcNHwXNIA1O1EDsVZG2C3kmuAIhb
 +l22Vf8EfxKONJ9oVE29HWjge8GOAzETkHc4OP8=
X-Google-Smtp-Source: AMsMyM7SybGPSAF64mhE5hd+ia/76r3F5U9T/erz69g3YJ6F4ZvIrSNOBYFM5fJiIDngfV9hAkuHIwNGPgKlULE7yO0=
X-Received: by 2002:a05:622a:654:b0:35c:f6e6:76b7 with SMTP id
 a20-20020a05622a065400b0035cf6e676b7mr20240965qtb.365.1664237832623; Mon, 26
 Sep 2022 17:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-38-bmeng.cn@gmail.com>
 <7e906143-363e-7a15-885c-8f3f8e4636b1@redhat.com>
In-Reply-To: <7e906143-363e-7a15-885c-8f3f8e4636b1@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Sep 2022 08:17:01 +0800
Message-ID: <CAEUhbmXRy7C4VKawSCiEmZee_3yFmqbpdgBhC7uxd+4hxKb=xg@mail.gmail.com>
Subject: Re: [PATCH v3 37/54] tests/qtest: {ahci, ide}-test: Use relative path
 for temporary files for win32
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Thomas,

On Tue, Sep 27, 2022 at 12:20 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 25/09/2022 13.30, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > These test cases uses "blkdebug:path/to/config:path/to/image" for
> > testing. On Windows, absolute file paths contain the delimiter ':'
> > which causes the blkdebug filename parser fail to parse filenames.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > (no changes since v1)
> >
> >   tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
> >   tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
> >   2 files changed, 36 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> > index 1d5929d8c3..66652fed04 100644
> > --- a/tests/qtest/ahci-test.c
> > +++ b/tests/qtest/ahci-test.c
> > @@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type,=
 enum AddrMode addr,
> >
> >   int main(int argc, char **argv)
> >   {
> > -    const char *arch;
> > +    const char *arch, *base;
> >       int ret;
> >       int fd;
> >       int c;
> > @@ -1871,8 +1871,22 @@ int main(int argc, char **argv)
> >           return 0;
> >       }
> >
> > +    /*
> > +     * "base" stores the starting point where we create temporary file=
s.
> > +     *
> > +     * On Windows, this is set to the relative path of current working
> > +     * directory, because the absolute path causes the blkdebug filena=
me
> > +     * parser fail to parse "blkdebug:path/to/config:path/to/image".
> > +     */
> > +#ifndef _WIN32
> > +    base =3D g_get_tmp_dir();
> > +#else
> > +    base =3D ".";
> > +#endif
> > +
> >       /* Create a temporary image */
> > -    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
> > +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
> > +    fd =3D g_mkstemp(tmp_path);
> >       g_assert(fd >=3D 0);
> >       if (have_qemu_img()) {
> >           imgfmt =3D "qcow2";
> > @@ -1889,7 +1903,8 @@ int main(int argc, char **argv)
> >       close(fd);
> >
> >       /* Create temporary blkdebug instructions */
> > -    fd =3D g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL)=
;
> > +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
> > +    fd =3D g_mkstemp(debug_path);
> >       g_assert(fd >=3D 0);
> >       close(fd);
>
> It would maybe make sense to merge this with patch 05 ("tests/qtest:
> ahci-test: Avoid using hardcoded /tmp") ? ... but if you want to keep it
> separate, that's fine for me, too.

I'd prefer to keep these two patches separate as they are resolving
different issues.

> Reviewed-by: Thomas Huth <thuth@redhat.com>
>

Thanks for the review!

Regards,
Bin

Regards,
Bin

