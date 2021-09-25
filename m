Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC644182C2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:33:21 +0200 (CEST)
Received: from localhost ([::1]:42496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8jw-00011I-PX
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8hn-0007rw-1V
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:31:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8hl-0004bI-8w
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:31:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id i24so20414941wrc.9
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oC/yMCHSXJ7QOcS95auJcmhJ4Ucza8JY9wW+tUAtgyY=;
 b=JaUSxJmhUbU7JxzRKTEpKTOnUoNnyIbAp7frfJYjMoc/7DIOGl0mrreoFdt4pdG5xo
 z+P24KC0pYP93+3nixZvpp3qbKGzTaSdN6Emb9hC4RfiyR3fYi9VCFvZM2CUbn/02/n1
 j4ZkTh2ODoB4azkSTDPc+bE3p+pCCNVYNzpZQUy6e/cv7LTbzm+mqD1s4buIXwrUtjmc
 aBP4gNsOsM73vYs6zbYTllud0s2VAuNWSB5HxQRlstO8CXZNItFfDeDfy/6am3/vdC94
 rdfghcHI6m7jn6/0xMRtd8UH7YLxacOEm1fPOhR9iwx/0Rig0hwcj53Idjii3Ovobnjg
 RBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oC/yMCHSXJ7QOcS95auJcmhJ4Ucza8JY9wW+tUAtgyY=;
 b=6O5LWvwrJBXesNErRL6jYRgA+mZV0tBS3vqiNwPfdxhs9Z1YPTIi0e2l7k5QiOSzI8
 G00jfGhWYV5fvLSMrX6u+Fi/PsnSF8S1ovj49IlXHv/2Wh0xQi2b91+JBBzPFsRKD8/a
 +OlzaAGLr+j0wFH39oz2zIvRqNRtqvvQhLJR34s0Xk8ihkIoc5R6MmifNACmOaFqjRjg
 SoxyVbgzzubd1VyQcft8gAF07o0upK1iE+F8PWmX9z6OT2POH27cJRDEqCi96MmFMJOQ
 grJKDsnY9IPao1lqFLY2/lWLYuZx9br90nmqyh8BMyIeF0zjGzLpY8Zp7+2VB2yQnsFa
 KtSQ==
X-Gm-Message-State: AOAM5338ZL8CLLnIwht0k4R5rLPvi7mRAltuZqnvObovpRdBLwjhAMrn
 wbSpBqY9oHUvbq7Yo31xhG0=
X-Google-Smtp-Source: ABdhPJwuJHWI2eQpXAOlm1EvPj7jDuhstTcpozo5j/UzMUnMlyTyJHchHX+HhWGYu/lvBwqe02ZWHA==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr17865490wrv.92.1632580263835; 
 Sat, 25 Sep 2021 07:31:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c4sm11423747wrt.23.2021.09.25.07.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:31:03 -0700 (PDT)
Message-ID: <9c7adce3-6e51-10cb-9935-4857f822c332@amsat.org>
Date: Sat, 25 Sep 2021 16:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <i.qemu@xen0n.name>, Yunqiang Su <syq@debian.org>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
 <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
 <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 16:20, Richard Henderson wrote:
> On 9/24/21 11:51 PM, WANG Xuerui wrote:
>> Hi all,
>>
>> On 9/25/21 01:25, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/loongarch64/tcg-insn-defs.c.inc | 979 ++++++++++++++++++++++++++++
>>>   1 file changed, 979 insertions(+)
>>>   create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
>> This patch series is only lacking Reviewed-by tag for this commit now; 
>> may I ask whose review do I additionally need to get this across the 
>> finish line? Or is this series waiting for upstream merge of toolchain 
>> and kernel support too?
> 
> An ack is as good as a review in this case.
> I don't normally "review" machine-generated code.

We'd need to review Xuerui's
https://github.com/loongson-community/loongarch-opcodes/tree/develop/scripts/go/genqemutcgdefs
script to add a Reviewed-by here.

> While the toolchain is not upstream, the ABI seems solid enough.  So 
> there's no worries on that account.  The safe-syscall code has nothing 
> in it that's kernel api specific, so there's no block there either.
> 
> It looks like one more revision to address the valid nits in 
> tcg_out_movi are all that remains before I can merge this.  I'll work 
> around the conflict with my SIGSEGV patch set, and Cc you for testing 
> when it is time.

Xuerui said on the cover 1/ we can buy a board on Taobao and 2/ Loongson
might help the community with hardware.

I tried 1/, spend more than 2h to read a translated version of the EULA,
succeeded at the SMS verification, but then when I tried to log in to
search for boards my account got banned with no explanation. This
doesn't seem easy to use outside of China, so I guess we're back on 2/.

Cc'ing other QEMU Loongson contributors in case they might give us ideas
about how to add this arch into our CI.

Regards,

Phil.

