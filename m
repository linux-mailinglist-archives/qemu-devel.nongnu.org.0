Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F003A9EA3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:11:08 +0200 (CEST)
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXC7-0005CR-Nu
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltXAO-00042Q-Qt; Wed, 16 Jun 2021 11:09:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltXAN-0005LZ-8T; Wed, 16 Jun 2021 11:09:20 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y7so3067585wrh.7;
 Wed, 16 Jun 2021 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D2sumaqdX8PgE+1dXFec4vQ63OsQWdc5Y6EH/uDxWCA=;
 b=rsxrkQVVlI8ch5VlsIs345vIV/fRUk1xUVGOyAdSRiTXzjvS5+dNwI/NpNaDGZEiA3
 HQJ4JoPBHVUS0fbmG+RI6lgDZpye7HVsXcjk7VoY9qdDKxvQH9Bk3cPLSmNbO8K04Jdl
 P5oz5w9atP8sqyjlLYyHqNNru85I77qwlZUgZAuUEQicmKKA9H4ZLrElJ4GsW/Y85Qyb
 KW0RQjXBVIhdMDJZL/AjO3Q5LOF47ZwamERe2Cr+jPRetTfxjKR82pOmTBbYADfbaEWu
 ho2YdrFISHCR9xB8sdRwbKM6OLMHqJuTDTlbNcCSe4fDBa0PuDFechro2aE2lL8JtoE1
 +j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D2sumaqdX8PgE+1dXFec4vQ63OsQWdc5Y6EH/uDxWCA=;
 b=XRB3mtchvHGd9KeR+L21FIBhKYAaT0j88DCRTsZ5XRLeb/p0tmwr3QFQCfN73JyVwd
 /2jIwpxXsrr7Nw8iL6VnxvOl4yxR3skOkBqLE1hWeEUKQdqwCyCrSqw0gce0jApzzRz+
 ALFuyrgJABaDjoXlXl3FPft1cGKagcZZHsjwg4Zw5fPIPH1WEU9RowYrg9vl9K33zxwT
 XOykFau51vO21ZpIWVDo0KBFl8TbDS6a4EaRQmexu5Lc84vWnTEOesmBKsmUaiK8+74L
 AjZslRmMGw+IJxWaktKbn+Qd+X28NXKz98mRuygs4pKJWKuyetv93a82uTX6xX7K0XIt
 GALA==
X-Gm-Message-State: AOAM531TXa+3WyVqzWHEd0V2+6ASudo4FSjpSdzIcu6JlJfsvY9bIJru
 pD9r+uWFSmd4sqOq4dN6CubYszkT19vB/w==
X-Google-Smtp-Source: ABdhPJxs3g/+aIpUJlgasn2LjrP/maDJZGUOcajIWZID1lea0G5VSmUz4x9g4lupheKaaUgv+oLQfQ==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr6134906wrt.302.1623856155861; 
 Wed, 16 Jun 2021 08:09:15 -0700 (PDT)
Received: from [192.168.50.31] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id 61sm2702874wrp.4.2021.06.16.08.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:09:15 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] i2c: Match parameters of i2c_start_transfer and
 i2c_send_recv
To: minyard@acm.org
References: <20200623063123.20776-1-f4bug@amsat.org>
 <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
 <8230aaa5-73b4-4bf6-6567-38bb5cde3883@amsat.org>
 <b5f020d9-53e6-602c-74f8-d2695462a5c@eik.bme.hu>
 <df15b240-af9b-49d3-178a-d0fb8de63aa3@amsat.org>
 <20210614193423.GE2921206@minyard.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15c7c1ed-dcd9-da20-5d61-e5abf5ca6c60@amsat.org>
Date: Wed, 16 Jun 2021 17:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614193423.GE2921206@minyard.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 9:34 PM, Corey Minyard wrote:
> On Mon, Jun 14, 2021 at 06:48:05PM +0200, Philippe Mathieu-Daudé wrote:
>> On 6/14/21 12:02 PM, BALATON Zoltan wrote:
>>> On Mon, 14 Jun 2021, Philippe Mathieu-Daudé wrote:
>>>> On 6/12/21 9:33 PM, BALATON Zoltan wrote:
>>>>> Hello,
>>>>>
>>>>> On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
>>>>>> This is v2 of Zoltan's patch:
>>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
>>>>>>
>>>>>> - rebased
>>>>>> - added docstring
>>>>>> - include hw/misc/auxbus.c fix
>>>>>>
>>>>>> Supersedes: <20200621145235.9E241745712@zero.eik.bme.hu>
>>>>>
>>>>> What happened to this series? I did not find it in patchew, only my
>>>>> original patch:
>>>>>
>>>>> https://patchew.org/QEMU/20200621145235.9E241745712@zero.eik.bme.hu/
>>>>>
>>>>> I still have this in one of my branches so I think it was not merged at
>>>>> the end. Could this be resurrected or should I forget about it and live
>>>>> with the inconsistency in parameters instead?
>>>>
>>>> I suppose it was not queued because you asked to remove the
>>>> "Reported-by" tag :/ I agree with you it would be nice to get this in
>>>> the tree
>>>
>>> I think I said only Reported-by is enough no need for Suggested-by as
>>> well but I don't see this as a reason to drop these patches. So maybe
>>> just nobody cared enough.
>>
>> Ah OK now got it.
>>
>>>> for good. However 1 year passed, so it might need adjustment.
>>>
>>> Should I try to rebase it or will you do it eventually?
>>
>> Found the branch and clean rebase, so no change needed.
>>
>> Corey, if you are busy, I could send a pull request if you provide
>> and Acked-by tag.
> 
> I'm somewhat worried about the silent semantic change.  I would much
> prefer the functions to be renamed, as you mentioned in an email a while
> ago.  I think that you mentioned this in an email in the chain listed
> above, and I think I pulled it for that reason.

OK, maybe the comment was sent after this series or I missed it.

Thanks for the reminder.

Phil.

