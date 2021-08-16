Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4C3ED9AC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:15:58 +0200 (CEST)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeLF-0001en-Es
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFeJ3-0008Br-U9; Mon, 16 Aug 2021 11:13:41 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFeIz-0005kl-8E; Mon, 16 Aug 2021 11:13:41 -0400
Received: by mail-oi1-x22c.google.com with SMTP id t35so27131872oiw.9;
 Mon, 16 Aug 2021 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dVlGZuCCTw/luznspzy2YoCy0QQYb8xrdRZiNgY33Mk=;
 b=GZfF8bSzWE3VdRCuDLUqzgX7wy2GgBWOYplGQbFMoL721dMFly8AzuiPMyRfBHVlhW
 0AJFHDYy8LxcenmfbYC2ajhVwZoOZp8wAcVRGBbQ8aUZvXOkxIDbjlrujX1GgMXnRd98
 N9ns7UaeX6DQKGQfDpBSMQYip7WetJYL+4aXt+Eu4KSRQQTjtrGrn857W0+nuKYJRI/w
 4qYzFQZ2bGQigP36JwcWUqSKDft+usW8HfgOd8adAk4KDjLVNY8X1Hnsr1v9N+TIYvyF
 BOqUJya7hNZqdXKqbNX8onT+nZtrX/ngrWflSB3Nk4zF1Jjbm+Z1TXdvtT7FIv/3IhBu
 qUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVlGZuCCTw/luznspzy2YoCy0QQYb8xrdRZiNgY33Mk=;
 b=qxRkv6wyLrVUWAzZUg6F2zaUyWq4EqgDq9+Lx/y6AuVgotPkwh8VpcQ3MLpLcue01L
 0syfVxMb1t17+9dcbVvboRSqelC2AePegrmI84ayWql6kDInVVA/WFfJke3As/J4anZ0
 hRBOt5+ALLNfSTAtaoXCu76cf8KIFNUbdzGsoqebz7sdGKZBnrXHd8ShHbePh4gfPpmm
 8rGQ/cm8V6utq2+M0eDA81jbJn/lOu9YcXMF/8PhBN4wf2mQa7LfxI3+vlb1WfBJZRF4
 SFBVeUVXPLTs2ILg3pM59F07dG4OqTANhFxNO1aB0DZ0DxJHG1fsxTJ3l5nlVW4p4prl
 luCA==
X-Gm-Message-State: AOAM530hbxxuhLqH5/f34bT0nbBoUMoefyqtAe+4+X9ZoG0Ie4bxhVFc
 tp/A1KdELZt32oQdDtdh/uo=
X-Google-Smtp-Source: ABdhPJw6I0KlhO48G3YM6d3R/Rk5h0vt94sQxZL4LIYBNPj85jrhfDPyM4KtKejDi5AVmVA3Kdmd1w==
X-Received: by 2002:a05:6808:2208:: with SMTP id
 bd8mr12464764oib.110.1629126814230; 
 Mon, 16 Aug 2021 08:13:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s184sm2101913oif.20.2021.08.16.08.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:13:33 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko> <b94ce36e-218a-008f-0063-8b99c3e658ef@amsat.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
Message-ID: <12470893-c91e-44df-7f1d-c64bdf23d95a@roeck-us.net>
Date: Mon, 16 Aug 2021 08:13:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b94ce36e-218a-008f-0063-8b99c3e658ef@amsat.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 3:11 AM, Philippe Mathieu-Daudé wrote:
> On 8/16/21 7:41 AM, David Gibson wrote:
>> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
>>> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
>>> enabled in devicetree files, they are instantiated in Linux but
>>> obviously won't work. Disable associated devicetree nodes to prevent
>>> unpredictable behavior.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> I'll wait for Zoltan's opinion on this, but this sort of thing is why
>> I was always pretty dubious about qemu *loading* a dtb file, rather
>> than generating a dt internally.
> 
> Hmm interesting point.
> 
>>> ---
>>>   hw/ppc/sam460ex.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>>> index 0737234d66..feb356e625 100644
>>> --- a/hw/ppc/sam460ex.c
>>> +++ b/hw/ppc/sam460ex.c
>>> @@ -194,6 +194,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>>           _FDT(fdt_nop_node(fdt, offset));
>>>       }
>>>   
>>> +    /* Ethernet interfaces are not emulated */
>>> +    offset = fdt_node_offset_by_compatible(fdt, -1, "ibm,emac-460ex");
>>> +    while (offset >= 0) {
>>> +        _FDT(fdt_setprop_string(fdt, offset, "status", "disabled"));
>>> +        offset = fdt_node_offset_by_compatible(fdt, offset, "ibm,emac-460ex");
>>> +    }
> 
> Oh, I didn't know about appending 'status=disabled'.
> 
> FWIW I'm carrying this patch to boot Linux on the raspi4
> (but I prefer your way):
> 

Neat, and excellent idea. I have a similar problem for xlnx-zcu102,
where declaring the affected device as unsupported doesn't work either.
I'll try the same trick there.

Thanks!

Guenter

