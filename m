Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F233D6267D9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 08:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otlKl-00051X-IM; Sat, 12 Nov 2022 02:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1otlKg-00050z-Gr
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:53:42 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1otlKc-0007SJ-8A
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:53:40 -0500
Received: by mail-ej1-x631.google.com with SMTP id y14so17207846ejd.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 23:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8QonaILVi/MyRJJUYxZtIVkoO4+8psGEIeZkHRY2Jz4=;
 b=DKPbE/acPcpin8bxXRvNeYGC6rqItYTFdCHRGaCFp5tHS/LzKLoSITrL/0C8Lv92g7
 8xXfmpzfK0Nj9OzzyhH37yton4cO3XXsjY++1tJZh705fHUJ+cGWooDn1z8OVNtc6Jcu
 v1guwBwNcqxx0SQHGoP9QAT/x+S0Yy5CakgF/W/a344PrrtSwoqJIICC/er/xuix8l1w
 fB+GQnFABBgO1FzlrqRq5thoHAKa6ok47gcHMq9QlONE4ndR8AgeY7/5C9GsuN0zzNu7
 C2CRWzcRe3tLFqN4CsWHuUBUW7LiVsWb/mJzcXTiAn2EiHsHDy1fISkxhBVI3nDQMxD0
 ywBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QonaILVi/MyRJJUYxZtIVkoO4+8psGEIeZkHRY2Jz4=;
 b=HponK4VrmxWO4g+yrOwpskSZDDAL3fTFXZ5QRFBl2qT67zOYMVRXbBZJ84OI4KCL9c
 3KpmAmrM+S3aXIIhfjbkPtfltE70wp6JV7+EudXYtQls175tndEM5L3hOq6OF+v30Owc
 hgVdb5PH8XZLhBKKtCK9c3lrCWMm3MeOHG83iwtuj9mPT11soDf7U25mdSdWd+DzQcd1
 4dt0nwzrk3cCeCNWDFh36/tJwClqlwpH2ZJ8mMD8YuU7GvPELLjmipmniDtBIBiwf7Gr
 UOcSuQ8RHFdNncPWpvQabIyi+o7jEv+ar6CECOcz2K65iJ1lJ8nCPNwwO9JM6hcLVfHV
 uGQw==
X-Gm-Message-State: ANoB5pnbfUCtzqs9NGE+jjlJHDAWtj3y9bQlcOcHvjyCE2M8ytLRfA4p
 OzE0oUxeW4JvPtMI8URJ3WmQrXdIva4a9Oq4+riB
X-Google-Smtp-Source: AA0mqf6+IbChh7QVPBhPSeg6icSYRv7zPV8vwzbxpkuyABDs+8mXQwyy/SbeThPaTHKJA0qWjjY0ELTQzf7vsZO/jvQ=
X-Received: by 2002:a17:906:7ac6:b0:7ae:6746:f26b with SMTP id
 k6-20020a1709067ac600b007ae6746f26bmr4472659ejo.171.1668239612967; Fri, 11
 Nov 2022 23:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20221111124550.35753-1-philmd@linaro.org>
In-Reply-To: <20221111124550.35753-1-philmd@linaro.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Sat, 12 Nov 2022 15:53:22 +0800
Message-ID: <CACycT3s=6uYv2fotr46afh+WE+7N1NcDsRKpURV2RCbKuUoqcw@mail.gmail.com>
Subject: Re: [PATCH-for-7.2 v2] libvduse: Avoid warning about dangerous use of
 strncpy()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Nov 11, 2022 at 8:45 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
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
>

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>

