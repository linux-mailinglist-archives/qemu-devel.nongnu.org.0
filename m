Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD768CA35
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:07:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPAXv-0007EA-Fk; Mon, 06 Feb 2023 18:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPAXi-0007AU-Ac
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:04:59 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPAXd-0000fN-2i
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:04:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j25so8404329wrc.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c9EgP6YKdZyMczvzVG3mnPsmQ7deQBk3kbubESLR/Ao=;
 b=I3FXHHYY8odOlRsr5VWCs+hBdksWBysrKWczUzGTFZNyGA8NAwVGEIith064XChh4y
 m0TJ4k1siF5pH+XpnSAu/Pt6vuJPngfNGAFNxo0JGvUPp8MKI8mrxsTFZfhT8tzGVEJ9
 3r+RpIT9NqxcdIDIjepvoaa+AQMsCFAmaB8KEWb3uAgxIVDgOrc3mrYd6KzqfScnWKfk
 /4WDSD+BnvkqWYYqrGfI8x1juGuTf9tDxa9iCULkbi6P9RVLy+QgPgMOS6a0iq3W4D8O
 4E1YImhZLPjoYApUJydwqXYClOBs2feGLcd/ehznNdcyRH4e9whU0dfLWvJF1MwKKGZ8
 wKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9EgP6YKdZyMczvzVG3mnPsmQ7deQBk3kbubESLR/Ao=;
 b=EwDVmoB5attPTETdzzEsfv4WHt/3+MAeTss78B/f5/N+fWPec5dx0Hg7rVKwpAR+bP
 FaPDir7lF+MLT4KQBh5gedjPKBKsKGSVYgbmsVL0lpWgYqTk5yFS98T0mXtW0ett8S/5
 lq2mFn4ipXRH0HC8bTUqKU8VBUzotXJx06RbYPqT2OyPxq65onfI3COoCeGmmdRgRhnB
 j3kL7yHT3z09AUr23ulxGKaspmPkyX3vsIPVqi2vFhCaZhJ3CT7Ke4sUBIFcDVtvOcEl
 dirKQh5scum6h+AkWbsYUe9P6fNEKYgh74nKtCYFIBgyXhs7npWuJrNBE3PTKjKz4SD5
 Pq5A==
X-Gm-Message-State: AO0yUKULLatHtbxKgMJcl5R2fKMjnka6VAa634k1AJn/70/0Gm5T3Yi7
 u2kJX/YVbEF2HtPp15BMWswgXA==
X-Google-Smtp-Source: AK7set8H37x6k3fMyjFpUUuf2pE8z12nnUo3Jzuh0wS35at/J3pJauk6Tb8WFH1mDEm95MNa394nkg==
X-Received: by 2002:a5d:49d1:0:b0:2be:f21:6af6 with SMTP id
 t17-20020a5d49d1000000b002be0f216af6mr457209wrs.23.1675724691212; 
 Mon, 06 Feb 2023 15:04:51 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b002b57bae7174sm9917510wrt.5.2023.02.06.15.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 15:04:50 -0800 (PST)
Message-ID: <8b79daf4-28de-86f7-8f84-32f7d3f7ce56@linaro.org>
Date: Tue, 7 Feb 2023 00:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/9] hw: Use QOM alias properties and few QOM/QDev cleanups
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <e30899d3-06b5-645e-3f42-c99631b5a53a@ilande.co.uk>
 <46f52043-368c-e153-2d02-ba30220685dd@linaro.org>
 <8c7cfd90-e2aa-a6ff-506d-f3a5d24622b6@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8c7cfd90-e2aa-a6ff-506d-f3a5d24622b6@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 6/2/23 22:54, Mark Cave-Ayland wrote:
> On 06/02/2023 15:27, Philippe Mathieu-Daudé wrote:
> 
>> On 6/2/23 00:29, Mark Cave-Ayland wrote:
>>> On 03/02/2023 11:36, Philippe Mathieu-Daudé wrote:
>>>
>>>> These patches are extracted from a QOM/QDev refactor series,
>>>> so they are preliminary cleanups noticed while working on it:
>>>>
>>>> - Use correct type when calling qdev_prop_set_xxx()
>>>> - Unify some qdev properties in MIPS models
>>>> - Replace intermediate properties by link properties
>>>> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
>>>> - Use qdev_realize_and_unref() instead of open-coding it


>>> I must admit to being slightly nervous about using QOM alias 
>>> properties in this way, simply because you start creating implicit 
>>> dependencies between QOM objects. How would this work when trying to 
>>> build machines from configuration files and/or the monitor? Or are 
>>> the changes restricted to container devices i.e. those which consist 
>>> of in-built child devices?
>>
>> The latter. All parents forward a property to a contained child.
>>
>> The parent forwarding property is replaced by a link into the child,
>> so accessing the parent property transparently access the child one.
>>
>> The dependencies are already explicit. We can not create a parent
>> without its children (the children creation is implicit when we
>> create the parent object).
>>
>> I thought this was the canonical QOM alias properties use. What is
>> the normal use then?
> 
> The problem I've found with this approach in the past is that it fails 
> when you have more than one child device of the same type.
> 
> For example imagine the scenario where there is a QEMU device that 
> contains 2 child UARTs and each UART has a property to disable hardware 
> handshaking: if you add a property alias to the container device, it can 
> only map to a single child UART. Furthermore if you then try to alias 
> the UART IRQs onto the container device using qdev_pass_gpios(), then 
> that also fails with 2 UARTs because the gpios from each UART have the 
> same property name.

I noticed some qdev gpio namespace issues. Thanks for pointing that
qdev_pass_gpios() restriction.

> You could then think about solving that problem by using 
> object_property_add_alias() directly to specify a different property 
> name for each UART's mapped property on the container device, but then 
> you end up accessing the child UART properties with different names, but 
> only when using that particular parent container device(!).
> 
> For this reason I've tended to avoid aliases and setup child objects 
> from the container like this:
> 
>     static void container_init(Object *obj)
>     {
>         object_initialize_child(obj, "uart0", &s->uart0, TYPE_UART);
>         object_initialize_child(obj, "uart1", &s->uart1, TYPE_UART);
>     }

Hmm OK, this is the approach used in IMX:

@@ -120,8 +120,12 @@ static void fsl_imx6ul_init(Object *obj)
       * Ethernet
       */
      for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
+        g_autofree gchar *propname = g_strdup_printf("fec%d-phy-num", i 
+ 1);
          snprintf(name, NAME_SIZE, "eth%d", i);
          object_initialize_child(obj, name, &s->eth[i], TYPE_IMX_ENET);
+        qdev_prop_set_uint32(DEVICE(&s->eth[i]), "phy-num", i);
+        object_property_add_alias(obj, propname,
+                                  OBJECT(&s->eth[i]), "phy-num");
      }

But then this is how it is used today:

  static Property fsl_imx6ul_properties[] = {
-    DEFINE_PROP_UINT32("fec1-phy-num", FslIMX6ULState, phy_num[0], 0),
-    DEFINE_PROP_UINT32("fec2-phy-num", FslIMX6ULState, phy_num[1], 1),
      DEFINE_PROP_END_OF_LIST(),
  };

What do you mean by "you end up accessing the child UART properties with
different names, but only when using that particular parent container
device(!)."? I tend to see QOM modelling as matching hardware design,
so if a container is used, there is a similar relationship / hierarchy
in the hardware, then accessing the children via a particular parent
container path sounds the correct way. QOM indexed child must have the
same meaning in the hardware layout.

> And then when configuring the board it is possible to obtain the UART 
> references like this:
> 
>     uart0 = UART(object_resolve_path_component(OBJECT(container), 
> "uart0"));
>     irq0 = qdev_connect_gpio_out(DEVICE(uart0), 0, ... );
> 
>     uart1 = UART(object_resolve_path_component(OBJECT(container), 
> "uart1"));
>     irq1 = qdev_connect_gpio_out(DEVICE(uart1), 0, ... );
> 
> This allows all UART configuration to be done in the same way regardless 
> of the parent container device and number of child devices, and without 
> having to think about using different property names depending upon the 
> container device.

OK I think this is the same explanation as what I just wrote earlier.

> One place where it could conceivably be useful is where you have a chip 
> modelled as a device and you want to expose the memory regions and IRQs 
> to an interface such as ISA, but often even that doesn't work (think PCI 
> IRQs for example).

IRQ wiring is an unsolved problem in my TODO, in particular when a bus
is involved...

> The only valid use cases I can think of are the /rtc property (which is 
> an alias to the RTC device, regardless of where it exists in the QOM 
> tree) and perhaps in future adding similar array aliases to the root of 
> the machine that can point to things like block devices, network 
> devices, chardevs and audio devices (i.e. anything that has a 
> corresponding QEMU backend).

Hmm I see, but this seems a very restrictive use of QOM link property
concept IMHO. For me a QOM link allows to share pointer to any QOM
object (with the QOM type checked). Am I abusing the concept?

BTW DEFINE_PROP_xxx() macros are a QDev concept. In particular
DEFINE_PROP_LINK(). The 'realize' step is also a QDev concept...

Markus suggested I watch Paolo's QOM talk to use the standard
terminology from the expert. I suppose this is "QOM exegesis and
apocalypse" from 2014.

Thanks for the brainstorming and clarifications!

Phil.

