Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCC2AE18A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 22:21:38 +0100 (CET)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcb56-0007Zo-R2
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 16:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcb2a-00078O-Ce
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:19:00 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcb2Y-0006HL-Hg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:19:00 -0500
Received: by mail-ed1-x543.google.com with SMTP id t11so14315999edj.13
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0u9MFTO0Qp1FgOCydNIwI0sP+NwIaOX1ieX2PTqcXVs=;
 b=nsCHoycu3rNyM0IlNR9GgjcIB+1mIylw0mltJUiTBVCmVNXYkd1VR/Y2Z5OY+9+oAN
 7h56z17lYQ4h6+3WqVcWK1h7iC3eRf45FPobxBtRcgKFD90FjxyFYj/yeSsPf9t3GWZi
 IiWqPx8lhKGDTOB7X2cVV10lSo6w4B6Oc8P8pbu3knElmo9I22I2kDfz4r/PONsVVOcq
 ZUPscrPsTBdD4+BBuABc+Dpw//DceWSl8aY71WbTFHtG9bXhujLFdTslXmA4CzAW6di3
 YEZhz0IXHDAfSVvJxs508yt7Lk59YmMqy2DHQEsssEv7Ys+Z6neVMgH/wJIC5bv9pKJe
 p7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0u9MFTO0Qp1FgOCydNIwI0sP+NwIaOX1ieX2PTqcXVs=;
 b=SKlxq4a7EYV1yot/RiNUngpqdhBWJfBzglJ+I9dcV671l699JFplKyfmdFry0uYIFK
 mqYEanDY88UiCyMpe2uWI1+V666O9ZdCXFrL9OHEyfPO/MENtwvNiIwb7RYUzEoSsY2X
 sEBbXI5ffcxwt6yUFJaqPAK4+DeXfyRKfzVxN8gAXlt6aHxF9trgC72hXt57Ft+1LyI1
 Vq7pwFY9BrCPUKGHQmUfZxgm6Jb/AMIODXMqfy7YyM9vsM5M2Vu9fYHcCht2U3mPcKIc
 oqrw+8TYc/luSFEc0mXr3fgdISFfMN19ykBwFmmJyBrkCdxHRZV+F2Hn2Gib7NR5fid2
 ywCw==
X-Gm-Message-State: AOAM530m/xlSEAOXqmBAWyZuIOQoetyDz705OOaQ8mjXlDQ1tNfDblV/
 A0z18XXteGm3BC17i2dbiAJcPR9hAqNgZUwCnGzNXg==
X-Google-Smtp-Source: ABdhPJwDXdy+43Qj3vzkHAufg1PacIQcvWdLJXWE0hh86OIBn2i8v/kB4lPyWLV9HncquTY4H7n+oDzunjvnLR2oXX4=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr1491605edb.100.1605043136713; 
 Tue, 10 Nov 2020 13:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <202011101901.09940.pisa@cmp.felk.cvut.cz>
 <CAFEAcA8ujRALffz8KfvxdVb6NTcNLNdR4tF6picWnF6wk3R64A@mail.gmail.com>
 <202011102030.58186.pisa@cmp.felk.cvut.cz>
In-Reply-To: <202011102030.58186.pisa@cmp.felk.cvut.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 21:18:45 +0000
Message-ID: <CAFEAcA_LHQvYtgMMeZVn9XW=Tdrd=nXAWYFXB=WeECa1utpnbg@mail.gmail.com>
Subject: Re: [PATCH for-5.2 v2 1/4] hw/net/can/ctucan: Don't allow guest to
 write off end of tx_buffer
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
 Ondrej Ille <ondrej.ille@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?SmFuIENoYXJ2w6F0?= <charvj10@fel.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 at 19:32, Pavel Pisa <pisa@cmp.felk.cvut.cz> wrote:
>
> Hello Peter,
>
> On Tuesday 10 of November 2020 19:24:03 Peter Maydell wrote:
> > For unaligned accesses, for 6.0, I think the code for doing
> > them to the txbuff at least is straightforward:
> >
> >    if (buff_num < CTUCAN_CORE_TXBUF_NUM &&
> >        (addr + size) < CTUCAN_CORE_MSG_MAX_LEN) {
> >       stn_le_p(s->tx_buffer[buff_num].data + addr, size, val);
> >    }
> >
> > (stn_le_p takes care of doing an appropriate-width write.)
>
> Thanks, great to know, I like that much.
> Only small nitpicking, it should be (addr + size) <= CTUCAN_CORE_MSG_MAX_LEN
>
> So whole code I am testing now
>
>     if (addr >= CTU_CAN_FD_TXTB1_DATA_1) {
>         int buff_num;
>         addr -= CTU_CAN_FD_TXTB1_DATA_1;
>         buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
>         addr %= CTUCAN_CORE_TXBUFF_SPAN;
>         if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
>             ((addr + size) <= sizeof(s->tx_buffer[buff_num].data))) {
>             stn_le_p(s->tx_buffer[buff_num].data + addr, size, val);
>         }
>     } else {
>
> So I have applied you whole series with above update. All works correctly
> on x86_64 Linux host and with Linux x86_64 and MIPS big endian guests.
>
> Please update to this combination.

If you've got a modified patch set that you've tested, would
you mind sending it out to the list? That would avoid my
possibly making mistakes in updating patches on my end and
then requiring you to repeat the testing.

thanks
-- PMM

