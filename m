Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBC516DE1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 12:06:10 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlSwT-0003p0-Em
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nlSsj-0002m3-JC
 for qemu-devel@nongnu.org; Mon, 02 May 2022 06:02:24 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nlSsW-0002AG-KD
 for qemu-devel@nongnu.org; Mon, 02 May 2022 06:02:06 -0400
Received: by mail-ej1-x631.google.com with SMTP id kq17so26829033ejb.4
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0ZnpPYry4YK2E5MakkNotdWCbt565UgL8bsn/7Hbbs=;
 b=GXBaTNDTBhZkqToz1kwtEJ6/FsKWpzoEy80iIhjREmy9hgb55tbwRJJx/ULUAIXtHk
 FaLdwkD6m0oP0QjHcf4DYxNXeQltWgOnDsWPssBpxpVim3AkDj/+UpsjDnpqc/lbaSlj
 WIjTkwIeS8DmlabqnEEQ6+0IUNS/WjbdOc8Be2SjqmUCF+AuS6KGFmjrGK28BMnEBgSk
 iB0a8Qn66KpREBCDwQJyDA1L7uEosHpy99TAHPUvOP4nflMZdvbCjTXQeua6+A1JlSMQ
 Fa736dbvqkCVTCZhnqMoB3FzjwexoLFboOmrO1iKxseuAssD4BvtzKgJLhXmGQBmUVRB
 D6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0ZnpPYry4YK2E5MakkNotdWCbt565UgL8bsn/7Hbbs=;
 b=OqCy8H5JtFqxfTdgnYrtLCFyVUaV8+lf2di6DE7gQ3dq379CBV9mla0k5Yns1Md5e9
 xJYBG60VKSQGxDroR35NkkcPdFyDPYanppRbMia0UK2SWkU7mB7XfAHH+FDffgmyIzsz
 c5vV/JqhWqfYQ1zvBBq60bIKmWJ9P84HDRuD8EZ8oh3qISkX+7veKuiVbqKVNJ37fp0W
 uGYu6H7///35y/FnBSfII1Fwt1wlr+RkvX8eJa7aO8Or5YzUnUnykmDqujlNuBMaMoci
 SqOeRLdOzb6gZqP5bfuAAJZ8vDCOOxOe2lGga57XdHz0NZz04z2B8wO67h8y13Siwj+q
 0BYA==
X-Gm-Message-State: AOAM533Miq02NAGUoA1H/j33IuyXYuTg1oWNt5/sBDuarjZjnz1SlL2v
 kdFa88g0IGMRy1jTXPIAh50=
X-Google-Smtp-Source: ABdhPJw4R8YEE15Wk02rxBictjKMQIzSK261eL4SvGzgxTpTyX8rrHDlVLNV9E6t82X0iZqkOlz3BA==
X-Received: by 2002:a17:907:94c5:b0:6f4:6de1:399c with SMTP id
 dn5-20020a17090794c500b006f46de1399cmr840399ejc.336.1651485722520; 
 Mon, 02 May 2022 03:02:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm3445620ejc.40.2022.05.02.03.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 03:02:01 -0700 (PDT)
Message-ID: <27efb3bd-226c-3542-5c2a-53e350f0fc81@redhat.com>
Date: Mon, 2 May 2022 12:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 10/12] pc-bios/optionrom: compile with
 -Wno-array-bounds
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-11-pbonzini@redhat.com>
 <baa3f5ce-5c58-2918-e188-a0f35a6e4e52@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <baa3f5ce-5c58-2918-e188-a0f35a6e4e52@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 09:37, Michael Tokarev wrote:
>>
>> pvh_main.c: In function ‘pvh_load_kernel’:
>> pvh_main.c:101:42: warning: array subscript 0 is outside array bounds 
>> of ‘uint16_t[0]’ {aka ‘short unsigned int[]’} [-Warray-bounds]
>>    101 |         uint32_t ebda_paddr = ((uint32_t)*((uint16_t 
>> *)EBDA_BASE_ADDR)) << 4;
>>        |                                          
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> To me it looks like we should try to fix this particular expression
> to make it more "compiler-friendly" than to disable warning for the
> whole thing.

I think this is really a compiler bug, or alternatively this case should 
be extracted to its own -W flag.

> Which compiler (version) does this?

The GCC 12.0.1 prerelease.

Paolo

