Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD0C307BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:10:58 +0100 (CET)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Aop-0004qt-Tu
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5Ajc-0000wi-OA; Thu, 28 Jan 2021 12:05:32 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5Ajb-0003BG-7H; Thu, 28 Jan 2021 12:05:32 -0500
Received: by mail-qt1-x830.google.com with SMTP id t14so4564885qto.8;
 Thu, 28 Jan 2021 09:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9vEZRYqIh82sDQheTJdVAx6yS1VNuef9qDUq+hQsTSw=;
 b=KE6NY/0sKQ7xK/nd4AofFzECZ/WkscOYtrqT/WMHWKD3vNGJ82XuLRSP8BY/5zcUT8
 bv3cfn/4ycTFoSdlvcl6TrcQFodAS1S+GH12rjrmxqICa76qELXCv6PlPZbsVOYynLJs
 cw1+ROpZFHKOHddimqF59G1sPaHPo3NlpgCjidBPO00LvohfDLo1PebAL/0Wh3VWjA65
 /DXpJd6NPpIzT/kkGbXuNaIaF9u+lBbESxIYqWbBH85nRex58bLO+sTpTcXnM6DYJ2Rl
 H5artv0P4nv/HGPWBK3/TMmHZX0lWG7nJ05UGf3VvP8ciAv26Fvkk+VqQp948Os+r/+v
 ZI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9vEZRYqIh82sDQheTJdVAx6yS1VNuef9qDUq+hQsTSw=;
 b=gIPn1rsqw+b0amIOBhnYPZkplcSFVautGcANxc99WseGvDUXu/Cfr0yDs5iz4u15CJ
 QfIHCBt7M5QhcFvBgKJdp892IGgRgqM/dD9FtmLZrCHqfAPmQ0HVI4UQEpsML51fDHr0
 gcHXr8pZHxrIvhdTDo1Q1gp4OhmawznjFQmw0lq/Y+z9wFwhqFJOn28XXopbRz/c9yHR
 uMhueNJO0DaxC/qzIgNiPEEmAmRHyk0KisMiYU9sseTIrzp/YsXUP8FGQSr5z2Tr4hko
 F8OhYkk2HugQ18QrYcc09bmhs+MKCmCvvTrPCBBDXZHIqJMSytv2B69S17IuVzKmbLVw
 gt+A==
X-Gm-Message-State: AOAM531S0M29uqlKOk8Us3gM6m08xVizuQe8hE9tM99z7R5eELtYqVpM
 Qy53baHSQnwvQ/RcXsdgLXHd+iLCyCI=
X-Google-Smtp-Source: ABdhPJxvpv8829oNUsbKiOPrS+A+Zs6dgoW/fmmRt+Apleo65x4ItP9AHmYhLdnBIyfbgMwqYXnwgQ==
X-Received: by 2002:aed:2f01:: with SMTP id l1mr457866qtd.21.1611853529820;
 Thu, 28 Jan 2021 09:05:29 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:6df1:6267:881f:cc79:a1f7?
 ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id n20sm3877221qtc.13.2021.01.28.09.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:05:29 -0800 (PST)
Subject: Re: [PATCH 0/3] spapr, spapr_numa: fix max-associativity-domains
To: Greg Kurz <groug@kaod.org>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
 <20210128170318.1e164823@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <6057fa92-e554-edfb-c6a7-4d0d318dd52d@gmail.com>
Date: Thu, 28 Jan 2021 14:05:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128170318.1e164823@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/28/21 1:03 PM, Greg Kurz wrote:
> On Thu, 28 Jan 2021 12:17:28 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Hi,
>>
>> Patches 02 and 03 contain fixes for a problem Cedric found out when
>> booting TCG guests with multiple NUMA nodes. See patch 03 commit
>> message for more info.
>>
> 
> This paragraph mentions "TCG guests", but I see nothing that is
> specific to TCG in these patches... so I expect the problem to
> also exists with KVM, right ?

Yeah. I mentioned TCG because this is the use case Cedric reproduced
the bug with, but I myself had no problems reproducing it with
accel=kvm as well.


DHB

> 
>> First patch is an unrelated cleanup I did while investigating.
>>
>> Daniel Henrique Barboza (3):
>>    spapr: move spapr_machine_using_legacy_numa() to spapr_numa.c
>>    spapr_numa.c: create spapr_numa_initial_nvgpu_NUMA_id() helper
>>    spapr_numa.c: fix ibm,max-associativity-domains calculation
>>
>>   hw/ppc/spapr.c              | 21 ++------------------
>>   hw/ppc/spapr_numa.c         | 39 ++++++++++++++++++++++++++++++++++++-
>>   include/hw/ppc/spapr.h      |  1 -
>>   include/hw/ppc/spapr_numa.h |  1 +
>>   4 files changed, 41 insertions(+), 21 deletions(-)
>>
> 

