Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638254A9003
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:34:24 +0100 (CET)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjkF-000520-9J
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFjhm-0002Ny-54
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 16:31:50 -0500
Received: from [2607:f8b0:4864:20::1032] (port=36364
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFjhk-0002Kk-H9
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 16:31:49 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso11237085pjv.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 13:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rXmYbwNl7Kr/ivvsZOena3yb6vA2NKitQcHiSKWGftQ=;
 b=dyHmITmx3uoUuzdMAVbFFktcralPR5K2XX2Y7nJP6re9xCcdevIKlATTNrQTJ3QozB
 bWe0RQqLTiUhx4iJL2mJTyS2M3BDzwfA0OU9TiYq6sPFyJ1BixC4TiOq9/kZ+Xg9rHuU
 A0zzZK7KpDcAPrR8EAal02BmPclIa8l4ruWZwOK6G362s473VUysg6onHRPkLa4E/A6u
 N87in5b8wQdlIcdRFzT4LmXT97G5Kj4d28LjgQ8oHJgKVnJ7OLTxsOc3GudLhLY/MqHp
 Bx8nUKnudw76OluXDy4AR0IvER/PrYe6JZbUmBlUoP54DQ15lsegpCneVWlhaH2A3FZG
 WbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rXmYbwNl7Kr/ivvsZOena3yb6vA2NKitQcHiSKWGftQ=;
 b=SaOmV+n5YrgAwphv5sOeSk+WEhWjl7KAugmokxSxBUTCdq/NrRa7+r5tTtaFKOufQe
 LKJA/MkIchL1s6IqoSQnsuvJhWxVOcGisEGjOroffAy3YAPeRyMBZuEDg9VJVspj0H+G
 BTvK6qprS20LiviTXMk1QDLqZCaOPilV+atgTK4bF5HjGn4hptlO7gprWK+PCEQWinj9
 jdXWrrVNcNELlXdckK6mksmd4wwn91R9PfbyvwfTxr2q5Jwci0v9PUbSomQh/uRQVFyR
 J+XozCYy+5hrcARs+JIuhmE2l2jkJAg61D1cqkmWWQ3JwHt/lh54sxYtZtJxdT+1ZCDS
 Mx4w==
X-Gm-Message-State: AOAM532LQKdx1pv28i03JtoCDix9as/er8CFNYI3nHriKS0Hlt3wE9KC
 onRVtGngSuYg+SsyzBTGOn40LQ==
X-Google-Smtp-Source: ABdhPJw/ZZdMTi92q1eifwVYbfKBo3seLZ5/OmV9XaVW+IajzzWPtzJcubbnLRDD+pEU7mEnfASLAA==
X-Received: by 2002:a17:903:244d:: with SMTP id
 l13mr36755727pls.142.1643923906022; 
 Thu, 03 Feb 2022 13:31:46 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9?
 ([2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9])
 by smtp.gmail.com with ESMTPSA id mu13sm12755359pjb.28.2022.02.03.13.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 13:31:45 -0800 (PST)
Message-ID: <b5cfbd97-8f10-c41f-d28d-bf2567585e99@linaro.org>
Date: Fri, 4 Feb 2022 08:31:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
 <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87h79fsor3.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h79fsor3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 07:00, Alex Bennée wrote:
>>> Does:
>>>
>>>    #if BYTE_ORDER == BIG_ENDIAN
>>>
>>> work for your compiler?
>>
>> No, but this does
>> #if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>>
>> With that change in the source, the tests passes.  Will that work for
>> other targets?
> 
> At least not hppa-linux-user. The joy of having no standard compile time
> way to report byte order in the C standard despite most things needing
> to know one way or another.
> 
> Richard,
> 
> Any ideas?

I see you're not explicitly including <endian.h>.
I would expect that to be of some use.


r~

