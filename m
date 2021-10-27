Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264D43D1C0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:35:30 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoht-0004sl-Bv
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfo7w-0001FH-C0
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:58:22 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfo7u-0006SY-My
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:58:20 -0400
Received: by mail-pf1-x432.google.com with SMTP id b1so71056pfm.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GdnCxBGE2yhMmP6YI3smOM8W+mcJsqjKTsK+PUhmLas=;
 b=mcXy1K/fIZvIWj+h3LiX7bR6CGlPZ1LyRIrHKTo8zbx74Q7P+HtwAnNhuqmxTCSPo9
 tzM1T/xdUBFQE1o+s397Qhz5oxJxKiYd/zRpi+UWvLstXC9C+LSx6Z5//c7oK+k/Vqeu
 YwHr4nGGxYxEZiCNGKZDJTH8ro7RSm3AqGAsP8BfS+jhj261NqGE4RuEIXMOtaan91Ua
 uU8/IkzjYh/AnrIBef1+3OgLGThY1wiboeE5gt44I0k96NXUYq4f8eoxAqDSBD+/FWE1
 DCq8hej5TW5EjjBp9i3fmobycbau688iIcLA1N+t68cSdeUKuERDN8UCQQvnoSXjf431
 qunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GdnCxBGE2yhMmP6YI3smOM8W+mcJsqjKTsK+PUhmLas=;
 b=1h/GcOsP7R912w8P6WiYh5GkKxQwatK1NcxViHs4vc3uuCPbtzaKEDhJkKVRGMSnF+
 fak6TYwPGpL/vCTVpWcmKrx6n8LKldDQz4ZHJJ9i1ist+C1C2MK1ewfQpQoorpmTncN6
 IIS7hrAS6CB6LnUFztd5bAStuh+rZ6hoGqqcw+kLcfK4sXQ2tWOyXrc8mvBYsgLErsFT
 cVt8t2TCTIqWfIhde0shiyuOs5ss3oqzzjG0fU/OQdUbX0hU2AOCh14HXweQ0BkJvPLa
 CVAoGuuJafr1QQ1oAAq7IaPxyjW3S9s91d45J58wtxP5a62mh3gAoA+P5wP9FMcghGX0
 1LUg==
X-Gm-Message-State: AOAM532leU4cMtCEMWspVOuAadwgv9+IcdNWk2a1JuDyWaKc8nnBGR8A
 0TbO9gMVApklOxFBQSBmyHIrlw==
X-Google-Smtp-Source: ABdhPJx6JrNp7Ro35s6mQFd9dGZlM/11C+IcfoFldCl84ZzI7yIRgrReinCUJZO6ZcLuM57ISn98tw==
X-Received: by 2002:a63:a009:: with SMTP id r9mr25429817pge.172.1635361097084; 
 Wed, 27 Oct 2021 11:58:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 13sm430786pjb.37.2021.10.27.11.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 11:58:16 -0700 (PDT)
Subject: Re: [PATCH v1 25/28] plugins: add helper functions for coverage
 plugins
To: Warner Losh <imp@bsdimp.com>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-26-alex.bennee@linaro.org>
 <e26b5d8b-fe12-c0f5-0cd3-6a2e7421c0c0@linaro.org>
 <6C94810E-93F3-49E5-B4F7-995C41D64453@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <869244aa-ef0a-803e-5497-cdb22e1f65f8@linaro.org>
Date: Wed, 27 Oct 2021 11:58:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6C94810E-93F3-49E5-B4F7-995C41D64453@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com,
 cota@braap.org, Ivanov Arkady <arkadiy.ivanov@ispras.ru>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 9:09 AM, Warner Losh wrote:
> 
> 
>> On Oct 26, 2021, at 2:25 PM, Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 10/26/21 3:22 AM, Alex Bennée wrote:
>>> +#else
>>> +#include "qemu.h"
>>> +#include "loader.h"
>>
>> There is no bsd-user/loader.h.
> 
> Should there be?

Probably.  It came with Peter's cleanup of linux-user/qemu.h at 
3ad0a76928df01726e5872b8530d8e1eaa1a971d.

What I meant with my over-terse response is that Alex's patch is incomplete and cannot be 
applied as-is.

I think we should introduce a new header for sharing these new functions with plugins/. 
Perhaps something shared, in include/user/.


r~

