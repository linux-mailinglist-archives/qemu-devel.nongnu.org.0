Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D264415D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2VMW-0007Jv-FG; Tue, 06 Dec 2022 05:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VMU-0007JK-Ce
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:39:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VMS-0004ZZ-Pr
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:39:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id u12so21876502wrr.11
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FKoUNbUOLP4SURZcvebDc6kX7f2P/quOXthh5nGVePs=;
 b=lwSefpV9pyT5+p30tj8S27A+WWIn8p7KZ7T3Lw4/Cbe1+Bh4jo377GT0AVzh1Up7/1
 xB9l76v6zvxaWl8ELJQsklgusIezfRbsf5KKDyZ55vD9ETpIXRyPMf3cAZQU59o9ge32
 HNPUmjt1yz9vjm91dy72J5IBxJi4y8xn3z/a2KK2dm6wTulIitVmpzvTAL0Nlrj1zb2L
 MshKEmh2eiftiYutD8/q+WRqJMXadC20gwylL5om/jx/ii/XVhUE6NcrvB1RDpFGiLOW
 Qjhsm3/z44TyUONDd5v5s/59uTWm6uBpuGAoJvsZQy8B7Jx2ExICkdeXDRnCGnC7IbGv
 R1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FKoUNbUOLP4SURZcvebDc6kX7f2P/quOXthh5nGVePs=;
 b=LvxbpYz8X1RGcEjNKnAi1qbX4arHpH1LHw3OTPN9edxEdvfRSjX5AwDMVtpWZl7Kdq
 rByz4pXbASg5DxQJS56zdFx8kP3a8tEFPDbG0rHUIvC6JJTLQW/eBvRpB3DJrJ/AT9mo
 sg+rjjWobxC/7QaE57JyFu4Vvj76jxwp+GibsMqm9g4debY5ICsDMt3I8CYikDp6sDaB
 irYJecBJUbQP4q7Pb/DJr2OAxHK/mBNVFfxrYP8En5EGc3CdjR6SfEyO/LgQh208OtqB
 uYlP7H/bRW+2aWa9DdpPLfR4nl1l1+Uje8kUDqKKscrsNrd+LV1aJqtiHapGoQQm8mKU
 14Sw==
X-Gm-Message-State: ANoB5pnhMDRpWHUVmpWI90ZaxEHs5N97yNT54amzOXVWdCng+MM8lDnA
 UsKVhypLtwG5a/rR06vgRmOTXw==
X-Google-Smtp-Source: AA0mqf62SyMaU5Jf9pU7IZB9usowbY870i4BZ0IapQSTQ64wnmaA//lNbPoLW+kNAIpBNqryoEykRQ==
X-Received: by 2002:a05:6000:1815:b0:242:6006:50f2 with SMTP id
 m21-20020a056000181500b00242600650f2mr5622307wrh.64.1670323175475; 
 Tue, 06 Dec 2022 02:39:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b4-20020a5d45c4000000b00242209dd1ffsm16369278wrs.41.2022.12.06.02.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 02:39:35 -0800 (PST)
Message-ID: <5f98f1c6-e6a9-cea6-427f-3fa2c4493e5d@linaro.org>
Date: Tue, 6 Dec 2022 11:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v6 0/7] Add ARM Cortex-R52 CPU
Content-Language: en-US
To: tobias.roehmel@rwth-aachen.de, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 11:24, tobias.roehmel@rwth-aachen.de wrote:
> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

> v6:
> patch 5:
> - I'm freeing the PRBAR/... strings explicitly now since
>    I don't know how to use autofree in this setup correctly.
>    Maybe {} around the part were the string is created/used,
>    such that it is dropped at }?

The pointer is declared outside of a for() statement. Then
inside this statement you alloc/free twice, using the same
pointer. This is correct.  If you really want to use
g_autofree in such case, you'd need to declare within the
same statement, one pointer for each string:

   for (i = 0; i < MIN(cpu->pmsav7_dregion, 32); ++i) {
       uint8_t crm = 0b1000 | extract32(i, 1, 3);
       uint8_t opc1 = extract32(i, 4, 1);
       uint8_t opc2 = extract32(i, 0, 1) << 2;
       g_autofree char *prbarn_str = g_strdup_printf("PRBAR%u", i);
       g_autofree char *prlarn_str = g_strdup_printf("PRLAR%u", i);

       const ARMCPRegInfo tmp_prbarn_reginfo = {
           .name = prbarn_str, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
           .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
           .access = PL1_RW, .resetvalue = 0,
           .accessfn = access_tvm_trvm,
           .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
       };
       define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);

       opc2 = extract32(i, 0, 1) << 2 | 0x1;
       const ARMCPRegInfo tmp_prlarn_reginfo = {
           .name = prlarn_str, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
           .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
           .access = PL1_RW, .resetvalue = 0,
           .accessfn = access_tvm_trvm,
           .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
       };
       define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
   }

(Note ARMCPRegInfo can be qualified const).

Regards,

Phil.

