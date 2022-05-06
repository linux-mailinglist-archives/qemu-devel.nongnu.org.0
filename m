Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D451D94E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:39:38 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyBF-0003Ru-G3
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmy94-0002Ux-0A
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:37:22 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmy92-00047x-8Z
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:37:21 -0400
Received: by mail-yb1-xb33.google.com with SMTP id y76so12930119ybe.1
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tk/62UHojl4WcUuI+Ck0n6zdMhCu06W5eG0T+3cgiX4=;
 b=FMtAFoDey05KyZkjzb+XrS385RrS2O29ya/ReCT24IFheQrz5C0rUvOXUoV54Spcg0
 5ll4fhXEIzR3DEw60JDH+eGsC1gr7aYhzpWra/tqvxfh5xWgx/q675JQrK8qH95hJp5g
 3PDw99AykTpf+dYfTvoVNvB1AA7yCdFUuXE5oHa/xIMDY1pWRuNvCmorFkRfkTTHRjvK
 rvv7iHMELBg0gqiOSmGYtg6zKelRqe7GzNzj1gji9uROA2YzlGK9Yn7XA95resddBbmc
 9uUNIqQ5MGzd+O7tJu9EVBAgxisD4qTxjgym41+GPQDrHKnZOYRJ59TvAWsu3yyuQa6T
 zpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tk/62UHojl4WcUuI+Ck0n6zdMhCu06W5eG0T+3cgiX4=;
 b=b32VbDkXYztdpbD/uRpDmkghnSUogYBMa3HRev9awZhZs1Xj9iKb3ftQLzmZmogHHT
 ny2ynB/bHupr/9iSKx+dI+gBV3sKUCpkwwpGm1xA1xCYzxPClXfzxza7pTKk/ZKER2AZ
 4RAxEJ0cHmaETbS5Ti/j/9fLM5fVVoWXVrEcJodDULPZfSfvuqMkYesqBCgsx9QYzQhA
 c50E8frCnzpuYedOy1bp6BCVHmCqpFWoFO+qTjRV+xTdW4JWH/fQFhfrB1XMzRjVSTtD
 WeVlA8CvMVxFHd9sey1yIUvnamNElODMJqnkNPFKBiD7mboYuz3Pk36460aA8tFV71C4
 oFFg==
X-Gm-Message-State: AOAM530JEoMwyWbjZg9ABQP2QMuVQzj0zrcvHPI0aUhffLVt2nKE+rwl
 UXSEuAOkIS5ZQShBo6N61TmvDuEzdzuYLYWITLgDoQ==
X-Google-Smtp-Source: ABdhPJwIbAQGLHB21aMZKNZc6mxACjD5OeCwikNcxyPyu2cugIu6vC9lthEYXKyKZAWlu9q369CV0VwlArwuHznEwj0=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr2201119ybg.140.1651844238690; Fri, 06
 May 2022 06:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220427172952.2986839-1-kraxel@redhat.com>
 <20220427172952.2986839-4-kraxel@redhat.com>
In-Reply-To: <20220427172952.2986839-4-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 14:37:07 +0100
Message-ID: <CAFEAcA_9+1h2rBKfyvcJ5AHnisW_+WFM8ZK5jCErfvNTBk3OzQ@mail.gmail.com>
Subject: Re: [PULL 3/9] Added parameter to take screenshot with screendump as
 PNG
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Kshitij Suri <kshitij.suri@nutanix.com>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 18:33, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: Kshitij Suri <kshitij.suri@nutanix.com>
>
> Currently screendump only supports PPM format, which is un-compressed. Ad=
ded
> a "format" parameter to QMP and HMP screendump command to support PNG ima=
ge
> capture using libpng.
>
> QMP example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
>
> HMP example usage:
> screendump /tmp/image -f png
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Message-Id: <20220408071336.99839-3-kshitij.suri@nutanix.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

This change seems to have broken building the system emulator
with --disable-vnc unless I also add --disable-png. Specifically:

> diff --git a/ui/console.c b/ui/console.c
> index 1752f2ec8897..15d0f6affd4c 100644
> --- a/ui/console.c
> +++ b/ui/console.c

> +    png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                      NULL, NULL);

ui/console.c now makes calls to functions from libpng, but
the commit didn't do anything in ui/meson.build to tell
the build system that this object file must now be linked
with libpng. Because vnc *does* correctly state its dependency
on libpng, builds that happen to include vnc will link OK
by accident, but builds without vnc will fail:

$ mkdir build/tst
$ (cd build/tst && ../../configure --target-list=3Di386-softmmu
--disable-tools --disable-vnc --enable-debug)
$ make -C build/tst -j8
[...]
/usr/bin/ld: libcommon.fa.p/ui_console.c.o: undefined reference to
symbol 'png_init_io@@PNG16_0'
/usr/bin/ld: /usr/lib/x86_64-linux-gnu/libpng16.so.16: error adding
symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

thanks
-- PMM

