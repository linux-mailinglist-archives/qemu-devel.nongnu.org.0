Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC30414CE3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:21:18 +0200 (CEST)
Received: from localhost ([::1]:36562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT43h-00064o-41
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT401-0001xK-EL
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:17:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3zz-0007DJ-Ck
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:17:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id t20so2286889pju.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YUCX3lrtEYbQ8hAW5me1g0btrbDcfAs1i2hokJpmpRY=;
 b=HEwxjZrdlp1V5z+oM26ZUDfaukI4V/u9RWUn4GbYOALS+sYIqDHrb93vt4AfXiN0vg
 DwquOFUBn908o8W/hy01DlwVNy2HGd3gaFt6lfg7I0tR5CjeKVyNcViLGccUI6EHWXbB
 mgsWkYxaTPeTlKRL6ivAO48cY6Ru7mu56OflZuQOduvGXX/W9obS4mWfBykDsNm90FN9
 7VRDarqm/XwiHp6VZdndZpQFcbec+EUHyQTIovekdiEzkIlAHZQfFgQalVS68+VrRBIF
 i8/NoIzQUG4QibSovxiikQv0J2Xla384w0f0fvvOfjq0W5SKQi1iCDpp7Wr0J+Ap7JI5
 UuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YUCX3lrtEYbQ8hAW5me1g0btrbDcfAs1i2hokJpmpRY=;
 b=LuiDgA9Mf61cr4xkDlcpzsPRGZ3phCfozvCHu9FW26nkhSnm5gOSLHN+GfdTsFk70a
 lijchPiA7w/l9WSfiZiH2xdip/ceuDMseckrtKv0VAit/pBRL4MFG7pyGGf0Sn90Nef0
 gaxpzHRyU/jklgTHbB02wmc09Nsug5oay7bL/tSUKP9K4ArtiIGs8XC9G7EGsR2asWT5
 /3wP96aQxQt57NuZ2+aYHYm6Db7nZH7fwuGOVIX3BeQRPKnzCo/fEiKvyJTnCnjTb47O
 7tXUKt8CK9o7Je46ADFjoV1S6Z98D4XCZB1NbGpzBVMao4NjNwaqxEuVEgTcO8W4AkpW
 R35w==
X-Gm-Message-State: AOAM532xAVp74a6d/2KduUyw12fgGIrfF75M8/XBn9EDUFkI3I1WMg5O
 +Et7vCvfeDrypzcPbfpFoDCZXlJ8EFoJmw==
X-Google-Smtp-Source: ABdhPJzqAsWaTd1umUG3ijouyYyTqnlq7mS5Ab4OK1/8apTE6NwGKcSFEIygxL0x0kbXUIa/S+EfnQ==
X-Received: by 2002:a17:90a:4983:: with SMTP id d3mr546pjh.53.1632323845822;
 Wed, 22 Sep 2021 08:17:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n205sm2906781pfd.38.2021.09.22.08.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:17:25 -0700 (PDT)
Subject: Re: [PATCH v2 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-10-git@xen0n.name>
 <0717a7de-7c41-990d-ec7a-51b44f49724e@linaro.org>
 <75621c34-5cf8-3ae9-86cf-ce3cf53b4669@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0a802cf-a916-f7ff-6894-87930f07a667@linaro.org>
Date: Wed, 22 Sep 2021 08:17:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <75621c34-5cf8-3ae9-86cf-ce3cf53b4669@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 8:16 AM, WANG Xuerui wrote:
> Hi Richard,
> 
> On 9/22/21 12:25, Richard Henderson wrote:
>> On 9/21/21 1:18 PM, WANG Xuerui wrote:
>>> +    /* Test for PC-relative values that can be loaded faster.  */
>>> +    intptr_t pc_offset = val - (uintptr_t)s->code_ptr;
>>
>> This isn't quite right for split r^x code buffer.
>> You should have seen this with --enable-debug-tcg...
>>
>> You need pc_offset = tcg_pcrel_diff(s, (void *)val).
> Indeed; I just realized TCG debugging isn't fully enabled with --enable-debug only.

Um... it should be.

