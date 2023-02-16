Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3C6994B4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSddc-0005U8-ON; Thu, 16 Feb 2023 07:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSddV-0005SD-Uf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:45:18 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSddP-0000SB-Gh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:45:16 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h16so1691715wrz.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c2syNzvq483mCLb2QfRAx46gOg3VuaIlYCERZ6F2VQ8=;
 b=wHLtAklhqVLm44faqn00PEF+Yf4BsTXZQsLWkfmOzE49H/X/XinueKHh/hG0q0aCxW
 gOoH8M64AQcvPG0QwShMSw1g84Y6SmckPm34XqXYGkwQJl+b51s7mNZpsp+S+qNDNJ4/
 csWfbkqHpaX1jYT7V3/jONK96JXIdVD+kqPRmBR9hloxTOVpG/T1MHI87zm9N2JqXKC9
 DexTBYDqD27yOb9hTIJDhDH7fP+VZPsHidh58xgZZsopBO+7EqVwn7ScdYk2ZjWEm/I0
 hwmDwDVbbu7cZeK5pqywPyG43kCNP987TLTqFJ1gukU7UObcrMphWct3TWSwIOIzfnek
 t7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c2syNzvq483mCLb2QfRAx46gOg3VuaIlYCERZ6F2VQ8=;
 b=rn4sYL/t78t7Lr52d98P6hWrWMTfnfeGjRNxA7ECgTP6gN5xCMQwoi62j0TNwsmRZn
 8tx0irlDzSy/XWV6UFgeKYThqiRSZV9IhGarn9zTnPmcfFsHTKIytky93EGEDrHNssdg
 SJyN66ZVVP0BGep6huwf/ZhUpyreIkgVN4WMbpxuM8bEgFBlETZdUVgZUM3f5HKKf8q5
 7lvpu56j+vwkV5x6ZScV4AzVW0LVwHgjr16DxLly7B05ERjgGCEOVbYTMM23GnpTWcNZ
 hY9P+rHMQB+zceb2lEGN2qwdwG5URzKnglgsMl4X5o3op6WHwA7u5/BPtTxbW+S7ZiU9
 TkCA==
X-Gm-Message-State: AO0yUKVCsprb0JWe6Ir/hv1NvHhYOb/uBAMloEfYux2FLqWaQzRWS/su
 vwrbnCPJMN7CQr9MDhDwHYHuGg==
X-Google-Smtp-Source: AK7set9W00adO1M6pJaEY1FQchOXCNfdI0z6L8FbTMajELGKQvV2eT2z5s24tjCvPRzefuIucZUt0g==
X-Received: by 2002:a05:6000:81e:b0:2c3:d707:7339 with SMTP id
 bt30-20020a056000081e00b002c3d7077339mr1569841wrb.6.1676551507326; 
 Thu, 16 Feb 2023 04:45:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d3-20020adff2c3000000b002c55ed9e314sm1480052wrp.64.2023.02.16.04.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:45:06 -0800 (PST)
Message-ID: <d894d24c-cbeb-18e9-e761-427f068d95b9@linaro.org>
Date: Thu, 16 Feb 2023 13:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Future of icount discussion for next KVM call?
To: Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, Bill Mills <bill.mills@linaro.org>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Alexandre Iooss
 <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "Wei W. Wang" <wei.w.wang@intel.com>
References: <87bklt9alc.fsf@linaro.org>
 <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
 <87lekxkhes.fsf@secure.mitica> <87bkltredr.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87bkltredr.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 16/2/23 13:20, Markus Armbruster wrote:
> Juan Quintela <quintela@redhat.com> writes:
> 
>> Alex Bennée <alex.bennee@linaro.org> wrote:
>>> (replying all because qemu-devel rejected my email again)
>>>
>>> On Thu, 16 Feb 2023 at 10:19, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>> Hi Juan,
>>>>
>>>> Do we have an agenda for next weeks KVM call yet? If there is space I'd
>>>> like to take some time to discuss the future direction of icount.
>>
>> For next week we have:
>> - more single binary qemu (philippe?)

I'd rather skip "Single qemu-system binary" for next week agenda.
(In 2 weeks we could discuss CPU topology and shared buses.)

>> - TDX migration from intel.
>>    We asked them on the previous call to change their design to transfer
>>    stuff through migration channels and not create a new channel.  But I
>>    haven't heard from intel. (wei?)
>>    They agreed to send the slides and post the code before continue
>>    discussion. >>
>> And now I like the title of you topic
>>
>> - Future Direction of icount
>>
>> O:-)
>>
>> So, I will recommend 20 minutes each if Wei shows up, or 30/30 for the
>> rest.
>>
>> What do the rest of the people think.
> 
> I think we either need fewer topics per call (ideally one), or strictly
> enforced time limits per topic.  I don't fancy meetings where the topic
> that made me attend falls off the end.
> 
> The former may necessitate more frequent calls.

IIRC it was said we can have more than every 2 weeks per community
request, otherwise we should try to respect the current cadence to
maintain the current inertia.

