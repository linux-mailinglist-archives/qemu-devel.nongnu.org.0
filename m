Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD3300451
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:38:27 +0100 (CET)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wdu-0000Wz-Gk
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2wcI-0007iu-NA; Fri, 22 Jan 2021 08:36:46 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2wcG-0007jI-Sw; Fri, 22 Jan 2021 08:36:46 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id x78so5435615ybe.11;
 Fri, 22 Jan 2021 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kI0NtIlZ5oSUvFWDLYPUuXZw6vEMZcUV+P597q2hBjU=;
 b=lVTTNZPYZA7T99wzTmlzj/CkadQ7HebpEzogO7YJkMAR1iQlgegLAq8Gv5c0dcv4Ye
 gRxpS7vcvmoOkO8bUqEOArn0UsBKhr6Mzg4a77cnQCZ6ISYj0Wc2Mh3i1Daak5D2XlGJ
 PEWjiRi/HbJle9RXAdMBVmEr0wPLnr3kQjRWkQ8oEwMJsofTcSOCFu7FcGiXB/9RY0Hq
 60TZE6s/Bvv6Ev+spRak/wrzairBDcHm55/a4dU8V9ifihWYy5U901ZdyPSoYEYKRcGb
 ycjjSKT0kw4kKdC8ESyj4amurwZ6bpbbJYbjsjdiHp6rLIhLmAiwRPwWeBwu35nBNG8P
 dBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kI0NtIlZ5oSUvFWDLYPUuXZw6vEMZcUV+P597q2hBjU=;
 b=k8x0Vh7nAZNmc0ydctchkaZTWyRh//XY3SmGzfR51sHCUozW8EpsE/6OZamEmHpQ4a
 oPrB1aWfI/PlvXlIDszKLdtzJJ7+1XTWtjC1AmhCSbdaYkzIyg8g6bHOm064HwgmyFf/
 7UdXwwu8TFogx6hxNzy/SXl1szpSZ5RmuxzesBrah/Qr4QIYrlvZBU0RP8a0IpFZzfaZ
 CLFF4rhJrd31rM9sa1Z+8k7L34wIdwtSCnM18zUvoW5iqeIXMtPp7JCwy+BueUnvhsKi
 Elwt2VwR2CknrME+J4qH5EiA56n2TxziD72RXLdeD7nl2SnZFXuW5JLrEurGt7nUezI+
 b8gw==
X-Gm-Message-State: AOAM531GL3OwCCqJ1wkfEnE9EWCz/Gr5bBz9gfd0zJ2qbV2IDFHcrLuu
 jteO+B5HOBYZzLHUHt9C96zy5wgUQ/Wi4ujfXfw=
X-Google-Smtp-Source: ABdhPJzxApXHU1OHTNsRIb2DaX5/F7BOCIqcwRjUAZh62w7FL1hrzdRDi8WvL4m8jDC6lVDo5jtMDJYY95uutSpNWGE=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr6347499ybp.314.1611322603595; 
 Fri, 22 Jan 2021 05:36:43 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Jan 2021 21:36:28 +0800
Message-ID: <CAEUhbmWXTdL=DU0bRNJqx--2_=qa7kLpru7PE5jK4GxZRMWU3w@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 9:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This v8 series is based on the following 2 versions:
>
> - v5 series sent from Bin
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> - v7 series sent from Philippe
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
>
> This series fixes a bunch of bugs in current implementation of the imx
> spi controller, including the following issues:
>
> - remove imx_spi_update_irq() in imx_spi_reset()
> - chip select signal was not lower down when spi controller is disabled
> - round up the tx burst length to be multiple of 8
> - transfer incorrect data when the burst length is larger than 32 bit
> - spi controller tx and rx fifo endianness is incorrect
> - remove pointless variable (s->burst_length) initialization (Philippe)
> - rework imx_spi_reset() to keep CONREG register value (Philippe)
> - rework imx_spi_read() to handle block disabled (Philippe)
> - rework imx_spi_write() to handle block disabled (Philippe)
>
> Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> (interrupt mode).
>
> Changes in v8:
> - keep the controller disable logic in the ECSPI_CONREG case
>   in imx_spi_write()

Ping?

