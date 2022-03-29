Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1D4EAA98
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:34:43 +0200 (CEST)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8FO-00018p-Gd
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:34:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZ8DD-0008Vs-IA; Tue, 29 Mar 2022 05:32:27 -0400
Received: from [2001:4860:4864:20::2f] (port=42367
 helo=mail-oa1-x2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZ8DB-0007k1-N3; Tue, 29 Mar 2022 05:32:26 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso18074181fac.9; 
 Tue, 29 Mar 2022 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9V87G5Av4jqhr8MGU8NB+mXd0pxMh1KStGGmasHBzbY=;
 b=Loq8bCK1g7mfGl58z0x7EDD3E/yaJUOH6mgSloSimaAoAHLp26QOofZoVKn5qTdIK2
 pfcYR9fxHo2RDppbnGspA6QVpqbJH4pgEG0vYooEXqdu6Fc4pilCvEumOMShKSScS+ON
 yswo5R+jo/a3HiJOSlAAUSFFgMYNLRl0LKQiRjq/l/qBdi8vp4FF2zohp8yzgpAdFP86
 K0cePrRzIJqg5SjM8twwXBEhcZkBpGZIn7UdwL4eKA5vP1aHt8MYe5/c6Tcx4SqvKtpE
 cFbr1PkbvtvZCbhqW1uYIvxYUdXm7z9zIHpXq+eXLsKTywLINNwYEzDXvWmfM7TM/7Vt
 MnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9V87G5Av4jqhr8MGU8NB+mXd0pxMh1KStGGmasHBzbY=;
 b=KJdp2zNdhrwHc7clIBZStD9h6+5xlgrnX5wHjr0AL8HTGqgtE9URKxJweZkY5wlELz
 RbBdIcnE5T0wuTsv1Oy8Vxg9RM+fjxxLLiNSIa8E+3r6HifqRd95hscyIdD2tTEwshJF
 GdkNTmy5iRMWJrhbDDoi+PEv29E1/N2ztqXLElp8mDPlDqlgeKrLUAcs0Uksq9XOaRVr
 4mBDlFnAYtOnXl2zjkQ/Rsaj1O3W6Y+CXDtZJVLz1Zi/BDw8eU20EGbdcN+hNsb8nK4/
 DrrrK674+BDzywYhdQFaeAohZPusrYShFM9vcActM7DoKJPbwHGa9KWZs4J5ZVRslGmX
 oOLw==
X-Gm-Message-State: AOAM5302hIk8Ixww6mO52yZj4PKvt7WMgySqhgQ7jwZtvVjtmarix4HM
 s3sIZX5jGEQBnN434jYZkwACXLwG0iM=
X-Google-Smtp-Source: ABdhPJx6TmwZSnTrkcwnu0tBiy6pF6swj6bjG2r+8Wvbq1tWpJ7U+9N5x/CmsG5ANLAxSwv131AIaw==
X-Received: by 2002:a05:6870:a922:b0:df:b71:f00c with SMTP id
 eq34-20020a056870a92200b000df0b71f00cmr1607831oab.129.1648546342830; 
 Tue, 29 Mar 2022 02:32:22 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a9d6c52000000b005af7c7cb702sm8421806otq.34.2022.03.29.02.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 02:32:22 -0700 (PDT)
Message-ID: <9de39b66-363c-ea88-9fab-68271a27dcdf@gmail.com>
Date: Tue, 29 Mar 2022 06:32:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] ppc: fix vcpu hotunplug leak in spapr_realize_vcpu
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220328125918.494787-1-danielhb413@gmail.com>
 <YkJfxLJkxZQDQwch@yekko> <5c0a397b-9851-2842-0479-8f86241a234e@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5c0a397b-9851-2842-0479-8f86241a234e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2f
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/29/22 05:36, Cédric Le Goater wrote:
> On 3/29/22 03:24, David Gibson wrote:
>> On Mon, Mar 28, 2022 at 09:59:16AM -0300, Daniel Henrique Barboza wrote:
>>> Hi,
>>>
>>> This is a memory leak found by Valgrind when testing vcpu
>>> hotplug/unplug in pSeries guests.
>>>
>>> Other vcpu hotplug/unplug leaks are still present in the common code
>>> (one in the KVM thread loop and another in cpu_address_space via
>>> cpu->cpu_ases) but these are already being handled by Mark Kanda and
>>> Phillipe.
>>
>> Changes LGTM, but I don't see much reason to split this into two
>> patches.  They're both small, and are part of the same logical change.


I did it in separated patches because I tried to find other instances where
the timebase would need to be freed. Didn't find any.

I am ok with squashing them in a single patch. I'll send a v2.

> 
> And it could be a 7.0 candidate. Are we ok with that ?

Since it's a memory leak we are now aware of and have a fix for, yeah, I think
it qualifies for 7.0.


Daniel

> 
> Thanks,
> 
> C.

