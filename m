Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C052F3879A8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:13:37 +0200 (CEST)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizXU-0004Md-F3
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lizWN-0003VO-G1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:12:27 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lizWK-000616-PP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:12:27 -0400
Received: by mail-ed1-x530.google.com with SMTP id di13so11080452edb.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCCSKxroNVzJGKI8PzjzyI9BgotZdgWSK2IOkXEEX0U=;
 b=YuWfbp2o6MH7ml+/Dw/AioIwuRus61A4Avj+nCOyKioXFodufR2j5+SvZ7sWDnrYca
 qGVYweclvllb3VMBaCxqroeBPP5BkvB/1WRxgpX8mOP626uIiMzCylzGAT0HOXSkbgWL
 PUUL5GQi6uFbJJGbq1pyjHRdc8Ql+Fuze7yBkfk6iefuDLJS28G+gDx+UnPCuCgIQqJQ
 pC6gshEoQqgwkbeaO0fE7iBV94jKlF7z7vCy0VNAItf3mFVVNGE8Cte0cZQnzhhGGb3c
 zEMVmLU7AOcdZd9urXOt/0hwIFMATt5plqOsrYIajii0LAP/afbq5eba3EHJGNFDOYnk
 ANRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCCSKxroNVzJGKI8PzjzyI9BgotZdgWSK2IOkXEEX0U=;
 b=kN0zoPy39rt0uzY5IHpL/cHdQa4mjJC+IWYQZKy5TxMXUxEOMvw5PoiddxsffetPk+
 gtLiZ6rO4qs9P6rxRO/pMnDvJveCjMg1hNAN2GtqVA1MvwF2ieyHYVE+DAHwdh1hKvm2
 79lp6VFdENWdi2DDXgiQ9jp59vJzNorEfw1QSjoCIUoPE+cydWwQCEqxi3Kok08N569u
 G0VploBqtUye03FFNgwSF00naj0JSDEFzUezfocOMIYuw1fa06PuQf6jCJEWUMM3klxu
 dmecYrEd1qO5CzkP7fI9jh0R5U8s3YUZ4DkztBg8UO86B80WrdQ2gYdW8ukK5XWQHvpk
 psXw==
X-Gm-Message-State: AOAM532Vy4EZWxWnWQBYcu7/LBsnVO95/cfkHIIZFOAAKabryGAZCUP4
 wMPTPsT0f6pu2IL4NgZCX//K4hUMyO51hUqKBQCXwA==
X-Google-Smtp-Source: ABdhPJz4g+EjH7g2RrCxsh1JCPadGl/8aXfQ7jL3z+04mTTCN83A6Nc81oG77R7Y5B7b4E0eqKOTDRH70oAG2HQpkLM=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr6964023edx.52.1621343542964; 
 Tue, 18 May 2021 06:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210517091737.841787-1-its@irrelevant.dk>
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 14:12:06 +0100
Message-ID: <CAFEAcA8YO1kggXmusnMMVFf7N006yZFKrfitcWy5PDGKvd46Yg@mail.gmail.com>
Subject: Re: [PULL 00/20] emulated nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 at 10:17, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 6005ee07c380cbde44292f5f6c96e7daa70f4f7d:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-05-16 17:22:46 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 88eea45c536470cd3c43440cbb1cd4d3b9fa519c:
>
>   hw/nvme: move nvme emulation out of hw/block (2021-05-17 09:19:00 +0200)
>
> ----------------------------------------------------------------
> emulated nvme updates
>
> * various fixes (Gollu Appalanaidu)
> * refactoring (me)
> * move to hw/nvme from hw/block (me)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

