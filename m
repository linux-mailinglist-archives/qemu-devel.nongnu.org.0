Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CE6736DA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIT6T-0004pV-Pu; Thu, 19 Jan 2023 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIT6R-0004mI-Oj
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:29:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIT6Q-0003xR-6L
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:29:07 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so1021871wms.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ez4V2wkTV7JY8P+M6YUZUFp+ehLMYlyt+CzS2y+tQmo=;
 b=qLICt7KXXu+PN74JgF0PtbZotO5wiIMAhunoknc+wZrZTrm6YDQN+hsJSbU1zH2RTv
 dSzycMA9/E25jL7asAIN9NkoJOrmdLL0whDjZ09zkwvsosCEa8ybdyj2K2HOPCIJ0cp8
 Lg+EQyM8ipC7IQlE2e5rORB6Uym6ALhAd8IMIZVBYxSTQ6pl1VqqFQtnLKev9aQpeXas
 AUJ+zCgOI00jn4TC4nwKtuU2btyozVByaadVeSS9yzSvMcJuN92D/QiWGSwHMKEvNzqm
 H0hfI1iCkV5G/zI04ctzOH7vtRYqU0CzSx8mSxWIfk6ULRJZT0943i3kt2IjlEENoooy
 o4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ez4V2wkTV7JY8P+M6YUZUFp+ehLMYlyt+CzS2y+tQmo=;
 b=c0fr3vCzhr6bkU2kqnWgg8gFgjZvxtknQz8OKujnNoodn4YEeelE4fyy6J+EyIVuwa
 WMYc3r31qXn8ZIKVcbHJySf7Pjhuu9aMrIkIKow6bi9bk++AsvHKdc5nrx2b8X1zMxHI
 KZ2fy+UxI6d2OoUyloTT8ofnnbjE0lwP/z3WhYDRe9yr9yaxjfBa1Fovq6rDTy/pqme3
 uBobR40bMhKmBFBhvzU01cvBPrU+2NJSWfGRNwYJYu69Kb9ZAxmcdK8djxIiTWBr7l6m
 Rd9Jvhk7AIwX9hr2aOgVFmKHthhqcFLprcHHLtmXmCvZ3ruMDsg00Ex6THnhSb5CvKVc
 0UOg==
X-Gm-Message-State: AFqh2kpPAEo1nuXF1nqKrhRJRz+61Mb4EBVQpFQCT+HPgpBGkt1XPIce
 aiIU/tvz8nFH+RquNwjo5PCBOA==
X-Google-Smtp-Source: AMrXdXtEGLEvRP7opMtb5SV7HtOPZ2LAWBMo9ahW99zNL1kaLWAS3nGAwf0XLrtKNYksIDRA1aSVFw==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id
 fk8-20020a05600c0cc800b003cf497cc59emr6114015wmb.6.1674127743095; 
 Thu, 19 Jan 2023 03:29:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1ced0b000000b003dafb0c8dfbsm5603363wmh.14.2023.01.19.03.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:29:02 -0800 (PST)
Message-ID: <1f638911-efa1-6cee-081b-69b75959dc30@linaro.org>
Date: Thu, 19 Jan 2023 12:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
 <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
 <Y8kmlVU5NKaR7i4D@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8kmlVU5NKaR7i4D@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 12:16, Daniel P. Berrangé wrote:
> On Thu, Jan 19, 2023 at 12:01:18PM +0100, Philippe Mathieu-Daudé wrote:
>> On 5/12/22 08:51, Marc-André Lureau wrote:
>>> On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> The vnc-display-test is failing on Darwin:
>>>>
>>>> tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
>>>> Unsupported auth type 17973672
>>>
>>> It is supposed to pass. Can you share more details? It doesn't look
>>> like an endianness issue, at first sight..

>> ** (tests/qtest/vnc-display-test:8465): ERROR **: 11:59:18.613: vnc-error:
>> Unsupported auth type 5489072
>> Trace/BPT trap: 5
>>
>> Does that help? What else can I do to gather more info?
> 
> Modify vnc-display-test.c to call  vnc_util_set_debug(TRUE);
> before vnc_connection_new(), to get the gtk-vnc debug logs
> to stderr too.

I just realized this is what setting GTK_VNC_DEBUG in env does.

