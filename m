Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD668E1F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:37:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUgm-0007Yt-SK; Tue, 07 Feb 2023 15:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pPUgk-0007YR-96; Tue, 07 Feb 2023 15:35:38 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pPUgi-000411-3N; Tue, 07 Feb 2023 15:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=82HfK06DVh/agahlCdYtPK0dP+W5l5Q5YLeIizLH6ko=; b=BkY/UiZpu+i7YontJdzIk78PAl
 IZ9ErgjwrtpxT/2plP+KYPJJUrddOIPlTZ9bJtJbZXEVE7ecva/zdimEdEdT3OXMWBTkfY6CulbG/
 9tSHcG4WQzMVSiE4HiPNscCxm2RC1dNjuzj4ImMNmXH95s47Y7u4PtjcPIRcY975H9b8IkHc/cQxy
 CRp/lBL5nw9CV+txW/+jDds+ohui0YkDDKlG7p2G63FbxyiWwg4VS2RxgMDRm02oh1ANXkTVB0FH6
 OY3TAI51VDfRe8HYpJMcOgJWYHFNF2MBMtn9RifuDOTEdsyEhZzrkeNCZT0cjPIn2kyWULn0zoWEy
 oC29f0f7SfCggpdvJcCwrN5k53k9hE+9rrTyBDpGorVEsZzSe8ENOjpQNvPCHJNM4dRKBYc8UIFSP
 C3N+HcEtf1+iPXXDQ8DlKOrwz+5loyA9cKFRkKjyoVaXjrqnJXO6gu/bWPxy/Dkp+xj9rY82wsCDm
 +6vRwEccWRIO6GpjPiZ9hNeb+L7jJZYt2AVG6bc1T/GnBzN6o4ok7gVxHLa442Jr37A/VmVqvIRMA
 WNgpz+IMniOan1TKs+A18MjTKmg1Cq43EZKXD8zMP1L7odYRPLilHRyEcnWMWpdhX572U9TE/EDNG
 4vS6M5ZSf0O678PWNb2JrXjxdF1UA7iz7iB2RI3vU=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pPUgA-000Aig-LA; Tue, 07 Feb 2023 20:35:03 +0000
Message-ID: <47615329-9ae4-f9e0-117d-f7d4300bfdf1@ilande.co.uk>
Date: Tue, 7 Feb 2023 20:35:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <e30899d3-06b5-645e-3f42-c99631b5a53a@ilande.co.uk>
 <46f52043-368c-e153-2d02-ba30220685dd@linaro.org>
 <8c7cfd90-e2aa-a6ff-506d-f3a5d24622b6@ilande.co.uk>
 <8b79daf4-28de-86f7-8f84-32f7d3f7ce56@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <8b79daf4-28de-86f7-8f84-32f7d3f7ce56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/9] hw: Use QOM alias properties and few QOM/QDev cleanups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/02/2023 23:04, Philippe Mathieu-Daudé wrote:

> On 6/2/23 22:54, Mark Cave-Ayland wrote:
>> On 06/02/2023 15:27, Philippe Mathieu-Daudé wrote:
>>
>>> On 6/2/23 00:29, Mark Cave-Ayland wrote:
>>>> On 03/02/2023 11:36, Philippe Mathieu-Daudé wrote:
>>>>
>>>>> These patches are extracted from a QOM/QDev refactor series,
>>>>> so they are preliminary cleanups noticed while working on it:
>>>>>
>>>>> - Use correct type when calling qdev_prop_set_xxx()
>>>>> - Unify some qdev properties in MIPS models
>>>>> - Replace intermediate properties by link properties
>>>>> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
>>>>> - Use qdev_realize_and_unref() instead of open-coding it
> 
> 
>>>> I must admit to being slightly nervous about using QOM alias properties in this 
>>>> way, simply because you start creating implicit dependencies between QOM objects. 
>>>> How would this work when trying to build machines from configuration files and/or 
>>>> the monitor? Or are the changes restricted to container devices i.e. those which 
>>>> consist of in-built child devices?
>>>
>>> The latter. All parents forward a property to a contained child.
>>>
>>> The parent forwarding property is replaced by a link into the child,
>>> so accessing the parent property transparently access the child one.
>>>
>>> The dependencies are already explicit. We can not create a parent
>>> without its children (the children creation is implicit when we
>>> create the parent object).
>>>
>>> I thought this was the canonical QOM alias properties use. What is
>>> the normal use then?
>>
>> The problem I've found with this approach in the past is that it fails when you 
>> have more than one child device of the same type.
>>
>> For example imagine the scenario where there is a QEMU device that contains 2 child 
>> UARTs and each UART has a property to disable hardware handshaking: if you add a 
>> property alias to the container device, it can only map to a single child UART. 
>> Furthermore if you then try to alias the UART IRQs onto the container device using 
>> qdev_pass_gpios(), then that also fails with 2 UARTs because the gpios from each 
>> UART have the same property name.
> 
> I noticed some qdev gpio namespace issues. Thanks for pointing that
> qdev_pass_gpios() restriction.
> 
>> You could then think about solving that problem by using 
>> object_property_add_alias() directly to specify a different property name for each 
>> UART's mapped property on the container device, but then you end up accessing the 
>> child UART properties with different names, but only when using that particular 
>> parent container device(!).
>>
>> For this reason I've tended to avoid aliases and setup child objects from the 
>> container like this:
>>
>>     static void container_init(Object *obj)
>>     {
>>         object_initialize_child(obj, "uart0", &s->uart0, TYPE_UART);
>>         object_initialize_child(obj, "uart1", &s->uart1, TYPE_UART);
>>     }
> 
> Hmm OK, this is the approach used in IMX:
> 
> @@ -120,8 +120,12 @@ static void fsl_imx6ul_init(Object *obj)
>        * Ethernet
>        */
>       for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
> +        g_autofree gchar *propname = g_strdup_printf("fec%d-phy-num", i + 1);
>           snprintf(name, NAME_SIZE, "eth%d", i);
>           object_initialize_child(obj, name, &s->eth[i], TYPE_IMX_ENET);
> +        qdev_prop_set_uint32(DEVICE(&s->eth[i]), "phy-num", i);
> +        object_property_add_alias(obj, propname,
> +                                  OBJECT(&s->eth[i]), "phy-num");
>       }
> 
> But then this is how it is used today:
> 
>   static Property fsl_imx6ul_properties[] = {
> -    DEFINE_PROP_UINT32("fec1-phy-num", FslIMX6ULState, phy_num[0], 0),
> -    DEFINE_PROP_UINT32("fec2-phy-num", FslIMX6ULState, phy_num[1], 1),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> 
> What do you mean by "you end up accessing the child UART properties with
> different names, but only when using that particular parent container
> device(!)."? I tend to see QOM modelling as matching hardware design,
> so if a container is used, there is a similar relationship / hierarchy
> in the hardware, then accessing the children via a particular parent
> container path sounds the correct way. QOM indexed child must have the
> same meaning in the hardware layout.
> 
>> And then when configuring the board it is possible to obtain the UART references 
>> like this:
>>
>>     uart0 = UART(object_resolve_path_component(OBJECT(container), "uart0"));
>>     irq0 = qdev_connect_gpio_out(DEVICE(uart0), 0, ... );
>>
>>     uart1 = UART(object_resolve_path_component(OBJECT(container), "uart1"));
>>     irq1 = qdev_connect_gpio_out(DEVICE(uart1), 0, ... );
>>
>> This allows all UART configuration to be done in the same way regardless of the 
>> parent container device and number of child devices, and without having to think 
>> about using different property names depending upon the container device.
> 
> OK I think this is the same explanation as what I just wrote earlier.

Yes indeed, I think we're on the same page here now.

>> One place where it could conceivably be useful is where you have a chip modelled as 
>> a device and you want to expose the memory regions and IRQs to an interface such as 
>> ISA, but often even that doesn't work (think PCI IRQs for example).
> 
> IRQ wiring is an unsolved problem in my TODO, in particular when a bus
> is involved...
> 
>> The only valid use cases I can think of are the /rtc property (which is an alias to 
>> the RTC device, regardless of where it exists in the QOM tree) and perhaps in 
>> future adding similar array aliases to the root of the machine that can point to 
>> things like block devices, network devices, chardevs and audio devices (i.e. 
>> anything that has a corresponding QEMU backend).
> 
> Hmm I see, but this seems a very restrictive use of QOM link property
> concept IMHO. For me a QOM link allows to share pointer to any QOM
> object (with the QOM type checked). Am I abusing the concept?
> 
> BTW DEFINE_PROP_xxx() macros are a QDev concept. In particular
> DEFINE_PROP_LINK(). The 'realize' step is also a QDev concept...

I thought we were talking alias properties here? I'm sure I replied separately to the 
RFC thread containing qdev_set_prop_link() - nothing wrong with link properties at 
all, but exposing them via qdev was only done recently by Markus (to avoid around 
passing opaques IIRC) and I'm not sure how that would be represented/parsed on the 
command line, if indeed that is still considered to be the way forward.

> Markus suggested I watch Paolo's QOM talk to use the standard
> terminology from the expert. I suppose this is "QOM exegesis and
> apocalypse" from 2014.
> 
> Thanks for the brainstorming and clarifications!

No problem, hopefully by starting to document some of these issues it will help 
decided the future direction as to how this should all work.


ATB,

Mark.

