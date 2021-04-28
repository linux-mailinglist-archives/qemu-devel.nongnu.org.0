Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E136CFE4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 02:08:57 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbXlA-0000j0-OM
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 20:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbXkI-0000H9-2Q
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 20:08:02 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbXkE-0001hE-Av
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 20:08:01 -0400
Received: by mail-pg1-x533.google.com with SMTP id z16so2582245pga.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QUeIwPzJ4wfzKmUFSs3zia1ajsMWz/DDoyNx6rk0OyY=;
 b=Dr6XdPgscbV86QMQSLJ+CupZoVVgAxuiUMl2HYrK5I5NBNMM+agtDoM5OZlNofwk5B
 NzLlPZaxYpBqFPntCevcLuRxMkl9wyX13fZq8rLPmTihj+Wf++ZR/V10G7T79utslN1Y
 MBQ2mzNBM5avv/Q2QSdIfhXKBjm1moNay1fku13V+Pilz11zMFUVzLAakORYsCS2fHgM
 RsHXSErp83b/JfrnI8ZwcvJ0akHsY8ik2clnKWF2dvs+olEuuC0QtXFEuWKqaWmWMnj0
 eJBtxMx3utG/NLprqMAgpKVwUTAeUhAgzX2Y2Ed8/MKJDpciLCOtwH7mk4q/Z3lS5Ab6
 nzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QUeIwPzJ4wfzKmUFSs3zia1ajsMWz/DDoyNx6rk0OyY=;
 b=hI4IQOBhsnr+iLm86htwVugd8m3j2SlwMAkrU8Uwy73w8MF8bdhd2Q7Qzxrg60sFgo
 zXQkIuwvyiPgepn14856Q72K+VG4DqbwFLBxTn0TphMom/ljjaiWnzl/IgaGmsK8QKzJ
 +TEJipOr84RFquVr27WPsrQ99Af+ns9s4Hvh+IIH0L8F79V0ZyzHty6+zbU9dx3WLGQt
 Ea+gwck6t4+dAExeiFyKzZ8SA13VraRkWk3QSxqlpf3rleLIRSlc8SsAyS5nfkWaDgdw
 RktIoTVNQmxYEDPtQiTL+tWx2xBZsAcyg4ma21PHxogCxpL2RamIAiuWp00pLCEMY60y
 7vmA==
X-Gm-Message-State: AOAM531OnMcJ9GXeFoLE83C/Cvpog/bZyn/o3RFT30h3fXUVwJYX6bp1
 tEzfccCCnc8NGRI4ADTT6oUtRQ==
X-Google-Smtp-Source: ABdhPJx6CAr536aYpqZNjiJGiZ2GgcstZtO4bp/f/Fm8Nv+mt0E50zdR+3UZJ4Sqa1aPv+wDVA57pA==
X-Received: by 2002:a63:2265:: with SMTP id t37mr23534535pgm.452.1619568475818; 
 Tue, 27 Apr 2021 17:07:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id z188sm695347pgb.89.2021.04.27.17.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 17:07:52 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] hw/sparc: Allow building without the leon3 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427192658.266933-1-f4bug@amsat.org>
 <20210427192658.266933-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6300f36d-077b-491f-5ef1-ed2126a2db7c@linaro.org>
Date: Tue, 27 Apr 2021 17:07:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427192658.266933-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Fabien Chouteau <chouteau@adacore.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 12:26 PM, Philippe Mathieu-Daudé wrote:
> When building without the leon3 machine, we get this link failure:
> 
>    /usr/bin/ld: target_sparc_int32_helper.c.o: in function `leon3_irq_manager':
>    target/sparc/int32_helper.c:172: undefined reference to `leon3_irq_ack'
> 
> This is because the leon3_irq_ack() is declared in hw/sparc/leon3.c,
> which is only build when CONFIG_LEON3 is selected.
> 
> Fix by moving the leon3_cache_control_int() / leon3_irq_manager()
> (which are specific to the leon3 machine) to hw/sparc/leon3.c.
> Move the trace events along (but don't rename them).
> 
> leon3_irq_ack() is now locally used, declare it static to reduce
> its scope.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> RFC: The problem is we have hardware specific code in the
> architectural translation code. I wish there was a better
> alternative rather than moving this code to hw/sparc/.
> ---

This one seems dead obvious.  I think this code should have been in 
hw/sparc/leon3.c to begin with.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

