Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07C355005
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:36:46 +0200 (CEST)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTi8b-0004DJ-Ip
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTi7H-00035G-EJ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:35:23 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTi7E-000139-Um
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:35:23 -0400
Received: by mail-ed1-x535.google.com with SMTP id e7so15699187edu.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwvlEveWgUzaLAhQSIAGO20U60FyJSz5JXIURJILmG0=;
 b=tV+dhoNiPhs1Ylljnc3tgImaXmxkoJlg9A3LaI4+IOqAyoToq++K3gFKAkWHF44xWU
 el4Xvm0qx/KNDAeJAFn44zdkhmL6JsbPlrIItNHssoRN0iMl3HNvq2dxcFR4jen6P3h6
 Cxpe3zwGGddR5XfP1kVd17W9N97aYrbSTmNxcDWnn9pFfpWRLenwHT4JLc1XVmKJyrU8
 l+O1bU4gS9XMeqHwTsC1zxDWCvlxX/SQ5RLLX05j577xdAmhMscmY1v2JDc8MfwHX3vd
 Hj7cD5EMe9cw/eWtnwfT3dk1R+FJxxUb8j93VweoZxO/w1I1iiHcZxS3s/2IBX9f+YS8
 1a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwvlEveWgUzaLAhQSIAGO20U60FyJSz5JXIURJILmG0=;
 b=OhRiX6Tuv8JcJgoCfUkKgY8JwcbBQX2HLdRXXhzPaTwe028GcB9VSBEypZQ9MMCNh0
 wT1FgreLuASsUerwXZ7ZLSBr9T0z0jXAIAtrvvOANGpCeGUNC5fZ4ZAyeng6kXwKTzKl
 6vc2RitfV4nUrHd6Fn8LQAG2LxMN+oOnn9BoqhXmtCsZ8niT0uTT43RMcK6RQots5f4H
 kjbrvMCIAnhCbvVbehurVvx2ofBF03Ijg7AZ8UKROYJKM8ONxCmZWe7OYL6g1geNDi5k
 ngNCV6qWmxPKCBeWP6oaqNlwgx58OzP0nkY0T3WKFsMZ9rKjXgE+z3Misf1ob2aPKGWK
 yDeQ==
X-Gm-Message-State: AOAM533k4zK7LQ9H5Fv2xeagljJaWhYrrI3/2/wFx5TZOiz7QMjs31TF
 vS6ePp2husv661g8W05AiXwEN4gMiyRlDDF8dw1puw==
X-Google-Smtp-Source: ABdhPJzRBU8uGJfNT9zmfaXW1koiCEjJK6gAgrmPRjdMKl8w8RniV4oAlL9jU4RwdHWBEpg7Ho9FXnjjCP2hxi7RgvM=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr36575245edb.204.1617701719405; 
 Tue, 06 Apr 2021 02:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210405173435.36486-1-its@irrelevant.dk>
In-Reply-To: <20210405173435.36486-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 09:34:41 +0000
Message-ID: <CAFEAcA89zZr9mqvqLM03=niZ_3cZc41TLe9rRftoKLAnKhWqXQ@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/2] emulated nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Apr 2021 at 18:34, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 25d75c99b2e5941c67049ee776efdb226414f4c6:
>
>   Merge remote-tracking branch 'remotes/xtensa/tags/20210403-xtensa' into staging (2021-04-04 21:48:45 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-for-6.0-pull-request
>
> for you to fetch changes up to 498114b37bc99fddcfc24b92bff7f1323fb32672:
>
>   hw/block/nvme: expose 'bootindex' property (2021-04-05 19:33:04 +0200)
>
> ----------------------------------------------------------------
> emulated nvme fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

