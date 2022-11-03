Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C7618460
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqd4C-0007Of-Hv; Thu, 03 Nov 2022 12:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqd4A-0007OU-NC
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:27:42 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqd48-0001eN-P9
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:27:42 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-370547b8ca0so20768687b3.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jwsg74A/C1OXz+a65N8/QfNsIlNn0yRxNQdslLWDhic=;
 b=eb9SjGRQ5YkRfwXPWXRqWbKH9awYQNh1lYia5ljW2BPjUsFPkww8Lw5zb4tAqVs0/I
 utKpZUc80Yd1r1dzeBNiUxV979veqaDwgVi3Yfl6dKVjtZjJhjYpJ1WxoNFqa/GOMJ/V
 xWqG7LtATXWeBuPnMlrYTp9FXaHWzeTlCBYDbti2CA6u7vLmByHjH6IeqPD+b7A7upVo
 tNVOq6uNV+NhQLClz7VOYjbO8+X24ki6ClNjNMqSjX+2lcvCdXP2UVd6qKH4EC6VjHmz
 rCxJ71iM4hM6CRyZPQP8eEk8DbI4Li3enOK2dJBQGE3T3XIw9QbGs0sWIwjtZQGdHas/
 9vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jwsg74A/C1OXz+a65N8/QfNsIlNn0yRxNQdslLWDhic=;
 b=TrTdkm3cwT179WZIwBk4tQxZwAir3TPlSWMiS0ZM+7KDdHQ/BVP5Smoy9JBZJBZ75n
 X2+2IkqIrPJFlxU0QO0JZ58dNTLPoT1+u2SplW1MSjEFCWPaswsJRWUyvgyTHLNd4BDr
 VIKu0D1tTpY//+luBtbdQ8Wh2nR7vzsm5CjVpibuwmgrLCkq7SMP62ee3tW5JI2+Kf8R
 M0jm33V22IZa7pGrBws1DKQytYizk0OpCTMlwrWMTMF76klQUeQRyKghsl6hC8R7MGuc
 vqAeEw/+CNtZ9pGrZOfQFM6jn6hQ5aeulIL7h/atPX68mUKz3niIRoKxWhU7XWWhQML0
 hZKA==
X-Gm-Message-State: ACrzQf385QUd630q5HpxU0ojX948Sj7wBJ4bX/QIk3FslZbniPGKFKv6
 hRaBk4gqu86d2S7T0UjtZNnoYAMKBpvTbpCmmqU=
X-Google-Smtp-Source: AMsMyM58Kkj3hsS+8oBsLSFpE8IBInB1EdXwlp74CS0n2mqK+c2C4AZ7P/s5eG0cMDaT7Sv/5DVVa5QD2Yk8wQafw+I=
X-Received: by 2002:a0d:f0c2:0:b0:370:10ff:17fa with SMTP id
 z185-20020a0df0c2000000b0037010ff17famr28641585ywe.239.1667492858825; Thu, 03
 Nov 2022 09:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
 <20221103115817-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221103115817-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 12:27:27 -0400
Message-ID: <CAJSP0QWkB5Kosy8b-RgTfMJXKto=qyv0iR_HD4DB+J+6VcxdKA@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, philmd@linaro.org, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 11:59, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Nov 03, 2022 at 11:49:21AM -0400, Stefan Hajnoczi wrote:
> > gitlab-runner can run locally with minimal setup:
> > https://bagong.gitlab.io/posts/run-gitlab-ci-locally/
> >
> > I haven't tried it yet, but that seems like the most reliable (and
> > easiest) way to reproduce the CI environment.
> >
> > Stefan
>
> How does one pass in variables do you know? Environment?

Haven't tried it yet, sorry.

Stefan

