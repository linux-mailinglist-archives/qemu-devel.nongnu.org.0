Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D38510AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:57:02 +0200 (CEST)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njSF3-00074X-6Z
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njSDs-0006Ft-9R
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:55:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njSDq-00067I-QK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:55:47 -0400
Received: by mail-pl1-x633.google.com with SMTP id k4so19750463plk.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WG2ytXrRRv+9OjdzoN18K6C53x+LAm3ClcagjA70czI=;
 b=IQOrNKFBnK+9QlivShsBLnG2Mt3ofB4eTiNuCXzHWtf4TYaRFlRxn/sFp6MTAiwuMc
 LT0qJwUkoHoCtju/10ZyOu3LhsuHtrMBPOB2rmowksh9lzPHjJndYBqncB2z+ZPetD/f
 B8v/JfzEp+6g33mJ7onljqELlgmbxSFOnkVku/3uoXZV7vKABbDIaAExb4PTu5tLKGNu
 qS6oxW4bXZK6A2qfOqTIBhQyulRbCf9NZZqbv9qE4dhmPR80PLQ3b5fxdR3dyQjAHJbJ
 eNlLSfskLlScFSh7Wfwp8/dlPgDdhYe+zb8wTiXDR1Da/Db1Mykk4XZxrMshe1sUXTiB
 rn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WG2ytXrRRv+9OjdzoN18K6C53x+LAm3ClcagjA70czI=;
 b=I3AN//nHRL1Keg2HiK2mgwAniLhoaEDk+SyPSTDyDUolHYJmxw5TOz3fF13jCkW/hZ
 r6HCpbYjXoTOcvBWbQbvTwR9IiEG0V6/tpmXC0infeEa9EE0wlgDlrAcNe2SA3McltQg
 LZn36RMpmPq8zaShhCtpbsDeA0aro6xN+NEpZXbRgcUrxRGuJ80TvkKqG6ns+ppuaUJW
 Wkw2x/hSVuz2XETanMAMPpUHmMotsgmzutfHzeS9+tyI1W+Lrlrt8Hlt2hsOs1SB8KzO
 0rG/BNDur/XUAPL/8cTr2MtgX3+28fL9rXQmB5I0ueneKrMCSwEc7OSR5lI5FsNr0VSn
 xUvw==
X-Gm-Message-State: AOAM530XuzGVZp9V/MI03VSbFJ+RT6K8D6lVNr2RIfooWT5aVent3xkQ
 5al5IRZnImHCmRZVTo1K4F3JEg==
X-Google-Smtp-Source: ABdhPJygl03XrpSKjRJYccGNj8Q1KC9LjzgXkYE/pgtQHhOlZ98YdqxnwO8eXVrvibDZ1l9hkesUoQ==
X-Received: by 2002:a17:902:b18d:b0:15d:1698:5d77 with SMTP id
 s13-20020a170902b18d00b0015d16985d77mr11732171plr.68.1651006545356; 
 Tue, 26 Apr 2022 13:55:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a632113000000b0039d9c5be7c8sm13614923pgh.21.2022.04.26.13.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:55:44 -0700 (PDT)
Message-ID: <9c477785-4f5e-1fe9-26e4-d8ea4b15c569@linaro.org>
Date: Tue, 26 Apr 2022 13:55:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/20] target/ppc: Remove hidden usages of *env
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 11:54, Víctor Colombo wrote:
> By running the grep command `git grep -nr 'define \(fpscr\|msr\)_[a-z0-9]\+\>'`
> we can find multiple macros that use `env->fpscr` and `env->msr` but doesn't
> take *env as a parameter.
> 
> Richard Henderson said [1] that these macros hiding the usage of *env "are evil".
> This patch series remove them and substitute with an explicit usage of *env by
> adding macros in the same style of FP_* ones (e.g. FP_FI defined in cpu.h).
> 
> Patch 20 (target/ppc: Add unused M_MSR_* macros) implements unused macros, the
> same that were removed in patch 02 (target/ppc: Remove unused msr_* macros). I
> did that to keep the changes consistent with what was already present before.

Oh frabjous day! Callooh! Callay!


r~

