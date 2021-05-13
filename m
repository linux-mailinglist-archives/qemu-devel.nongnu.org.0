Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28E37FB31
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:03:55 +0200 (CEST)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDoY-00038a-7V
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDjn-00014j-Gs; Thu, 13 May 2021 11:58:59 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDjl-0002fT-5C; Thu, 13 May 2021 11:58:59 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MI5YH-1lkqUO3oIh-00F9uh; Thu, 13 May 2021 17:58:52 +0200
Subject: Re: [PATCH trivial] hw/gpio/aspeed: spelling fix (addtional)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7d955825-c84f-297d-de69-33045177947e@vivier.eu>
Date: Thu, 13 May 2021 17:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QCq2q3ORBC2DkYOkfL/1u4fK6AANADXlSOhfarozV2PajqI8oeT
 1K3K13LC/8I3pDit/UeWZLt/szqKe6PBJ8jQ/6ig7KAAsvrc+/gQ4Vk+VMz42CEKmGjsGdQ
 pEnjyPBmP0UmGhMFna082RqwQVaYuj1wGEVLiSkgcRtgek8t4i19NUOTOYzCNGRqa0RRWuX
 TMSfJux4b9qMW0BtMZdWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TPFNopJMfuU=:xaxIe1wxxIhtghmpq7aweY
 7FGxEv/32mDnThx4RSJpIE6VrQSGs1kvTxXz7GnBiDr1oGWUBu/p5CamHG9Q/0jSTs2AT2e+E
 YVfOycuQ/8Q/gIjzhMDRdNFRatpvcLBVHWMEwkiPwgxDqrxcyDkL6bQY/HPBRzPIIbg9r+yoS
 DispInJAqBB0L70o8gDr5cL+mV1rDKOb4lfcOqhu6+pNtvWi4Ov9NDpUJor+m/Hw01VSKi0CM
 UTtEx7XEQrpUCnU/OfIvBNSV/v2BSMJ5adfZZKLn1A6KuENxEschDGUjDbbTIpWLempmN1NLz
 yZJzO3h3HCmje2IsXFdPMjo6HrnPruSqX2HVKvFRRsTuj0fPTx44Q9+vb9iKPgALjeqGG/yeB
 itfn6qa2OH16y71ELLK9YML5+Z13lvdSWwlVcJdWIGMuJQBHgAbOBk7G6J/Nm/dPMW/gRrNLA
 jEUVbilqMzIwIcra3wNVvEevojxNqUI8GJxp0GRVjNKt2MbqbdUlrl6fvxN32CVhBUvR/RVT/
 o+0SbwYxSiIJq5Wk6Aiov8=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, rashmica.g@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/05/2021 à 11:36, Michael Tokarev a écrit :
> Fixes: 36d737ee82b2972167e97901c5271ba3f904ba71
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/gpio/aspeed_gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 985a259e05..34d8acb0e3 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -170,7 +170,7 @@
>  /* AST2600 only - 1.8V gpios */
>  /*
>   * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-0x198)
> - * and addtional 1.8V gpios (memory offsets 0x800-0x9D4).
> + * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
>   */
>  #define GPIO_1_8V_REG_OFFSET          0x800
>  #define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) >> 2)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


