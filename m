Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31275581583
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:39:14 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLiL-00045E-8U
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGLZy-0006hl-IG
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:30:38 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGLZv-0005I9-JM
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:30:34 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id a82so20027932ybb.12
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GULCDdtUJXn8yNrvsrInz144fCRO/iI6RixUcYA9Kz4=;
 b=oR8UdxC7u1Na6H760Pba5sFhGrSSgzpKdhCKh35V9CsLglP1UARXuTD+X709S23nz6
 Sx3RupFOscMT0u+wTvuiwYsST6TyPI54tHInNcK4gD5W8q3yLvRVlw5BEt/FdoTg72XU
 vOm+vqKxzyJrepLZkQHm+2V1Xy6sjhayZ/+S0wH4x32GjG/GcDqOUDiTapHvB1qogM8/
 HOExRW16TmeLXSBak7Xto2f6DoCAJAblJst/bpQOCh2Itrmb7G/Qlk/QpyoKv5xnYOgV
 6hGPumlMu3QZHuYal/c9KzbzdjwFkMFKPtIh3EBn/kH1W6LfouOHiZ8eOrH+3APF1MIq
 FCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GULCDdtUJXn8yNrvsrInz144fCRO/iI6RixUcYA9Kz4=;
 b=TkZxoJVC6ro9Ph59qguNzFauCo2ysk8kLqWd8S4zhlG1hnQnU44P/s81oEif41eULU
 ryjpL6kC5iunLV2DEHP8PPXZqqA6/iswIcGb7nIdPT1zv0eH+hGloZ6FVaQDY+GSIdV0
 bpzACMofAE7/xfb1zpC2ZBQW5UIuRY7Kn4tDUajtuZsBgbVHCXmzpuu0mgaN3nB/zvuv
 nzqhi2LwwNfK0kvXGeqn7Q4GNUkLFpJGmDYOSxQST1ZB+qRruCiDdGSpHwWyt4ALfd/8
 Lmjb0GP8jkyzEkoWlcn+bkHkm0wPoKhaYcDe1ku3DvZIm46XKMVrWsVb2mcQ6wda4OTl
 PPuQ==
X-Gm-Message-State: AJIora9Q08ORHGJ65D2oN3lrFQOD7j9floEMwb3YvouRRd/oA072X36j
 PBoDMJFDvGUI1xEu3nFqtx2w/pG0GM0RuZZrEro8bQ6VpxA=
X-Google-Smtp-Source: AGRyM1ui90ee01Sk9B0ETEar86b4GAKOCI8hI8rLmNkTmmOKx+y29gJZWEWUIS1jPfwY0SKbsjw+FdULj5IYfy2q4xM=
X-Received: by 2002:a5b:e90:0:b0:671:670a:594a with SMTP id
 z16-20020a5b0e90000000b00671670a594amr5437644ybr.193.1658845830447; Tue, 26
 Jul 2022 07:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220726094442.4452-1-laurent@vivier.eu>
In-Reply-To: <20220726094442.4452-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 15:29:50 +0100
Message-ID: <CAFEAcA-RZcTNytmyTpCKLfSNjk1UGv+dFh0ptZM6LRfSt5pzmA@mail.gmail.com>
Subject: Re: [PULL 0/3] Linux user for 7.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Tue, 26 Jul 2022 at 10:49, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request
>
> for you to fetch changes up to 6f200f51869ff0de7ea0343dd7104362e994b382:
>
>   linux-user: Use target abi_int type for pipefd[1] in pipe() (2022-07-25 10:42:11 +0200)
>
> ----------------------------------------------------------------
> linux-user pull request 20220726
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

