Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148123066A7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:47:14 +0100 (CET)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sef-0004yP-49
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4saZ-0001Vq-L8; Wed, 27 Jan 2021 16:43:01 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:33869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4saX-0002sL-Pw; Wed, 27 Jan 2021 16:42:59 -0500
Received: by mail-oi1-x234.google.com with SMTP id h192so3847953oib.1;
 Wed, 27 Jan 2021 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=l9uG97Z64EKE33FzNhO3mgkm0Nrr9f2/6MCrYDEqKDI=;
 b=kNLotVVNKJN1wULrncXh5FENpaN8WQbFWsy/DJBLjxX0WTQ0UdDXYN3KcQf5OtGjY8
 9YzI0Qg0S3DCkc6Zt3/SIkMIYbToFMAqmMYwx09zaGp7n0oVH8w8/u0zOr03PGCpV2BT
 14lbTB/Dxkpxj9iVluDJTXJn0ennUhhRXQ0WQ+z/9QItDB+NkfjkO2GmhKSDnamcsXVB
 IVQJ/Cj78LaYs8RBA8zBBn8ZScFXRvzHWRSfHQH8Elnx14yFUAbREEkVwbw6shP/pwKp
 1/YbXDgN94YunrK3PwqX9Tmnm/BrvJxCxSUj7ewP5BDr6CVYMlYB3iEF/VcxxVSQg0BR
 p+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=l9uG97Z64EKE33FzNhO3mgkm0Nrr9f2/6MCrYDEqKDI=;
 b=Qc8QNewgqHBfnoc+O/LYabIowuikd650NdbfqmYHbB8dm0Q8oo3eg95l7O1thVbq02
 gIzugeC94sdpoTSYA3YPhrXDdaIuLMkww3adK57XxDMYOgnDV+HfQDWazRpVwmF3DXxT
 Hkfae5Ygs/oBBGOlVImt7GErGoChJfrjJdqvkAGZcS+XlbaZCfdvscWSL+cuHIiGLQxD
 VFU0ZmrDzkU2A8vF27sL2QwzUdLCyg5h/sqzbJUQr8Hr0/N9h48uZtrp9/pX0ohM0T59
 dAtAqgw/tNtEuGb3JUvBanfK43Z6mPesZ5IKuooc6HXpWu1LjVjjNjgFFEMkLtosW6z6
 tYrw==
X-Gm-Message-State: AOAM5326B0PEUl2YAfqAG8zRNlNyOgbTB5k6cYR+yh3ZmFBlYK1xO94s
 PWl3UVlfPdrt9V/EGsgXfA==
X-Google-Smtp-Source: ABdhPJwVfSlVwobyzejrf82DIqzxNVlH6KbJcfGkFGaXPf0U+KTleqji8+v72CpWlFseClMEWRU5Gw==
X-Received: by 2002:aca:1901:: with SMTP id l1mr4670839oii.171.1611783774517; 
 Wed, 27 Jan 2021 13:42:54 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id d3sm682676ooi.42.2021.01.27.13.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 13:42:53 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:84df:dff0:9fb7:e686])
 by serve.minyard.net (Postfix) with ESMTPSA id 8D06818055B;
 Wed, 27 Jan 2021 21:42:52 +0000 (UTC)
Date: Wed, 27 Jan 2021 15:42:51 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
Message-ID: <20210127214251.GE2057975@minyard.net>
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
 <20210126234724.GC2057975@minyard.net>
 <CAGcCb12nJAMnZ+eaWC6n08hAFAVueCknSWzbEYFPp+GUApoRdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGcCb12nJAMnZ+eaWC6n08hAFAVueCknSWzbEYFPp+GUApoRdg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 12:37:46PM -0800, wuhaotsh--- via wrote:
> On Tue, Jan 26, 2021 at 3:47 PM Corey Minyard <minyard@acm.org> wrote:
> 
> > On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:
> > > +
> > > +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
> > > +{
> > > +    uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> > > +
> > > +    if (received_bytes == 0) {
> > > +        npcm7xx_smbus_recv_fifo(s);
> > > +        return;
> > > +    }
> > > +
> > > +    s->sda = s->rx_fifo[s->rx_cur];
> > > +    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
> > > +    --s->rxf_sts;
> >
> > This open-coded decrement seems a little risky.  Are you sure in every
> > case that s->rxf_sts > 0?  There's no way what's running in the VM can
> > game this and cause a buffer overrun?  One caller to this function seems
> > to protect against this, and another does not.
> >
> s->rxf_sts is uint8_t so it's guaranteed to be >=0.
> In the case s->rxf_sts == 0,  NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts) is
> also 0, so it'll take the if-branch and return without running --s->rxf_sts.

That is true if called from the
NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE case.  There is no such check
in the NPCM7XX_SMBUS_STATUS_RECEIVING case.

> I'll probably add "g_assert(s->rxf_sts > 0)" to clarify.

You never want to do an assert if the hosted system can do something to
cause it.  If you add the check to the NPCM7XX_SMBUS_STATUS_RECEIVING
case, it would be ok, but really unnecessary.

If it's fine if s->rxf_sts wraps to 0xff, then this all doesn't matter,
but you want to add a comment to that effect if so.  These sorts of
things look dangerous.

There is also the question about who takes these patches in.  I'm the
I2C maintainer, but there's other code in this series.  Once everything
is ready, I can ack them if we take it through the ARM tree.  Or I can
take it through my tree with the proper acks.

-corey

> 
> >
> > Other than this, I didn't see any issues with this patch.
> >
> > -corey
> >

