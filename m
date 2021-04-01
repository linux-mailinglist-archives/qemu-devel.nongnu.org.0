Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F0351072
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:59:30 +0200 (CEST)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsEj-000850-NH
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsDV-00076i-88
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:58:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsDT-000660-4A
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:58:13 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j18so846436wra.2
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/QUdaRB3iQwu1TNGPxFZD1e8L1NQLd6/NnPczr7/I6E=;
 b=lcfFdek+EeJQUPrk4/+XZx3Y6BtupBtFCpY72UGpLTlCxlj8XHJ/FcwKRol2NkiF6Z
 1DHIS2X9JZscMrZj84YmtbNeNfb/4rvJHJE3lA6XqvakG3h0e+CLvHgpfXisSkIi875f
 /qrK09DWtYnH0YG1y/LjjlUpF/opaYmVJGyOYcZbU+aKrzFy25/pbYatIJ841r7I4WA2
 3Qx2L3DD9iu7dDmJMd2q3Te0PUfRmfWqFuYDwBo2ydGyZ2th+hF32/NuCskgqIl4ZZDL
 X8cYlfUMc9q6jkisR5gsnpYVVLSUAQ6jwcc2ni8wRVC/z3PsFDW7tYKUwkDtIhE1+RdP
 uybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/QUdaRB3iQwu1TNGPxFZD1e8L1NQLd6/NnPczr7/I6E=;
 b=IweFGqKPzp1HVZeDrAYaa4z47knjbOLMgo15kEbMRkVmHlbFlgLX6pz2HyQxmAG08s
 c86CXIXLVjUKQAh4bIqseJeNRBZQzuOHZRfEbIlu22H+GCCPHMAhDtG1rpEHc8+Iygw8
 yxaHzV0bY+HXib6oVyfn8IfuTNRymr35r9tqtE0hTIo2BcAV9WCMt41S5oerRdfnYrxF
 bSUG0kuqxLDIoJ9CNsdovixkGxzbjv29FRhfkDaRzmUvopEMtSm0VTb6tqEUS3NxKpG3
 4pYd2rFnmdbY6zSHqw4na6y87jS6KQxXSMmTtROS23J9xGWxMZCrF5DO/vz24yl9NiwP
 gbFA==
X-Gm-Message-State: AOAM533VsxJ6/bSOuQPgsGyORHQB62qBcLHM9PB6jHMmmKS3WIrunBNz
 ulGY6MilblSIEVAzePcLudosrFPwthoHww==
X-Google-Smtp-Source: ABdhPJwqwBTjZoZ2ZZkN2Ptp7AoE4ZqqdM7WiN4EtW3wXblyZkh/xiWkn5oqFEVvPOgDclUzihjUyg==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr8053355wrt.64.1617263889795; 
 Thu, 01 Apr 2021 00:58:09 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v189sm7574831wme.39.2021.04.01.00.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 00:58:09 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: replace Huawei's email to personal one
To: Thomas Huth <thuth@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>
References: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
 <F8970EB7-4D0F-43B1-AACD-B161F505C6EC@gmail.com>
 <8db12aca-e7c4-0c76-743d-1297eedb71a1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d62a1ffe-4329-f6a8-d334-42afe5b9daf8@amsat.org>
Date: Thu, 1 Apr 2021 09:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8db12aca-e7c4-0c76-743d-1297eedb71a1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Xiang Zheng <zhengxiang9@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 8:34 AM, Thomas Huth wrote:
> On 23/03/2021 05.04, Dongjiu Geng wrote:
>> ping...
>>
>> sorry for the noise.
>> On 3/11/2021 19:29，Dongjiu Geng<gengdongjiu1@gmail.com>
>> <mailto:gengdongjiu1@gmail.com> wrote：
>>
>>     In order to conveniently receive email, replace the Huawei
>>     email address with my personal one.
>>
>>     Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>>     ---
>>     MAINTAINERS | 2 +-
>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git a/MAINTAINERS b/MAINTAINERS
>>     index e04ae21..823b98b 100644
>>     --- a/MAINTAINERS
>>     +++ b/MAINTAINERS
>>     @@ -1711,7 +1711,7 @@ F: tests/qtest/acpi-utils.[hc]
>>     F: tests/data/acpi/
>>
>>     ACPI/HEST/GHES
>>     -R: Dongjiu Geng <gengdongjiu@huawei.com>
>>     +R: Dongjiu Geng <gengdongjiu1@gmail.com>

We prefer the mail to be sent/signed by the listed address,
and acked by the updated address. But we should have tell
you that earlier, when you still had access to your mail.

>>     R: Xiang Zheng <zhengxiang9@huawei.com>
>>     L: qemu-arm@nongnu.org
>>     S: Maintained
> 
> I'm currently assembling a pull-request that contains some other updates
> to MAINTAINERS, too. I'll add your patch there.

A pair of candidates:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg790977.html

