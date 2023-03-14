Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F127C6B8F4D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1al-0005I1-CE; Tue, 14 Mar 2023 06:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc1aj-0005He-C2
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:09:13 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc1ah-0003bB-Hl
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:09:13 -0400
Received: by mail-pf1-x432.google.com with SMTP id ce7so9335623pfb.9
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678788550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eewZYSL+WzaGBSyCfmYwGSdT2ziAwq9taMsP2OXqcq4=;
 b=PQgyhP/F98hVKmzjd41eHke/6Bixct+A84H6EwX1k8O0aRGzdvyV/TvUUOv3/MG475
 1XjKoRYkehLEmGruZNKCTPrBsnVeN53T5gS6W/OJC8PcdakAtO+F4BDPc+ZyAbDCWsjV
 1tpHAmB1iIYQBpkzyrVR/Bqzj0gi/ix9qEKOWBen8g8OUNhiUdEJaoaygtASBSwg6aGg
 JVZ0sfOyDSa6WmdpClqrJ0OrKflFF4SoDL3ZoYNGfS8DQCz8jdSLEDo00+7xhJocW2M6
 FcZX8A16jKouhHt9Tah28gWqvINBzo8ec8NQphvac0J2b26Sxnj+SlOSQFDLd3HY1C9W
 WTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678788550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eewZYSL+WzaGBSyCfmYwGSdT2ziAwq9taMsP2OXqcq4=;
 b=QtjINxdzPDcs5UxzmqvE6tTXAZlzRkeab3oViOgDi49d19gt4K5fPNTw17udxifT3G
 mDZX16pRQsOoNsQSuVJvJOFzbd2LOd7S6VPvJlpxdeyBQLwCedPcgn/Tg/zu4pUXsCd7
 1joOomV0qqvWpzvXyhGFsWJoBLzFtIYHOO9DWvoucE07fIX4vsTX0YH/5joR4P6C2Swd
 yiq6KJC6R5YXWKW5hqzMSGxmU3OKbIFu95PS6y2SdU9hu1WwGaJ6luuW/js2auO93Vsm
 seQafI/fRfmglJV7ZIrk746VMOYVujkQAz5Ol6ChUakR1VqJ3Y7w6xsVDLFe0WXy7Ysy
 hncQ==
X-Gm-Message-State: AO0yUKXM4cmoA3/tRQAMvCWZ3+KKYQ1rNusGfU+nnMkS2193M3I78qHF
 LJmklvIsaG2Ea2ibJsfAgkBaCrBnvs0lSy6nC9bAlg==
X-Google-Smtp-Source: AK7set+IYr1Qk3dnryEQFOiEhRXdJtQhhvDy7tzKzR5wE7FpRIa4lcbYtCsbO/uy/tjPQ08c4tO1hxFH3Ri+YL7aZ0s=
X-Received: by 2002:a63:a80c:0:b0:4fc:2369:811 with SMTP id
 o12-20020a63a80c000000b004fc23690811mr12433230pgf.6.1678788549674; Tue, 14
 Mar 2023 03:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230313141057.230810-1-thuth@redhat.com>
In-Reply-To: <20230313141057.230810-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 10:08:58 +0000
Message-ID: <CAFEAcA_gQc=VSRDwPLQF4h17BEMAeCBBt7Q+QpP39dkxYcOrhw@mail.gmail.com>
Subject: Re: [PULL 0/5] s390x and test fixes for 8.0-rc0
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Mon, 13 Mar 2023 at 14:11, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-13
>
> for you to fetch changes up to 410791228c415c0e4f76e6cafae7c82fae7cb8cb:
>
>   tests/tcg/s390x: Add C(G)HRL test (2023-03-13 09:23:42 +0100)
>
> ----------------------------------------------------------------
> * One more fix for the migration qtest
> * Remove the edk2 gitlab-CI job
> * Improve the build-system-alpine CI job
> * Fix emulation of the CHRL/CGHRL s390x instructions
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

