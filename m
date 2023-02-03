Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A8689C74
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxXP-0004m8-TP; Fri, 03 Feb 2023 09:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNxWp-0004DB-QV
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:59:04 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNxWf-0006WO-9T
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:58:54 -0500
Received: by mail-pl1-x635.google.com with SMTP id k13so5515365plg.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JcATyZ6j4tPoyUN8UKqz1lnXDOhVvWoyivrYpOhCkh8=;
 b=LEx+F+XCuazbGSduJzbVF0Rt3NdWRVxXG2+26QtY8YQ8UXF3m98Fyo5JPXROFmQgzK
 Qk7tBR4C6DkuRNrssOEgyBRCi12C1ebtjSAfCYwcmHBXbRwM7bfgfyCJMUVOzyEaDrIK
 82MpuC1E4ZRJLAb/WBQvjQ6Tqt3xZKlRk0wUj+F068Ogy1lECIbwT4RQ4wUr4nc99frm
 /p4yhY8wBjiqrgJFYRXh3elf/4pwyl/gfYVR6O2YB6hb/8t7Cgde90PY+q5rtw1vuLyF
 Azj40mOmYOpq6pdeDdf2S83aNP1GlD4X3ghP3/yhGeT0SxIMPh36gxXhhs4JZkdxNC1P
 J11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcATyZ6j4tPoyUN8UKqz1lnXDOhVvWoyivrYpOhCkh8=;
 b=SN+TmRRBsIPvKFbQv6/56JZ95TTPo1BRitJOPmigZ+m7z1GCq7hAJkpiS6bHb7SCtc
 g31VYMH95hKVGa6C7rpw+lQffH5Za+FKa3xJanvA9a2yXudngpq9mYcxgR31zG3U+ibW
 0WkzjbMjKQ68b2kpszaGw6MRPhxGh3Q5WhtKs9rNPtymKA8WHpl32ual1rXxhtwR6cer
 ghpvHyqUjWasy7UpDHX3GKU8VHGLYzVLfbAsWXuajCzRZR2MjmQNzc2XSzeZjauHU1Sp
 7zwojHYfmXxp9b168pV07n16E9+HTHEGU0jSbZt7JWVPBoF8nnd0Sk4g8CB2FXB8oe+w
 ZxUg==
X-Gm-Message-State: AO0yUKV8JvryI+jSK4HBdi7j/lOh2NQkqValsj4+ycVUq50TrJWap/8f
 G3oY+kx/tgINQDT6HQwbnVJEr2Vo/qvjH8YDjB6u6g==
X-Google-Smtp-Source: AK7set+TMpx7Ei+43UKVoDGTghC8odNxprIglDvsHCCeabg5b425oxMyEFG8/9eXj1N3FtelnSFbccfX4EX19/Sp2iY=
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr178681pjp.89.1675436331762; Fri, 03 Feb
 2023 06:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20230201160356.239254-1-kwolf@redhat.com>
In-Reply-To: <20230201160356.239254-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 14:58:40 +0000
Message-ID: <CAFEAcA_wk09M90NGMDzJT3ES+gCrRmRAjMi30GSmX0cTDN0w7A@mail.gmail.com>
Subject: Re: [PULL v4 00/38] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
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

On Wed, 1 Feb 2023 at 16:04, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to d570177b50c389f379f93183155a27d44856ab46:
>
>   qemu-img: Change info key names for protocol nodes (2023-02-01 16:52:33 +0100)
>
> v4:
> - Fixed the 'qemu-img-close-errors' test case to run only on Linux and
>   only with the file protocol, use qemu-io instead of truncate
>
> v3:
> - Make the compiler happier on BSD and CentOS Stream 8
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


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

