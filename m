Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5261A584713
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 22:35:48 +0200 (CEST)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHAEU-0000pF-R5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 16:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHAAx-0007LW-Jk; Thu, 28 Jul 2022 16:32:07 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHAAw-0004H0-1d; Thu, 28 Jul 2022 16:32:07 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10e45b51f77so3716074fac.7; 
 Thu, 28 Jul 2022 13:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g85C+4aZW1jP0xjdxzWGasnh4qYONvseasJKr8V+Iuk=;
 b=lbWEkITlnafJMhl9PoxBqgcKxWpl+ufWHjsdx8oPXz25/eMvKzSUrd07C3X4Ye/L0v
 EAsTBtm/BHimyW2S/4Z+jX4XmI6KdSr/XmYHVMiY79BhLyHpQXhrq8rLpDO95QPEQK2n
 bbi4LAkX3oYZ/0d4+rZLgszzKurUv48+mRHK1epg7eydj10H0tRNTPlD4jb15CMwuSa0
 CJHthVim3Br1pgva/WhMZc87uMNqEdH+MCa8TrClSVHbyAUWuYZk63DT2dVK2FUU2UAh
 nBZq/a4M5VCiFwNCQyqIztB9Hf72dqHUF1ISVu7UO5jKKf4EZo9+QMnBgK3IsqpRf0GP
 GZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g85C+4aZW1jP0xjdxzWGasnh4qYONvseasJKr8V+Iuk=;
 b=ywVqRXCe4nQD2PRw4jTXwRdjX/NHuBH7wb3vbF/FLzYnM+rx8GBv0nl4nvJvDLL+ND
 0TttAYm5WLqXK7AAhzJ15Bov+UIAoLpmZ1TqsmwcNVI0b1n34rQWeoMeIJ6fhyRHWQGM
 073RihZwpBXcnshfGb3weeABe1Y94q67HjrLEPthVVmfKSRzho63tQgc3M1CPx/x7Csm
 NoR1T4IuvMRfKjHPI8hLQqAV9mOrxKr09wLdC10FQEKLVnGunNtHVk4XcbbQ+Rg3e2f3
 K18M9O9eqnrKlEJsM9jM4bFWqxOqS+nIGzXP3y5VqX1i6rxLrJXL9tkE4Qf1eKF2jbkk
 s48w==
X-Gm-Message-State: AJIora95XVuIpA0TuQqfvpG3Ig7BGz1AKVlVazIgR2rDDSOQa4H2RpDU
 4QKWLjFHM8mB3kM6LiQ2e2Y=
X-Google-Smtp-Source: AGRyM1vUQEdPQId1d8dHmVcLDQLWl8KYMrXpwzotxoBQdQbGZPNmt/V/kO432GuFpuoLBxckSMYTqQ==
X-Received: by 2002:a05:6870:339a:b0:f2:d065:be1f with SMTP id
 w26-20020a056870339a00b000f2d065be1fmr196826oae.69.1659040324435; 
 Thu, 28 Jul 2022 13:32:04 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a9d641a000000b0061c530ec022sm672434otl.79.2022.07.28.13.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 13:32:04 -0700 (PDT)
Message-ID: <03379d76-a85b-3d1b-c334-ddb02823c418@gmail.com>
Date: Thu, 28 Jul 2022 17:32:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 0/3] ppc queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220728165519.2101401-1-danielhb413@gmail.com>
 <8a7f394c-55ac-09cb-91b0-41f5d4c12fff@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8a7f394c-55ac-09cb-91b0-41f5d4c12fff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/28/22 17:18, Richard Henderson wrote:
> On 7/28/22 09:55, Daniel Henrique Barboza wrote:
>>    https://gitlab.com/danielhb/qemu.git  pull-ppc-20220728
> 
> fatal: couldn't find remote ref pull-ppc-20220728
> 
> 
> Did you forget to push the tag to gitlab?

I guess I mistyped the credentials when running make-pullreq.sh and the
tag wasn't pushed. Can you try again? It is pushed now:

https://gitlab.com/danielhb/qemu/-/commits/pull-ppc-20220728


Thanks,


Daniel

> 
> 
> r~

