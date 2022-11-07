Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5361F3FE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1q6-0008WI-Nr; Mon, 07 Nov 2022 08:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1os1q2-0008Uq-FB
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:06:54 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1os1pz-000480-VY
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:06:54 -0500
Received: by mail-pl1-x630.google.com with SMTP id p12so5505447plq.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CokQCthltXArHgeXeP+mG0lge6iFcoJC2pAhsLLTxeA=;
 b=mVtZPraq26J/agFjfITLb8VIqzreaup6RzDLpoWd0VGr0/mh35ZNPG3ARxIitnwu4V
 XrtBxeQ1Mvin9Bo+Fz1KLjEmg+wJE6Oq93wcK9E7mbEVhaz9/8sdqnu8KV4hVxwfePGY
 8pfd4IG4SKQdcnRn2Vcj/fUqWNQc2AlZ/usLwnwuzqHPsc9fkH21v9sBYBQkhHDk1RqH
 D9RWfRXT+dujNRRMi7v0iGvdWPhUAXxJLrG5HFhtyTCNwk8kP4880dsG4pqkMw3ghGDl
 iwCqdwxmkSkdHZplXUDL0LJq/t+hB42uY8shC1EZPMHmFd8i0hYPKticbo49rx/Uy8pF
 nsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CokQCthltXArHgeXeP+mG0lge6iFcoJC2pAhsLLTxeA=;
 b=PZWNf3cgN7HUw3M/rjuot9JuaK8guYfJ66FdFWzH0+QqFkVdB0WpONdDqsUF92+zcc
 fYf/VQzTqbYuRbgdKnPsD15YAS5zdx/FTFLyfZCDejolg5Ztrs47jJ0LWKpug+UgFGY/
 716TkGJtPcWPZhuELGTCTuxijZ8OmWWXTMF0ewyjwvjzTZmLdWCoD3UUhlB66sm0D9fB
 bDGi8Ny10KfuHCUXj4wU2g4qNlc4Mq75Ok/Vx9hOvFNXBSwGs03b62Pynpjfm8A4i5N5
 5MyP21Qxh01yGJQj1jQc/KE07EG373I1wTBIbnqReBo0aAeRE0YaYmNW7Ha2rjVPIeFd
 1uxg==
X-Gm-Message-State: ACrzQf1LoIXzSzk8WCj7TmVAcDGPwoCv6ukGfRL+o3e5sC/z51CwDv6N
 jN1O8Ft2Kz49SQa7/DDRrP7KPbCO3qfSSDxy/LX06odD/jQ=
X-Google-Smtp-Source: AMsMyM6aKbmjq9PeiipeRGlVf9xgWWW7n1WdC7LnK9ySZnYBIPzEw3Kr9K8OI+uYTpPoUqj5DHNsTP7LQykiuWUcA+A=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr50482166plb.60.1667826410317; Mon, 07
 Nov 2022 05:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
In-Reply-To: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Nov 2022 13:06:38 +0000
Message-ID: <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> The pflash implementation currently assumes fixed size of the
> backend storage. Due to this, the backend storage file needs to be
> exactly of size 32M. Otherwise, there will be an error like below.
>
> "device requires 33554432 bytes, block backend provides 4194304 bytes"
>
> Fix this issue by using the actual size of the backing store.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Do you really want the flash device size presented to the guest
to be variable depending on what the user passed as a block backend?
I don't think this is how we handle flash devices on other boards...

thanks
-- PMM

