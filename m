Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14011616E00
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 20:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqJkD-0005K7-Uq; Wed, 02 Nov 2022 15:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqJk5-0005Hu-TO; Wed, 02 Nov 2022 15:49:42 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqJk4-0004bN-5F; Wed, 02 Nov 2022 15:49:41 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 s1-20020a4a81c1000000b0047d5e28cdc0so2624171oog.12; 
 Wed, 02 Nov 2022 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHBmb1csdRBUPwBHhL7rZVhORJjo93BnWkN3FEdlhoA=;
 b=YAYGC77p7NjpMUvHS7GHfhl1yN70h0uNtXcw5L22wT8GFOsJ6y0XtsRifx9PoweJLb
 qpUVffl8xoKJMJl+WQip1HZ0SRZMyS8wXrElIiKOS3/NwF+yTxFSMvwpFlXrCO6VEyL0
 GqCzKUEz0Ao4u4Ktwzcmyop0bU2f8MHVtJAHQQ1hvQ+6/ABQD39S88Sw0sSQCVbg9lw9
 wAY/YaPViM0hYwBCtj8a2S5gNFvEV5OiecxMRxSoRavx8yYSOE5uEM51Aia7Rcl0aDB4
 DOxgu7lkGKir2l+fc4YLxSeRMPL/0vYB2JdZzm0nMDTUjEikgp2LMRi+aOB8YxVnxd/5
 yZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHBmb1csdRBUPwBHhL7rZVhORJjo93BnWkN3FEdlhoA=;
 b=6o3L8/hAdcPQ3/AZW11S5BFB2UTqdpueNkxxN/0az7dNYqB7NcbsDG5DcMS+Ql/qEq
 TVAxMwKvD1IfZRxOK3k+A+oS8loYbds6iswcHlmBxLu2TdoDkF6QlVo7rXrWII4qYUXK
 jq5/pE1S94Feq/mBHjgD2O7QkaM2z9asT8vXZHIVsQeZNz7UCaKPnkoqvYFWz15P+tmc
 gKASH6KgWHo7uc08AXu5IKO2fsDLCH6/WrNqwBI/yE6PYBiPZu2n6Vf+CKQdRLNU8RRM
 LGtRX3d/dFcuIFydemEJFmCmKWYr8H++cbYrF8GK134zcXI8PrIjXGAKAoqa0K45Ii9X
 jXSA==
X-Gm-Message-State: ACrzQf3M9lv93/iW8HS/pbKk9nCrGvwcLOVoKOvXvTizMSXEw+SkYhag
 RCyfKk9YVXFIODPb+jrtSWc=
X-Google-Smtp-Source: AMsMyM6edLzu0oa5cMejSuJJwph3cNgoqElJvO5imp1RKNCs4Lv26rC7CW+Won0vbY1LlRphIF/pzw==
X-Received: by 2002:a4a:1787:0:b0:44d:f068:d0e2 with SMTP id
 129-20020a4a1787000000b0044df068d0e2mr11390145ooe.27.1667418578218; 
 Wed, 02 Nov 2022 12:49:38 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.35.250])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a056871079300b0013b911d5960sm6357931oap.49.2022.11.02.12.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 12:49:37 -0700 (PDT)
Message-ID: <3f097e35-ac7f-0889-4a28-33544e011995@gmail.com>
Date: Wed, 2 Nov 2022 16:49:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PULL 59/62] hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221028163951.810456-1-danielhb413@gmail.com>
 <20221028163951.810456-60-danielhb413@gmail.com>
 <CAJSP0QWiE2gmUB4Fcb_TdS1SzXiS3fFvjoCXjqYbvts0Nvb+HA@mail.gmail.com>
 <78b914c5-ce7e-1d4a-0a67-450f286eb869@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <78b914c5-ce7e-1d4a-0a67-450f286eb869@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 11/1/22 19:49, Philippe Mathieu-Daudé wrote:
> On 1/11/22 23:23, Stefan Hajnoczi wrote:
>> There is a report that this commit breaks an existing OVMF setup:
>> https://gitlab.com/qemu-project/qemu/-/issues/1290#note_1156507334
>>
>> I'm not familiar with pflash. Please find a way to avoid a regression
>> in QEMU 7.2 here.
> 
> Long-standing problem with pflash and underlying images... i.e:
> https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@redhat.com/
> 
> Let's revert for 7.2. Daniel, I can prepare a patch explaining.

I appreciate if you can send a revert with the proper explanation. I can make
a PR with it.


Daniel

