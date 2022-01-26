Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7249D25D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:12:18 +0100 (CET)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCniI-0003h3-Mk
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:12:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nCnde-0001Px-UV
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:07:27 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nCndd-0003U4-EZ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:07:26 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 5741FC60912;
 Wed, 26 Jan 2022 20:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643224043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRJXzvUrvPNIKpSBEDqh4kXPc6OaPIUiMEgFuFEpzoM=;
 b=ChpKkdmUl9POfekXd+Zyr83+bDcvJRz3SnL213sDD4LS/vL+YKjLy1MJonB0zytiF3XWbw
 4jZVk1eRXgT9HZkC7TJcVO+9/0fVgn0poXTWBD9dKoE52kw70P/FL6fQlj5eEMqd4lnYab
 cNAXR8tLEFXWRXijrIh1vgRoTy6Uv75asZZbQZQrqzZgwnQU+da7NfZsvYHilKvuHlpODJ
 HfCZTrC0UcDBCc6tYBfpbi6bzXK+eoQ6huStKKO2zqB+NHndeebsLkM0HYZxNR9Y0JlCX0
 VWRQzJCFy54VKHubNM+vOL+TuuWHhxXaBP1VYSPwvP+adP0VWCyvXnqMTlr/GA==
Date: Wed, 26 Jan 2022 20:07:23 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v7 06/10] hw/ssi: Add a model of Xilinx Versal's OSPI
 flash memory controller
Message-ID: <YfGb6+XgoWaGuHKG@sekoia-pc.home.lmichel.fr>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
 <20220121161141.14389-7-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121161141.14389-7-francisco.iglesias@xilinx.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On 16:11 Fri 21 Jan     , Francisco Iglesias wrote:
> Add a model of Xilinx Versal's OSPI flash memory controller.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  include/hw/ssi/xlnx-versal-ospi.h |  111 +++
>  hw/ssi/xlnx-versal-ospi.c         | 1853 +++++++++++++++++++++++++++++++++++++
>  hw/ssi/meson.build                |    1 +
>  3 files changed, 1965 insertions(+)
>  create mode 100644 include/hw/ssi/xlnx-versal-ospi.h
>  create mode 100644 hw/ssi/xlnx-versal-ospi.c
> 
> diff --git a/include/hw/ssi/xlnx-versal-ospi.h b/include/hw/ssi/xlnx-versal-ospi.h
> new file mode 100644
> index 0000000000..14d1263497
> --- /dev/null
> +++ b/include/hw/ssi/xlnx-versal-ospi.h
> @@ -0,0 +1,111 @@

[snip]

> +static void ospi_ahb_decoder_enable_cs(XlnxVersalOspi *s, hwaddr addr)
> +{
> +    int cs = ospi_ahb_decoder_cs(s, addr);
> +
> +    if (cs >= 0) {
> +        for (int i = 0; i < s->num_cs; i++) {
> +                qemu_set_irq(s->cs_lines[i], cs != i);
If you re-send a series, indent is off here.

Otherwise:

Reviewed-by: Luc Michel <luc@lmichel.fr>

