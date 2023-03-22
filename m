Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7A6C4538
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peu1B-0004OR-PF; Wed, 22 Mar 2023 04:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peu1A-0004Nr-4N
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:40:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peu18-0000JI-F6
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:40:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so114947wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679474420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJpOMy7cGUoRqnNcaYB9ndKAII62Ihc5rjczSWHF36I=;
 b=pcxM4lWVIt0PyH/IMRP8aFEDwfFlHmSLICciNjHlXvXp+QRFMXwwc+Jhr6egaX7tM2
 I+uKB07/djOWoI7S1ZhkMLrH+DXaKRuuWCqhDfqSx04Ihke/FonyQmPEB24u6pBOg70D
 uMWuVc8NnwrusdWLWPzzJrKiPIf12vggO1HMIQFId18S7aTpne6vHQML41gtMuzpemFv
 9oGyxEOEL+gbYP6OH5Nj9CVkusX497rLL2uhki1ar49rBdXLr4J9XLLIOB0o0maWaEdc
 5EIURQE57wwGm9MFuKnYYYwWpIHQgbwSkwdJQeEq0QU4GoRSJasl+v/vhsyduJF+i+GR
 EtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679474420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJpOMy7cGUoRqnNcaYB9ndKAII62Ihc5rjczSWHF36I=;
 b=Q1bS6xLv4AP42vUUPfVlYk8WlE57W3daF+bOz0EOe2d29rVbD9S43I8cnYrYRvsZCQ
 F/rUwfO4yegDMML/RCI2jjnJTZRN3UqLBNCb1H3QoYoi/KTUiM3y3kHUjKdV0ko9WWs6
 fAfK/W7cfh+MUHjMArO+jBfNYOFzxMFTOOodxlnjBnnTHTMup3fYePBX8LnRQ3vgihLW
 Y42fVswfB1c1c8wpF6dCxr/BXlTH1Qse717sEIycio54CWRtuiOV98j4UTBofETBvJ0l
 nMw0+ju3B98nZiTLPQTzY6IPRwkVxuAs4uC0dhdZGMpyIT29vJndAjzJ/ymA85YB+TzK
 9m2w==
X-Gm-Message-State: AO0yUKVmQY8w8atYj+2muDMYOpGCydtUR41DXCkv6Ny4yKxvJeE7N0T+
 NhTqmWxibp3+vbNOJ7f5jHEEEw==
X-Google-Smtp-Source: AK7set9b+z+wzC2MtY2NqDJi8S8s7nQK/ZagyonEqpjPjZQvP/HCP5TM9HACwsvd+J3ps52SlalU4A==
X-Received: by 2002:a7b:c409:0:b0:3ed:b56c:9496 with SMTP id
 k9-20020a7bc409000000b003edb56c9496mr4628057wmi.31.1679474420607; 
 Wed, 22 Mar 2023 01:40:20 -0700 (PDT)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c00c200b003edd1c44b57sm10842375wmm.27.2023.03.22.01.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 01:40:20 -0700 (PDT)
Message-ID: <f08778c0-321a-2cb8-ad62-c07c87114ebe@linaro.org>
Date: Wed, 22 Mar 2023 09:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] tests/avocado: probe for multi-process support before
 running test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230321111752.2681128-1-alex.bennee@linaro.org>
 <e072cbd3-f497-b384-ab46-16c88c70a12a@linaro.org> <871qli6k7d.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qli6k7d.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 21/3/23 19:19, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>> On 21/3/23 12:17, Alex Bennée wrote:
>>> A recent attempt to let avocado run more tests on the CentOS stream
>>> build failed because there was no gating on the multiprocess feature.
>>> Like missing accelerators avocado should gracefully skip when the
>>> feature is not enabled.
>>> In this case we use the existence of the proxy device as a proxy for
>>> multi-process support.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Cc: Jagannathan Raman <jag.raman@oracle.com>
>>> Cc: John G Johnson <john.g.johnson@oracle.com>
>>> ---
>>>    tests/avocado/avocado_qemu/__init__.py | 10 ++++++++++
>>>    tests/avocado/multiprocess.py          |  1 +
>>>    2 files changed, 11 insertions(+)

>>> +        """
>>> +        Test for the presence of the x-pci-proxy-dev which is required
>>> +        to support multiprocess.
>>> +        """
>>> +        devhelp = run_cmd([self.qemu_bin,
>>> +                           '-M', 'none', '-device', 'help'])[0];
>>> +        if devhelp.find('x-pci-proxy-dev') < 0:
>>> +            self.cancel('no support for multiprocess device emulation')
>>
>> FYI a more generic alternative to this method:
>> https://lore.kernel.org/qemu-devel/20200129212345.20547-14-philmd@redhat.com/
>>
>> But yours just works :)
> 
> For now I want to keep it simple. We should replace it with yours once
> we get a chance. Are you happy for a r-b?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


