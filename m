Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77782E877C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 14:27:44 +0100 (CET)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvgwZ-00035t-Mk
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 08:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvguJ-0002Po-2o
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:25:23 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvguG-0003Xk-I3
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:25:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id g24so22155472edw.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C7pIaNgW+iHZ5anVt66RQzXcltVlE6J+x7M9S0DBSEU=;
 b=iE8D5SP2or0152G9bvOTCTE7EnMfyvady8dJyt+nxMi3rZeSV/80NkU9W96bMoovRL
 UEmv1GppN0fUiY2rdZ/E1emJLzPHR7iaojATHybx7Alqydlvz1ZOQXbeH6j+R2/bPzQo
 8VqmU2KtPumiWPqBxALadHg3OefsWZDug723lOiutej1o5tAESHcbB9JSfX/6dp1XzWY
 SXg+2Otr8xNjet2XYfzFz1518SYZH9WSQHXEz2K988td0xzw41drQ11qut2AR7U7wbAS
 eFFc2AGco15jvviq7QbNN2AxqHqIcZRxoE3lxd47ha/HRDH2LlisX54stFI4VrrWoguL
 DEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C7pIaNgW+iHZ5anVt66RQzXcltVlE6J+x7M9S0DBSEU=;
 b=dh76LHI15pBj5qYcy9MDxX+rS2B6xm116NEgOSkEC3D/3M4qdKOmfyfd1q6yI6zMon
 g+qf3j1Zf8lrejbwSbXFELBNym0BcEG1GYKJCJZtVe7iAn51mkZKQiiaOGXqf2qPKm3h
 R630PDsu0SQ6bWpaRSwkhIsKIfc2CnjELWt9yc1jr8M5DB1M4DWQvciSynfJp0TMbMMQ
 iQAo7dHSHx4+f9d62+sva35AxiKzc/YNTRUVtEQvL+N4UC5wfZ8i33Zf8MegXtPF8Qx1
 G/I8ahJOYFsV9zf612lLDxjDR3xiYD5+mgpWksmRvsurziyyqXchUQEdwVbLY4588/LD
 SkDw==
X-Gm-Message-State: AOAM531PI57qkB5RH0Fj7nn/lprzy2m2Fpb6iF7yyBle0QRkugyxEjTy
 xYV6iNpmHlNWwF+da0RrpDdzB+E7cVE0e15unhkwVQ==
X-Google-Smtp-Source: ABdhPJwZo5wgCvYNg3LYI9ez5rzVGLMO+j57UKG3JLbLPenGssRbgB2f5Jk4AUIXD7pozag3zCQCVf2k5HvZsbuw5Wk=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr62088817edv.100.1609593918619; 
 Sat, 02 Jan 2021 05:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
In-Reply-To: <20210102125213.41279-1-r.bolshakov@yadro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jan 2021 13:25:07 +0000
Message-ID: <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Jan 2021 at 12:54, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> crypto/tlscreds.h includes GnuTLS headers if CONFIG_GNUTLS is set, but
> GNUTLS_CFLAGS, that describe include path, are not propagated
> transitively to all users of crypto and build fails if GnuTLS headers
> reside in non-standard directory (which is a case for homebrew on Apple
> Silicon).
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>

Ah, this is https://bugs.launchpad.net/qemu/+bug/1909256
-- thanks for finding a fix.

> ---
>  block/meson.build          | 2 +-
>  io/meson.build             | 2 +-
>  meson.build                | 5 +++--
>  storage-daemon/meson.build | 2 +-
>  tests/meson.build          | 6 +++---
>  ui/meson.build             | 2 +-
>  6 files changed, 10 insertions(+), 9 deletions(-)

> diff --git a/ui/meson.build b/ui/meson.build
> index 013258a01c..e6655c94a6 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -29,7 +29,7 @@ vnc_ss.add(files(
>    'vnc-ws.c',
>    'vnc-jobs.c',
>  ))
> -vnc_ss.add(zlib, png, jpeg)
> +vnc_ss.add(zlib, png, jpeg, gnutls)
>  vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
>  softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
>  softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))

Question to Paolo -- it seems pretty fragile to have to explicitly
list "these source files need these extra CFLAGS" in half a dozen
meson.build files, because it's pretty non-obvious that adding
eg '#include "block/nbd.h"' to a .c file means that you also
need to update the meson.build file to say "and now it needs these
extra CFLAGS". Isn't there some way we can just have the CFLAGS
added more globally so that if we use gnutls.h directly or
indirectly from more .c files in future it Just Works ?

If the build failed for the common Linux case then it would be
at least more obvious that you needed to update the meson.build
files. I think it's better to avoid "you need to do this special
thing that you'll only notice you're missing if you happen to test
on a somewhat obscure host configuration" where we can.

(We don't want to link helper binaries etc against gnutls if
they don't need it, but that's LDFLAGS, not CFLAGS.)

thanks
-- PMM

