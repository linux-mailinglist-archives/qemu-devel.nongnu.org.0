Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C6626F4A
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 12:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouBD3-0007Or-MH; Sun, 13 Nov 2022 06:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouBD1-0007ON-PZ
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 06:31:31 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouBD0-000115-9K
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 06:31:31 -0500
Received: by mail-yb1-xb29.google.com with SMTP id b131so9809069yba.11
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 03:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJnPxMPDc1EYFaYKwnp3Ke9/sH986XpvODnaexHyXUk=;
 b=FRsB89+8wI270p31WJSjTFbW43iDuILACS5urdi++jFD4xzMYKIidVy53Wm903j9SG
 zYSBirLzdfnCECcg7Z+1nII2PD1/9EH3Llz+eceFVxSya9or89ox4OuPQsdDartDjjya
 tPJlbLkKYP5jsgeZqo9QdFvtuqwq0zI7MoYl2N+62TDzenbg0t4HwfXdLuEfXIfIaoBx
 7ZONAQ6oJY5Urm77YPISGsQsH3OCxBRUXJwbsWBD0T1fmNEJLTcIUEZ27hsfHRONK+2f
 Kxq2CbapQZZZGbSmSTh+Fszm+itkP9ioF6Ex7AEg8YA03Ik4ySVmx9D5wpBxCap+L0Xj
 FTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJnPxMPDc1EYFaYKwnp3Ke9/sH986XpvODnaexHyXUk=;
 b=RvkcY7/OYiblH2bgOVixLW1/gWn0zrvFvDcx9LncCWFkT0U/8WirU3ZQ5hrmB+lhBl
 ZpY53JRRt6tVy5bjt5xCow7XKBVO4SI5aWmxr5hoXePvE+03G2/upRbBmqJddN97IO1s
 DH5gEba8Qucr5oc+mTzkoXG0cTXaZI2jQwoFUtDibxsUAqDYPCHB0JmvwzE/japAkRn8
 sJJjzHfpeA2JacjQIj9y9ncGCJw/mgcHlKm+jd/Woytt9/FiCt1Z1xB8QBbH/j/GJLvU
 3bEuSW2ydOZEAbuHNIpJfcQwM1JpPUJgk9g3Dg+gzkkX+Ct/b7x0OzEiQOVbVYlzxL0v
 pbJQ==
X-Gm-Message-State: ANoB5plk7MpeLfaPTStr16DxukH7MUUmTdZNF171x2ZJXmEmImdryCFj
 b1QOQ5+2NqLu86csDvLzWMjtxOaTxxA3HaeH4YU=
X-Google-Smtp-Source: AA0mqf4wJSo0PJ1RdQpVMK6OItALo3tBxZk3ZS48UxqI0d+iRh17dDv7AuVm5suSo/bH7D2xT3z5ytwSIFw0FAIysCY=
X-Received: by 2002:a25:d2c3:0:b0:6dc:e3ee:3e60 with SMTP id
 j186-20020a25d2c3000000b006dce3ee3e60mr8521349ybg.58.1668339089006; Sun, 13
 Nov 2022 03:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20221111124550.35753-1-philmd@linaro.org>
In-Reply-To: <20221111124550.35753-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 13 Nov 2022 06:31:17 -0500
Message-ID: <CAJSP0QXBi=gRjecKaPQhQk+Q_70CDGimKkFZVRYwz+v2EW4c4g@mail.gmail.com>
Subject: Re: [PATCH-for-7.2 v2] libvduse: Avoid warning about dangerous use of
 strncpy()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Xie Yongji <xieyongji@bytedance.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 11 Nov 2022 at 07:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> GCC 8 added a -Wstringop-truncation warning:
>
>   The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
>   bug 81117 is specifically intended to highlight likely unintended
>   uses of the strncpy function that truncate the terminating NUL
>   character from the source string.
>
> Here the next line indeed unconditionally zeroes the last byte, but
> 1/ the buffer has been calloc'd, so we don't need to add an extra
> byte, and 2/ we called vduse_name_is_invalid() which checked the
> string length, so we can simply call strcpy().
>
> This fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:
>
>   [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.=
c.o
>   FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
>   cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libvdu=
se -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.p/=
libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
>   In file included from /usr/include/string.h:495,
>                    from ../../subprojects/libvduse/libvduse.c:24:
>   In function =E2=80=98strncpy=E2=80=99,
>       inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../../subproject=
s/libvduse/libvduse.c:1312:5:
>   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: =
=E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destination =
size [-Werror=3Dstringop-truncation]
>     106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (=
__dest));
>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>   cc1: all warnings being treated as errors
>   ninja: build stopped: cannot make progress due to previous errors.
>
> Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Supersedes: <20220919192306.52729-1-f4bug@amsat.org>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> ---
>  subprojects/libvduse/libvduse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to qemu.git/master.

Thanks,
Stefan

