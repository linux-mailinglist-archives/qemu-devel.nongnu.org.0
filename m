Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F95E934
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:34:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLAAt-00083d-Sj
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:34:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA6L-000527-7m
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA6K-0006OM-C9
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:01 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hLA6I-0006NG-59; Mon, 29 Apr 2019 13:29:58 -0400
Received: by mail-lj1-x244.google.com with SMTP id z26so10164142ljj.2;
	Mon, 29 Apr 2019 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a3DPUEIRyecRUGS47p5FmLdqBTx4B9Jqf0Eml2oDI5A=;
	b=dvO7IKoZ/NCO+KgP0M4oOoruQBLoRFLX1iMYIYIUw9QZYvvR51PPyysV0U0D1qWosQ
	sbBLKj1kOjyhx/Q1u7aSYImkJcElfBLLGNeydnYaBmQSOH0nmNYYC5qtXm6O6L7LDhIc
	oyebTT9bkwxWruARMnVSyPoqYFYsO1HG0N1RJzylSvk7pZK1ee0OGChereLdE9DKuzq9
	DsDmuwkX6KAtxLzJArG8Rjdff9ZsVenXrLT+O6WyBAbuOkJU2O8aNPxTWqh0S68HtwMF
	wRB/WxbVYkOmKODoQtXqfSjw6NsJzMXv9NeUDI43v3/s5jSJ6wzCaUEDePeThR4aduvY
	oGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a3DPUEIRyecRUGS47p5FmLdqBTx4B9Jqf0Eml2oDI5A=;
	b=iIVi9dPT0gIhWTHN7E9kuP8zJOcFatwHR4GkyxPcj/TgXH31QBE5QUP58PPizK7l6E
	NKxNEZZ7rOFYpueu/DCVYUUBgkK+XdgHJoikJbnui0uqAQBOjvn/5a60Hz5kfFmZ9M04
	SNoq5onJKttNX9ErT6UEuNGNMhPyMRPrlP+fISi1x3daqQwLXugADu991fzG4k4tPQZ/
	AyGWsVhMBHpAUHAJtSjEmeWekPTnLG239w6jhMG6VqucFzPzCFbZlBSQFlJtC2tCLFXn
	ypOKCFOc+Pk8ZcplYNyCNFKovsM2APR359AecCCJQEFwnjSZQ1vqe8mPd/hwVskenMdh
	s3RQ==
X-Gm-Message-State: APjAAAXp6AchYIdKK/WUvW35H6JI4lhIf8UA37pObuqdwsBA6My1LXpb
	CY3LKC6govP/IfkOAuiFh9+k29yIoVNmri+Ydrs=
X-Google-Smtp-Source: APXvYqxjg+46dKjNOMsJigUvEunR5+STr7yycBYH8zZj8mniMwmerkLHCPahociWWSlRqSUzDhRCRaVhVvATCwkgP7g=
X-Received: by 2002:a2e:9ed3:: with SMTP id h19mr33593853ljk.129.1556558996905;
	Mon, 29 Apr 2019 10:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190427141459.19728-1-philmd@redhat.com>
	<20190427141459.19728-3-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Apr 2019 10:29:28 -0700
Message-ID: <CAKmqyKMMTQtq2sxSH85oPzsK-vVX1jELaQALPhAEJ6EpTSD66g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/intc: Only build the
 xlnx-iomod-intc device for the MicroBlaze PMU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 27, 2019 at 7:17 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The Xilinx I/O Module Interrupt Controller is only used by the
> MicroBlaze PMU, not by the AArch64 machine.
> Move it from the generic ZynqMP object list to the PMU specific.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index df712c3e6c9..247e8016cb8 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -3,7 +3,7 @@ common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
>  common-obj-$(CONFIG_PL190) +=3D pl190.o
>  common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
>  common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
> -common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
> +common-obj-$(CONFIG_XLNX_ZYNQMP_PMU) +=3D xlnx-pmu-iomod-intc.o
>  common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-ipi.o
>  common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
>  common-obj-$(CONFIG_IMX) +=3D imx_avic.o imx_gpcv2.o
> --
> 2.20.1
>
>

