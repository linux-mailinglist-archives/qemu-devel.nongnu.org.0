Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B892ADDCD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:08:22 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcY45-00080B-Dn
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcY0t-0006Wz-FL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:05:03 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:13926)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcY0q-0002Ob-FB
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:05:03 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AAI3uUx086415;
 Tue, 10 Nov 2020 19:03:56 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AAI3uku029699; Tue, 10 Nov 2020 19:03:56 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AAI3usT029698;
 Tue, 10 Nov 2020 19:03:56 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2 v2 4/4] hw/net/can/ctucan_core: Use stl_le_p to
 write to tx_buffers
Date: Tue, 10 Nov 2020 19:03:55 +0100
User-Agent: KMail/1.9.10
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <20201110170604.5897-5-peter.maydell@linaro.org>
In-Reply-To: <20201110170604.5897-5-peter.maydell@linaro.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202011101903.55958.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AAI3uUx086415
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605636240.84921@n9UbRtVJ51RBFLTgj0Ueng
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 13:02:14
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tuesday 10 of November 2020 18:06:04 Peter Maydell wrote:
> Instead of casting an address within a uint8_t array to a
> uint32_t*, use stl_le_p(). This handles possibly misaligned
> addresses which would otherwise crash on some hosts.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> ---
>  hw/net/can/ctucan_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
> index a400ad13a43..0ef528eb879 100644
> --- a/hw/net/can/ctucan_core.c
> +++ b/hw/net/can/ctucan_core.c
> @@ -305,8 +305,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr,
> uint64_t val, addr %=3D CTUCAN_CORE_TXBUFF_SPAN;
>          if ((buff_num < CTUCAN_CORE_TXBUF_NUM) ||
>              (addr < sizeof(s->tx_buffer[buff_num].data))) {
> -            uint32_t *bufp =3D (uint32_t *)(s->tx_buffer[buff_num].data +
> addr); -            *bufp =3D cpu_to_le32(val);
> +            stl_le_p(s->tx_buffer[buff_num].data + addr, val);
>          }
>      } else {
>          switch (addr & ~3) {

I test change soon, but this seems obvious so

Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

