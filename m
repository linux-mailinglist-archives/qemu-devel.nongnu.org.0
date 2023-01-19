Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BAC674342
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:05:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIb8W-0005Rz-4m; Thu, 19 Jan 2023 15:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIb85-0005OM-8J
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:03:21 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIb81-000231-G2
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:03:20 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v13so4269703eda.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I6T9dE8zcSzT6NjfpdIy+5Pn0k6HXC65u6ITUAmV72s=;
 b=bS+oq3SSJQEPsEw6/QX8/ELs6icWAiglfX7L/jRmB1uqpwVdR/xgPNH6OIuoJbL0/h
 HzyuE34ean/37t1JKTCq3DfdNPCIx7EZ1xy4NNOeAZf0gUeokM1yo3tUcpI3KGNpTt80
 7ZnQ+e4qRhpJgEm3yAw7lkOBqnsUF6ifWHAj33Pw21usqz9tpHcLJqEIgelbrNbm0bBv
 yMmZA24TCham4kmSPaO3rVmrPkp0YaUTZcyIse/sfe7BTNAXThx7sL+vftKHVi3bB5cC
 Oafm8IxBlBo41kwtT80o2MxSXYJrSxOwyLVo9jmdX9R68XCC4QEC9yMaruIyezIypB46
 om+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I6T9dE8zcSzT6NjfpdIy+5Pn0k6HXC65u6ITUAmV72s=;
 b=cq8kmRO9eptGUl76ak7GjsQDPVdyKNefNrc/fF5rQGzicJfE7FluNCbKMmngNyLIh6
 toWAgpzf+NpB2Y7tUZTYMGSH9GEkJwG0Jb5de6BpBC/YTYtuyo8gQv1U2OPjZUap3bnx
 g0MvicWNeeWmQCX2AAxQEZC2oM6MnEOE+sy330S0L+UkwbTxDaoLxp77y8fb5q/a6wQ0
 /630fAWFaAhxbbIkfCAoe9qX5q+VDELGUuwGsuf27az9QRSLZZWuSrcM9j8AVJPnNV/0
 PqrP8DRnFBjEzh0XYif7L+veDCb9Od70nVH5UIRIhXSnHK/5uKVrHnFwM2ddy0CBWSKJ
 gTFw==
X-Gm-Message-State: AFqh2krEr/2Ketjn0IuCEgHQZnUBOa2bMjGUDC1BPXsU4q682UNvGomu
 XhFe/VCeXKT4jFLNhAunNGsheA==
X-Google-Smtp-Source: AMrXdXuAU47YqXolub+EQMlCy87UfpVP6k4vPawVb76vQGRztM4JQy2OCUm95eeBa4jy962OAfWT4Q==
X-Received: by 2002:aa7:c84d:0:b0:499:d374:e18b with SMTP id
 g13-20020aa7c84d000000b00499d374e18bmr11914996edt.35.1674158590028; 
 Thu, 19 Jan 2023 12:03:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bc25-20020a056402205900b0046b00a9eeb5sm16105736edb.49.2023.01.19.12.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:03:09 -0800 (PST)
Message-ID: <440155ee-4782-c7fa-6860-c39a983aecae@linaro.org>
Date: Thu, 19 Jan 2023 21:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-15-farosas@suse.de>
 <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/1/23 19:50, Richard Henderson wrote:
> On 1/19/23 03:54, Fabiano Rosas wrote:
>> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
>> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
>> default.mak anymore. So reflect the change in a Kconfig.
>>
>> Instead of using semihosting/Kconfig, use a target-specific file, so
>> that the change doesn't affect other architectures which might
>> implement semihosting in a way compatible with KVM.
>>
>> The selection from ARM_v7M needs to be removed to avoid a cycle during
>> parsing.
>>
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> The linux-user build does not use Kconfig. Is it worth it to add
>> support to it? There's just the semihosting config so far.
> 
> Probably not.

I hit this limitation last week trying to restrict libdecnumber to
powerpc targets.

Fabiano, do you see how this can be done easily?

