Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC756591D8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 21:55:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzva-000791-16; Thu, 29 Dec 2022 15:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzvH-000733-8m; Thu, 29 Dec 2022 15:54:44 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzvF-0007Np-Dj; Thu, 29 Dec 2022 15:54:42 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A7B9A5C0092;
 Thu, 29 Dec 2022 15:54:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Dec 2022 15:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672347280; x=
 1672433680; bh=l0sRPdlIPICshHyYVoraM+a4KCoNN/bNwhbzJRQ5fcs=; b=v
 YUraVCPqbkILSQiwTPPzaOGF47w805SA1GVvqFzNEDzQHd/hTqXZcHFF9HJqg4eI
 ttJJl1zTF1yBtmX5yTEkDP2ULMUBiIrViItz/dHkspwC+vNHaZ7QBfxBqeQDCY4B
 YmWMFlmwrMtfnl/NtHNBpwkr8XuDeLCo4FFF8VMXsKddetP2Ox/8jzBh70OOAOGH
 tdA8u2V9N0LxjhuYeVCS4FModyqdCIM8QDtwGn3A0cD0VpQW+NYNAepgjyQBEBZW
 fpfwRrQwDKcdOdM6ughYVk8eFv+4ZPvLLXCgn7sK3/PB1S9Jdn8xDuANz8wMOQDe
 8ueiwpeGDR0x76TKPVUsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672347280; x=
 1672433680; bh=l0sRPdlIPICshHyYVoraM+a4KCoNN/bNwhbzJRQ5fcs=; b=w
 cZvH/q1cIrPMQDNdQU9irrdGZK6mWFGm1XCKPt/gU36cR4oL2fZAWHPiAmSLfPXJ
 GU879UsatKvcfaBLwgG04R9lrmNt5NHWqh7RXJHRg9VRDetoeeM2q9roV1VLcFUB
 ypUXWYUQaR8Js2mEaXHMSEEzEbita9G61SXS3XqJGJf88gpGtW4GFKUyv8A2iPkh
 X2AdU7MOPVx/Rzq58hPHdbde4ySJr5yBJcq56BRLwzPm/XScPwUHS/hRom4BtUHa
 XWWahGq5dmrXkbnRzS/821RZUkOvDK/qK9PGdWKqAtGxj+B0r8InGNOgmMadvvos
 PfteCVTUpzDbnZrVoh4fw==
X-ME-Sender: <xms:kP6tY5tqnRHgQbzlY9crYGJguPGtZFMpF_3RGztkqrw_tEKkcdz5YQ>
 <xme:kP6tYyfCp-aMRaXoEQa16Xk4KTH2Vlq-U2frJU-_uCjjDAHFNb4lbDMFpDshBy7lq
 xrWafDrH1Wp5wsWo5s>
X-ME-Received: <xmr:kP6tY8wMMbMLtvxSzbjJeHQi7KICgFY1wX9hxUHFHtPq1Yd-nKA2FTz3HsHAqsCO3iyeiE-JuSQo-G1Amt-tPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:kP6tYwMnVVYXOzFetxBxkY5rL4Cdp8Cgo0df-OBGpzWRXbcmSgkYqg>
 <xmx:kP6tY58SVhBveNWCLDAfv4L-SX0yUGdayzFeimozwNSu3qJgzZPp2g>
 <xmx:kP6tYwVk29YFNw-ftfS369pZdODgdnkzZTYVpgUDTKp_7rJSr8EgCQ>
 <xmx:kP6tY3dmgBVyNrwf_4Mq9-WsjAXdR0L813w9gT81kR1KBVUSYmIt5g>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:54:38 -0500 (EST)
Date: Thu, 29 Dec 2022 12:54:36 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 7/9] hw/misc/aspeed_hace: Do not crash if
 address_space_map() failed
Message-ID: <Y63+jFP3oNOfR7Px@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-8-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Thu, Dec 29, 2022 at 04:23:23PM +0100, Philippe Mathieu-Daudé wrote:
> address_space_map() can fail:
> 
>   uart:~$ hash test
>   sha256_test
>   tv[0]:
>   Segmentation fault: 11
>   Thread 3 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
>   gen_acc_mode_iov (req_len=0x7ffff18b7778, id=<optimized out>, iov=0x7ffff18b7780, s=0x555556ce0bd0)
>       at ../hw/misc/aspeed_hace.c:171
>   171         if (has_padding(s, &iov[id], *req_len, &total_msg_len, &pad_offset)) {
>   (gdb) bt
>   #0  gen_acc_mode_iov (req_len=0x7ffff18b7778, id=<optimized out>, iov=0x7ffff18b7780, s=0x555556ce0bd0)
>       at ../hw/misc/aspeed_hace.c:171
>   #1  do_hash_operation (s=s@entry=0x555556ce0bd0, algo=3, sg_mode=sg_mode@entry=true, acc_mode=acc_mode@entry=true)
>       at ../hw/misc/aspeed_hace.c:224
>   #2  0x00005555559bdbb8 in aspeed_hace_write (opaque=<optimized out>, addr=12, data=262488, size=<optimized out>)
>       at ../hw/misc/aspeed_hace.c:358
> 
> This change doesn't fix much, but at least the guest
> can't crash QEMU anymore. Instead it is still usable:
> 
>   uart:~$ hash test
>   sha256_test
>   tv[0]:hash_final error
>   sha384_test
>   tv[0]:hash_final error
>   sha512_test
>   tv[0]:hash_final error
>   [00:00:06.278,000] <err> hace_global: HACE poll timeout
>   [00:00:09.324,000] <err> hace_global: HACE poll timeout
>   [00:00:12.261,000] <err> hace_global: HACE poll timeout
>   uart:~$
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Good catch,

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Maybe include this tag?

Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")

> ---
>  hw/misc/aspeed_hace.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index ac21be306c..12a761f1f5 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -193,6 +193,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>      size_t digest_len = 0;
>      int niov = 0;
>      int i;
> +    void *haddr;
>  
>      if (sg_mode) {
>          uint32_t len = 0;
> @@ -217,9 +218,13 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>              addr &= SG_LIST_ADDR_MASK;
>  
>              plen = len & SG_LIST_LEN_MASK;
> -            iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
> -                                                MEMTXATTRS_UNSPECIFIED);
> -
> +            haddr = address_space_map(&s->dram_as, addr, &plen, false,
> +                                      MEMTXATTRS_UNSPECIFIED);
> +            if (haddr == NULL) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> +                return;
> +            }
> +            iov[i].iov_base = haddr;
>              if (acc_mode) {
>                  niov = gen_acc_mode_iov(s, iov, i, &plen);
>  
> @@ -230,10 +235,14 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>      } else {
>          hwaddr len = s->regs[R_HASH_SRC_LEN];
>  
> +        haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
> +                                  &len, false, MEMTXATTRS_UNSPECIFIED);
> +        if (haddr == NULL) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> +            return;
> +        }
> +        iov[0].iov_base = haddr;
>          iov[0].iov_len = len;
> -        iov[0].iov_base = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
> -                                            &len, false,
> -                                            MEMTXATTRS_UNSPECIFIED);
>          i = 1;
>  
>          if (s->iov_count) {
> -- 
> 2.38.1
> 

