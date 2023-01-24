Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB166797EC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:25:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIM8-0003Yj-7N; Tue, 24 Jan 2023 07:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKIM3-00034I-R9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:24:47 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKIM1-0007WY-84
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:24:46 -0500
Received: by mail-pl1-x630.google.com with SMTP id c6so14566053pls.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C+D7unaTrowTq7szPM+qA3VxwdpmMzbFL2c2oDt9qEU=;
 b=o47Z5/nL8rbvKwd4dRe5mPvxXPZA2ZVPC4N+7A7B61YS8F0/TgTSYwhI+U+iTqPShe
 Ol2e6wSqMi6aGhu2lxo2l4e5fJCO1mJUEcBKvLb4YCGNz46up+5e0aUXbeUcZpILQGF8
 gCUKxKLfaXzmKMjfmNIH7QxkKmo5sN02QIDyebzo8bk21qEQeNEUhmmdpdN38o/xzwRd
 rM9lxBXWLcNJ/G2WcN37v3NHuWLWcet/qR+JpLnsg2gI6GxMUNutQCLSH++a+wk2zCe1
 +k+62IVqpehYZhbqmTKGAxsEhO+ag4+iyp4A3sYjR5sULmlFGq7NPAXoNpYauNnxDdAq
 Id2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C+D7unaTrowTq7szPM+qA3VxwdpmMzbFL2c2oDt9qEU=;
 b=4MqFN0c96ArMZbUtQFDs0W+lJOjucSX1vNF+gAp2FyMgxK30lwqYmKHEwPLhUb3D/v
 tKt+XiP5RPssm8E+Pmgz4AbEouGExlpop5MdFZpifyHINtbhWzB4Ekbm3VskUDv2sT72
 t8kiy2r1BJdVSLOMz9hY/I9/68pamgn5yElE1OBuIatkhBb0b0RBTfdcIVzTJCRvzBit
 GIQSPYhtuJTmzk+7T1Doc2mcHA0cP0YMRU0Hi1K82lS2RpMUKXnb3FGUY+kJolIWoYBn
 avdDJcv1oDeVNtDv1pDVrc5xJtV+JO+uWYNyoy6LW0BlPpWOy8QJPLroh81lxFEblEwy
 QNxw==
X-Gm-Message-State: AO0yUKWw4/C8uXMpxHuEh78WmBhrwuAqPfYsYV7OHcITukc/Hsx3GR2S
 D7L6mYimRhssdmJV/foT8XLO+pJYnc3hQTRCcuyqEQ==
X-Google-Smtp-Source: AK7set+X0TSOflqWHQLZhdxNk6Fit+4fuQbdojeST04P0ZFcU/gukqlTF1NTIxrSlMsaJdH8Uq2Ecq/5oiX1KFNOE5c=
X-Received: by 2002:a17:90a:8a0b:b0:22b:e329:7262 with SMTP id
 w11-20020a17090a8a0b00b0022be3297262mr585078pjn.221.1674563083284; Tue, 24
 Jan 2023 04:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20230123200417.169053-1-stefanha@redhat.com>
In-Reply-To: <20230123200417.169053-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 12:24:31 +0000
Message-ID: <CAFEAcA8D4JNmnnoFoh=74OiGpK73+yEF1ZN+T=ZuTfHDBO-5=A@mail.gmail.com>
Subject: Re: [PULL 0/3] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Mon, 23 Jan 2023 at 20:04, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 00b1faea41d283e931256aa78aa975a369ec3ae6:
>
>   Merge tag 'pull-target-arm-20230123' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-23 13:40:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 4f01a9bb0461e8c11ee0c94d90a504cb7d580a85:
>
>   block/blkio: Fix inclusion of required headers (2023-01-23 15:02:07 -0500)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

