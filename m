Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B860FA39
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:13:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3cf-0004eJ-N0; Thu, 27 Oct 2022 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo3cc-0004GK-HU
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:12:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo3ca-0006yQ-UT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:12:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id h9so2439910wrt.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YMJSx2gTMmSw9MFzQl4aHBDfdpESEmuzC0XZal9Md6s=;
 b=hf5RXSKxCg8bR9bZOZrKx4QMNOqPHrEqswHGS3Ie+v312SgCofaNVVwQFKZT3HPCmt
 /4ow4VkV6p70GdxFpRPTNfxucGWfqm7PGnb6mxMAGo9gtrWRmdBGg156wdt1hcF4HrVk
 SbNvG6huSVd4zjxiS33d7GkOH0CeYy2yXWvgWNWrfugWs30dP61VHM7p+DBMXwepE513
 M1FSkC2mBE/63e2O8EvuqioNBXzncxdZAiW92vYS9AnqCMm1hOl8rCGaAkAlI/JzyrC6
 blTjMGHjKwVR8oQGDmsLk4jI3nruy+4pyEgW+h+IM/2oWWUr27dXQ2gDPiOm5TURLzsT
 dlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YMJSx2gTMmSw9MFzQl4aHBDfdpESEmuzC0XZal9Md6s=;
 b=bjs0VejJX/GJq7GkJH3JMtsVgAIaPxH56esdZEYZNcDvTDFCfhMtdM778AqvbytU6l
 RB98wBFM3va7A+jLTplB9fQr68is6Ckbu6yxuP+y4JKZxCHWdzs75MXBx76bIXc1Rc3z
 tAxAOtpxLtSxcIH6F+oqYqDDVm8WXg3IuucTdm0t9bXmdxmbW13IUDPCNiWTB+AUiB0U
 fYauCiKLD3MgKl21x8poAnq7xzk53xZys4lOj/SkDYmkXabKtvyq7lE5c6en8L5i8deS
 0i/mrEwZAqcLXXCeopkoDl6py+W7EhCchcgCT7nWVMbnCXP21aCrevLkApUqKSw+3XBi
 PSSQ==
X-Gm-Message-State: ACrzQf3wgnLUytKOp+4nVRKL276AIAJmKyTd1ENrbgAmV2JF9z11skEQ
 bFM8YmNv/Iktjc4u8ilzg4RMgw==
X-Google-Smtp-Source: AMsMyM7EPBdAbE1vKkbt4NzFihvlBSIsMBKifmoxopRoxNvnWEpRvcMJC0pCLEnFNBWHi2tTy0Tnqw==
X-Received: by 2002:a05:6000:23a:b0:236:71d7:5f90 with SMTP id
 l26-20020a056000023a00b0023671d75f90mr13561563wrz.322.1666879954524; 
 Thu, 27 Oct 2022 07:12:34 -0700 (PDT)
Received: from [192.168.45.175] (101.red-95-127-41.staticip.rima-tde.net.
 [95.127.41.101]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c2f8f00b003c64c186206sm1666042wmn.16.2022.10.27.07.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 07:12:32 -0700 (PDT)
Message-ID: <9b3824be-1da3-e5bb-d324-d1f2a417b6e8@linaro.org>
Date: Thu, 27 Oct 2022 16:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>
References: <20221025235006.7215-1-philmd@linaro.org>
 <8d197b71-937a-5693-3b7f-ea4bded8c360@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8d197b71-937a-5693-3b7f-ea4bded8c360@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/22 08:46, Thomas Huth wrote:
> On 26/10/2022 01.50, Philippe Mathieu-Daudé wrote:
>> We use the .h.inc extension to include C headers. To be consistent
>> with the rest of the codebase, rename the C headers using the .def
>> extension.
>>
>> IDE/tools using our .editorconfig / .gitattributes will leverage
>> this consistency.
> 
> Ack for this series, but I've got a meta-question: Does anybody remember 
> why we are using .h.inc and not .inc.h for such headers? .h.inc has to 
> be manually configured in most editors for supporting syntax 
> highlighting here - with .inc.h most editors would get it right by 
> default instead...

Daniel synthesized the reason here:
https://lore.kernel.org/qemu-devel/20200817165207.GN4775@redhat.com/

 >> IIRC, we need to use  c.inc, because Meson has specific semantics
 >> around a file ending in ".c" that we don't want.

First explanation from Paolo:

https://lore.kernel.org/qemu-devel/36032642-9bea-8625-65a6-bd4afc7e459d@redhat.com/

See also for generic .*.inc admitted as convention:
https://lore.kernel.org/qemu-devel/CAFEAcA-kOs3dKhh3SRchg6Ne8QL8kwyz+2ihDC6ND2v-seuRfw@mail.gmail.com/

Could be worth mentioning in docs/devel/build-system.rst...

Regards,

Phil.

