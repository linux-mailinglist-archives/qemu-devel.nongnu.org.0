Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D7546695D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:46:16 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msq9u-0002DI-Vy
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msq6e-0008UI-MW; Thu, 02 Dec 2021 12:42:52 -0500
Received: from [2a00:1450:4864:20::32d] (port=46878
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msq6c-0006qU-BA; Thu, 02 Dec 2021 12:42:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso348264wmr.5; 
 Thu, 02 Dec 2021 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fzc9fRimTVXigs1r0IpTWfiZqAfavm+lr2ZSIfoAN9M=;
 b=aey7DLLc/rYEfxIYejeUoc2HNhP+zwTXQY7RYefZf65Cy+e0vmENogDB5pTzc5VfyF
 J4ztJMwNXTrZtDPkxrgdXPWsB1y1YXlpiR4q8AIs6yD/91xrqMvCfpsvZ5q4PCtQA0UJ
 l43dfPoj0twrJRJvwaWCeJbC+iF2vQoNwyM7m8TnqME+EvPjGWQmJU1H2qTi5vwfMQAf
 BaY3tSPGXZKq8oSvjvidD7AhqGC88YQZd0qXmwB+4oOk3CurXlFD9FaAf8Ly+2o7KtkG
 ZyzYD1qBUI4IHp1Wj2B1SodTsaFyXkz03Ez5xIMfgCXyqp/iKOn1Qs2GYalZOhUUprPB
 O04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fzc9fRimTVXigs1r0IpTWfiZqAfavm+lr2ZSIfoAN9M=;
 b=5g4UXYipgsbmSMBIKWlNxRYFJAsy/hQ25LgnhY8AHd37ZbUz5wXK75x7u87ohSViDo
 dlKpztnqyfe6Dv8FKPbkGvVYNOUxQ5YWxI+NLAHMHtDVRFGcCLv/rWFFGU+9yU78+6xA
 Gw9zIBOPFTyZQkVAb8lD5eplCN+Mq84D0n3vk4RdGY4d+gyohC33CYDIynF0na2TXoa+
 qP/MnjFnS7ZpZiNspjh2uUpHw9gNa/Ppfaa/dcl801sWoqfqWhyP/6sSCMrc/ju4OtfE
 vw+qhuvdg7+fM3fMeaw5tYox/tAHxAnYjJjc+Nf7M2a9BO90NmyhUyEjp2pyIJYmOy0G
 D/Rg==
X-Gm-Message-State: AOAM530EWMbigOd0m+COIEqSSYgknu2qmr6lSpJ8gus8u37VMOFglDJV
 kYTs0Xr2xaVwG5JU7sD/4LA=
X-Google-Smtp-Source: ABdhPJytz2A3tWOVuST13GElpDHmyrg3HoGMF/OT2liquAGruHN4F2XjpkRv/R0n8Mm45PYm+TWdcQ==
X-Received: by 2002:a1c:a710:: with SMTP id q16mr8175431wme.138.1638466967372; 
 Thu, 02 Dec 2021 09:42:47 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id f13sm402207wmq.29.2021.12.02.09.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:42:46 -0800 (PST)
Message-ID: <4de257c7-b508-e259-7203-48c64d8c587f@amsat.org>
Date: Thu, 2 Dec 2021 18:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tests/plugin/syscall.c: fix compiler warnings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211128011551.2115468-1-juro.bystricky@intel.com>
 <87r1azyv88.fsf@linaro.org> <81d05a81-8ade-2a6c-427e-79a93543554f@amsat.org>
 <87fsrbxnzq.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <87fsrbxnzq.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Juro Bystricky <juro.bystricky@intel.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 jurobystricky@hotmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 12:08, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> On 11/29/21 13:58, Alex Bennée wrote:
>>>
>>> Juro Bystricky <juro.bystricky@intel.com> writes:
>>>
>>>> Fix compiler warnings. The warnings can result in a broken build.
>>>> This patch fixes warnings such as:
>>>
>>> Queued to for-6.2/more-misc-fixes, thanks.
>>
>> I wondered if this single patch would justify delaying the 6.2
>> release by one week, but then I noticed the IDE pull request,
>> so let it be...
> 
> Already in - as I had a PR in flight ;-)

Oops, mails out of sync...

