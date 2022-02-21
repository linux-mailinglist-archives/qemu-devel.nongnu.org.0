Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0374BD2C5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 01:10:49 +0100 (CET)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLwHw-0007BB-5c
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 19:10:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLwFe-0005yE-7E
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 19:08:26 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42620
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLwFc-0006HF-BO
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 19:08:25 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so2110024pja.1
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 16:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/aVBsxaKDQvUbbsz4hT1PcSV+6DAYRm1ACX9rjvu9A8=;
 b=hOdzwecVtnYD5I4HgD/8PXfjSFs1jYT8X83mbEovFtI6jGgUeWHkhwYh42DulT8zUS
 WsOtYmcXcef5lQpFCW/tVFUlKVaj38Hawrbvm66wUojZ+e9ywgT/jWm5UbqKKXcE9+Kn
 J95Yy2LNs4+Dp4cqp9JLUZXoBXTmlQB3IR8NudPqonCPZh0Hd/XgsyV8lo3VxrjvPgVU
 ZDIIyPEFKp5LPSIwv+x/2BjuBqxGPqWlxBq11umgz8ojK6Dg/KhplralzAS7Jvu+mfoc
 sUgujsi62lPeCqHdz3TGDbrYYfRTPIvW/BgjlSGsLeiH6Z3JWKSQgSg4r6NLFDYaCwQi
 QV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/aVBsxaKDQvUbbsz4hT1PcSV+6DAYRm1ACX9rjvu9A8=;
 b=2XVvRDR3KGygKB5rnFwsg3qMvB0n1oTHmH7cXh4gZQgtr1YfLwwA+OmKlkJKks+ZVL
 wTyVy3jkbePDOWvXO85XsxKP9jOJEqQUNuBOs08dyvlqBvUDz9YN1OwGBdsqhHGGfZM4
 u4wyjfiuAZ0bhzleqAXf5c0gDM0BBaBCLPJxfI3Gx4TQ+4UyyxVfJFShL72+vPxL3az0
 HzqbGqRAvfIMO5vbc2Lao2PyzOoal0R0aCkzAvnH7aavjtqR6i4W2c++Qe1B690nnjOG
 FSYpjsX8SGcsWakKP+OtzhA2cJ80ggFj6gV19RE7RWNELAko7uDioHtz+lo1S4/BZc1u
 OhaA==
X-Gm-Message-State: AOAM533sCD8GO0cc/dyk1AWrwFUR4cBbQSC8nCrjZu3UjEFNmE0P8omt
 1n89tege11tvcPnI0ZITBuY=
X-Google-Smtp-Source: ABdhPJzKd9o2OL14Um2vPBKjTFlm+O1tkNle1glbKaLG8zDTjpeeo8pDINUdxbzIUfPZ5H+owYghuQ==
X-Received: by 2002:a17:90b:4f42:b0:1b9:5a43:2278 with SMTP id
 pj2-20020a17090b4f4200b001b95a432278mr22974619pjb.158.1645402103154; 
 Sun, 20 Feb 2022 16:08:23 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id d8sm10978089pfj.179.2022.02.20.16.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 16:08:21 -0800 (PST)
Date: Mon, 21 Feb 2022 09:08:19 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 3/6] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting UART
Message-ID: <YhLX80Ygi1h1PPl4@antec>
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-4-shorne@gmail.com>
 <b5009ed2-b53c-c985-6414-0804cd0db11b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5009ed2-b53c-c985-6414-0804cd0db11b@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 20, 2022 at 09:06:41PM +0100, Philippe Mathieu-Daudé wrote:
> On 19/2/22 07:42, Stafford Horne wrote:
> > Currently the OpenRISC SMP configuration only supports 2 cores due to
> > the UART IRQ routing being limited to 2 cores.  As was done in commit
> > 1eeffbeb11 ("hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
> > IRQ to multiple CPUs") we can use a splitter to wire more than 2 CPUs.
> > 
> > This patch moves serial initialization out to it's own function and
> > uses a splitter to connect multiple CPU irq lines to the UART.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   hw/openrisc/openrisc_sim.c | 32 ++++++++++++++++++++++++--------
> >   1 file changed, 24 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > index d12b3e0c5e..5bfbac00f8 100644
> > --- a/hw/openrisc/openrisc_sim.c
> > +++ b/hw/openrisc/openrisc_sim.c
> > @@ -137,6 +137,28 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
> >       sysbus_mmio_map(s, 0, base);
> >   }
> > +static void openrisc_sim_serial_init(hwaddr base, int num_cpus,
> > +                                     OpenRISCCPU *cpus[], int irq_pin)
> > +{
> > +    qemu_irq serial_irq;
> > +    int i;
> > +
> > +    if (num_cpus > 1) {
> > +        DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
> > +        qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
> > +        qdev_realize_and_unref(splitter, NULL, &error_fatal);
> > +        for (i = 0; i < num_cpus; i++) {
> > +            qdev_connect_gpio_out(splitter, i, get_cpu_irq(cpus, i, irq_pin));
> > +        }
> > +        serial_irq = qdev_get_gpio_in(splitter, 0);
> > +    } else {
> > +        serial_irq = get_cpu_irq(cpus, 0, irq_pin);
> > +    }
> 
> Up to here the code seems a generic helper:
> 
>   or1k_cpus_connect_device(OpenRISCCPU *cpus[],
>                            unsigned num_cpus,
>                            unsigned irq_pin);

Right, this is similar to that used in openrisc_sim_net_init.  I thought about
sharing the code but I didn't think it worth adding helper.

The main reason for me is that openrisc_sim_net_init doesn't expose the qemu_irq
and just does sysbus_connect_irq.  While openrisc_sim_serial_init exposes the
qemu_irq.

I think a generic function would have to look like:

    qemu_irq openrisc_cpus_irq_pin_init(OpenRISCCPU *cpus[],
                                        unsigned num_cpus,
                                        unsigned irq_pin);

I would like to leave this as is for now as.

> > +    serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
> > +                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
> 
> This part specific to UART.

Right.

> > +}
> 
> Anyhow,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thank you,

Adding this to the patch as is.

-Stafford

