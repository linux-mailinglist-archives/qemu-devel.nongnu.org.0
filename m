Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A85FC8C8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:58:56 +0200 (CEST)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oie8F-0006UL-Gw
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oie3Y-0002xG-B4
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:54:04 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oie3V-0003Wz-5k
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:54:03 -0400
Received: by mail-yb1-xb30.google.com with SMTP id j7so20491984ybb.8
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SIhostCnpH/2FWX9Gf6eV4rbAByRU+2yip9xdDSz+8w=;
 b=kREh1Mvm5r/CVaqvPJ7SylL6JF9Kb0Gwg6uKcw+1PfmC+hgozlo6mXTGblV4ftHrfl
 HjEd5ydUedDXVIRZd1HrDnyFmKGAbMPqOY0FEd6vITg7DQ6MnvK5tw3yPyElCGire/K9
 2RdltKTOC/BX32dTzbyaQwaFAzOsdefbSWb78skWxvmT8muSqYvBsIbWg2zthULDCYP0
 vgGFhwdxFEoWzEj/ebvgvpHWYlF0bP5vBLf1/XFcdITwpF59a+JM7kpxaqf9UAYdlyrg
 dNAiPwim1o+c89r9rBtiOiaamOne6QBBxQ1Wveq/9ArQym4Ge6XZNO+HsKk+yddOTzAw
 54KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIhostCnpH/2FWX9Gf6eV4rbAByRU+2yip9xdDSz+8w=;
 b=n5uTyNOvIW6yjKR5U7/NP5+tzww+UttqkmwvUgUwqVF/gbAey4VFZ+LI/TAr/NpccM
 XVb9J1gMc54bfACK81CBdIhkhETk9tm2kHfCrfpZhitZahNSUQaFqUigtcFFC4zQuOiX
 XlMffPA+cpP/eSsxO+4E0QRY0CKSFa6KsQ1eafyjFuQ8SP3J8WdYH/cQFCDWTzM0L0Qo
 OAn8uA86N1cOoDutAHF22Woy60WjM/TqZylrsSvHzIC0pDWOUeIjcqQ05L2pXFQSRlAT
 MkInxlAXgqpGwLOU7byi+jQXR88OS04Iww6alJQH61L8CtaYJVu4o0lwHRKAl5/ZGgKw
 cCOg==
X-Gm-Message-State: ACrzQf3MjzSEiuP6xm6PcZ+cqPhV67qJRAOWPvaLhcdkw3vfV3NUa+7H
 Xdu6k0ltakElEmAuoqrSjDEHdtVssF95vgjmeyA=
X-Google-Smtp-Source: AMsMyM6rvLoKZz5cjfK7iel5eHxywm77U2jXcJ5xwAM5mjRWUWGd3PlnGc/oLAJh4gz3rrODB9EfVck3AMbnu/hDnRw=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr25113848ybe.642.1665590040169; Wed, 12
 Oct 2022 08:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220826111834.3014912-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QViGDCNrdPNPnT87go=ofCxTE7cWMGHFnOH5v+8rw8BGA@mail.gmail.com>
 <Y0bRsLWaSaUnPFqM@cormorant.local>
 <ce082eb5-e362-87f7-c4fc-bc786515017c@ict.ac.cn>
In-Reply-To: <ce082eb5-e362-87f7-c4fc-bc786515017c@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 12 Oct 2022 11:53:48 -0400
Message-ID: <CAJSP0QXu_cG6ErLZMsmdPc2iGtMCRKD8Kxp4vQQ8fjHLgORJhA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iothread and irqfd support
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org, kbusch@kernel.org
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

virtio-blk's dataplane BH completion batching mechanism is not enabled
by default and the performance results are mixed. If you develop a
different mechanism from scratch I think there's a good chance it
would work better :).

This looks like a queuing theory problem to me. It should be possible
to model IOPS as a function of some parameters and then hopefully find
simple rules to optimize IOPS by adjusting some of the parameters at
runtime. I haven't looked into this much myself though, so I don't
have any concrete suggestion. The basic idea is that as long as events
occur at a minimum rate then they can be batched to maximize
throughput without sacrificing too much latency. If the rate drops
then the device cannot hold back events.

Another place to look for inspiration is network cards. In Linux it's
common to use the NAPI framework to disable further receive interrupts
and then poll until the receive queue becomes empty. Transmit
completions can also be mitigated, but I'm not sure what the most
common approach is there.

Stefan

