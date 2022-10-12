Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA035FC77F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:37:40 +0200 (CEST)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicra-0001hg-S7
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oicj0-0002X3-0A
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:28:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiciy-00061V-Im
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:28:45 -0400
Received: by mail-yb1-xb30.google.com with SMTP id 126so20217658ybw.3
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SwYQJoEykjpqcbmVfSAOwF8hguexsi5AWZszDqlu9hU=;
 b=GJKp7BfEMYtjFRQjiWMr5H9RAritKZ1fCT7UCsNobgjOFemBm2aEvg7dYatC5A/z3S
 oEZNRciTiHbTzPv8ldb3/3VQaX1j64G2+dHp+T89+rRz02J3UCdLYzZkZiZUG0u+i7ME
 rWpRxnP4omB1bs3VENxZzTm14bzlUH3lJK0ThlpmY2QVSjrLF0fZc0fT+T2sYMbqbJyC
 U+DVw6PmF1sdGqN5hxGkFSrMtzLTXA5lkkz0SHJ26kspxaqb6GTxZk3z9wJ8umSy1+AB
 Y+VZIS5bCO9vJ+65hteVmImQyDhM8adJU1JDa2PSVdsX+pyRuITO7imA+l3TH7+yvIna
 S/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SwYQJoEykjpqcbmVfSAOwF8hguexsi5AWZszDqlu9hU=;
 b=tpHLzLk9a/5S6/ahijclmlm3bZ5ED2KwBr8tj3/hJc41x0hXKBJkIaAgV1Wh4UACWu
 bcWrQ4jjrbrtLOe3dV7uyO0kltdmLvhXKeC4XZqwgvIbWJLAhN5Xg+O2CVhl1sKc8SzU
 pDGOCNNkHhA1uX1/47n2cOm9JoPmKFnSjwB8XXoFgAch4OY+OGLURgi7YjO8V7ome5B1
 3eYwVKQXPCDcRnUN+GF0APNBKeV4LMPCKyVTnTwOayfIIIeSg/7ft4cWLGpGoa08kXpn
 2Ov5Cgw7BA1QcxXcpRZWAX7s+z3n6uRwswJmQ8Th3202w11i+SpigElFmDG4q8WQJDtZ
 iITw==
X-Gm-Message-State: ACrzQf38Wb5kO3Zlmmjdg6TCjSH5oaM7UQI13X4IARlj3RJg8keq15Jl
 CI00tN6wATueey6Y1her3SiFflH6n96i7dqPlgI=
X-Google-Smtp-Source: AMsMyM43+FsgHvWtCbGzHObBmTvSdA3b6jF3skUj7wuTfIPa0l0FM6Wjvix3CMEvqw67vGo228Zj9zN4Ovw1a94y+L0=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr24763995ybe.642.1665584923193; Wed, 12
 Oct 2022 07:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220826111834.3014912-1-fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220826111834.3014912-1-fanjinhao21s@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 12 Oct 2022 10:28:31 -0400
Message-ID: <CAJSP0QViGDCNrdPNPnT87go=ofCxTE7cWMGHFnOH5v+8rw8BGA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iothread and irqfd support
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk, kbusch@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Aug 2022 at 07:18, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
>
> This patch series adds support for using a seperate iothread for NVMe
> IO emulation, which brings the potential of applying polling. The
> first two patches implements support for irqfd, which solves thread
> safety problems for interrupt emulation outside the main loop thread.
>
> Jinhao Fan (3):
>   hw/nvme: support irq(de)assertion with eventfd
>   hw/nvme: use KVM irqfd when available
>   hw/nvme: add iothread support

Hi,
What is the status of this series?

Stefan

