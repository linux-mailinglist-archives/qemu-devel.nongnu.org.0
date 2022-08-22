Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5B59B7FD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 05:33:11 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPyBa-0001Wb-JH
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 23:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oPy8R-0008PN-AB
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 23:29:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oPy8P-0000vr-1u
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 23:29:55 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso9963324pjr.3
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 20:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=5j0OBKAgyholZH+0/r/9MuF3pGuosobrojMykmHbHzU=;
 b=PSkn2HgZhasAB35YNKu2uemslyI01m5mCJk4JSnRD6n3rM9oATROBv6h4tVHEjV8tF
 zrehn4Vszv3E+01WFjI4tu0PxJJLZOaelVRNQlZj8W14UJ8mtIu3ZMED6ztlaYyUwjsG
 d/NPQlPNoMtoCyn3NI3+szqNjhlCH5Wgmzm1SwZO5uZN6dqY2w1KEEsbranOfA6Ykf0C
 jK2OS8VdG3yGEpOjHplai2hP38FHszJTHc+CkI2aEHKg38lEmC/qWXqyEkJxgiv0cRCu
 Bf8r9ly1LhoqpQrLnxSbR1KJ2XB/vTBURMA3rbSM6Y0WT80+MZpjnjHelYgUZNj9lTTF
 MFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=5j0OBKAgyholZH+0/r/9MuF3pGuosobrojMykmHbHzU=;
 b=aD34gLSVu2KuEoHwJ4YKFkVZ1LfrqLnf3IHSroEobTBjosorGjFrQeo4XqJ+iES+bg
 0ANoYlxJlPei5+MMRoXTEYxck2x2gmi12UGmpc6xfq3yZ+zf7tDHgiVLjODl2Z7n7m6+
 7zaf6QDdUVhZCTajs/OvAlvVvfxbu//Jo8XMqRW2MSHp9FeDoo90nsLrhrvkCXO4bdho
 xeTWGQtYf5gZk9+4Dk23XObCTq/t3O64jD8PYR7jSYCI7cDDmzRewx/UOARrZAzYezAD
 csXrBDL+bHlDTMRbYM9xjrUMgqN5HCgGofBlvpg/iJzL0srLURwjLAil5hj/h8eVDUTA
 PSpw==
X-Gm-Message-State: ACgBeo3VU9jai9ho97trR6zyySb5jeiKzad0cKXhJh5DG7FTVjUWPz0p
 ML4VNgPY3iIqxZa9AjR10JzFsQ==
X-Google-Smtp-Source: AA6agR5oe06bM+pRib6WeULIL8sXY2WMp4rzKllAUcEGp0njCsd5cVHIPl+pRM4Rbo4tjld+0GihSg==
X-Received: by 2002:a17:902:f612:b0:172:cbb0:9b4f with SMTP id
 n18-20020a170902f61200b00172cbb09b4fmr10571509plg.142.1661138985179; 
 Sun, 21 Aug 2022 20:29:45 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 v30-20020aa799de000000b0052d4ffac466sm7393133pfi.188.2022.08.21.20.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Aug 2022 20:29:44 -0700 (PDT)
Message-ID: <708e6776-5589-15ab-535a-69c5d6d5f0d0@ozlabs.ru>
Date: Mon, 22 Aug 2022 13:29:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
 <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com> <YwLyhvijapVkpgjr@yekko>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YwLyhvijapVkpgjr@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 22/08/2022 13:05, David Gibson wrote:
> On Fri, Aug 19, 2022 at 06:42:34AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 8/18/22 23:11, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
>>>> The pSeries machine never bothered with the common machine->fdt
>>>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>>>
>>>> We're going to introduce HMP commands to read and save the FDT, which
>>>> will rely on setting machine->fdt properly to work across all machine
>>>> archs/types.
>>>
>>>
>>> Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt property enough?
>>
>> I tried to do the minimal changes needed for the commands to work. ms::fdt is
>> one of the few MachineState fields that hasn't been QOMified by
>> machine_class_init() yet. All pre-existing code that uses ms::fdt are using the
>> pointer directly. To make a QOMified use of it would require extra patches
>> in machine.c to QOMify the property first.
>>
>> There's also the issue with how each machine is creating the FDT. Most are using
>> helpers from device_tree.c, some are creating it from scratch, others required
>> a .dtb file, most of them are not doing a fdt_pack() and so on. To really QOMify
>> the use of ms::fdt we would need some machine hooks that standardize all that.
>> I believe it's worth the trouble, but it would be too much to do
>> right now.
> 
> Hmm.. I think this depends on what you mean by "QOM"ify exactly.  If
> you're meaning make the full DT representation QOM objects, that you
> can look into in detail, then, yes, that's pretty complicated.
> 
> I suspect what Alexey was suggesting though, was merely to make
> ms::fdt accessible as a single bytestring property on the machine QOM
> object.  Effectively it's just "dumpdtb" but as a property get.


Yes, I meant the bytestream, as DTC can easily decompile it onto a DTS.


> I'm not 100% certain if QOM can safely represent arbitrary bytestrings
> as QOM properties, which would need checking.

I am not sure either but rather than adding another command to HMP, I'd 
explore this option first.



-- 
Alexey

