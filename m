Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EF48AB4D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:24:58 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EKm-0001lu-TM
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:24:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7EH0-0007uA-Rs
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:21:04 -0500
Received: from [2a00:1450:4864:20::330] (port=40693
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7EGx-0003R6-1H
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:21:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so1091074wmo.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0cvCYusgXVfiMrxiTXMMAKePwodfB1Miu/9YZooBIr0=;
 b=C2CWS4Jz8Nekd++wAfP6X2NL2jr45mi2uzNGbcfhLk4cMalmRPFzMBqUWbIsPMvyp8
 bRvWegvR8w48r2fAZbY4/pPXYcXe/89EYqEzIGGujnCkzAgDTAgIpzvASOAZ53JJGwNy
 M8q2u/8ps0sUw2Ga2xDo1a7XrHSlSDetm/rHhhziTczD7FlrdmQdkbXQoUMgXrFS1eHD
 exOGhGWPWj8JBJkcPcXRjLvgEmq+oYR6VBKzUyTmNrQysNKI7LAl0VITTV+T9N3E8amF
 VLWXapmbtYMdFVWWetfjCr43nC36MEkaaGxm5PseaR3xs2/NKxeVsdvyxYH/kpmRCgrO
 qZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0cvCYusgXVfiMrxiTXMMAKePwodfB1Miu/9YZooBIr0=;
 b=t6GjH8WIn9X3iN+MG44cYEpA1Wt3ih1AeR/25YylPUpVspOW5Ga7onA8cxbDh9aG+j
 CUT1g+JCBqTDJfFBHdvfcMa8bHOEfNGq2lVk/hetDnRwcaaMuhiOfuCuMpBY4qJr5gpv
 UjDRp3OZHwowWJutjW0l0fx2STJm8OWrUdMWTTPyEEKDUMyGpZDHza2Ohv6wrUfr8bOs
 7crUGsHprRXQDDUzfElsVe1gOnHFT11iJ0eQOsySG5rzzlZFBa4cwi7HHs51K8s7rGcN
 0ay7hdzIjsRcpBYuEeTNMd5lMec+MVPVnCnmr/IiDYEi3ry2qka4JGg6KlAQo0y01Hcs
 r43Q==
X-Gm-Message-State: AOAM533T49KzBrXTkxUEo3y4/nn/cPg6xIB7ST3r4yJlRoK44pSU1sSk
 i1tpWwo9kuHB6RB4L6YL4Hw=
X-Google-Smtp-Source: ABdhPJyK+bk8CfUVkSvNhhLiiveDPy4lMCIjiCLLf/OqOvLfwZ0aBpP+fPcsYcOd2N9cLPA0YEMM/g==
X-Received: by 2002:a05:600c:3b8a:: with SMTP id
 n10mr1238575wms.180.1641896457283; 
 Tue, 11 Jan 2022 02:20:57 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id i3sm1355393wrn.11.2022.01.11.02.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 02:20:56 -0800 (PST)
Message-ID: <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
Date: Tue, 11 Jan 2022 11:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: "Startup" meeting (was Re: Meeting today?)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>
References: <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YdbRShE01esANc5h@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Just checking in, this call is scheduled for today, 3pm CEST, right?

Here is the KVM call calendar:
https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

On 1/6/22 12:23, Daniel P. Berrangé wrote:
> No one objected, so I think we can go for the 11th.
> 
> On Thu, Jan 06, 2022 at 12:21:56PM +0100, Mark Burton wrote:
>> Can we confirm the 11th for this meeting?
>>
>> Cheers
>> Mark.
>>
>>
>>> On 4 Jan 2022, at 10:29, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>>>
>>>
>>>
>>> On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster <armbru@redhat.com <mailto:armbru@redhat.com>> wrote:
>>> Daniel P. Berrangé <berrange@redhat.com <mailto:berrange@redhat.com>> writes:
>>>
>>>> On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:
>>>>> Mark Burton <mark.burton@greensocs.com <mailto:mark.burton@greensocs.com>> writes:
>>>>>
>>>>>> I realise it’s very short notice, but what about having a discussion today at 15:00 ?
>>>>>
>>>>> I have a conflict today.  I could try to reschedule, but I'd prefer to
>>>>> talk next week instead.  Less stress, better prep.
>>>>
>>>> I fear we've run out of time for this year if we want all interested
>>>> parties to be able to attend.  I'll be off on PTO from end of this
>>>> week until the new year, and I know alot of folk are doing similar.
>>>
>>> Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan 11?
>>>
>>> Jan 11th works for me!
>>>
>>> Thanks,
>>> Edgar
>>
> 
> Regards,
> Daniel

