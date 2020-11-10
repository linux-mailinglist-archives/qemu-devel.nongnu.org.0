Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C72B2AE15D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 22:08:05 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcarv-0000v5-Ec
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 16:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcaqA-0000JM-7F
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:06:10 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcaq4-00046N-GA
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 16:06:09 -0500
Received: by mail-ed1-x52b.google.com with SMTP id o20so14342772eds.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tr2a4u4QTHOCzOgV1pDGF2+/7molxSL7Zb5UlPMswgs=;
 b=HAYkMq1A6L3/eDnclNE2PNtQLnakjL3JtuPxeYcz14a90z/KNK4sbyUqAytMwZwhuz
 VttOk6a80w1A0gAolvtBa3x2wgL0oDnCNfTT1IoKmPs4vaiYHkANw/4dvenVzYcwNofC
 fYrMkyP+SUJ+MxaDFhLtejMqjwdpOP7abhTlIU7Qv+yZZCAlYbIEYM9m5E/raS9IikLI
 BMgtSoaSl8oLmyFWe8YS8O6yOfPzxLwRMML0NE9kwZ2DpRGqffZF/nsqWKhH4kqE8nBg
 NbXCnennS7adj1xaPdHwdBLWT2eks2Fsbl1UV0P+Bhzz+k3svXMqGb+HONvtVNR0YcmB
 YxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tr2a4u4QTHOCzOgV1pDGF2+/7molxSL7Zb5UlPMswgs=;
 b=NJ8A7lE4O6N4SN64wg1Us/W53ElDSnH4WyKtuFzX107+V2e3PFHWunpw0MHZ7TYGur
 A2xcIZhTzs+RLD6F3SV0X2W9bTGfDFb20Ttujr7UwchPmZX2NCmyubXAXX4qjBCsb7tF
 KyaZ+rWCeGCn6enWfdPUlzBtmhRRxC+5mR+epTVwHtKDCsX5lfty3QYyMsU9s2ipAOVl
 cjE+veKjO57KTzi9HJUof1PUEs99lkLK2Ntp59Y9L8aDh4Og72iE3aIk6ksObLApmoa2
 thk+xgRwWPVFW19wK75S75wRarfwYUn89/AJgTrTFcg8HpBqZ/Rdmd6eTbE/VLcuTRwh
 kRSA==
X-Gm-Message-State: AOAM5300O39XjtN3JPTaD5f0WxuXYmSmEPZS4p6YzCSCr5XNGLAAo+Bs
 MjEJmeg49dxecR5I7CMg1+eTLUt7q+MhUJKosN4jFg==
X-Google-Smtp-Source: ABdhPJxJexgAo8Xg3tVnMBDju+EDN2cTyIEWAbbYyVCWboq4uJ9LimSTo6qBq3cOdQnl+Aw+Pv8Otqks/TZRtbnVoME=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1424469edt.204.1605042362669; 
 Tue, 10 Nov 2020 13:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <20201110170604.5897-3-peter.maydell@linaro.org>
 <202011102036.59785.pisa@cmp.felk.cvut.cz>
In-Reply-To: <202011102036.59785.pisa@cmp.felk.cvut.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 21:05:51 +0000
Message-ID: <CAFEAcA--KYfWZErVagQVDVzFQEOsiedOy=_Q2eEgd-bQj=pPuw@mail.gmail.com>
Subject: Re: [PATCH for-5.2 v2 2/4] hw/net/can/ctucan: Avoid unused value in
 ctucan_send_ready_buffers()
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Tue, 10 Nov 2020 at 19:37, Pavel Pisa <pisa@cmp.felk.cvut.cz> wrote:
>
> Hello Peter,
>
> On Tuesday 10 of November 2020 18:06:02 Peter Maydell wrote:
> > @@ -256,10 +254,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState
> > *s) for (i = 0; i < CTUCAN_CORE_TXBUF_NUM; i++) {
> >              uint32_t prio;
> >
> > -            buff_st_mask = 0xf << (i * 4);
> > -            buff_st = (s->tx_status.u32 >> (i * 4)) & 0xf;
> > -
> > -            if (buff_st != TXT_RDY) {
> > +            if (extract32(s->tx_status.u32, i * 4, 4) != TXT_RDY) {
> >                  continue;
> >              }
> >              prio = (s->tx_priority.u32 >> (i * 4)) & 0x7;
> > @@ -271,10 +266,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState
> > *s) if (buff2tx_idx == -1) {
> >              break;
> >          }
> > -        buff_st_mask = 0xf << (buff2tx_idx * 4);
> > -        buff_st = (s->tx_status.u32 >> (buff2tx_idx * 4)) & 0xf;
> >          int_stat.u32 = 0;
> > -        buff_st = TXT_RDY;
>
> I would prefer to add there next line even that it has no real effect
>
>  +        s->tx_status.u32 = deposit32(s->tx_status.u32,
>  +                                     buff2tx_idx * 4, 4, TXT_RDY);

I mentioned this in a reply to my v1 series. The buffer status
in the tx_status field is already TXT_RDY, so there is no state
change happening here to document as far as I can tell ?

thanks
-- PMM

