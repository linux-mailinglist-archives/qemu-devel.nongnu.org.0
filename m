Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054EE3B0B40
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:15:20 +0200 (CEST)
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvjzb-00032H-1L
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvjyG-0002KK-RO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:13:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvjyD-0001yv-KM
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:13:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r7so24656362edv.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1dbZNJqRVcLL6H4b5d6T15nvsNztq2nDPL2jqgN6TA=;
 b=Ox+coga28E4Sqjg03NPRQxXd0QBAHiDUQVs7d94xNg5/u+IZxI0cNsTppz02LSYBJs
 2DE7zN8gGhkPMSdBN5fBAm6C6uK78jS5eeyEgB27NKo+C5eylvmCq99xxpcXbfT8Iyqz
 pSfRFjseXwlHUJM714rh75J34jPc7odYb8N12msk9NwZlqaqPnA9RwbZoR/Vd+e04Y6F
 vyzwu8h57Ly9+xrIX3QJ0RAD44DCr6xCSL5lvpxRYh7JXLs4Vm1FWZC59tMSNFJIAh0n
 dM5IJc+pTFAvWkPTrbqcUSdtbncGvXRiCbv661xzkj3a5+vToXG0a0GkZY5SW5+swHjL
 gV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1dbZNJqRVcLL6H4b5d6T15nvsNztq2nDPL2jqgN6TA=;
 b=fahS1EU0i67jlpx7Eo6oNCATLC6paOxZPfAMV93IwLxH6mbCH5ZZuysH+3M79WS9iE
 Zks8SvU3o6QV0SiHuZzGN4VUNzbppaZKTK1aDlOarbRm6+fnE4sCwBT/mNerINs56lRK
 RHv5LB1H5yCViKar2SEDFP0LZ73659+oETw0BnkBeUZU8z7M885/nFsOKu8+DFT7kQPN
 F+XUa9353QTRTnxwXnqFiZSXUybRrWQbaj23ssN4hqdENviD8Bb81AvD+VYowK24drt1
 zHxtIorIO20Axcu32jlx5Qj83ELJXTiZsHoH8yhud0IxUjhINHDKh2EzQX7Mg6XboLOp
 nRHA==
X-Gm-Message-State: AOAM530JWLehBsywPO5uazDOxc0RXjlIoEI4D731Up8jr9rH4cokgwMg
 7NcGPi0Il62DRevLzUjasiHbmpBT3JlbLIMr0kxirg==
X-Google-Smtp-Source: ABdhPJxjPasZm0geI+ZNjd9isgnJC5kBSo/tk6MxiDmXTFsyc7ahrfcOmvzaU76XY5UVlr2nFmi/SzEcVvPYIMSyqiA=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr6363360edt.100.1624382031483; 
 Tue, 22 Jun 2021 10:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621110445.231771-1-laurent@vivier.eu>
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jun 2021 18:13:15 +0100
Message-ID: <CAFEAcA_paaDKDk+CpwT+mnD2_t13=1==ynw2Rfj7kER7hz8vdA@mail.gmail.com>
Subject: Re: [PULL 0/9] Linux user for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 at 12:07, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request
>
> for you to fetch changes up to 96ff758c6e9cd5a01443ee15afbd0df4f00c37a8:
>
>   linux-user: Use public sigev_notify_thread_id member if available (2021-06-20 16:41:47 +0200)
>
> ----------------------------------------------------------------
> Linux-user pull request 20210621
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

