Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5F60D88F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 02:48:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onUXN-0003wi-6A; Tue, 25 Oct 2022 20:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1onUXI-0003jV-JL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:44:48 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1onUXG-0002lN-Uc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:44:48 -0400
Received: by mail-qk1-x735.google.com with SMTP id s17so9476531qkj.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6T+Nl7cyBwXv0OViZ4jdzNNLcQzTEArslmFKclrTZQ=;
 b=GvroCbMGSwnYzb8OpSXsYX2S/Z5dx7OQttj37kEPg6qfWHLlKS/YNBS38Mnot2nVNX
 Hiwtqi3Zm+IVxUZ624AmADjF10bWkZZvCdHYCn8OmZ+Us6AsSymdGYn+gGjIT/nuzVvM
 LGD2KWQQJVGaUKHmsKJtRbNra1FEoZ45ZFpAJj1ZiPysoff4ItU3luYy3G203/zEOY+h
 u/IV9VY6zngLpv07c+Zos+uld8RVQ7Ki6XerxWfCOMxulLTUCcyI0mRVHTLkEKNwj8xN
 cf6XN4disgkp4RRLK1CEWDacoYZf6AJEFUFauZoT8foN8ptvdWO6PsLRpxeVIBrOwgx3
 DEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B6T+Nl7cyBwXv0OViZ4jdzNNLcQzTEArslmFKclrTZQ=;
 b=dG7nTpLepMHzKc4xKuw9wunz/xxkaSRBRlMJJxv0iEVfbUftl+olLtRP8AR1Xb05IO
 yNQf+QnojtYEvam6jvs8XkF2yMIpNzuH3hpAALMZcDyy0ewMcnt8vE9ycUKKGbwz3j7/
 0lR4D5k5XHszK+3saT3NOMQMdG4/3vwS6WiBblnBYhIdkOeaW/BjuawonT3lm35yjimW
 Vjy4ecUeZqomHWTPiZQUU13rZ2qmg1NFI3kBs35mcMXMQQmllTV7rbOoXzscc+Lxauss
 ok0dlnBCqpvLnUUgwtxIwPvi2yRkYXL843efx0EAtCEtBvpW9WKt5S0w6vq5LSm/FTMU
 voGQ==
X-Gm-Message-State: ACrzQf0hIgfIiptjIS8xfrC2HTGxyoRUQkwFtSE6TslZPutsWsE8mPmk
 YUplqxlN/YBEVp2gOZqOCnDbZoSpDFR6jEmvMDQ=
X-Google-Smtp-Source: AMsMyM4vHz+qcvwGEgfY4agO0S2J6eU+BuUrwEmBhHbOQWiNIjp92j97Mv/lA0MPoqIEXgkanNi9He6WzRfwXdl59IA=
X-Received: by 2002:a05:620a:19a6:b0:6ee:d3d6:6b03 with SMTP id
 bm38-20020a05620a19a600b006eed3d66b03mr28353103qkb.376.1666745086076; Tue, 25
 Oct 2022 17:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-5-bmeng.cn@gmail.com>
 <19172ac9-519c-2a32-9336-7d92aaea05f8@linaro.org>
In-Reply-To: <19172ac9-519c-2a32-9336-7d92aaea05f8@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 26 Oct 2022 08:44:35 +0800
Message-ID: <CAEUhbmWYdYL6v3V_3jPAvW8RTCmWxYFK9jiVk1A89oz=+kkbdA@mail.gmail.com>
Subject: Re: [PATCH v5 04/18] tests/qtest: migration-test: Avoid using
 hardcoded /tmp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x735.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26, 2022 at 7:44 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 01:19, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This case was written to use hardcoded /tmp directory for temporary
> > files. Update to use g_dir_make_tmp() for a portable implementation.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > Changes in v5:
> > - Use g_autoptr(GError)
> >
> > Changes in v4:
> > - Update the error reporting by using the GError "error" argument
> >    of g_dir_make_tmp()
> > - Remove the const from tmpfs declaration
> >
> > Changes in v3:
> > - Split to a separate patch
>
> This patch breaks with gcc 12:

Weird GCC ...

GCC 9 reported [1], but not GCC 11, and now GCC 12 reported again.

>
>
> > @@ -2479,9 +2479,10 @@ int main(int argc, char **argv)
> >           return g_test_run();
> >       }
> >
> > -    tmpfs =3D g_mkdtemp(template);
> > +    tmpfs =3D g_dir_make_tmp("migration-test-XXXXXX", &err);
> >       if (!tmpfs) {
> > -        g_test_message("g_mkdtemp on path (%s): %s", template, strerro=
r(errno));
> > +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> > +                       err->message);
> >       }
> >       g_assert(tmpfs);
> >
>
> ../src/tests/qtest/migration-test.c: In function =E2=80=98main=E2=80=99:
> ../src/tests/qtest/migration-test.c:2484:49: error: =E2=80=98%s=E2=80=99 =
directive argument is null
> [-Werror=3Dformat-overflow=3D]
>   2484 |         g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
>        |                                                 ^~
>
> The compiler correctly notices that tmpfs was tested and found to be null=
, but tried to
> print it anyway.
>

Patch [1] already queued in qemu-trivial

[1] http://patchwork.ozlabs.org/project/qemu-devel/patch/20221017132023.222=
8641-1-bmeng.cn@gmail.com/

Regards,
Bin

