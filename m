Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE292A0124
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 10:21:26 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYQb7-0000zj-Vb
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 05:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kYQVM-0005Uh-Az; Fri, 30 Oct 2020 05:15:28 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kYQVI-0008Ih-Sq; Fri, 30 Oct 2020 05:15:27 -0400
Received: by mail-yb1-xb43.google.com with SMTP id 67so4539100ybt.6;
 Fri, 30 Oct 2020 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTmzJ/jElPGt3FUJEPmktOZo3WNUdJ8tMml+rQeBq28=;
 b=CbJg6KQnWwSSUA+3V3qGxh8WxhviH8NXtjMZcCFRlJj+vLaOnTLCO8drVFSGV7zAEb
 G0Q/21keK738qYjHfgzNT0zH12sMPgjhrgMeY3kRXFne/RaKjDU49mRa2d4xwupdEEXf
 ybEfQDTEe/PNGcCMKmQyyC1pV5JQooZM8ykEm4+nIKowULE5Uv3d5ezuYoBBcf1knI+A
 8V8WoXo+jbHPZWlVloTL6WPHIYmHQvgFxP84QLx5pzo999wS2A6onZZVO7BI/HQpoB+J
 PNu0QfLOcsOTgnNndjwsvjL7mbQ32WotPBUQPrp6TI+vXLFwCFMiNhj6zw2TIn079vF6
 YU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTmzJ/jElPGt3FUJEPmktOZo3WNUdJ8tMml+rQeBq28=;
 b=nfTiV6tvLhsSLZKwrk+GWHPvkTN7Zb5ZiS+mzMpwbE8h1pZKYJhM9dq+zz+QIkXVHU
 Zdla9OQ8IpTXffBSH95WCjPW7aY6jguswsDHQlDQeHR1Tqj+kKACJrFtGbtt4WyDW5x+
 rKNbrH7q3/AOuWA+OYe8C8oOOeNtnWwucVy8hg46ypwX03kHSpo3wasaJwks4RAeGIrd
 VVilGCoNHQG454w4CG8y/AYeW3RAWz8kZtPdPLn4byi+bpLLZXbzTEU2iNqCSdQidwzn
 lBxIfhYzh9Ndu1ZnH1/hHI6nIWJAfffotf7eba4mytyY5N+xPbTY3KQehMTBhcAekJsO
 5REA==
X-Gm-Message-State: AOAM533+mraZ/DqKt3NvGXuns+ZXkSAdab1J37M7yiY8WXWOZH//AX6R
 aFdtM7+Ye/8FZ8Yz+DQJDUdyyQSVQmC0pJm1Zo0=
X-Google-Smtp-Source: ABdhPJzyaz3TLdkBpdY/WAo8jRIPqU6hJM+zgBm4GcJo0talYxJXicMoju6vPSqN+oVYAB2CDoFXCIb5oNB0MM0Ai9U=
X-Received: by 2002:a25:f81e:: with SMTP id u30mr2269160ybd.332.1604049310069; 
 Fri, 30 Oct 2020 02:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201030004815.4172849-1-zhangxinhao1@huawei.com>
In-Reply-To: <20201030004815.4172849-1-zhangxinhao1@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Oct 2020 17:14:59 +0800
Message-ID: <CAEUhbmXNRkFSvtPg8AQhCmN1X-VYow2JiEypeZFZFnswFB9BUg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/csr.c : add space before the open
 parenthesis '('
To: Xinhao Zhang <zhangxinhao1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 alex.chen@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 30, 2020 at 8:58 AM Xinhao Zhang <zhangxinhao1@huawei.com> wrote:
>
> Fix code style. Space required before the open parenthesis '('.
>
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

