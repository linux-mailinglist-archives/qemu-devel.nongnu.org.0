Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B88661024
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 16:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEBYx-00038G-Rf; Sat, 07 Jan 2023 10:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEBYv-00037J-4Z; Sat, 07 Jan 2023 10:56:49 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEBYt-0001MQ-LA; Sat, 07 Jan 2023 10:56:48 -0500
Received: by mail-ed1-x533.google.com with SMTP id c34so6295238edf.0;
 Sat, 07 Jan 2023 07:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RvfRUzjthLXddsXQvHVsBIgnCwlCTjah2T7aWa1s2kw=;
 b=RIsxzeRG7ym3X4JcHhS61j7xSXIsgv5GK81KcDdOJJ169i0YvlKEPZ/GPcXVmXYsBP
 3zMvGICcG2jiPcKOKSrQeZ3Zgn7mBYAcsdo9L+hShTz9HFT9IVfLprFxzRJojPI+Kgcy
 CBXxVQiP/GtFSyhPO3hJwOlHrgjjBMZZ8wtUJI4Mh57o6/aBLjN0z2K3whtK5q3rYA8V
 j106NXSwv7mTzzcTkFRk3xy61l5aCXpXqwPs1PG8Cq67RBRcV7FMacP0bd05oVlGOA1y
 SUZ9OmBmRjeml58XVqReO9pIda+Mf5P1QUFHKdStURRUKEr+XWOLgJPsjUD18cpvKWIU
 F6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RvfRUzjthLXddsXQvHVsBIgnCwlCTjah2T7aWa1s2kw=;
 b=0TR8mLFjQ13SVNOH2hK/drERFdCdiYfHQlWhNN1oB9gE/DZeCcIKKIhBM0jkmiipPj
 UU9ZQ7up1YvwyLtIQT1a+QZDr5RaWb/+okA3QfYvlMI/PtbnpAbUIn5f01uwLEJz31RM
 JsjytAJ2mI7OZ2i0v3Dhe/u+oAOEePB2xMxtFjdNChj2ZoSmaa30DWwVitfjNfWxpryJ
 BGcKGfExYxGMFpywvQrL0O9t0NvKWrq63WEIIAFXveoeU1D709Bh0hE43bpcNTh0il3P
 cTarMZTFZCN7efLN3tOQ4Vn0A1fOhtRxxxSOqFzWyF0ftjwaq4vfcW2HDvttC5Ztichn
 MWXQ==
X-Gm-Message-State: AFqh2kpkZxjuS93rKv+Zt7WpU+58NKYy2HYzq/7Gp3TiqfIOE0Xba2HS
 P+0Zp5/nKC7sSAN94DskBibIkRdAqNbYOKBqQDQ=
X-Google-Smtp-Source: AMrXdXvTXNWWQqGpFrv8Wz/3JE6oGOS0eD28z9lfiVnCZFynQ3Yl2Vs1QgXCnoJ8x79XMkEk3opl0//NtzzF4JWBtCs=
X-Received: by 2002:a05:6402:1394:b0:48a:eac7:2b9f with SMTP id
 b20-20020a056402139400b0048aeac72b9fmr2670310edv.91.1673107005405; Sat, 07
 Jan 2023 07:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
In-Reply-To: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 7 Jan 2023 23:56:34 +0800
Message-ID: <CAEUhbmUxfow6JQq3P1CpKNcZehA6dQ+EOYYoMvymxOVk_t0_5Q@mail.gmail.com>
Subject: Re: [PATCH] Windows installer: keep dependency cache
To: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Cc: sw@weilnetz.de, jsnow@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
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

On Wed, Jan 4, 2023 at 6:54 AM Arthur Sengileyev
<arthur.sengileyev@gmail.com> wrote:
>
> It should be possible to reuse cache built by previous iteration
> processing next executables. Already processed dependencies are

s/processing/to process

> already skipped later based on dll name.
>
> Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
> ---
>  scripts/nsis.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 03ed7608a2..a2e52df556 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -91,12 +91,13 @@ def main():
>          print("Searching '%s' for the dependent dlls ..." % search_path)
>          dlldir = os.path.join(destdir + prefix, "dll")
>          os.mkdir(dlldir)
> +        depscache = set()

nits: I would use deps_cache as the name

>
>          for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>              signcode(exe)
>
>              # find all dll dependencies
> -            deps = set(find_deps(exe, search_path, set()))
> +            deps = set(find_deps(exe, search_path, depscache))
>              deps.remove(exe)
>
>              # copy all dlls to the DLLDIR
> --

Otherwise LGTM
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

