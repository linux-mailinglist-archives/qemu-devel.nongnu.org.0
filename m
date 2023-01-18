Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD467198B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:46:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5x3-0000WN-Hl; Wed, 18 Jan 2023 05:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5wi-0000Vu-8H
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:45:32 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5wg-0001b9-Hv
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:45:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id b5so12312739wrn.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=POBLeK6wEBeyqlHV8bgMgnWeDtKCT80g2KWdwHFt+N4=;
 b=eBHh1gU9890a0Cjs1jBmE58zoc/8pgoRzETRQ2kwcC/e+CQkN8jNP3Eo45hsHPXfQu
 fkaoh+LR2Bb07pDtH3lMsdI3tualo557O+NyIijMGwVmIikmxjra0NkxfM8bFFSMMB64
 yldNagt4h2dEw2AjFYo9eWlS3hQ1iOSFBx04oMVZN0px1BzuTQSy/LXnYKMZ/e/9WPEj
 K5Rm47VJEgPNxzB9Lq6bO0ArRcrnaDAP08rcY3PWqqRwKv0x1DR/+mDWYbeE1EJXWD9R
 h8JjCPdg1u1tgz9mjnVGNOn3V+HKh93W4tNkPsrZ5BOz/S32eRQAWrF/GWJQsbIZnNdF
 xF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=POBLeK6wEBeyqlHV8bgMgnWeDtKCT80g2KWdwHFt+N4=;
 b=vIy0V6St9dudbNUZGzA9J0MXjO8sZeZ7xSXOAFbmKXRqiZIIjBADTCT9w3lXeY9LkW
 EX+PzYaddVHJhZtIlw6feRh1eq31UQYxPs2ZeADqwYwuc6Iiy4+bj+jsM+Yt4PBy1SR3
 979f8SI8AdLClrCwcaLvspkM+hS1rHauxew3+OzAbNPcsQAKY7a7XI3F7akXTajaA4X9
 y19sdF7laM8jncMBQS1xkTgKomCfVenRspStXVkGJ140eyOCOJDKqWJiPSJrxjsgYIkD
 /7v4ZyLf1rWor0K++aZvAqHeAakUnZJINNLGa5uSy7XH/P58ruyGjxZ9Njm/dgDKpkYD
 9UlA==
X-Gm-Message-State: AFqh2kqrvZQtcV+XJQADZ89nSPAnPMOKQ20oYJadDez3k1Xya5ZSai5u
 HtW5ew70+Z1VMHxkqlvMgvcspg==
X-Google-Smtp-Source: AMrXdXvb7kGmsBhwQYlBpEUi/YaiU0sZP3RlGi7e9bGC9mrhnmUQMDdPSHWj9CGvHNgjl/HQidjpeQ==
X-Received: by 2002:adf:a318:0:b0:2bd:dc0c:ffd1 with SMTP id
 c24-20020adfa318000000b002bddc0cffd1mr5978546wrb.13.1674038728583; 
 Wed, 18 Jan 2023 02:45:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h3-20020adfe983000000b002bdf5832843sm10162239wrm.66.2023.01.18.02.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:45:28 -0800 (PST)
Message-ID: <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
Date: Wed, 18 Jan 2023 11:45:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org> <87bkmx0yux.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87bkmx0yux.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 17/1/23 20:01, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 13/1/23 15:04, Fabiano Rosas wrote:
>>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>>> code that is needed for cpus that also work with KVM into cpu.c.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>    target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>>    target/arm/cpu_tcg.c | 77 --------------------------------------------
>>>    2 files changed, 76 insertions(+), 77 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> [...]
>>
>> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.
> 
> Hm.. QEMU doesn't start without it. There might be some implicit
> dependency. I'll check.

Likely some M-profile code (note this type is a QOM *interface*).

I checked the uses (git-grep -W IDAU_INTERFACE) and none should be
reachable in a non-TCG build.

