Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3E3ED2B3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:00:08 +0200 (CEST)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFaLe-0002aJ-Jr
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFaJw-0001F6-SL; Mon, 16 Aug 2021 06:58:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFaJv-0006M6-4a; Mon, 16 Aug 2021 06:58:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id g138so11282456wmg.4;
 Mon, 16 Aug 2021 03:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q48U9lKwPk3sJBewfZqPDfHY8yE7N5XjZFJVeemTTa0=;
 b=OySPQYB0KqAFwtA7W8OM8/XhWGGpTrfcUmBaDhGN8WysK3CIWUv2acmJ0fbgFCGMz0
 pk+GxWWbLfR5ABYayEIThK1buhQXcoISvTy9LP51O28jpIIXxUuOEc+Jnynt0+NHr1Nf
 jDVWoMp8oxnZCpA907rmswT3glc8CRC73ylBLYdAl7Wp/u61BlinkoHv6psfbkpa74+1
 N8MZdZoMu+35l6BcXXKjSNNx99U1ANMAaOR54lNX3BfTkCSuyyF5/gM6C3Pt+YTBmGeF
 +rdsKKAudxO7L23iyPASGWRKbOUv3Wk/+uPkaKgVsjAX9nfckI6VsDX9VqfUFHXNCTTr
 RaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q48U9lKwPk3sJBewfZqPDfHY8yE7N5XjZFJVeemTTa0=;
 b=W3gRhWXa0OzsfEkBcxFx9Jpqk+5r6qwBP1qkqqZJJRX8NEMDDtk7gOdJ3KNSCNXs6j
 ogOuTKgm2Z5Y2DmrPu5hucaExKIaUHtPb+BNfVT77n1sqku/nVSYZiolr0VhVqDHrsOa
 TEQkO/5ePoPLZBI18oWMtuC4v7N9petVKPc7KdCU+7GSZJQMm45P4+1VQTSCTkvnMxx+
 5RewZVaib6pfTGLTQXBUP9iio46tvtTn7rZibaRfXYPx2xuI7a+WbhENBN13XfRGxOnJ
 n9LxfZFcuad9zujJZUim6mqAsYBIU3maZ23t7+bGQZ8gEQALMDh/MZCxWKnRUatJHEOY
 iqAg==
X-Gm-Message-State: AOAM5318DWYisLBdwoMnNF1lvN4v9fUKy0G5mImDuGP71eSLWRUCaMV9
 E+cbQWArkTiCjNsEUWOKTV0=
X-Google-Smtp-Source: ABdhPJyyKAKsTx8kSIrW1FOKQ7nQ5GDMe1jBdM/w1k2wj2ikJ/S8WHz9Izcos46XXIw9FKZ9xCQZrQ==
X-Received: by 2002:a05:600c:1909:: with SMTP id
 j9mr11051112wmq.139.1629111496910; 
 Mon, 16 Aug 2021 03:58:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y14sm11272086wrs.29.2021.08.16.03.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:58:15 -0700 (PDT)
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1e0f11ef-fd72-0e96-279f-f02463f96442@amsat.org>
Date: Mon, 16 Aug 2021 12:58:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 12:26 PM, Peter Maydell wrote:
> On Mon, 16 Aug 2021 at 06:46, David Gibson <david@gibson.dropbear.id.au> wrote:
>>
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
> My take is that if you have to modify the dtb file to get QEMU to
> work, then that's a bug in QEMU that should be fixed. It's no
> worse than for the machines we have that don't use dtb and where
> the kernel just knows what the hardware is. (In my experience
> Arm kernels can be a bit finicky about wanting the right dtb
> and not some earlier or later one, so I think at least for Arm
> trying to generate a dt for our non-virt boards would have been
> pretty painful and liable to "new kernels don't boot any more" bugs.)
> 
> Is it sufficient to create stub "unimplemented-device" ethernet
> controllers here, or does the guest want more behaviour than that?

For raspi4 "unimplemented-device" is not enough, so what would
be the ideal resolution for "the guest wants more behaviour"
when we don't have time / interest / specs for the missing
pieces?

