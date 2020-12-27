Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414772E3249
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 18:44:44 +0100 (CET)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kta5y-000711-Ta
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 12:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1kta4d-0006ZF-Kc
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 12:43:19 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1kta4b-0000Oc-KP
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 12:43:19 -0500
Received: by mail-ot1-x329.google.com with SMTP id d20so7462326otl.3
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 09:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNqkdnppUlZjpiFgWHgRFJZO1SgvYPBWDe1pqUSlh40=;
 b=jHpKnrqvmySJ9PH5hzyuz2YidkH8d081E63sBJGXcG8ONFdWKzbUUs05X+TLg019Ox
 fWysXbqqzS53bNAWt7dpD4tq4rLMlmH1xutt0ywl1i2xuA3ycuSwZ981/0NGs55BwFLh
 8zcZwzkyIZRfsvR7Lg2Sckgjps7yAFHJ+BU7yQPwYrBG9GZodYUD/zPcyA2vxgey/Uzv
 aOHu/5aBWqVaBxRTzmL1KJ1trreyLyQToFtCBa6dnzvGwicpDksgqZYxCn/NRmAmxMnH
 VSCMbQe/jrxxeAc07LJJbAhd7dt7Y5nhxd77BzT1N3hQIUAkErNBgFCCLD39CgtqvbhV
 qJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lNqkdnppUlZjpiFgWHgRFJZO1SgvYPBWDe1pqUSlh40=;
 b=c8UagzypavIIWkIOm4jo88zq7VwFY3zvFfW20PB/B3D2gRm7PR2yUUzEkR18H3JzRI
 EGSEntK3NhBZp7je5OsnGcrtjMVniEL41zdJQLuk3m0uZxojDVC4zv6+nWXERzTz1wj3
 QA3gilvcPUv9XOArVZ4km1FArWQ9V31gvuIZ03u89Df490qyzzvxpnlfPZyV289h9VRE
 /K0BvzhMooKrmkQpl1E6Fv/+T67zqHOba0qOfKUd5jaWFvOUGQt601Zgbr7Z0EeeJcoL
 M5ha46UEIQVPFutFtO3ZE5wlHj7PwzMNgJTZ4NadYn3+sYNosOmgti0mp6tmCtHXYGyF
 rEmg==
X-Gm-Message-State: AOAM532eTRzBvNHBdpE55Yvt0eAf9XTZq1kMwTBFNC1Ivx8OwmgUPO8h
 P2zGCAZmJOJz4ckKL7+Nrgw=
X-Google-Smtp-Source: ABdhPJzEl+bWGw13N3FYSzjZRDNidQ13sMHvElDWPMPsByaAcAZZKrGZKgswaF/H+UiSJvSZmRMdgQ==
X-Received: by 2002:a9d:1c6:: with SMTP id e64mr23497630ote.50.1609090995703; 
 Sun, 27 Dec 2020 09:43:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a24sm8470954oop.40.2020.12.27.09.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 09:43:14 -0800 (PST)
Subject: Re: [PATCH 2/2] via-ide: Fix fuloong2e support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1608852217.git.balaton@eik.bme.hu>
 <796292ea92f3f00e696b1eea33ef0c6815002bf0.1608852217.git.balaton@eik.bme.hu>
 <00c994c9-99d8-5b34-3976-4e6617b794a2@amsat.org>
 <8c7e7487-3cb8-5df3-2ce7-5b4bb1b698c2@eik.bme.hu>
 <cdf2cf0e-bde8-a854-5206-4e55bdcc733f@amsat.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f7e3aa00-ef00-612c-6f8c-86bd19986b98@roeck-us.net>
Date: Sun, 27 Dec 2020 09:43:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdf2cf0e-bde8-a854-5206-4e55bdcc733f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: John Snow <jsnow@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 9:24 AM, Philippe Mathieu-Daudé wrote:
> On 12/27/20 5:40 PM, BALATON Zoltan via wrote:
>> On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
>>> On 12/25/20 12:23 AM, BALATON Zoltan wrote:
>>>> From: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> Fuloong2e needs to use legacy mode for IDE support to work with Linux.
>>>> Add property to via-ide driver to make the mode configurable, and set
>>>> legacy mode for Fuloong2e.
>>>>
>>>
>>> Fixes: 4ea98d317eb ("ide/via: Implement and use native PCI IDE mode")?
>>
>> Not really. That patch did what it said (only emulating (half) native
>> mode instead of only emulating legacy mode) so it wasn't broken per se
>> but it turned out that approach wasn't good enough for all use cases so
>> this now takes a different turn (emulating either legacy or half-native
>> mode based on option property). Therefore. I don't think Fixes: applies
>> in this case. It fixes an issue with a guest but replaces previous patch
>> with different approach. (Even though it reuses most of it.)
> 
> Well, if Linux guest got broken by this commit, why not name it a "fix"?
> Anyway I don't mind how it is called. I find important to refer to the
> commit hash to help navigating between commits while reviewing history.
> 
> What about:
> 
> '''
> The legacy mode for IDE support has been removed in commit 4ea98d317eb
> ("ide/via: Implement and use native PCI IDE mode"). When using a Linux
> guest, the Fuloong2e machine requires the legacy mode.
> Add property to via-ide driver to make the mode configurable, and set
> legacy mode for Fuloong2e.
> '''
> 
> Guenter, is that OK with you? (I can update when applying this series
> via the MIPS tree).
> 

Sure, I don't really care about the commit message as long as the problem
is fixed.

Guenter

