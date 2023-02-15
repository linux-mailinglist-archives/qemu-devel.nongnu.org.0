Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5426984FA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNpN-00031e-7C; Wed, 15 Feb 2023 14:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pSNpK-00030Q-AX; Wed, 15 Feb 2023 14:52:26 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pSNpI-0006A2-Mt; Wed, 15 Feb 2023 14:52:26 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id F27765C010C;
 Wed, 15 Feb 2023 14:52:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 15 Feb 2023 14:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676490740; x=
 1676577140; bh=J7JNshNTxlN/ZL+pKTpHmHpmNSBYqop6px+qKOVQ0ps=; b=n
 7r3WbMsljNbgA91NcfJK+Py4E3DWARq66vbIKApK/5HIHcssj4sKygdQhE83ePVI
 8ieDZMa/aBJxp5GvAzv9/gjvQmHvqZ+HtEJ5FYhtirLA9Ash0j8/rgoaQadXyWba
 c2qObHwvmYdE4era+Y77RVdM3MhXhzCvXPK5ydgL4BEmQbCgWYSj2Tr71R0bJ5Ml
 1Tc1GVHMGB48Hsf45ApiBNeeq+nz5BNpB0We9zEkC/7nbQ+uFBOF8IXTJUxVQPSp
 9bHgk/O4KEAIqDomugK73t8ArGIr5HxzsdW98iYZyK0yNlocDScgWn8SMQsq6wN+
 gsj9VP93Gw3SR3CLU8E8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676490740; x=
 1676577140; bh=J7JNshNTxlN/ZL+pKTpHmHpmNSBYqop6px+qKOVQ0ps=; b=d
 89nD0UDoTsWaB5vO1CMCKHhrM2vKY6ms/eSF6hxq05y+ETIYAnTrkAuhcPbSoYCB
 7aNYi2Fqe4XWyO4/IS6d3e3qyL0+lv5XDSNXkwFI4qPez/H/+NY0cg3IiYozUCbb
 1r0x3riOImgkDW7Z+az/Dxc3ARH101YwrpDhvQIWqdygM673xpisxhXMPLVQWdCx
 gbU71mxSZal4l/49oOsUw1dCtpocDMzdKYdEIJfwoChqqOMQC7JQTOJh81QY2HKD
 L6s9kZqbGzYg7Uu7LO4yEenbJ9C2O8osWqhJSUUbvp6fBK3FXl3h2GNx/O/h8hXv
 bH+RXigu/lZi2i/ZVb2Fw==
X-ME-Sender: <xms:9DftYxntmgiEB4F9ym_x0uZxiVHzbwUtm2VkHbJgF8StrUro_-IrCA>
 <xme:9DftY82F_WPaudIyuiN3t6_3zbcuv50KwK1IVr8V9DyBmnLshGYCKTIBZS_tzNiHs
 WfGCoaPuJYjZwtq35s>
X-ME-Received: <xmr:9DftY3p-hG8H1jUo5ebdqZj0tRZBwrxKHnIHgMnSPhc4nydHjzWa9-CXk437zyv9l-LNRQ5aR9XPwbpW2hOfHwKi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:9DftYxniZi4O7bkB2k8cN9YljRhJEPM3a61G1JfCcpSbQGc1VOcOWQ>
 <xmx:9DftY_1-QIqSKE6R1SO7BtT0tJ72k9pxEt0K23wOlRm4VNrQ2MTC2w>
 <xmx:9DftYwv8r8fe18sSNOaPeUSU9JuwNbqq0nuRmZ-lI3W3ZziRS3AvKA>
 <xmx:9DftY4L5l6AfkRf1VVK9bWY5FWJTN85S7daO0azojfJjdnBHo87mPA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Feb 2023 14:52:19 -0500 (EST)
Date: Wed, 15 Feb 2023 11:52:17 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 1/8] m25p80: Improve error when the backend file size
 does not match the device
Message-ID: <Y+038bMA0BaPLUr8@pdel-mbp.dhcp.thefacebook.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230214171830.681594-2-clg@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 14, 2023 at 06:18:23PM +0100, Cédric Le Goater wrote:
> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.
> 
> Use blk_check_size_and_read_all() instead of blk_pread() to improve
> the reported error.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20221115151000.2080833-1-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>   breakage with commit a4b15a8b9e ("pflash: Only read non-zero parts
>   of backend image") when using -snaphot.


I guess it's not obvious to me, what broke?

1. BlockBackend *blk = -drive file=blob.mtd,format=raw,if=mtd,snapshot=on
2. uint8_t *storage = malloc(...)
3. blk_check_size_and_read_all(blk, storage, size)
4. commit a4b15a8b9e 
    for sector in blk:
        if any(b != 0 for b in sector):
            memcpy(&storage[...], sector, sizeof(sector))
        else:
            # Skip memcpy of zeroes

But this is probably a regression for us because we actually expect the zeroes
to be copied?

- Peter

> 
>  hw/block/m25p80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 802d2eb021..dc5ffbc4ff 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "sysemu/block-backend.h"
> +#include "hw/block/block.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> @@ -1615,8 +1616,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>          trace_m25p80_binding(s);
>          s->storage = blk_blockalign(s->blk, s->size);
>  
> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
> -            error_setg(errp, "failed to read the initial flash content");
> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
>              return;
>          }
>      } else {
> -- 
> 2.39.1
> 

