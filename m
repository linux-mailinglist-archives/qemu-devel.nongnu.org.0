Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43163E1480
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:14:53 +0200 (CEST)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcGy-0003TY-S7
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcFt-0002lp-VR
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:13:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcFr-0003WY-BD
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:13:45 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m12so6218401wru.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SiNQbckGiLHSdAhwjfK5xvVxyTBBf3VLzq5ylGolmws=;
 b=OTUCZpAkpE6gRwGvLMvsLn29rAFWEFKQiKdkFLnfDn4lfxrBilxxv1D11KtgtRq1xZ
 A1eY7GaSy/6ihLcZ4o+aZs9ZDdDqJ+n99C0TL6fqYPcsGnrhVrDqlEdPu7eFlupZToYt
 Xz08nOKFPoaIpxrotG19cmj3ZSiQuPOA4xijwF9s6yiPKGepwLi/Qq8mKQCHWesnPh7a
 7NC2ueZ6xDovHQHiR90uchC6VMOVBcSil7PMNnnZmM66x1YoQ7jJ79c7nxJobxAN9H/t
 4uY6UB5pvWfsX9KSWhTD8dRZzbN2bMcwieg4pS/DPnMtFV4ySf0OQTAWzCmgM7TOJodr
 lhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SiNQbckGiLHSdAhwjfK5xvVxyTBBf3VLzq5ylGolmws=;
 b=A0ss82ZhNyBSJXo2A4zHvKNVmv/3FN9PyQySHQ1TMYixH5UnwTQdd0g36dm+ja66oo
 tRLPPdSkn3r1+jumYd6mpjTfZoti2h6g8F4o0Bu/pQ0OjSI2uROutZ8N78XyP2DmJrD7
 Rb+geAiAFPoHphM2fKShTX9xn+QrNBqm91TgbQHRLIZUug8vIKbl3os48/1BGj6+JblJ
 aNkmAAcY6R/JnWCiSqspH8SyJoWHg2OcilXRoxBrHkDC4SZM9RGotimPOiT7DczO5MjJ
 CyB4DXYdVXX7mVdws05gV1IkRj5vHSt64IUBv+bMNeqAfUInV4wysW7EwJEYeOFMe773
 e6Eg==
X-Gm-Message-State: AOAM533mmvAMHfwYUbws9MOdpXLURMBDZcMhzU1GwCR0iBM/u40na0Lp
 AzkA583DMzn8jK1TDYfrdRFaww==
X-Google-Smtp-Source: ABdhPJw5CQQexXmwb++qaTTrhT4Hd/auJ+tIXPDy0hoYBkKu7v4b0V7a0Qzm8Cv8myhXd1F7M3Svog==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr4824477wrt.107.1628165621831; 
 Thu, 05 Aug 2021 05:13:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y192sm8728875wmy.1.2021.08.05.05.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:13:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2EC81FF96;
 Thu,  5 Aug 2021 13:13:39 +0100 (BST)
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-7-jsnow@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 6/6] docs/devel: create "Miscellaneous Topics" subsection
Date: Thu, 05 Aug 2021 13:12:23 +0100
In-reply-to: <20210804005621.1577302-7-jsnow@redhat.com>
Message-ID: <877dh0ks24.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> The hallmark of any truly great taxonomical reorganization: the bin of
> leftover bits and pieces that didn't neatly fit elsewhere.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/index.rst        |  9 +--------
>  docs/devel/section-misc.rst | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 8 deletions(-)
>  create mode 100644 docs/devel/section-misc.rst
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index da579a7b666..ef14f3302e1 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -14,11 +14,4 @@ modifying QEMU's source code.
>     section-testing-debugging
>     section-tcg
>     section-subsystems
> -   control-flow-integrity
> -   decodetree

decodetree is TCG as per Peter's comment

> -   s390-dasd-ipl
> -   qom

I feel as though QOM should be in the Developing QEMU section as it's a
fairly core part of the programming experience. Maybe?

Anyway it's an improvement:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

