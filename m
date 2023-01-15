Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42F66B1FF
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH4kj-0003Gh-1I; Sun, 15 Jan 2023 10:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pH4ke-0003Fn-6q; Sun, 15 Jan 2023 10:16:52 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pH4kc-0003gs-HO; Sun, 15 Jan 2023 10:16:51 -0500
Received: by mail-ed1-x52e.google.com with SMTP id x10so34735303edd.10;
 Sun, 15 Jan 2023 07:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0kQTxjhe2QsuwMEpdSBpZ/e+3rJmR/hA3tmVAJedXyU=;
 b=SsHpL1hfYAXHtRGHS516+mZgsei0cMGOAUJcfVuDMJ9PiuOpvaWRPi00eu0T/W488l
 kEvMlzCwRuPzaHLpBHM4daXqkfoGgxixhrKDWOSokr/qdMoUzf0PJ21TU8xVp64qcVld
 mk0EL65TFBoW1IVMEY7StKjbkhDm4gCaHW+RwdIZhJEwi0lKDN2JOX3fGGz6cn2LUn8o
 nIOSO7YGCfiIBJx8MLgs0iblbjGKirEWR4Nj+xCVDgjUGUH8LEszHLZLijPQIUFMHb0z
 SchfRllS/1AM+PVGqRgVOh8FMANYvL9E/Y9+sB30Lt860CIHlkFFE7WcqmacqznfhAOt
 aERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0kQTxjhe2QsuwMEpdSBpZ/e+3rJmR/hA3tmVAJedXyU=;
 b=6vK38sB+uAT+c4/u3O3EEaMmW6C1rMPSNzcc2++z3PJm61ReuLHjXV98kLIojdSaBI
 JoLzV+kL8osd+crukvUJJ6vEpxtoXkWZwm/fZo2abS9ZpoMCmD2A+jeKMENEhuNf/uQO
 JWTKI4duBv+TL9X/sH6ZrVohaWV7XiACK5jcf02LJmpGm4XR0cSCb1izD8+dFGcl2QZL
 rjjh3+qf/jYVF63JWu1NHWIGAafr6EX64HzN/eMWkZGjVQAwefVrenI4iKL5A4mM7nWn
 FtH31xeEknYh4asasB/OY02ffJKMmkXqLjIAcYfVfKxXKDkuHUJ/REzWOCS2RuouPBdW
 zxOA==
X-Gm-Message-State: AFqh2kq6nQwilOac3WAoF3zB4QW9U2q3rwsvLvyYvjNBLgG1w+fH9LWw
 nZMnNSpwqN+195liYo8mCj0aAvnSMgpunFy7sZw=
X-Google-Smtp-Source: AMrXdXu4V+oZXYJgc59LeJixNtINYpnEJXTFx4TUivtOU/efKW5DOIxWkxb+YpxLQY/ekPJhPZ3kzuDOSBnQuHtJ/kI=
X-Received: by 2002:aa7:d80f:0:b0:499:dfa:1c6b with SMTP id
 v15-20020aa7d80f000000b004990dfa1c6bmr3528007edq.202.1673795808286; Sun, 15
 Jan 2023 07:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20230114184003.76193-1-arthur.sengileyev@gmail.com>
In-Reply-To: <20230114184003.76193-1-arthur.sengileyev@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 15 Jan 2023 23:16:36 +0800
Message-ID: <CAEUhbmVYWu2oH0w2iLBncxrVgh2uBRoQQkiV83bCkrN9q7AnfQ@mail.gmail.com>
Subject: Re: [PATCH v2] Windows installer: keep dependency cache
To: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Cc: sw@weilnetz.de, jsnow@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
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

On Sun, Jan 15, 2023 at 2:40 AM Arthur Sengileyev
<arthur.sengileyev@gmail.com> wrote:
>
> It should be possible to reuse cache built by previous iteration
> to process next executables. Processed dependencies are already
> skipped later based on dll name.
>
> Changes for v2:
> (1) changed variable name
> (2) changed wording in description

The changelog should not be in the commit message.

>
> Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  scripts/nsis.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 03ed7608a2..7cffba70ff 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -91,12 +91,13 @@ def main():
>          print("Searching '%s' for the dependent dlls ..." % search_path)
>          dlldir = os.path.join(destdir + prefix, "dll")
>          os.mkdir(dlldir)
> +        deps_cache = set()
>
>          for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>              signcode(exe)
>
>              # find all dll dependencies
> -            deps = set(find_deps(exe, search_path, set()))
> +            deps = set(find_deps(exe, search_path, deps_cache))
>              deps.remove(exe)
>
>              # copy all dlls to the DLLDIR
> --

Regards,
Bin

