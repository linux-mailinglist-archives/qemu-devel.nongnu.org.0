Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74E4A76E6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 18:33:07 +0100 (CET)
Received: from localhost ([::1]:46982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJVB-0001XL-J7
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 12:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFIMo-00035g-0R
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:20:24 -0500
Received: from [2607:f8b0:4864:20::42d] (port=38800
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFIMk-00069J-VV
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:20:20 -0500
Received: by mail-pf1-x42d.google.com with SMTP id e28so19220774pfj.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 08:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3kfT80F1DS6tJRuDe4pRVe4ANGJuMDL82X56LJeakuI=;
 b=g/0mca/JXYRO0ENsJf1CR2Of/rB+oRqJIw+QX1PjLbsU85Vyv2KrlvSTgfjPBQus8a
 AWVE2ji4YOLAgTybAsB17gJvpDmyjX+uJLaGafCzGjMqsBiWAX7QktcmLuzCuzpP3AG/
 T8ok4k28ILwPCQdFSkjdm7b8/KuT0FE+FTCMMYFP1PwNii18CLKK9ByERSfUBAa0oliF
 q9OFsbYeTM2yXz+VCsNB3MbDzWRVArFRBE/xoRn6Pn6DRb+ZTtuLrjVGxaqbtkI0Q34f
 RaqEviweuRj3DGtaAoCw4htkXcUl8uJ+On+rsA2gZrIW7n6DFHxGrfUeJs6m15XhDNvY
 SiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3kfT80F1DS6tJRuDe4pRVe4ANGJuMDL82X56LJeakuI=;
 b=OarzwFKT90+WdzJvdDppBqmrWvvnLkM9z9g1smSpp2BLTOm+2m/CMcURBmve8SrExK
 GacYfwyjfIaU67xolxo/p6t0WU6jFQE+crR0Ri0T9Ed1aHm+xywDYoYtdTPPC6BTaemh
 haFx64PekUv9wGhSxmB28l7eud5bNzNSrtxE+pv1i+PQ3Pe0CsucXf6A23ZSbStOVdpU
 WvBcZo9Td25e2wSC92Hu7PLlKMXuxv9m1L/ueFJlBKKPvkI84jB1Fmji+A3EF/91wc6A
 Z/YIcZ6DbzJ0Qb9cfhqX1l/l2IfrAHKFRzA/rosuDoz6xDzFk5QHMu/hpsX1bCX9rq9z
 TsrA==
X-Gm-Message-State: AOAM5312RzjfaamVDsC7I73/M0tKh5DVwzm1/HcPTLqzarPtx4gTdKAS
 As7r8lrNoudhHJuFxJhIkTw=
X-Google-Smtp-Source: ABdhPJwculluUqw65ii/Bu2e737HugG04viVQFLWdsUpTCPivhYp/xWutqZiZGX2dVBrK4HvYGV7DA==
X-Received: by 2002:a62:f207:: with SMTP id m7mr30080684pfh.44.1643818817535; 
 Wed, 02 Feb 2022 08:20:17 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j10sm26432188pfu.93.2022.02.02.08.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 08:20:17 -0800 (PST)
Message-ID: <c110e097-70af-904c-5b0d-adb0762ee2d3@amsat.org>
Date: Wed, 2 Feb 2022 17:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
Content-Language: en-US
To: Patrick Venture <venture@google.com>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
In-Reply-To: <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/2/22 21:54, Patrick Venture wrote:
> 
> 
> On Tue, Feb 1, 2022 at 11:02 AM Philippe Mathieu-Daudé <f4bug@amsat.org 
> <mailto:f4bug@amsat.org>> wrote:
> 
>     On 1/2/22 17:30, Patrick Venture wrote:
>      > Previously this device created N subdevices which each owned an
>     i2c bus.
>      > Now this device simply owns the N i2c busses directly.
>      >
>      > Tested: Verified devices behind mux are still accessible via qmp
>     and i2c
>      > from within an arm32 SoC.
>      >
>      > Reviewed-by: Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>>
>      > Signed-off-by: Patrick Venture <venture@google.com
>     <mailto:venture@google.com>>
>      > ---
>      >   hw/i2c/i2c_mux_pca954x.c | 75
>     ++++++----------------------------------
>      >   1 file changed, 11 insertions(+), 64 deletions(-)
> 
>      >   static void pca954x_init(Object *obj)
>      >   {
>      >       Pca954xState *s = PCA954X(obj);
>      >       Pca954xClass *c = PCA954X_GET_CLASS(obj);
>      >       int i;
>      >
>      > -    /* Only initialize the children we expect. */
>      > +    /* SMBus modules. Cannot fail. */
>      >       for (i = 0; i < c->nchans; i++) {
>      > -        object_initialize_child(obj, "channel[*]", &s->channel[i],
>      > -                                TYPE_PCA954X_CHANNEL);
>      > +        /* start all channels as disabled. */
>      > +        s->enabled[i] = false;
>      > +        s->bus[i] = i2c_init_bus(DEVICE(s), "channel[*]");
> 
>     This is not a QOM property, so you need to initialize manually:
> 
> 
> that was my suspicion but this is the output I'm seeing:
> 
> {'execute': 'qom-list', 'arguments': { 'path': 
> '/machine/soc/smbus[0]/i2c-bus/child[0]' }}
> 
> {"return": [
> {"name": "type", "type": "string"},
> {"name": "parent_bus", "type": "link<bus>"},
> {"name": "realized", "type": "bool"},
> {"name": "hotplugged", "type": "bool"},
> {"name": "hotpluggable", "type": "bool"},
> {"name": "address", "type": "uint8"},
> {"name": "channel[3]", "type": "child<i2c-bus>"},
> {"name": "channel[0]", "type": "child<i2c-bus>"},
> {"name": "channel[1]", "type": "child<i2c-bus>"},
> {"name": "channel[2]", "type": "child<i2c-bus>"}
> ]}
> 
> It seems to be naming them via the order they're created.
> 
> Is this not behaving how you expect?

On the monitor:

(qemu) info qtree
bus: main-system-bus
   type System
   ...
   dev: npcm7xx-smbus, id ""
     gpio-out "sysbus-irq" 1
     mmio 00000000f008d000/0000000000001000
     bus: i2c-bus
       type i2c-bus
       dev: pca9548, id ""
         address = 119 (0x77)
         bus: channel[*]
           type i2c-bus
         bus: channel[*]
           type i2c-bus
         bus: channel[*]
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 73 (0x49)
         bus: channel[*]
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 72 (0x48)
         bus: channel[*]
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 73 (0x49)
         bus: channel[*]
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 72 (0x48)
         bus: channel[*]
           type i2c-bus
         bus: channel[*]
           type i2c-bus

>     -- >8 --
>     diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
>     index f9ce633b3a..a9517b612a 100644
>     --- a/hw/i2c/i2c_mux_pca954x.c
>     +++ b/hw/i2c/i2c_mux_pca954x.c
>     @@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)
> 
>            /* SMBus modules. Cannot fail. */
>            for (i = 0; i < c->nchans; i++) {
>     +        g_autofree gchar *bus_name = g_strdup_printf("i2c.%d", i);
>     +
>                /* start all channels as disabled. */
>                s->enabled[i] = false;
>     -        s->bus[i] = i2c_init_bus(DEVICE(s), "channel[*]");
>     +        s->bus[i] = i2c_init_bus(DEVICE(s), bus_name);
>            }
>        }
> 
>     ---
> 
>     (look at HMP 'info qtree' output).

With this snippet:

(qemu) info qtree
bus: main-system-bus
   type System
   ...
   dev: npcm7xx-smbus, id ""
     gpio-out "sysbus-irq" 1
     mmio 00000000f008d000/0000000000001000
     bus: i2c-bus
       type i2c-bus
       dev: pca9548, id ""
         address = 119 (0x77)
         bus: i2c.7
           type i2c-bus
         bus: i2c.6
           type i2c-bus
         bus: i2c.5
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 73 (0x49)
         bus: i2c.4
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 72 (0x48)
         bus: i2c.3
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 73 (0x49)
         bus: i2c.2
           type i2c-bus
           dev: tmp105, id ""
             gpio-out "" 1
             address = 72 (0x48)
         bus: i2c.1
           type i2c-bus
         bus: i2c.0
           type i2c-bus

Regards,

Phil.

