Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4B2EC2D8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:57:54 +0100 (CET)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxD4D-0008JK-3y
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxD2J-0007Qi-Ot
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:55:55 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxD2I-0005jx-DF
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:55:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t30so3243512wrb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j7Hm7dV+k0yTsk8QCAftNXZ6fPPCozd8njuJWtLMIsU=;
 b=LojxKohkKvXrIHoU95ki+Zc/Aae/TCf9H2FN6g23TzvokS86NkRCJw7QGlmJ+Cdtko
 mHNlIgkDqzzcsdUpKbklhQL4Jwpsl+uNX3E8zVGFIT8oIg/wZoZD7D88VFrLZIT5sbkY
 aN+p4s4CEcm3c/cANOQl8H6Y+6wmVXriPFHjffPcaReqeGf9DdUM58cgnEQQyCwlEfRG
 aakrQhxP5OxnOqJwN3dPlzluzqvPjNcxC4TOaAfBnetxTTX76K1wGHvGvgCepUhUSU9+
 dsdxsTOJYApFRsu+wFPB3KgY4t+7AlkoSsR1/dsI9cviROxPwKte7eASqfrwPcGfBpHV
 a4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j7Hm7dV+k0yTsk8QCAftNXZ6fPPCozd8njuJWtLMIsU=;
 b=XZaLaXEHzkq1UUKAwd4M+TWBZ4yVNDR2pl6O3/tSmlbJ40p0N/mspJZDp90xyhFUPH
 yBo0gTphNwRUjOBEko9DMwgAemOMGI/xufXsJioOaFSjZ8Cmk7jA/+UJDgUYuLAtiyD4
 lIk1NiiKlkcjxNYbVa7To+DqCfmBEQhdEbITOWb8TNlYWwAX01RlVjN/Zq4Gb+8tL2mY
 xhXx0IEZ4/Jel/YAgvttb88/NE4BP2FJemq3uwejJKvkPaP18ywNDcuC+AQZMkfJhdSq
 g95gV3DUZrJ7oziHv1RSOz/ts1zpltE/IB0vhLyEuIqhu8AnpCwhj1nzNozGn6gmj4Hd
 vLOQ==
X-Gm-Message-State: AOAM530aJISGVgWXwFj0ITqF5RVrWMkHgpzCLKD6SQbv82xzX4V1GAUn
 dOgt1iZ/NrA2DNXuY1XKffA=
X-Google-Smtp-Source: ABdhPJwjkpkumAjhsxWSievMnYPeODFBviziMbM/+ZnVU7uvFcLFqEYw7SdQHsVM7rhlwgWYQhbs2Q==
X-Received: by 2002:a5d:4bc2:: with SMTP id l2mr5458312wrt.204.1609955753061; 
 Wed, 06 Jan 2021 09:55:53 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j13sm3772885wmi.36.2021.01.06.09.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 09:55:52 -0800 (PST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
 <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
 <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
 <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
 <c82fd319-4cac-f2f8-729b-5edf8b5fd624@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b80353a-f9bb-65b6-5bd5-b030be9a11f0@amsat.org>
Date: Wed, 6 Jan 2021 18:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c82fd319-4cac-f2f8-729b-5edf8b5fd624@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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

On 1/5/21 5:01 PM, Richard Henderson wrote:
> On 1/5/21 12:05 AM, Philippe Mathieu-Daudé wrote:
>> I'm not sure it is worth the effort, as I plan to check each ISA /
>> ASE bit from the CP0_ConfigX bits (similarly target/arm/ does), so
>> these definitions should disappear eventually.
> 
> Excellent.
> 
>> Might I keep your R-b tag for this patch (eventually improving the
>> commit description with some of the info added in this mail) and
>> keep going?
> 
> Yes.

Thanks :)

