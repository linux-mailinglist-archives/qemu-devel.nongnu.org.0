Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7791679DAF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 16:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKLNS-0000t7-LZ; Tue, 24 Jan 2023 10:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKLNH-0000si-9A
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 10:38:16 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKLND-0006d0-R8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 10:38:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so11956739pji.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kAqPXPYtWTPR1Aw+FnY0fnoJ9iamxDsZFRy8Jo0758E=;
 b=fmlGh2ApyJaL8ruzDhO1cq1VjYQlMRJCF9+zBWydhp8uAKSRQRiW5yWlpPZJSjS6XV
 XvI+tJ4H75GF6/fgsv5vVjwr58715y5re3G+jpFWH8zAAJ0jsc8AqDltMtys8qL/hECO
 EJf3uoEfCtLhCbafFhtqoU0jFqFjk1ulDSPc4RgDwWV6mJ0EuSLfh7F5xIKay1XNsW8L
 QTVJPjOYIUluywOg9BZ2+a+DqwSTdLPHrW+0mm+0/B7XXUv5PM21OdXBgO5fKAlXdqtW
 KSHpW3Q0QqEdLbq9ClRjLWuAozdzLmt1APNxdI+dXGQUALflCsAPirqIHZi5k9gxCUZK
 99dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kAqPXPYtWTPR1Aw+FnY0fnoJ9iamxDsZFRy8Jo0758E=;
 b=cOF4Obw2HeuNCjrpKtZRXrdQQOOOIebSQVuYweyJToYqXueJTaVroXsDPphJhyTm6f
 tpWlMjSVzN4waz/KtHZfW39Ni2uc/L3oRSkZi4NMkJ0bz04D+Bo5Sm3FxyKhRrOtqmku
 sXN27XtqGMZpL6co5Wh6jGE943EsJCfQ0ShxsE3qzTiuDuLxxI2+Gc6g4JqJ0iDKTW+B
 NwDjvLU1WEwyQFA1aw+LaCWSPKPePycoVH8tB99S6lbnVNZIpSfIZglq+HgUL0WUmZz3
 U3iY9BxxFYrzvXJjB+eK0zzya3OjAO7+8TkxfDLlQIq3gBC8e1UUthXGUDWBAXjkcqXK
 iF4g==
X-Gm-Message-State: AFqh2kpnnK42MEDyNKZHDD08xZ8KDXAbZMfT5SPVlgxCbTF0l6ukUrhI
 HoYTsaq8x+mNX4UqoRVpWk1ThdYhKaltokMvKSiQGg==
X-Google-Smtp-Source: AMrXdXtqMXSQ6tJI0odbebi7BR/cSNSu6E7UmZMcnWmLsaZw7r6SkOO0DuHeCny24Y/Stcz40OxpuVxv+IT5yWD0CzM=
X-Received: by 2002:a17:90a:53e4:b0:22b:b025:38ed with SMTP id
 y91-20020a17090a53e400b0022bb02538edmr1956524pjh.19.1674574689930; Tue, 24
 Jan 2023 07:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20230124112157.37437-1-kwolf@redhat.com>
In-Reply-To: <20230124112157.37437-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 15:37:58 +0000
Message-ID: <CAFEAcA_UUHxrW31V_KXtCBCAEhgU+enBOUE3Q0wZXTULsaW+AQ@mail.gmail.com>
Subject: Re: [PULL v2 00/38] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 24 Jan 2023 at 11:22, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 00b1faea41d283e931256aa78aa975a369ec3ae6:
>
>   Merge tag 'pull-target-arm-20230123' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-23 13:40:28 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 19a9c20a68f47b133e7bc8da789f2b21831fb9b0:
>
>   qemu-img: Change info key names for protocol nodes (2023-01-24 12:09:26 +0100)
>
> v2:
> - Rebased to resolve merge conflicts in coroutine.h
>
> ----------------------------------------------------------------
> Block layer patches
>
> - qemu-img info: Show protocol-level information
> - Move more functions to coroutines
> - Make coroutine annotations ready for static analysis
> - qemu-img: Fix exit code for errors closing the image
> - qcow2 bitmaps: Fix theoretical corruption in error path
> - pflash: Only load non-zero parts of backend image to save memory
> - Code cleanup and test case improvements
>
> ----------------------------------------------------------------

Hi; this fails to compile/warns on the BSDs:
https://gitlab.com/qemu-project/qemu/-/jobs/3652646535

../block/file-posix.c:3098:19: error: unused variable 's'
[-Werror,-Wunused-variable]
BDRVRawState *s = bs->opaque;
^
1 error generated.

thanks
-- PMM

