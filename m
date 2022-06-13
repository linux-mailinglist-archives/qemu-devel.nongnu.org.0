Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3854A220
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 00:34:33 +0200 (CEST)
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0sdk-0008J6-04
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 18:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0scW-0007IE-Jw
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 18:33:16 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0scU-0003kF-S6
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 18:33:16 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e24so6936644pjt.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oIcKARpzGf29SVphlk82rJ2aVOhuP6noiWiMWEDchbM=;
 b=XZogkijGf1sevpsPWl2xeS2/AGzLF3O0vUMW6fCQWEX8ovIR9banFJtVB0Lgk7leKQ
 nQQb3S+Yn/ijchiGbe4SCwb7LN33n4avDR6YI8YufsDZEwh4MJswf2hEoPmO3MX+KzLP
 NTug3pdtrYp/vq6jXz6bz3CmAayowypkI9NNRndInKALAehQwbX76pKLgQ7nnvWDeDLj
 DpssD0Gb196oXqiDCFyUDvfxZrVdCxuNLaGDquudigK/NSYHWjOwakHol+CUc03p0Xj+
 XhiDeB1qgnbOSNm6w+lt3o0ErvIRkCBEHTeN0rWZXwmuS/kPY5cqqW1ESXIerrENxule
 ZYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oIcKARpzGf29SVphlk82rJ2aVOhuP6noiWiMWEDchbM=;
 b=mQk6+M8K499gukOZkLh550fUq0ofw1IFlpeSuka8dec8N4KTONUjGATak17zYYb3Ga
 uJQC0sQKQsYPl5wVTxdjHqkfHLjC/jF8ynWiOEFcrox8waycgSJp3YCh7MB1vb4hj0BA
 V1/4Ujay1+PNXNBar0LrNf9zwslFVx7Kse7pp61TATfzni4D1vIbe66H6zSvFpC5LSgU
 dKYEH7bBJ4PkoQxj2pjmPf/3ZjSPJ8ijlLchlAysT3OyK8Vk87njCMUUDdGwO2X94fdr
 nH+R1vhIQ+nsTaovfi4lzdWOVWwvexWTLk6xZzcc6NA4BMSh7DpNj0wSVC/ca20o2oDu
 IQoA==
X-Gm-Message-State: AJIora/i4yy+STd/JXjXLv7HRhHSapPX+ZjBNIdPD3WAeAvZXj2I8RBS
 zCjZJhO73myNJoE11Ls/zDE=
X-Google-Smtp-Source: AGRyM1tROzBZwTZ2fRG1klWaqUsd6nLG8ZavP0xIOl6EBygUe/iDylJ+jmylixNAizuN2AEkDKTDcA==
X-Received: by 2002:a17:902:7893:b0:168:ca2e:c944 with SMTP id
 q19-20020a170902789300b00168ca2ec944mr1444100pll.107.1655159593166; 
 Mon, 13 Jun 2022 15:33:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a17090aae1700b001cb6527ca39sm7942195pjq.0.2022.06.13.15.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 15:33:12 -0700 (PDT)
Message-ID: <95a94a96-1013-8b51-83ae-7bc5941f7420@amsat.org>
Date: Tue, 14 Jun 2022 00:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v1 5/7] tests/tcg: disable xtensa-linux-user again
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-6-alex.bennee@linaro.org>
In-Reply-To: <20220613171258.1905715-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/6/22 19:12, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> The move from tests/tcg/configure.sh started enabling the container image
> for xtensa-linux-user, which fails because the compiler does not have
> the full set of headers.  The cause is the "xtensa*-softmmu)" case
> in tests/tcg/configure.sh which became just "xtensa*)" in the new
> probe_target_compiler shell function.  Look out for xtensa*-linux-user
> and do not configure it.
> 
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220608135727.1341946-1-pbonzini@redhat.com>
> Fixes: cd362defbb ("tests/tcg: merge configure.sh back into main configure script")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

