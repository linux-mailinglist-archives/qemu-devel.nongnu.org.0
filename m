Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B892F9BD8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:24:47 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QmC-0003Ho-IA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QkV-0002bz-SG; Mon, 18 Jan 2021 04:22:59 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:32825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QkU-0005zv-7r; Mon, 18 Jan 2021 04:22:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so8459936wrz.0;
 Mon, 18 Jan 2021 01:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gMJPUZg6CqWtEOOlMaBHvgfyN7dW5WThmSaIMy+HsZA=;
 b=A6IfZ+kpdcIxD2rRj6/a/OmQN16YYQ27QrJ3Gn1Lj1HHbDA8bEsFhL3uQ7Ylj+BTf6
 CsHRMOPf1mJpv96wLlmlsSED5W/2zAcCQAHbcN3YrIWykf7D7vQ8oRnrSICNxJHcC92S
 ARIOz8zpVSv/7RFO/AIaA+fr4qQVwcQxJvSLGfNPWUVBDyOt/pMYLexyAjKkKpYknw4t
 7tUmUllteSmpwTnZ45ioDjKQv2N3cktMD1OWswkzric+LIeu0wh4RKPgLt90LikzZqj3
 ZM7250Eh7HYOfeehJQ8bg8zB1TPT7txPY52DKpPAPv6hG8vnqameVbmn2sn6Ds3IaB8f
 +NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gMJPUZg6CqWtEOOlMaBHvgfyN7dW5WThmSaIMy+HsZA=;
 b=jvGOiSYjehkuxSdvpEpfTzd61AvePDC1uoOjLFx+ExmBbD/tQkGOzW5LGfXBQkjoOE
 gab7FlOzVKeqhP4lUFPC0+YC0KyNmdR/krlwOOUAjGtSgb5xjA/dlYK8cQGglagAm6Yp
 FUXpGwFE2qQmLoq2p+vgSDlt5o/j2ELtbPbUuhivMQBV6xe12UWBoq3PTuZKA78sd5zc
 Dri/AgCcgv9Rj9WyCQLkBNPKsqMY7B/RUyNMAwulLiBfMIfF6YnG7HdZQWO89xAqU33X
 crsP2S9J50LSeQd9B2Tlpmm8nQmGzmLNwuljJr1Eh2+JrcipwAIjdG0l82HnW9ZJJeNc
 DhHg==
X-Gm-Message-State: AOAM532nikmBI9gqSHWlnlw/C9At1BVGlAXnbIsIGqDQqf+c/KGP96KX
 XwzYC/7RJ07/FjyUxfN9cFA=
X-Google-Smtp-Source: ABdhPJwkivlgOE8pgMcQ+N9IQbSUQvB8rAv629RAFZOMpOgMsNeJhBmaThIb8P6Xi5JPvSrShInkWQ==
X-Received: by 2002:a5d:6686:: with SMTP id l6mr24791751wru.236.1610961776441; 
 Mon, 18 Jan 2021 01:22:56 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a184sm13089948wme.35.2021.01.18.01.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:22:55 -0800 (PST)
Subject: Re: [PATCH 00/18] hw: Mark the device with no migratable fields
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200703201911.26573-1-f4bug@amsat.org>
 <CAFEAcA8Cu2N5qX55rUk_yd4R6PdJX+X5KPQmMiQPFakP3ShZ-A@mail.gmail.com>
 <17a5ddc4-c7d9-08f3-5260-f17e1bd48dac@amsat.org>
 <d0eb49ce-b94a-7b5f-c616-eb461e2f73b7@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c55e82fb-4434-9052-80bc-50c1ad18d492@amsat.org>
Date: Mon, 18 Jan 2021 10:22:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d0eb49ce-b94a-7b5f-c616-eb461e2f73b7@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Juan Quintela <quintela@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 1/18/21 8:33 AM, Laurent Vivier wrote:
> Le 14/01/2021 à 16:49, Philippe Mathieu-Daudé a écrit :
>> On 7/9/20 9:19 PM, Peter Maydell wrote:
>>> On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> This is a proof-of-concept after chatting with Peter Maydell
>>>> on IRC earlier.
>>>>
>>>> Introduce the vmstate_no_state_to_migrate structure, and
>>>> a reference to it: vmstate_qdev_no_state_to_migrate.
>>>> Use this reference in devices with no fields to migrate.
>>>>
>>>> This is useful to catch devices missing vmstate, such:
>>>> - ads7846
>>>> - mcf-uart
>>>> - mcf-fec
>>>> - versatile_i2c
>>>> - ...
>>>>
>>>> I am not sure about:
>>>> - gpex-pcihost
>>>
>>> I think it's correct that this has no internal state:
>>> the only interesting state is in the GPEXRootState, which
>>> is a TYPE_GPEX_ROOT_DEVICE which migrates itself.
>>>
>>> I made some comments on the "meaty" bits of the patchset,
>>> and reviewed one or two of the "mark this device as
>>> having no migration state" patches, but it doesn't seem
>>> worth reviewing all of them until the migration submaintainers
>>> have a chance to weigh in on whether they like the concept
>>> (I expect they're busy right now with freeze-related stuff :-))
>>
>> Now that we are far from freeze-date is a good time to ping
>> again on this concept :)
>>
>> Most of the devices are ARM except:
>> - cpu-cluster (Eduardo/Marcel)
>> - hcd-ohci (Gerd)
>> - mac-nubus-bridge (Laurent)
>> - generic QOM (Daniel, Paolo)
>>
>> Is someone against this proposal?
> 
> I'm not against the proposal, but I don't understand why we need this.

IIRC the IRC discussion followed this thread:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg554453.html

Quoting Peter:

> I think we should care about migration on all architectures
> and devices, in the sense that we want savevm/loadvm to work.
> This is a really useful debugging and user tool, and when
> I'm reviewing devices it's the minimum bar I think new
> devices should clear. You then get migration "for free" but
> I don't particularly expect it to be used compared to
> snapshot save/restore. (Of course some of our existing code
> doesn't support this, and we don't have a good way of testing
> so bugs creep in easily, but as a principle I think it's
> good.)

Currently there is no automatic way to catch missing vmstate,
we rely on code review (mostly from Peter...).

To be able to add a code check to catch the future device added,
we need to first clean the (old) devices missing VMState, justifying
why each doesn't have any field to migrate.

Also IMO it is simpler to have an unified API, rather than explaining
each experienced and new contributor why "old style qdev" are allowed
to do things than "new introduced qdev" can't do anymore.

Regards,

Phil.

