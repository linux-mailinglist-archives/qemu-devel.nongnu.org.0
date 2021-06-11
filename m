Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE93A4B49
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:39:12 +0200 (CEST)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqk3-00040h-CP
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqhG-0008KM-EW
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:36:18 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqhD-0007jH-A3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:36:18 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x73so5679402pfc.8
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZrCxhCZ6as5Y+L9H0dHxLrkIAX+pMtFY2keZko9/LCY=;
 b=vPtvYSPPGVmGB8o8JFtABp4wQLRezfe1wZ7s4+u+BDs2DSe0CkQhwsXSVxapIZOiMw
 j8m6fNIgM54uXLYHhcKP/SHXQmuOreif6nw0VuhRAS7iTY3caEyhcNGvdTtiTv6mA7EA
 8ig0TDR3uEBRsHBXWTpKpPPuocwtlQz326/HOaBgNIzf8QsAvcnLyyHIiRbfm4Ha2Nb8
 duJayFuTLZ2CSaexBstuHRokycJHx+nGAUUdv87f/9T//sVdzpPn+vjsPH9KAWQNMzus
 jwOi789mDu5tlxlxmor1EhuzPpqQ92cTTgWv7GyWiGwxM/d0O2AUkDJAdq5yAOOSVJan
 6meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZrCxhCZ6as5Y+L9H0dHxLrkIAX+pMtFY2keZko9/LCY=;
 b=LLsTRRoWN0zTH64PkN31qDLEjlFPQ+7j64RXeWnGy6s4gz5PDDBvTz5l+snMtoYq1K
 XyH9Ks7ifiQ6DDAmjPZPNPtg4E+6kkxtb/mgNneHYckdv5jaSKXRZAFyYtUzhv34aasc
 JGxzsMz0pa2gSGUqNaa7+X6Du0whkCtzbRGy69JW2hOVzkYCOzNsDBO6pI4pHKj6gZwC
 Z5ulO2E7lWb1oAt1BveefusCesCN/AO0SqcBapH/yheBgbWQDzW4rjtOlKKUNV6I4OGD
 Xop7V4FnMoXzjzryqqhPF2Y+/jdFw4N4lNnxpoAfwBBGfJ4CX1aUp3ARgbUfG3PARv6I
 kPJg==
X-Gm-Message-State: AOAM531qjztEnP+e1Sq71Wd/qZ2f4qiSpMuteDUbGlQofDrM3liu3Jzi
 s6Jy96T+bmgSCKgKf9ZX1RB2Sg==
X-Google-Smtp-Source: ABdhPJzpMc4cTsgTl3LJC3F9UowrFgS6EC70EtlVNs/SDTTdojbHM29IUS/ZdeZgvl3nNJ+ntm0YXg==
X-Received: by 2002:a63:9515:: with SMTP id p21mr5909998pgd.333.1623454573992; 
 Fri, 11 Jun 2021 16:36:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 203sm5998105pfw.124.2021.06.11.16.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 16:36:13 -0700 (PDT)
Subject: Re: [PATCH 0/8] configure: Change to -std=gnu11
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210611233347.653129-1-richard.henderson@linaro.org>
Message-ID: <848dcc6d-a7a9-f48c-05df-8a5fc83f8bff@linaro.org>
Date: Fri, 11 Jun 2021 16:36:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 4:33 PM, Richard Henderson wrote:
> Now that we assume gcc 7.5 as a minimum, we have the option
> of changing to a newer C standard.  The two major ones that
> I think apply are _Generic and _Static_assert.

Poor editing there.  How about s/ones/new features/.


r~

