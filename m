Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68570390E76
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 04:49:26 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lljbo-0004XB-UH
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 22:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lljag-0003pZ-Nr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:48:14 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lljaf-0001JP-4Y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:48:14 -0400
Received: by mail-pl1-x630.google.com with SMTP id b7so13223943plg.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bh/DSW/js5M9G/6jpO15SPcVQUGziv0X8AJf79iMCf0=;
 b=Kk84VnnZPbMgc8kwTXtMuJM3fbfnPAc+fxhfksv/RD2z+SPI/rvDGmKhTLE8DqQcGQ
 HtormfiV7vlrWg+XOG1CIuPXSZWKwsHxeu9Tdf9J13Gt6FZps2v49hHpPOljCtddZpZM
 2LTuC6oc5YY8+Lc50xry7mM1u4vsAhNwlvHbjr0DvARL9cn5S0dzhPH/4dYEh/9rcY1G
 AbxKhXUWYYqgl5+apvZb1qIrZu33AhowjuB0dFPs/WctHxY4NXTz/O2f9lllq2faVqla
 w1LMK63du9ttvfLXRQmwhdtZAaC+fRBZWiZ8U1Mo5Ew1lgZzrHY3m2y1LJUu0ypyY0yM
 6VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bh/DSW/js5M9G/6jpO15SPcVQUGziv0X8AJf79iMCf0=;
 b=hKLkfKDN5ouoSVQuKPwSkES9lYVYflYtMBDFvsHSbcm3dsMekV0qWzd5+8yvUQfrI+
 sy8XUYrRG+axUEe1rv+WySoHTxByazaNCNElhIzxHdnLijgwSINFuuIeMXSTOqD3D0AM
 x7NJqR2fubZkp59734V5aXA46DW0wbg5vioGepe56dSIw3fxBG7cCkqipNxfMleFObMh
 pS/CVM4/U31JPElRDWpNrYS+nTs+u3wuepaXiqgiRmDvktkRYHvfE1hGviLqg67zrVMX
 Uyu6fLBzSBpkSAcjeOa6DYOP8dmHuqDKle30WeF/aAoNSXnFpgl3Icz0j+fM8qXZVbpy
 VvxQ==
X-Gm-Message-State: AOAM532uN4KMPDefSTBlrtqeghyrPgys2AGtn87JzBMIg8cgXbfVBuaB
 WrCOheNaof4hSoi3OoTwvyI/ltw2ZbmlDA==
X-Google-Smtp-Source: ABdhPJwEdhMgh29sG3EB9OVCtVBPY45Aj3toSyLYOfJ+w5AuaObrK5/+8+UenZJbsG63fVlj8iH3MA==
X-Received: by 2002:a17:90b:d98:: with SMTP id
 bg24mr1474268pjb.112.1621997291309; 
 Tue, 25 May 2021 19:48:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 cc2sm13347301pjb.39.2021.05.25.19.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:48:10 -0700 (PDT)
Subject: Re: proposed schedule for 6.1 release
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA82qqRmBeMvauPj-oyXU=TirtV=0bgB7jxUeRPUU7A+rA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7378fa5f-9227-38d9-06ce-3c9f13f91499@linaro.org>
Date: Tue, 25 May 2021 19:48:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82qqRmBeMvauPj-oyXU=TirtV=0bgB7jxUeRPUU7A+rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 5:27 AM, Peter Maydell wrote:
> Here's a draft schedule for the 6.1 cycle:
> 
> 2021-07-13 Soft feature freeze. Only bug fixes after this point.
> 2021-07-20 Hard feature freeze. Tag rc0
> 2021-07-27 Tag rc1
> 2021-08-03 Tag rc2
> 2021-08-10 Tag rc3
> 2021-08-17 Release; or tag rc4 if needed
> 2021-08-24 Release if we needed an rc4
> 
> I don't think there's anything much we want to try to avoid
> dates-wise, so I just put the target release date in the middle
> of August and worked back from there.
> 
> Any objections/suggestions ?

LGTM.


r~

