Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788355BA4AE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 04:39:51 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ1Gg-0008Ut-1F
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 22:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ1FA-0006qy-5y; Thu, 15 Sep 2022 22:38:16 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ1F3-0005hW-Vt; Thu, 15 Sep 2022 22:38:15 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id w4so15693239qvp.2;
 Thu, 15 Sep 2022 19:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rfE6RXFq6Ff22aG4yPDGoLo8OZ2x8ttm/poZImcqmIo=;
 b=UrXAhaOJt6JkUPe29SvH0PsivKbWVjPcGUubhsrUxdUKol2AqoAeQ9AA4BK2eK66HX
 AfpI4NT0U80TOD/0Icj3dcUmKrHSqSaXDzl09k7fxhVmLjPOTnVTsOU0GNzUI6PCZYt3
 M3uThg66u3pbe3lQ5lLfEI1nrJgOkDqTRgkYeglotm+De2hXrBNZOj6wN40vcEg/isB1
 TvtTvaboFbr+F+zHzlmLJfhkqSz0x5z2Bs0+mpx4jsl3juQiMaaL5eXCO6JF51EoX3ib
 T/3uG/c/vY4qRKBVzofVjC3hVCE8yYDPVQk/q5zzkEa4EpXRysAgQQNU3djhINyHXogm
 f4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rfE6RXFq6Ff22aG4yPDGoLo8OZ2x8ttm/poZImcqmIo=;
 b=VEarQ3e48Q9dvkGADnqTrMvAGL/z1Wkb87FhjQ7XJQyDjUdG5nOEbUPGMPukC0uhmM
 vxugEiqtIBvo9vtJ1xTCTAfMPakxwNFTPq6KCfRD/SKxgICnIkkZHuHMAQsFtlY0Qlb+
 wBhWAsMuB9cZ6gcK28p3em1JMAeoqo6UAdC+0Zj7pFHTxQa03XbfPte9o0g6+/N06jU5
 XrjUPmenKTt6MtJHammVgbH5/+Op8+6WM1wBtB6MQQ4lisYBjGFKvAPRoSQD+t4//veb
 /9dx8uhDOnCYbGCdo/T8Wio6938ctMeQ2lwzIHpZNhmG37fFFZhr7rRYxxhtVvNXlA+c
 5IGg==
X-Gm-Message-State: ACrzQf3H8lWKO2nDWk0c//2KUDTKGYpHt4MfEI+DoX/J49ty9zauNRq1
 3IS5uVB6sZKZezlyx3hr4Q/ZcA5WbKth44j9fAg=
X-Google-Smtp-Source: AMsMyM5MTcM4ByuPV3Rl+RVqWb7E6DyvTHUOmZgqbPFa708OGNRYVB8s+7BICtQ7MMFRN6xxKzYM74U056V9GUNBCk8=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr2736085qvc.12.1663295886935; Thu, 15 Sep
 2022 19:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-2-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-2-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 10:37:55 +0800
Message-ID: <CAEUhbmV09XCLcW+Jsiybmfw31Jz2Dm-rv7J_RcOW62ZJo4GB9w@mail.gmail.com>
Subject: Re: [PATCH 01/11] hw/ppc/meson: Allow e500 boards to be enabled
 separately
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 15, 2022 at 11:25 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Gives users more fine-grained control over what should be compiled into
> QEMU.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  configs/devices/ppc-softmmu/default.mak | 3 ++-
>  hw/ppc/Kconfig                          | 8 ++++++++
>  hw/ppc/meson.build                      | 6 ++----
>  3 files changed, 12 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

