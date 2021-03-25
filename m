Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F4348D64
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 10:52:33 +0100 (CET)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMfI-0001Vo-JK
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 05:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPMdk-00010A-BU
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:50:56 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPMdi-0006w8-R5
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:50:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id x16so1611121wrn.4
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kUuB711mnnFe4SQj297loRSSi6ZG0mqIsCLsntEY2d8=;
 b=UnNsdMPHizDY6oVn1Be74ofWH4fPfVh2dFx7HRrM5iIj9RyoLtyezVig9kPbhmtNrx
 KAQoXN3CoLngEEYnHjdCKpboMy0qMXjQT6Bu4qx3I+vH3qaKENgMxYkUj8WuooIMnGdM
 1Xotw1M33QQvdclmd+//33aujDrMfpYiwhcruvTvOd/jFmnkhKiOIK2UXDJ3tx93V2lS
 CtkVATdjxZ1qd2KNqsalLFXm4WAAx7svmaBnlILsT8Z4PPpUNBWq0RTZVZVNMJKIDERl
 OyaznBG98OrNPOxHoC29G/B42QTaJvJmCchlwArOxWLPstKlz1fvxPv8xVR9BEtPrUc8
 DqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUuB711mnnFe4SQj297loRSSi6ZG0mqIsCLsntEY2d8=;
 b=BOUAhQEcXiUHPrsT1kf9zIyUcYMdOMGoT2F1utnonlcrBPvqK1fTPdmsRshKAIAsgL
 IJaa4gK41IBnZaGGpbQ0KiP75bBXSYTDUAtI2G5N2BASzpdJELeUAQaByASxoTmBhIHq
 xQyVhLrQLyHTLtdNq95ozN6/2EgSEp9EEA6iYeKEXJGEJGo0I9bWcuq1Rwf3z76Dz+bf
 E2n1jIdhZCqwOv7zsK06jag8yZm2vqISriUdN1E8KRMJmaahSVNNOVdjzAQpCUVsaX6+
 EPri8OMP49TAfI1Oc1NTL0xC/ZOZts2hUhHqCFj5Tq706suVLIa6xbA79nLm/fq+yYXy
 N5iA==
X-Gm-Message-State: AOAM531Cbxh3q4N3LYRAFs/kZ3/FJovURAYKKVWCRCsztzZ31S33e55D
 oSoSUgA3uNd6e4am1WkbGRM=
X-Google-Smtp-Source: ABdhPJxCNb31rxOeaeEaKPmMt+3atB0SyBczb/K6fv9wTZrtGr0gFejDKCg3E5eFzDJhUnYhQVpGPA==
X-Received: by 2002:a5d:5904:: with SMTP id v4mr8010864wrd.261.1616665852294; 
 Thu, 25 Mar 2021 02:50:52 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d18sm6920947wra.8.2021.03.25.02.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 02:50:51 -0700 (PDT)
Subject: Re: gitlab-ci: Only build /staging branch?
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
 <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
 <1a70056b-78b4-c4f4-afc2-044aa499e1c7@redhat.com>
 <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
Message-ID: <15a71585-dd61-9ef7-c7fc-887952d45ab2@amsat.org>
Date: Thu, 25 Mar 2021 10:50:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:29 AM, Philippe Mathieu-Daudé wrote:
> On 3/25/21 6:43 AM, Thomas Huth wrote:
>> On 24/03/2021 22.58, Philippe Mathieu-Daudé wrote:
>>> On 3/24/21 7:33 PM, Philippe Mathieu-Daudé wrote:
>>>> On 3/24/21 7:01 PM, Philippe Mathieu-Daudé wrote:
>>>>> Hi,
>>>>>
>>>>> Peter's current workflow is push to /staging and if his
>>>>> testing succeeds, he pushes the same commit as /master.
>>>>>
>>>>> IMO there is no point in building /master branch, as it
>>>>> has already been built earlier as /staging.
>>>
>>> Similarly with tags. Although we don't tag often.
>>
>> Tags are used for pull-requests. So I think we should run the whole CI
>> for tags, to make it clear that a pull-request always includes code that
>> builds fine.
> 
> Sorry the context was not clear :/
> 
> This is only relevant for the qemu-project/qemu gitlab namespace.
> 
> v6.0 is at the door and I was wondering what is missing to have the
> CI used as a gate.
> 
> - Stefan/Paolo moved the main repository location.
> 
> - Alex made yet another effort to get the CI pipeline green again.
> 
> - IIRC Peter said waiting 2h after pushing /staging is too long.
> Currently worst case it takes ~2h25 between one /staging and the
> next one, simply because /master is rebuilt in the middle. If we
> remove /master we have ~1h15 per /staging pipeline.
> 
> - I don't remember what is missing from Cleber script, maybe we can
> use it as it without waiting for a respin?

As someone else is caring about this, please disregard this thread
and its questions/suggestions.

Regards,

Phil.

