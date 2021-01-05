Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77732EA6A0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 09:36:29 +0100 (CET)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwhpL-0005m4-Ew
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 03:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwhnT-0004oR-Jm
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:34:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwhnR-00042H-Sq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:34:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a12so35275985wrv.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u4fDxKrq/oHZKvqIdl0+XxzEt2hwyKe2E+efAeqK5Yk=;
 b=aPjJi6UWdQf+q/fv8hLjIhPA5IuFOXytB/hJMW+Kg7Bb7Quk57izXxiCREE+YSjUFi
 VqpToVuQAEfRHSFvDOk6/0TZDQ8KIjGuRZnA4Wkxi3DV/hv+BvFAG0BZYyZskO+FdS/c
 qC066OqIKQu7VqIZWb/wNfAhDxiAv94OcbEsMvgsieW3Jt0D4+9w5GIVgxv8gK7J+YK2
 s+sgAYPQvbECyh1IuFGpsHLq/0/ogLNLbNTaE/yUr6b0yMItr5EYueyjoDVt+UxxDGPk
 0ju5yxolSfwYi3SNpljWPXBxD4KryITzBRJMcHPUHD0+57uJsu4OaotZD4uCWYQ0HNl5
 dPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u4fDxKrq/oHZKvqIdl0+XxzEt2hwyKe2E+efAeqK5Yk=;
 b=HKZM35gK2I7jq3G4ejpaCcllhiVBxSIlV6DavPxolJn//h0NbGt4boYNTKsz5MAK7i
 cmrrVPXtoUDHuekXgt+/WERtehP0x5i5IbAwC8SegrXIquNFaNiBAd2y93r8zNCFJLhR
 R7yp5xk7PDda2/sf8IhZM3Jae5gqu+o5qUjuLdpEZQ4Z3coMM7kab+4DD0uk7vh7YZ2r
 nUG0vruiKup5rH5Scar9djTkkHJyBx3CEoQqZFzD8+9FaTVaH+1tSo0TMEc+yJaXOhZE
 n2+9E4xmQ4oyDdiXaG7gGu8Lm6e588J0PMI/0oK4UZJcTYYhfYGXG0gQPnqb9hyJVbgM
 XpzA==
X-Gm-Message-State: AOAM532rkh4n/iwQLIW6ooR5iYYyzekPb9pvqCfsFrrms+0VApWfMgcx
 MR2ZXfWtqPC1lsW/kZZK+Ds=
X-Google-Smtp-Source: ABdhPJyEyUvOOCVOP+DgWSAAEu3inBgj3noS86AtAhBuMzjn74bawTtSy/UIyTw8eKRD/Yaz6jdHMQ==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr82717217wrw.73.1609835668516; 
 Tue, 05 Jan 2021 00:34:28 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s133sm3101523wmf.38.2021.01.05.00.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 00:34:27 -0800 (PST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
 <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
Date: Tue, 5 Jan 2021 09:34:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 12:30 AM, Richard Henderson wrote:
> On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
>> MIPS 64-bit ISA is introduced with MIPS3.
>>
>> Introduce the CPU_MIPS64 definition aliased to the MIPS3 ISA,
>> and the cpu_type_is_64bit() method to check if a CPU supports
>> this ISA (thus is 64-bit).
>>
>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/cpu.h       | 5 +++++
>>  target/mips/mips-defs.h | 4 +++-
>>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> I still don't understand this as an alias, as opposed to a separate bit.
> (ISA_MIPS3 | CPU_MIPS64R6) does not make sense, because R6 removes instructions.

I now understand your concern.

I based the decodetree logic on the R6 ISA manual, decoding the
bits from the more recent feature (a leaf) to the root, following
this tree:
https://images.anandtech.com/doci/8457/MIPS%20ISA%20Evolution.JPG
(2.3 Evolution of the Architecture).

Also "2.1 Historical Perspective":

  In the MIPS IIITM ISA, 64-bit integers and addresses were added
  to the instruction set. [...]
  The MIPS32 Release 6 ISA maintains backward-compatibility, with
  the exception of a few rarely used instructions, though the use
  of trap-and-emulate or trap-and-patch; all pre-Release 6 binaries
  can execute under binary translation. [...]
  The MIPS64 Architecture is based on the MIPS V ISA and is backward
  compatible with the MIPS32 Architecture.

> But if this is an intermediate step,

As this isn't planned as intermediate step, I'll try to keep
CPU_MIPS64 as a separate bit and post the result.

Thanks for reviewing!

Phil.

