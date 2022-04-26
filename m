Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922FA50FAF6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:34:40 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIWl-0005ai-Et
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njIOZ-0002nh-57
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njIOR-0006UY-GF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650968762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WTk7bVFTYYYrPuyW+60sIJYE6fGglSJbT/+k8s6Pws=;
 b=FSiZ75IbPn9IKaLZ+hn+Ad+Lziyy29hZhmjkp6sTtvpQVAUjOtUSbASR2qFP0fbHyF9kqD
 Tfv2yJWKAOJON/nEqo8ykOOuv576JR/g3QHuLf7FpspGNWxmRTOsHDaUJxm1jMVUolxMbE
 1Vw+v45gvUUpc0+jOLwF7sB4ITuD5mE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-7vUuB-MiO7ma2JEXUSjY1Q-1; Tue, 26 Apr 2022 06:26:00 -0400
X-MC-Unique: 7vUuB-MiO7ma2JEXUSjY1Q-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2d7eaa730d9so151737857b3.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 03:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5WTk7bVFTYYYrPuyW+60sIJYE6fGglSJbT/+k8s6Pws=;
 b=oxSsNa2Ns28KYdOz2wb/Z0qJFfBnLIPGqV2CeFTtV1mLNR4aOqWmQF5SuAS8eVJcqC
 6O26xVMOXYX62xTjYqjnxYJ2kNjNZPWDcXa2U6a8tazQBprE7S1IJ7dBL9mYnEWoaBJM
 fjZNkm6BZMx6H/R+4YGrq2cWukSHkKSdZewNn55fpB7EXkTTvlOH7EPortQaPFb6uI7R
 iwCs78wWoNK65Z0IegJ9oiGtPSyyJ9s2ScA6AwRGP5cXBffnG2fUFIBJ4GFaxwND2GM/
 MdqNC7N3KuxiTOsWChmhEqM/GN5W7GQx+jlUXfzUCkRgPeBs2olVFLCo6LZjoRBWmLfq
 HuGQ==
X-Gm-Message-State: AOAM532ymw4LFfOO8ly/aMHs7kCxxaLFelZ/ddyfeDoVjFV9+KncYGr9
 AcccsNVegM2kZ5eGsqWdUjX05LAaorMlpXUL0iKO6oxmYdK/pXGH+CVmnLNYEKmxE6Z+yu8WDIH
 aVaeRRRU0EcAZYN31S3b45eDKic3M3pg=
X-Received: by 2002:a25:cc0b:0:b0:648:4590:6cb6 with SMTP id
 l11-20020a25cc0b000000b0064845906cb6mr11521470ybf.87.1650968759636; 
 Tue, 26 Apr 2022 03:25:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD+UKzBJI/imUr03R4B81A3cNiJenG25UW4I6O1INSHE2T2sN0sLFrDxvcRu8VYIi7kMs2vwpXagXt/rXFZ18=
X-Received: by 2002:a25:cc0b:0:b0:648:4590:6cb6 with SMTP id
 l11-20020a25cc0b000000b0064845906cb6mr11521459ybf.87.1650968759448; Tue, 26
 Apr 2022 03:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-8-marcandre.lureau@redhat.com>
 <50da3bb2-6199-ea6d-99de-b70b708c3d84@redhat.com>
In-Reply-To: <50da3bb2-6199-ea6d-99de-b70b708c3d84@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Apr 2022 14:25:48 +0400
Message-ID: <CAMxuvazuqNRfL_Wi+QKpqgpBobq+2T_P1QuyZ-0+OtR6h-YOrg@mail.gmail.com>
Subject: Re: [PATCH v2 07/26] tests: make libqmp buildable for win32
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Apr 26, 2022 at 1:32 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 26/04/2022 11.26, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   tests/qtest/libqmp.h |  2 ++
> >   tests/qtest/libqmp.c | 37 +++++++++++++++++++++++++++++++------
> >   2 files changed, 33 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
> > index 94aa97328a17..772f18b73ba3 100644
> > --- a/tests/qtest/libqmp.h
> > +++ b/tests/qtest/libqmp.h
> > @@ -20,8 +20,10 @@
> >   #include "qapi/qmp/qdict.h"
> >
> >   QDict *qmp_fd_receive(int fd);
> > +#ifndef G_OS_WIN32
> >   void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
> >                         const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0=
);
> > +#endif
> >   void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(=
2, 0);
> >   void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
> >   void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3=
);
> > diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> > index 0358b8313dc4..5f451ebee796 100644
> > --- a/tests/qtest/libqmp.c
> > +++ b/tests/qtest/libqmp.c
> > @@ -15,9 +15,15 @@
> >    */
> >
> >   #include "qemu/osdep.h"
> > -
> >   #include "libqmp.h"
> >
> > +#include <unistd.h>
> > +#include <stdlib.h>
>
> unistd.h and stdlib.h should have been added by osdep.h already, so pleas=
e
> remove these two lines.

Right  (it will be part of the follow-up series, moving it to a
standalone project). Ack with that?


