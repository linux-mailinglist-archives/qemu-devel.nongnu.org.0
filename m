Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE0F5EB2C9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:04:33 +0200 (CEST)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvHD-00076K-RK
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ocvD9-00047t-ID
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:00:19 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ocvD8-0008IO-0G
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:00:19 -0400
Received: by mail-pl1-x635.google.com with SMTP id c24so7360026plo.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fAfS4Wq33BXyQGE7CcR34XYPte7qEdpIcjZ/YFhaYW8=;
 b=StrDdkIYLjayHLzISZ9QZ76PZ+a1qNWx6pwRTlz2cTucNAOy3S4fKcy6reFksCaRWS
 zdA4CkNR1RY1sjOG9WyxftLNdhNRV7fjEA8sNCgW8kDvoA/FbFvQenvncBundfz2ZKY4
 1aBqCwPvRXHneA1+APt6CgrXXOH5vl+uuQv2SKLMS+sgM9egdtjhQlCrIfhsrw/nwV+a
 9K6p6k0Y3VjEw1X4UmRKsXsFJKcDHWHEN5AD9xORc3WXU/avAdWwgRQg/ol+RDJYgApJ
 Le68kxgecglGYH6WBFEdkaMwSdLFDIvnJz6z/4CoEHGWv+6JwwtLtCOXtzFF5yW4lfWQ
 P+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fAfS4Wq33BXyQGE7CcR34XYPte7qEdpIcjZ/YFhaYW8=;
 b=eZ9xYtCae/5JKyUUS0cBJeipPt6EBYQA4yOwuYR0si+V87AapBNX1WzEUDeu0CdPJ1
 jQfYSyEN0c5OdJQzu1+ZabADvRBLZIhCWnm/CqxjqXgMYO4E28iOPy2cSR1/17wZQ9St
 Ksv3gkWuRqn69rPt2QIzi98zYogUzZEMemBsWPlW20OUFQNKmkxeXdenBSpphb3ryXSM
 PUcYrFSt6KPkMYc56x+Yut2qlNNTCjM4Tkz57nL47Dqk5hlm5c4fWMvvWc6lqIh9AlTN
 pf5/sGBCqJ3rWVYxzCC5ttAjNi3SO3d2mjrFS5M1cp8zStn5gXMqcUZlGd4VBERylXGs
 zHRQ==
X-Gm-Message-State: ACrzQf0lhuQToiEoxWho7p7DI+tu7WjVRjQP/e1rsTFiXrWOw0+1M04S
 zU5rewLAFYB9t80OI38Qw239PD9LNRxoaYiYb/g=
X-Google-Smtp-Source: AMsMyM5l6mUiA/ECsKw8a0mjN38YaJhgL47Xy7S8YjxogMrkTiioeAep7DXdNupPj0JDI4QfRXSTsBWqQePq8m0z5Pc=
X-Received: by 2002:a17:902:f7ca:b0:178:9c90:b010 with SMTP id
 h10-20020a170902f7ca00b001789c90b010mr23524073plw.149.1664226016381; Mon, 26
 Sep 2022 14:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
 <CAJSP0QWi_xpNynSKsxH5gdK8gqt1jOjZqEsJ=eiJkypVShuc4g@mail.gmail.com>
In-Reply-To: <CAJSP0QWi_xpNynSKsxH5gdK8gqt1jOjZqEsJ=eiJkypVShuc4g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Sep 2022 06:59:50 +1000
Message-ID: <CAKmqyKP4bTGUtDA39F_W1Bp6PxRVgcQr_-Zsh2aKG6wFjGeVpA@mail.gmail.com>
Subject: Re: [PULL 00/12] riscv-to-apply queue
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Sep 27, 2022 at 5:29 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, 23 Sept 2022 at 00:08, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git pull-riscv-to-apply-20220923-2
>
> Hi Alistair,
> Please use the HTTPS GitHub repo URL in pull requests. Setting
> separate "url" (HTTPS) and "pushUrl" (ssh) settings for your remote in
> git-config(1) should solve this problem.

Ah! Ok, now I see. I do have a separate `pushUrl` but I didn't update
my script. I wasn't clear on what you were asking for last time. I'll
update and resend.

Alistair

>
> Stefan

