Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F75BEC1C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:36:54 +0200 (CEST)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahAz-0007Tw-2T
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1oadQh-00058n-IE
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:36:52 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1oadQb-0004uT-EJ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:36:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id r18so6145276eja.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=k8DiByaDu9Du/V6017bE7jU6tByqBR7kuzhfvzi0/rY=;
 b=YBTE7KxKhuSbgerwVZfFWgTeRJwT+8/qb2g/oG5f27JQsVOk1Gv+emj4qbXOMv3xuI
 a6LLhvM/qFJNIJ6X/MFwNgMq0ccN5U3f6unUgrCUyVhgGEGMd5nJY7saNbE3D7kVpmJ4
 cRuJnu3T9ooYtwA5eYNOQZFA12eGqJ8u5ccrIXXR/VXTAWz+8Y/s334CfYB1KmOtUGaK
 nFj+zI8xqY1CeFohaDg/DBkMj5Qye/gt4LgcFHKtGBeofYjQ9vYGDKAo9lIFDTRzvPwj
 UA+z6pEHX0agoA3jLwQGgc0gedk9tmhHMhazLS4aeo7Zy0qtImMCbISUz3jnWJOZgxkm
 dW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k8DiByaDu9Du/V6017bE7jU6tByqBR7kuzhfvzi0/rY=;
 b=gCrcS+OMTovcoWwTHW/5O2g4LlQcErrFDyicPmW0A9gPot8XREESdpYJFKQwrtrN1R
 mLXSCfmRcUnLLee3EJszsdzxAHPUTI1QqD4FelaRwI7z87gpG1Koxp7g+EUZgk4dENQO
 lU9ypxx5oiZ/4oXmtPSJAuF1ZowYUDguWWCiZtvI4VBPml+7ANvcpeaV6m9VKuAmikGz
 aVLDGbgGYq81FVWSpvt5tK2HSObt6gVdQUBOvK7LRv84HFFNlGbbcKp+0Fij3wBkOL2P
 JtG3uIeRqWxBqhWgNKYss4yeeyain7MsSuLMVdQHSYeVva8xS2/emk0woBBI6sif94Uo
 HQqg==
X-Gm-Message-State: ACrzQf08vZC7OM2TWOjaSJweSlScLX9qBTMD/YtQ3PEG77QHwEXVLeQL
 JUNBC9yGuGIJ4NdhNEmKI4iuauPOq72wCmuGvizWJcPZFA==
X-Google-Smtp-Source: AMsMyM5i4craUDjJKpn9bnE7zei0+Jc3+G+zOO/bGOx/Vs7KBBCJwUJQYVTTw9lfWapQT/fzxh8FcdoVWguFpg/Jd34=
X-Received: by 2002:a17:907:1b12:b0:72f:9b44:f9e with SMTP id
 mp18-20020a1709071b1200b0072f9b440f9emr16922683ejc.653.1663681001949; Tue, 20
 Sep 2022 06:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220919192306.52729-1-f4bug@amsat.org>
 <87k05yxp7p.fsf@pond.sub.org>
In-Reply-To: <87k05yxp7p.fsf@pond.sub.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 20 Sep 2022 21:36:30 +0800
Message-ID: <CACycT3sqE+_JNv0k4we7TyLS-JJx_hGhRCfKpe1JMLgCw_x+PA@mail.gmail.com>
Subject: Re: [RFC PATCH] libvduse: Do not truncate terminating NUL character
 with strncpy()
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 7:25 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > GCC 8 added a -Wstringop-truncation warning:
> >
> >   The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
> >   bug 81117 is specifically intended to highlight likely unintended
> >   uses of the strncpy function that truncate the terminating NUL
> >   character from the source string.
> >
> > Here the next line indeed unconditionally zeroes the last byte, so
> > we can call strncpy() on the buffer size less the last byte.
>
> Actually, the buffer is all zero to begin with, so we could do this even
> without the next line's assignment.
>

Yes, I think we can remove the next line's assignment.

> >                                                              This
> > fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:
> >
> >   [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvdus=
e.c.o
> >   FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
> >   cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libv=
duse -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.=
p/libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
> >   In file included from /usr/include/string.h:495,
> >                    from ../../subprojects/libvduse/libvduse.c:24:
> >   In function =E2=80=98strncpy=E2=80=99,
> >       inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../../subproje=
cts/libvduse/libvduse.c:1312:5:
> >   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: =
=E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destination =
size [-Werror=3Dstringop-truncation]
> >     106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos=
 (__dest));
> >         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> >   cc1: all warnings being treated as errors
> >   ninja: build stopped: cannot make progress due to previous errors.
> >
> > Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The subject feels a bit too alarming to me.  This patch suppresses a
> warning, no less, no more.  Behavior doesn't change.  Perhaps
>
>     libvduse: Avoid warning about dangerous use of strncpy()
>
> > ---
> > Cc: Xie Yongji <xieyongji@bytedance.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> >
> > RFC: Any better idea? We can't use strpadcpy() because libvduse
> > doesn't depend on QEMU.
>
> There's no need for padding: the destination calloc'ed.  So, pstrcpy()
> would do, but it's just as unavailable.  Can we use GLib?  There's
> g_strlcpy().
>
> Outside this patch's scope: is silent truncation what we want?
>

Actually silent truncation would not happen since we called
vduse_name_is_invalid() before.

static inline bool vduse_name_is_invalid(const char *name)
{
    return strlen(name) >=3D VDUSE_NAME_MAX || strstr(name, "..");
}

Thanks,
Yongji

