Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6881368DF42
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPS4M-0003Ze-5p; Tue, 07 Feb 2023 12:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPS3t-0003Yi-5i
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:47:30 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPS3r-0006NP-Dg
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:47:20 -0500
Received: by mail-pg1-x536.google.com with SMTP id u75so4358356pgc.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A57ycYPKLNNSLj8drChHXrIPJs3n+Bixrphti1iyrnk=;
 b=l8zd/hcRkMrPQ5d4BHK9bdu5PUOrvSC9/PFFr4+yg4bfADloe/by76ethvJugTSMME
 099EtST5Qaza9igW/FQTLiG53xut2q5MntSQuDup/VT7I1R/8iSCu5/qhRsoEuW/1PZW
 0KuO/Fu87kfPG1ds6HTEyu8zvWr1mSR9NEiTE1pdCm0HhEQSZ38CdN/7HE2bj0mNCHGQ
 KDPkKh/O4XnToUdVjjtWpnas6iVqns/bgMHy48w1haK/hBqmGLdNyrO7CQuoyxxR7c3C
 Cw2IdoHaB2As6Hu0UgpRx8O+NtOCZa8sWkJgM20iceqrlV9dySz1mNzbzEE4DmE/54q3
 n8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A57ycYPKLNNSLj8drChHXrIPJs3n+Bixrphti1iyrnk=;
 b=7iK86ayn6XR2mDri4ISFMYBFeqitigQ1/+2RVXBxMDGDSGmt0iCiqbdSeE68Dnqteq
 FaEtTjtwI4ZVU8m8t77/4+ZxyF61SSim/KVxibDYkhZOWosDt9Cz+h3GM8EE+tAA09cN
 pPWEXoHat9aB15TX3gJ+4zQFd84Ead3jPNQJMmxUJFrES9GNztvvf6hZMqZDqjgAZ1Tg
 I57rQTuQzx87dJXLOPWPNlzZbB6lFaXXCH0fNhDs05ehVFJreSSfe4FwWoE7d76jU3d1
 J14OdTzsBfmTCZ9FJXbxJ8PEFSrtPP6T+6nP6HvZG57Irmp67uuIgtAN9SuOHsTCEkZQ
 UsQg==
X-Gm-Message-State: AO0yUKXYqJJPlVeiHM93vZYf1KRGi6HbxH7YQqMULYsJVJQKiWlve0dh
 1Vmu3moumZ/4DoRPPPLTfgEIjTh7sr/nVvRIOqStDA==
X-Google-Smtp-Source: AK7set+jYdCTuSdAw8J7fScNGUWqpUIeMb0vvMaA+ypvP8fcltRuBwFBYKzjxXKD7FoGqiNKsZFpOAOEZ1VeNyl6cgE=
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr472234pfq.23.1675792036962; Tue, 07 Feb
 2023 09:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20230207064523.3968603-1-armbru@redhat.com>
In-Reply-To: <20230207064523.3968603-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:47:05 +0000
Message-ID: <CAFEAcA83Ye9KN44OA5Sb3pq_xAVYHOUb+nsEqN57wSm7vH1H2w@mail.gmail.com>
Subject: Re: [PULL 00/20] Header cleanup patches for 2023-02-06
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 7 Feb 2023 at 06:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b:
>
>   Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into staging (2023-02-05 16:49:09 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-include-2023-02-06
>
> for you to fetch changes up to e74285cc0d1d517271531c4103d8bbabe1bdad7d:
>
>   Drop duplicate #include (2023-02-06 16:40:33 +0100)
>
> ----------------------------------------------------------------
> Header cleanup patches for 2023-02-06
>
> ----------------------------------------------------------------
> Markus Armbruster (20):
>       scripts/clean-includes: Fully skip / ignore files
>       scripts/clean-includes: Don't claim duplicate headers found when not
>       scripts/clean-includes: Skip symbolic links
>       scripts/clean-includes: Improve --git commit message
>       bsd-user: Clean up includes
>       crypto: Clean up includes
>       hw/cxl: Clean up includes
>       hw/input: Clean up includes
>       hw/tricore: Clean up includes
>       qga: Clean up includes
>       migration: Clean up includes
>       net: Clean up includes
>       target/hexagon: Clean up includes
>       riscv: Clean up includes
>       block: Clean up includes
>       accel: Clean up includes
>       Fix non-first inclusions of qemu/osdep.h
>       Don't include headers already included by qemu/osdep.h
>       9p: Drop superfluous include of linux/limits.h
>       Drop duplicate #include

Failed to build, alpine:

https://gitlab.com/qemu-project/qemu/-/jobs/3729904042

../hw/9pfs/9p.c: In function 'v9fs_xattrcreate':
../hw/9pfs/9p.c:3968:27: error: 'XATTR_SIZE_MAX' undeclared (first use
in this function); did you mean 'P9_XATTR_SIZE_MAX'?
3968 | #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
| ^~~~~~~~~~~~~~
../hw/9pfs/9p.c:4016:16: note: in expansion of macro 'P9_XATTR_SIZE_MAX'
4016 | if (size > P9_XATTR_SIZE_MAX) {
| ^~~~~~~~~~~~~~~~~
../hw/9pfs/9p.c:3968:27: note: each undeclared identifier is reported
only once for each function it appears in
3968 | #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
| ^~~~~~~~~~~~~~
../hw/9pfs/9p.c:4016:16: note: in expansion of macro 'P9_XATTR_SIZE_MAX'
4016 | if (size > P9_XATTR_SIZE_MAX) {
| ^~~~~~~~~~~~~~~~~

Your commit "9p: Drop superfluous include of linux/limits.h"
inadvertently broke this -- on glibc other headers drag
in limits.h to define XATTR_SIZE_MAX, but on musl they
don't and so the include is required.

thanks
-- PMM

