Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF52ADE3F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:26:10 +0100 (CET)
Received: from localhost ([::1]:45408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcYLJ-0003yQ-M2
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcYJX-0003P4-Fw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:24:19 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcYJV-0000Sk-Bb
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:24:18 -0500
Received: by mail-ed1-x542.google.com with SMTP id t9so10435578edq.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 10:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LK2OK49KtHO0bRavy7DeJjDs2RpJPS1nXTSVtNfjfV4=;
 b=Qm+QXOLwXETTJ3pke1ye83d9H4v8O6/3v61oivCAdwECXHBZhvYi8C0Wrnm+MZqgYG
 nVaKMmGkGbYEUuPgfq+Usm1vK4JYY/uwa3N/4cNDX6N7IlAMbQBw3Y/e/ihgD+yABtZ/
 CpDV3+DMF+N4+1tJNsvJIgrUn8LRICY01+6MX4yZql8X856f/UjXMDDgYAoRN5WQdM+r
 urEZU3Ojenk157ZJVB/X0TkF4dG3Zqgj/KdWydZP6nOzP2dX5d1tStNVGA/wJUW2uCAA
 EXg8sDOLqiM1QX04he9odYHP2o/0ZVe0bTzbnqD6V6Osop1ELVW7ap+Lx84Sy82EUs/+
 zavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LK2OK49KtHO0bRavy7DeJjDs2RpJPS1nXTSVtNfjfV4=;
 b=F71jB650T9cmUNS/tVCR2BdwG8EraNuAhRhlcAwWB9OUv9+fiQUQfKSO6Oie010A1e
 1604LgDF9IHFpJv++ZuK1U9lvvnqzyGh1GKk7WQ5ymSKBMA44r+5o3dSrFpufkk9z6VT
 V5OgZq6abik9B1fpbj+TLE3HkbJNNWK5Iwy5/tHNWIEXNriJeRIY3l/tqY/36ASkUuew
 Fs9TnKEVIhzemDFPOL7ZnfwpoNqYQPtLBKGwnkiBxMt3cyLGMjLngb5H/rV1RyHl1iGV
 FiEQFpHPbffhergSkkYNIniy51970Qcwuls+DUl5Qr2ILQgmUNei0WeSPtqnTx6Mec3X
 j5jg==
X-Gm-Message-State: AOAM531AfJmC+VfXSg4gjHbgJ5btWEWQCuppjBE4jLRLMvQ9i2k7d4ti
 lI9Z9cSkm1+UY+0BuAQse29e8qmdOLnAAU2nbEm9Ow==
X-Google-Smtp-Source: ABdhPJyQvCmtOLJ0m3OVK0HKhdvF98JKZiCouygHNSIvB3NwmlqY+GrrqA2nC84Ru7TUEzWEPpf17j43Xt8iZ9gxLvI=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr678072edt.204.1605032655264; 
 Tue, 10 Nov 2020 10:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <20201110170604.5897-2-peter.maydell@linaro.org>
 <202011101901.09940.pisa@cmp.felk.cvut.cz>
In-Reply-To: <202011101901.09940.pisa@cmp.felk.cvut.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 18:24:03 +0000
Message-ID: <CAFEAcA8ujRALffz8KfvxdVb6NTcNLNdR4tF6picWnF6wk3R64A@mail.gmail.com>
Subject: Re: [PATCH for-5.2 v2 1/4] hw/net/can/ctucan: Don't allow guest to
 write off end of tx_buffer
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 at 18:02, Pavel Pisa <pisa@cmp.felk.cvut.cz> wrote:
>
> Hello Peter,
>
> On Tuesday 10 of November 2020 18:06:01 Peter Maydell wrote:
> > The ctucan device has 4 CAN bus cores, each of which has a set of 20
> > 32-bit registers for writing the transmitted data. The registers are
> > however not contiguous; each core's buffers is 0x100 bytes after
> > the last.
> >
> > We got the checks on the address wrong in the ctucan_mem_write()
> > function:
> >  * the first "is addr in range at all" check allowed
> >    addr == CTUCAN_CORE_MEM_SIZE, which is actually the first
> >    byte off the end of the range
> >  * the decode of addresses into core-number plus offset in the
> >    tx buffer for that core failed to check that the offset was
> >    in range, so the guest could write off the end of the
> >    tx_buffer[] array
> >
> > NB: currently the values of CTUCAN_CORE_MEM_SIZE, CTUCAN_CORE_TXBUF_NUM,
> > etc, make "buff_num >= CTUCAN_CORE_TXBUF_NUM" impossible, but we
> > retain this as a runtime check rather than an assertion to permit
> > those values to be changed in future (in hardware they are
> > configurable synthesis parameters).
> >
> > Fix the top level check, and check the offset is within the buffer.
> >
> > Fixes: Coverity CID 1432874
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/net/can/ctucan_core.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
> > index d20835cd7e9..538270e62f9 100644
> > --- a/hw/net/can/ctucan_core.c
> > +++ b/hw/net/can/ctucan_core.c
> > @@ -303,7 +303,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr,
> > uint64_t val, DPRINTF("write 0x%02llx addr 0x%02x\n",
> >              (unsigned long long)val, (unsigned int)addr);
> >
> > -    if (addr > CTUCAN_CORE_MEM_SIZE) {
> > +    if (addr >= CTUCAN_CORE_MEM_SIZE) {
> >          return;
> >      }
>
> Ack
>
> > @@ -312,7 +312,8 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr,
> > uint64_t val, addr -= CTU_CAN_FD_TXTB1_DATA_1;
> >          buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
> >          addr %= CTUCAN_CORE_TXBUFF_SPAN;
> > -        if (buff_num < CTUCAN_CORE_TXBUF_NUM) {
> > +        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) ||
> > +            (addr < sizeof(s->tx_buffer[buff_num].data))) {
>
> should be &&

Whoops, that's a silly mistake on my part.

> I would use
>
> +        if (buff_num < CTUCAN_CORE_TXBUF_NUM &&
> +            addr < CTUCAN_CORE_MSG_MAX_LEN) {
>
> But that is equal. There can be problem that last three bytes of the uint32_t
> type can fall after the end. The correct changes to fully support
> unaligned writes is not so easy an dis unnecessary for actual drivers
> and use. So suggest

>> +        addr &= ~3;
> +        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
> +            (addr < sizeof(s->tx_buffer[buff_num].data))) {

Hmm, yeah, the code is currently doing a 32-bit read regardless.

> You can consider that as Acked by me

OK, let's go with your version for 5.2.

For unaligned accesses, for 6.0, I think the code for doing
them to the txbuff at least is straightforward:

   if (buff_num < CTUCAN_CORE_TXBUF_NUM &&
       (addr + size) < CTUCAN_CORE_MSG_MAX_LEN) {
      stn_le_p(s->tx_buffer[buff_num].data + addr, size, val);
   }

(stn_le_p takes care of doing an appropriate-width write.)

thanks
-- PMM

