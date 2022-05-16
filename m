Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B6F528DC9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 21:15:06 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqgBM-00077p-Vt
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 15:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqgAW-0006RX-7E
 for qemu-devel@nongnu.org; Mon, 16 May 2022 15:14:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqgAU-0007cw-Ea
 for qemu-devel@nongnu.org; Mon, 16 May 2022 15:14:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id k16so8117608pff.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CT/o8Pz1jCeo4KItEcGWz4r+pRxRPmpnYp5ynyRBlQI=;
 b=ymHAf6idVrf7hbwO1CCDs5ivfN3T4pMajob+evKs0WSzLBwSnh/0qaZddSA+4QKDn/
 OY4BEUvp58rwIKOJTyt+mr9tTJgfSxiGysh95clGS5RkgWW0ulGei56i5kcBeoZfR+B/
 ihrW9oN4/R2qFWwIXTtS41882XLBVgkqgohZqCLW6LyXhLil5iJcniVHX8udxQq91yR0
 vE8l99dvL1byM37Yo10APddxJoXORA3A9C8QiQWU2XbouUHII++WtVZms8HQ/W5S/aJo
 JoWhollpiETWlX04oSMf/KLJrMLn6rAcdXPmbPijAvDFfsKiMxSO/bOhgTkUdpQHbQmO
 /nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CT/o8Pz1jCeo4KItEcGWz4r+pRxRPmpnYp5ynyRBlQI=;
 b=357J70AVt5EmQpo39sLaVQXjEh9w5Z61MpP9Be+4hyyKFreKLh6V2C7EsYqPCOmd2q
 G06RzBwZWs5HBEMJx3MSKKNFqeoj73KudLcvQU2nPPQJpj45fUqPS1q2e6pBKrkv5bPJ
 DfSoH8rPlUAs2DdUlgzib73Gkm3G8ORiQGU6eMwxXqRPAlzj/DW9xN7c16b9ZDTWJ+P+
 1LN7KSxCFekImkiS25LLBWi8jV1LkU9ENg9gtXvyc+D4nvC7O31MgTb9wxQp8kALmzFy
 6p0pYT0InBUfRQHwRYd4GGrZnWjG+VHUbsA3qAvwnMi3inheBxcbr4Aq2KRwOV7Yv8jr
 5AfQ==
X-Gm-Message-State: AOAM530MvZSa4r+viorcgjMJcDpWGeQD33VI5XDaaJjy2BZ+wL2TtBEv
 2xFSBc3gPZrjTfnyFuRd2G58gw==
X-Google-Smtp-Source: ABdhPJzZ6DEURmB4h5iVsNuLpoms0AgMdqTf2CMWE4W5NUTDCRDpSXz/Aj6dWipC5mzVSVLc9UBr8Q==
X-Received: by 2002:a05:6a00:2442:b0:4fd:8b00:d2f with SMTP id
 d2-20020a056a00244200b004fd8b000d2fmr18838680pfj.39.1652728448819; 
 Mon, 16 May 2022 12:14:08 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b0015e8d4eb283sm7322656plb.205.2022.05.16.12.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 12:14:07 -0700 (PDT)
Message-ID: <be93a9aa-4edf-3152-c225-19abc291afd2@linaro.org>
Date: Mon, 16 May 2022 12:14:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
 <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
 <02b0c561-c93c-2ac8-7579-6c456c37771c@linaro.org>
 <CAFEAcA_Fqm7VL-ZoEuzmoQUDHqbOxKCG9s53GVy8hzDuET82yA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_Fqm7VL-ZoEuzmoQUDHqbOxKCG9s53GVy8hzDuET82yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 09:53, Peter Maydell wrote:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg07542.html
> 
> Is that this one?
> https://lore.kernel.org/qemu-devel/87wo0no0wz.fsf@linaro.org/

Could well be.

> 
> Did we find out why Ubuntu's capstone in particular fell over ?

I vaguely recall that it was a snapshot of a capstone prior to the 4.0 release.  The error 
message you quote above is because CAPSTONE_API is not defined to something reasonable.  I 
don't have an ubuntu 18 system to quickly look at.


r~

