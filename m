Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D466B33E284
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:10:14 +0100 (CET)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJlN-00006v-Tc
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJk7-0007hU-NH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:08:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJk6-0007A7-42
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:08:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so306637wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qRrWx8IecwqHRWv6pCms04wG8j4IFrru8/aKju64QgU=;
 b=eNVb7X/GiERZ6E77zlbGEcG/paT670kxcFVHkijALxLWBMvtShnnkst40iVmWSJaVV
 TEMPpkvgNWuQMv4KRIChdvj4gxxPfjSq0aUq0K7zft4UOUHMS5atZqilCMq5vvWKX0mc
 /vp2+fSNWa6GWqYTuDHa09BgQ1NhDLhf2N4dvLNrkXE1t79lnLvBildfrCWmw8aTObFH
 +PeWpLdmJK/mMxP7jymvGl/BQdS8BxH5G09DeXrCXprWRfAa1+LPpI/9MIgxKnGKGUXU
 F+F1WYuClb9K+rkOP0GQvqH08dvfpl31XNAtBstolcJSHIgLpSJlwkOYbw65tBQ6vxrp
 f2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qRrWx8IecwqHRWv6pCms04wG8j4IFrru8/aKju64QgU=;
 b=kK0UmkTBXTmu6cyjg7QNzitM/3DNrD0xVdhwP3WXR+tlUTGNDxmcyo7ET+HYhZTl62
 OO8S5CshEbbe5dbRxAdu6OOm6cVQhmO+597hjEqgIAK0pOdCjtnbOdwe5IZ6mGZVRcRX
 XKJBmVqiViVpIHL4H0uD9NWHdO3oLT1wca8/zPMyPce7n70leDRlWl0lbVcSqXDq1h27
 8C10PK3xHJWEtvOEsRybNGtmzVMEpcf6uuJmUaV+kgIjoZ9vsX7lKyMVwRrzoDvlN2S4
 9wZaycfH3z+QdgVq5tZ/2Mh9mcH1SlY9wGLP+dJqgzxVAXiW6JmeM0FGvXUDj22mfD/H
 MYfA==
X-Gm-Message-State: AOAM531xVbgHUvyHRROEYBXcAGbyLRZ176jVTs06sXZOwM6NXM9qrTim
 +xXX/k/TekQGRsiaTv6hwdw=
X-Google-Smtp-Source: ABdhPJx56bHQLDuUkASAWBAegf5+rGSlJUTYpiqPJZymnPmdYKfvKfxmSlMFhA6Oux4drPjfn45JUg==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr1091684wme.58.1615939732663; 
 Tue, 16 Mar 2021 17:08:52 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm783204wmc.17.2021.03.16.17.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:08:51 -0700 (PDT)
Subject: Re: [PATCH v7 00/35] Hexagon patch series
To: Brian Cain <bcain@quicinc.com>, Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <02e7217d-6376-b93d-842d-197d9e13fc58@amsat.org>
 <BYAPR02MB4886C64A59EAC3B164159D5BDEBD9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <SN6PR02MB4205631BE926DC85052330E9B8BD9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9919a29f-95ae-8bb1-c029-74678fd9eefe@amsat.org>
Date: Wed, 17 Mar 2021 01:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4205631BE926DC85052330E9B8BD9@SN6PR02MB4205.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 12:28 AM, Brian Cain wrote:
>> -----Original Message-----
>> From: Taylor Simpson <tsimpson@quicinc.com>
>> Sent: Monday, January 25, 2021 5:09 PM
>> To: Philippe Mathieu-Daudé <f4bug@amsat.org>; qemu-devel@nongnu.org
>> Cc: richard.henderson@linaro.org; alex.bennee@linaro.org;
>> laurent@vivier.eu; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: RE: [PATCH v7 00/35] Hexagon patch series
>>
>>
>>
>>> -----Original Message-----
>>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On
>>> Behalf Of Philippe Mathieu-Daudé
>>> Sent: Monday, January 25, 2021 4:15 PM
>>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>>> Cc: richard.henderson@linaro.org; alex.bennee@linaro.org;
>>> laurent@vivier.eu; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>>> Subject: Re: [PATCH v7 00/35] Hexagon patch series
>>>
>>>
>>> Hi Taylor,
>>>
> ...
>>>
>>> I'm looking at stressing a bit more your work.
> ...
>>> Any other real-world binary you could share?
>>
>> In addition to busybox, we could build other open source packages.  Would
>> that be of interest?

ffmpeg.

> Taylor -- I have been running nightly builds of the cross toolchain which include busybox and Python (CPython) as test cases.  We could put one those binaries somewhere.

Maybe a release tag on Githug?

