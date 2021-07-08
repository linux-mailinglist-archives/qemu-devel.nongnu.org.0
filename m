Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD73BF861
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:26:53 +0200 (CEST)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RF6-0008O2-5J
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1RDZ-0007Yo-Kl
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:25:17 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1RDW-0006ac-Qk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:25:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id t9so5471130pgn.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qN83k4s+zEUOuessE4YUgJRhuoPaXkVk1fp1RjgUcuU=;
 b=fUvUZu4ZqD5nsoNan/SQhNgl+UpKA4JfYLEC3PMlohFLtgC69xID928YHz5nh4oNWy
 z7ox7RzAHGbrDycXZ7ZLGkUlUNndG1CunjbaCQfwDsmsqcUt2/eGhqNOkSnDu/IbZ1KD
 k25QOLOQm+X/ZYCReBUNN2VVJyoE0pkzXyhHnrR9BDWbwpWg2Hly/iGEA0mTsEFs9yJa
 zFCRr8WeSgZNxoWeQJRhVgK/HjHu9Ijy47f7bSMrsSlhvhs0xjdARFgb5aNKw+0wXSPw
 I7XpI1MVlJ+GmGuhhQzeTZWyPOPqhSIR0JnzOrTqnXK+JhzeVgmvBh6Id7vbjupUYMht
 er0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qN83k4s+zEUOuessE4YUgJRhuoPaXkVk1fp1RjgUcuU=;
 b=tkvGEtk0sZSCuRc0tpvvFM5vV6YzhMlxUqelOCeZh2TwCwGw+OFOrIDx9xhbtmNkn1
 1931OJIEzm1GXOg83mCq2YReQtpnD7QeIaCS+vsi/t8R7X8JxbgU3GJgChFO9Z9c1t/F
 SclWeLDHF2ZBCDwiwwiZly41mQOLnNQGWuoqBOCxPqcUsQ2zUpUVVP0h+Tml7xFxkZ1c
 O67HNm6DAVSPFaUpicKPuVIeGuYrOMEXAJG8m0QgSce9wTwaRQN8OGlDncCzAFCFKsSh
 FRis/zRB5fYxJ3DYaVXx5jKYPMlarzemqt5PsNB4s2adCw1MFoBsDbtZzd1OtGDuyQyu
 hnSw==
X-Gm-Message-State: AOAM531E7BQceYtvLDY1vmqDbW+L4BPgWlKI94tNwCjPv3oPuJ6N+aP7
 4BISy7EjDmCQXVEFRqbLChmksQ==
X-Google-Smtp-Source: ABdhPJzbeh/s9Vwx0H7onReiV3J3NV9HTKH8o3Be1YOezHXg2mSnpXvVp5umCR9169D/gsGeAOmlUA==
X-Received: by 2002:a63:4815:: with SMTP id v21mr30777108pga.213.1625739912303; 
 Thu, 08 Jul 2021 03:25:12 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 75sm2459228pfb.159.2021.07.08.03.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 03:25:11 -0700 (PDT)
Message-ID: <07d3a270-6d44-591d-d0ee-0264d3b4c7f2@ozlabs.ru>
Date: Thu, 8 Jul 2021 20:25:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <22b9ae49-7252-b664-ea98-99bb7baf4680@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <22b9ae49-7252-b664-ea98-99bb7baf4680@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 20:18, BALATON Zoltan wrote:
> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>> This addresses the comments from v22.
>>
>> The functional changes are (the VOF ones need retesting with Pegasos2):
>>
>> (VOF) setprop will start failing if the machine class callback
>> did not handle it;
> 
> I'll try this later but I think I've seen guests using setprop (Linux 
> also does that for some property). How should I allow that? Do I need a 
> new callback for this? Could it be allower unless there's a callback 
> that could deby it? But that was the previous way I think.

A simple defined callback which always returns "true" should do.



-- 
Alexey

