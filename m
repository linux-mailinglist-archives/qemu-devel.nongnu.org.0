Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2D3D08A1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:13:54 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65UO-00009u-Vv
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65So-0007eO-Fy
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:12:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65Sm-0005bP-Ig
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:12:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id p9so1059489pjl.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rZS+yx2y2qrdjEwRmTn7dbXL0fxkYX6pTpAIQRxTLEI=;
 b=AxSmjttgEz3RH+mpycOc8iGOpJUIN1e3gJinNN0lfCXtrjcn4GR1NcKdGolA14ypW/
 dzNA3x6oXwE2eLD2EOYIpLFHMA5M7iFpb8v17OYTCuGca04i9A85jErXevBC741nPjQ2
 7zeVvqlq3grDHwAI9K6T2Pl5fAk9918KufCwQ+hgU80xesosfDM6XBqbhZIXj/S/0o+L
 CR58yAf9FKHvndqYtI25qJKT2MYhBCaHD8E/BUd0vzt+OXG3UxbACTVwI5FhQb7b4GNr
 e4Ozvy/t9VasrM1ME+rrAi7Fw1YZpI415PdaFYIiKi4j0b1uYwlMhBJ6SXc2/NtCXiXW
 yWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rZS+yx2y2qrdjEwRmTn7dbXL0fxkYX6pTpAIQRxTLEI=;
 b=SJ6TBcKkwRDTl6c8U/4hrofqZsacEUKA9QjdUwc3Cq7MYtUiytvEA44VjdPMgtKsZW
 bspQ2u6z/rLfRw9FD9WXtz5BZeMyMWtYSztIHtFkvDYEhLMcWf9TkdtvBM3UkTM9oBkt
 BfsonDzva2N6HlMzIpKmvE/iqfNbOrMji7YoIfO9KzOlOFigvHAlf5ayXSJkRW6WonQA
 xaQ1emjgB7GKCeqyO33MBHwmAwbu0lSekSc/RPTTZq6fUEbj5CIBaFXKcZmRRYq3NYn/
 ykoRqgEvcV/0q0Jc5MGhUHF+LvaTHyhK7HKYiEj96vP4gQJh2fOJ3p10CfgxdmO5Lqrl
 Mvog==
X-Gm-Message-State: AOAM530FlV6dGj7RkXoPO9Zjae79Kceu0n73nwE0+flKFDHjpCzybLZO
 qjx5dWc7Wxc4FR2j59+ilV3K29wSOzIlEA==
X-Google-Smtp-Source: ABdhPJxKMIuD8+Na/hShskDvY1KjOPRyjFOzH6MhKHTCpmcKIDYlKK7XO/HZkpTQORoqJ3feshNfcw==
X-Received: by 2002:a17:903:186:b029:12b:8d80:5d78 with SMTP id
 z6-20020a1709030186b029012b8d805d78mr10114974plg.17.1626847930537; 
 Tue, 20 Jul 2021 23:12:10 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id h19sm23540956pfo.161.2021.07.20.23.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 23:12:10 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-12-richard.henderson@linaro.org>
 <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
 <6e101005-ce67-3179-b446-c9b963b6bda2@linaro.org>
 <2a1b3fb7-e701-f2a6-0777-caa90a9e3a51@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25f290cd-17a6-8ba5-df0e-6258e3fca01e@linaro.org>
Date: Tue, 20 Jul 2021 20:12:06 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a1b3fb7-e701-f2a6-0777-caa90a9e3a51@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 AM, Philippe Mathieu-Daudé wrote:
>> Practically, this is working around what I'd call a gdb bug wrt avr.
>> Which may even have been fixed -- I haven't looked.
> 
> This is not a bug but a feature to deal with the Harvard architecture.
> QEMU AVR model is based on GCC sources so uses the same "feature".
> 
> The AVR core has 2 address spaces: "CODE" and "DATA". An address space
> is always zero-based (so both are). To avoid having to deal with
> relocation of symbols from different AS but having same address, the
> DATA space is mapped at 0x800000 (bit 23 is "virtual" as inexistant
> - masked - from the CODE AS).
> 
> The core can not execute from DATA, so CPUBreakpoint can only be
> triggered from CODE.

I know all this.  It begs the question why gdb would ever *ask* for a CODE breakpoint in 
DATA space.


r~

