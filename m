Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506A6D1EB3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 13:08:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piCae-00061K-Gd; Fri, 31 Mar 2023 07:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1piCaY-00060b-S6; Fri, 31 Mar 2023 07:06:34 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1piCaX-0003E3-Ea; Fri, 31 Mar 2023 07:06:34 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 n6-20020a4abd06000000b0053b59893660so3439344oop.0; 
 Fri, 31 Mar 2023 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680260792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TSIK2qdWYJMNKFudiQ3+kCIl3109OQkh4w3P6LDiXUM=;
 b=nqzwq9nxo5GR0Eqow/AtYE8NgetsvQpUile3hlAyH9ijSOn8iBtJgufALhBQn236WV
 LXa8QFBGoDiikURPjLlD3CZzHq2Lv87AT/EkV6COUN9InNyRUqklInzQzYekNREfWL8I
 1siBLlOdOyTvMKmddbNxuqbYPetwG76/C8J5MUp2J/3oIaR+pq53aE2we8RJWLK26z43
 WEatDYZc3M+2rRKhKF1ZEJD+9yNtc3AwL8OYQAOFXtuK8lYXXVnrVW0QKLTfNl5BVBjU
 BzIa50eTOdlZ+itABFY/ZZxNKXLq7mz+x9tkR88opQq6CUac03xjaKVE5+apOCH1QvhO
 Pn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680260792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSIK2qdWYJMNKFudiQ3+kCIl3109OQkh4w3P6LDiXUM=;
 b=LcItmB9u4p1X+9xegXJxYFKGwmQphumNo3/KOsLbPS7bUnNftaGpV4u7gzCTCSqips
 TkENZ1Q0RZJxozH85pij6Big8pSvG8AuOt7xYvAteeKmq9fzRxfIKP+PqiDmHyiVooeP
 dNdFdydjG3o5603QxaV8o2PoYVfCb2D2VockFGZbTRoxO2EkWsZvXQoehg+EMrxC6LlO
 MZTmEtHaFtdBWWlzH4fQCwFTslyEdjAoGcK7ppuNDkpG74t29k86Mw5BANDHLj/sz2Ue
 x/dJn4dk2aFVBp/GjumRcljQgkkB+VuszQ6qQScfdUcGi6YG7uil78HGdVZWc/EKk5Sh
 pJ1w==
X-Gm-Message-State: AO0yUKVvt8k092F5yXZHtb/zaDkfrk2sQyS4d4/28tezgBJGtZ8uMnVq
 c0qbJ4DprH67dtAOL2hVUWs=
X-Google-Smtp-Source: AK7set8p5jrAF9PcevHe4LwD2eJj9/uvy7qq2nWBqIv7htqca/dofT3XVXY5yoDiM1Jq1WAeL8U5AA==
X-Received: by 2002:a4a:458e:0:b0:525:7eaf:2084 with SMTP id
 y136-20020a4a458e000000b005257eaf2084mr12653921ooa.2.1680260791771; 
 Fri, 31 Mar 2023 04:06:31 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 125-20020a4a0683000000b0053e8336f5dcsm698101ooj.7.2023.03.31.04.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 04:06:31 -0700 (PDT)
Message-ID: <111fdf2e-32bf-9466-d679-dc84e18c862f@gmail.com>
Date: Fri, 31 Mar 2023 08:06:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <3492b914-4b11-0fe2-2e9e-a67820dac9c5@kaod.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3492b914-4b11-0fe2-2e9e-a67820dac9c5@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
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



On 3/31/23 07:39, Cédric Le Goater wrote:
> On 3/31/23 08:53, Harsh Prateek Bora wrote:
>> This patchset introduces helper routines to enable (and does) cleaning
>> up of h_enter_nested() and spapr_exit_nested() routines in existing api
>> for nested virtualization on Power/SPAPR for better code readability /
>> maintenance. No functional changes intended with this patchset.
> 
> Adding Nick since he did most of this work.


And also Fabiano.


Daniel

> 
> C.
> 
> 
>>
>> Harsh Prateek Bora (5):
>>    ppc: spapr: cleanup cr get/store with helper routines.
>>    ppc: spapr: cleanup h_enter_nested() with helper routines.
>>    ppc: spapr: assert early rather late in h_enter_nested()
>>    ppc: spapr: cleanup spapr_exit_nested() with helper routines.
>>    MAINTAINERS: Adding myself in the list for ppc/spapr
>>
>>   MAINTAINERS          |   1 +
>>   hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++-------------------
>>   target/ppc/cpu.c     |  17 +++
>>   target/ppc/cpu.h     |   2 +
>>   4 files changed, 161 insertions(+), 110 deletions(-)
>>
> 

