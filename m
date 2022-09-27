Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F45EBB19
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:05:07 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4eQ-0005Wa-IY
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od47y-00059E-7x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od47u-0001Hq-FG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664260289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQTs4tfEW30qVCeD9xi5rcIrk6UTMX4QrTH9glQfXVo=;
 b=Kmq0otpejJvsxfrv1iQATxv3l8iKoTf4+sXZRhnCpWxfyPtxPsiF0Qw8hWAto5iLsyh4ug
 uvF/7W4XOTwY7OqChZRulYZ8dscyEoyoXMpH+Te+2tFn8m6v+SS88LHFVmt/G505kVUiga
 Ch1tcDuIaE511f/kHq30N6xpod/heSc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-tiMCtdJXNxOc1HdGu9SXwg-1; Tue, 27 Sep 2022 02:31:21 -0400
X-MC-Unique: tiMCtdJXNxOc1HdGu9SXwg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d18-20020adfa352000000b0022cbe33d2a5so238510wrb.11
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YQTs4tfEW30qVCeD9xi5rcIrk6UTMX4QrTH9glQfXVo=;
 b=fDXsujH+42NCvMtmIJRVpLep8x4XBfxqoG7va1hpRwCPpW+rcyKPx7YHZ+0FHVNDt9
 vMB8oAk4QyzJwjC6bcK4scE60J5CHpIfin5WxAlWalr9a7/g/CxNjuxWOlQaVIMUuW+C
 2CYIQ1na18GEnlL6kV07Qsd9BQk9WZT5tKACWAv6k9mmWmU5XG96h5AlGn0u71Qposg/
 Z5WV4g6aSCOzI302yp2cBSLG/Df2TZuMQnclwsQ4WKd+4SI4g43rkPJo4fAKB/8+Xnnt
 O1EL48w4xMfAW9A10ONSNc2p7QhZppSgeK+2cwX4IzyxmnRQjY42HtM5KIqSQRZSocyC
 Yc0w==
X-Gm-Message-State: ACrzQf1KS19QE4eV8f5CaE50WAzy3RQq+4o76AOdK9mh7V9jcVsbmn+g
 ffn06mpL5NwFR52m6h1dF9BdkDk76+gTBJlRKxRma4ACXx0wwKYQ5bbQkoXgI6TppG7DHmDSYBt
 MhIrLjtfDAy1RUa8=
X-Received: by 2002:adf:e383:0:b0:228:9a53:612b with SMTP id
 e3-20020adfe383000000b002289a53612bmr16206747wrm.651.1664260280307; 
 Mon, 26 Sep 2022 23:31:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ttaRsiIb1FEuqSTWEraLokNxZE6dO08JR3NM4noaFCzF2sr5Dr0cVzparkhVGHsBcuCM2nw==
X-Received: by 2002:adf:e383:0:b0:228:9a53:612b with SMTP id
 e3-20020adfe383000000b002289a53612bmr16206724wrm.651.1664260280065; 
 Mon, 26 Sep 2022 23:31:20 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 bd24-20020a05600c1f1800b003a62400724bsm826993wmb.0.2022.09.26.23.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 23:31:19 -0700 (PDT)
Message-ID: <c2773c56-2710-ae39-5009-a8d11bddb81f@redhat.com>
Date: Tue, 27 Sep 2022 08:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
Content-Language: en-US
To: Tyler Ng <tkng@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
References: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
 <55a69b23-3bea-0676-478a-d257fc4febf5@redhat.com>
 <CAB88-qO7vw4gC6JNuX=CcnXmYznPdwdhv_nJNrejVzFXSoLQnQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAB88-qO7vw4gC6JNuX=CcnXmYznPdwdhv_nJNrejVzFXSoLQnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi Tyler!

On 27/09/2022 01.03, Tyler Ng wrote:
> Hi Thomas,
> 
> On Thu, Sep 22, 2022 at 9:17 AM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     On 22/09/2022 17.58, Tyler Ng wrote:
>      > This commit adds most of an implementation of the OpenTitan Always-On
>      > Timer. The documentation for this timer is found here:
>      >
>      > https://docs.opentitan.org/hw/ip/aon_timer/doc/
>     <https://docs.opentitan.org/hw/ip/aon_timer/doc/>
>      >
>      > Using commit 217a0168ba118503c166a9587819e3811eeb0c0c
>      >
>      > The implementation includes most of the watchdog features; it does not
>      > implement the wakeup timer.
>      >
>      > An important note: the OpenTitan board uses the sifive_plic. The plic
>      > will not be able to claim the bark interrupt (159) because the sifive
>      > plic sets priority[159], but checks priority[158] for the priority, so
>      > it thinks that the interrupt's priority is 0 (effectively disabled).
>     ...
>      > diff --git a/tests/qtest/ibex-aon-timer-test.c
>      > b/tests/qtest/ibex-aon-timer-test.c
>      > new file mode 100644
>      > index 0000000000..af33feac39
>      > --- /dev/null
>      > +++ b/tests/qtest/ibex-aon-timer-test.c
>      > @@ -0,0 +1,189 @@
>      > +/*
>      > + * Testing the OpenTitan AON Timer
>      > + *
>      > + * Copyright (c) 2022 Rivos Inc.
>      > + *
>      > + * Permission is hereby granted, free of charge, to any person
>     obtaining a copy
>      > + * of this software and associated documentation files (the
>      > "Software"), to deal
>      > + * in the Software without restriction, including without limitation
>     the rights
>      > + * to use, copy, modify, merge, publish, distribute, sublicense,
>     and/or sell
>      > + * copies of the Software, and to permit persons to whom the Software is
>      > + * furnished to do so, subject to the following conditions:
>      > + *
>      > + * The above copyright notice and this permission notice shall be
>     included in
>      > + * all copies or substantial portions of the Software.
>      > + *
>      > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>     EXPRESS OR
>      > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>     MERCHANTABILITY,
>      > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>     SHALL
>      > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
>     OR OTHER
>      > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>      > ARISING FROM,
>      > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>     DEALINGS IN
>      > + * THE SOFTWARE.
> 
>     Could you maybe add a SPDX license identifier at the beginning of the
>     comment, so that it's easier to identify the license at a first glance?
>     (also in the other new files)
> 
> Will do, was actually thinking of switching over to GPL-2.0-or-later as 
> opposed to MIT.

Yes, that would be the best fit for QEMU, I think.

>      > + */
>      > +
>      > +#include "qemu/osdep.h"
>      > +#include "libqtest.h"
>      > +#include "qapi/qmp/qdict.h"
>      > +
>      > +#define AON_BASE_ADDR (0x40470000ul)
>      > +#define AON_ADDR(addr) (AON_BASE_ADDR + addr)
>      > +#define AON_WKUP_IRQ 158
>      > +#define AON_BARK_IRQ 159
>      > +#define AON_FREQ 200000 /* 200 KHz */
>      > +#define AON_PERIOD_NS 5000
>      > +#define NANOS_PER_SECOND 1000000000LL
>      > +/* Test that reads work, and that the regs get reset to the correct
>     value */
>      > +static void test_reads(void)
>      > +{
>      > +    QTestState *test = qtest_init("-M opentitan");
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x00)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x04)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x08)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x0c)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x10)) == 1); > +   
>     g_assert(qtest_readl(test, AON_ADDR(0x14)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x18)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x1c)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x20)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x24)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x28)) == 0);
>      > +    g_assert(qtest_readl(test, AON_ADDR(0x2c)) == 0);
> 
>     The read tests that check for 0 could maybe be simplified with a for-loop
>     (or two).
> 
> I'm not entirely sure about what benefit this would bring after writing it out.

Mostly a matter of taste. Keep it in the current shape if you prefer that.

>      > +    qtest_quit(test);
>      > +}
>      > +
>      > +static void test_writes(void)
>      > +{
>      > +    /* Test that writes worked, while the config is unlocked */
>      > +    QTestState *test = qtest_init("-M opentitan");
>      > +
>      > +
>      > +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
>      > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
>      > +                     ==, (1 << 19));
>      > +
>      > +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
>      > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
>      > +                     ==, (1 << 20));
>      > +
>      > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL enable */
>      > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
>      > +                     ==, 0x1);
>      > +
>      > +    qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN enable */
>      > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), ==, 0x0);
> 
>     I think the above code would be better readable if you'd provide a helper
>     function like this:
> 
>     static void writel_and_assert(QTestState qts, int addr, int val)
>     {
>           qtest_writel(qts, AON_ADDR(addr), val);
>           g_assert_cmpuint(qtest_readl(qts, AON_ADDR(addr)), val);
>     }
> 
> Thanks for the suggestion. I decided to go with a macro instead though, 
> because it makes it easier to distinguish where an assertion failed without 
> a debugger.

That's a good idea, indeed!

  Thomas


