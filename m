Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182757BA33
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:59 +0200 (CEST)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBj0-0005C7-C8
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBc5-0003xc-UC
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:27:49 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBc3-0005Sa-LS
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:27:48 -0400
Received: by mail-yb1-xb35.google.com with SMTP id k85so29916371ybk.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1WXv8g8eEfSLxZI/hCNWlttyLSBiEuRLnfI0F5DWdUA=;
 b=zBC4M1H43gjM4JcDVqbMgWjuJY4u9un753OGRtBKLdHx+Q9mJuFAPhNiPAVCD4p2vl
 MNZaFAL2+xFVJ825nmo4LT/kshfzK907jronXC3yHhXtJRNjQIyhSC7X4bROoSiTr11o
 56bU1n8b2UGKcw6wScNut4jemxMLha+/D2gg6bsrb0mtpmxMZX8dmmkLHvThTyg2Odzj
 veNfHnFY2Dfm0/QEee9GLM+bGubcaIjLnuBoGmVtExzrQjVTVgHcZE8GBTSp6WonEx/7
 O3JjCJas980Wkq1jBvvdHhDMsREl9/wzE4yJ4ZiODaRFFs6aO5Y8GfhhLIDwvF3w4iTF
 a8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1WXv8g8eEfSLxZI/hCNWlttyLSBiEuRLnfI0F5DWdUA=;
 b=YVf7MfvPfFJfC9rqQBfAWQQeR+lWdAB8aJmOr6ayofQlK+QRIP22tRa8zIwJAeInTp
 q7cA2GXuBtYG6socse3/aAv4Z3BCw6o0yvyGJbW112DanjJu20R0R63vSSkxqexAhWJ0
 5KS4sR6Hq0LD789EA7rvAzCpOsTbl/26OjNHE7bF0Fev/PzEOCd2oSKxNiUDtT0iDzfT
 3l92c4wqZ0J2goO66AKIIDT/COlOV98uOxSH4hLZdw+ughqVum9wyBM2SDmVF3RQP8JM
 tPhrHLjSJhe/z/olXjfTTiRwIFZtcITfd7IesjvZyOxP+Phe+DdYHwpT2x4RXaqmCUyT
 xtLg==
X-Gm-Message-State: AJIora8ijVGuad3J+qJGdkbxzSN4Do+2U9y5R5z+7dVSz0qazTpZNM+E
 l3g3BC2rSJ/XCETFQi4AkgxLhFx8SFwlheMXBogpLQ==
X-Google-Smtp-Source: AGRyM1u21EW/hcCraAWfxDY/BtG43+CBLN0PZQAJ76tDMT4zg9KAzT818FeVKONTH1HZmZI5rLHz5gNKhHbPwaRiBCY=
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr7883696ybf.67.1658330866582; Wed, 20 Jul
 2022 08:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220720075756.760404-1-thuth@redhat.com>
In-Reply-To: <20220720075756.760404-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 16:27:35 +0100
Message-ID: <CAFEAcA8TcEV3PUxxybO3Wjj3hKvC41QKgF9gnoc-Ot4QphV49g@mail.gmail.com>
Subject: Re: [PULL 0/3] s390x fixes
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jul 2022 at 08:58, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit b8bb9bbf4695b89bbdca702a054db0a7a2c8ff2b:
>
>   Merge tag 'pull-ppc-20220718' of https://gitlab.com/danielhb/qemu into staging (2022-07-18 19:27:25 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-20
>
> for you to fetch changes up to 23f13e1986e2ed3a02b65c0bf376c8c61d04ae7a:
>
>   tests/tcg/s390x: test signed vfmin/vfmax (2022-07-19 12:49:56 +0200)
>
> ----------------------------------------------------------------
> * Fixes for s390x floating point vector instructions
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

