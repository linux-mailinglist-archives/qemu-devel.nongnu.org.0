Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C397C2C8CD9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:32:28 +0100 (CET)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnyN-0005cV-Ji
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjntF-0008V5-Dc
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:27:09 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjntD-0002LS-Qi
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:27:09 -0500
Received: by mail-oi1-x243.google.com with SMTP id c80so15232490oib.2
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 10:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aVmiK7TorvfAu1km5yKcUebNSfkzuShuKyPh1NbvKwc=;
 b=S82MQYDJVOJW9x8AuED6fSotwyQLzcMVOwcTm7ySiIkgLAwf2+5/wVltcCUgPA6lG6
 VQG+7bg1PAOVV5+QVXbNO5twiE49/dFlEsHWVw42qI3O0TZnhhc8YHqiV3YxfHKMB4Xd
 kgbHlJaGIcb/92w4UViRJFWqOYprHB+PtjaQ0BOyCcmjX9+LK2jJfiptRU6r/rQLTrDo
 36QhNBZdIMKerLd0wQ3iy6g2B1ZvRVMxhJDwfwK2A7azIMGfPEuTm1UlvlFl+X+YzzkE
 1rm48o/xX2nDTUvBw/SxhBp8X/K4XbJMt7MQr2zQdqvIs+og0m9O2Ge0K0RSOOs/bMRf
 06gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aVmiK7TorvfAu1km5yKcUebNSfkzuShuKyPh1NbvKwc=;
 b=gHmLMZxzvtslfa7SZk+MAuE9GRhmyP2J/vPJ7uqwlkntDxBsZZIAyOIrtyhvnvDd7Q
 TXz4WqBxTnlAH4a4RanY8EUdTeFeEVpCPYxPKv8I7ofpoS+WQ0RQSPr+lyIQqIkdaKUe
 NjRnwGl3wJwUVgBaEjyotv4FK6mINYgqty6RBsauESysXdOV8/7uKzEq3YdWOI9Po6x8
 ku7XRJMAZfkdC83ZG4nJ/q5OkQWWAA7yoUHR/7SIBKpl5QThUyuvPwhDEo6TvmQrfVdz
 y28TbgTNz7UuBoi6ESdFwyTTrm8L1acvrH9Je4Z2sGF5QEoWFpDUXEYDQmw5tnbYPGqa
 WYkg==
X-Gm-Message-State: AOAM530zQpynnhzLhynSEHZLPCUB6LiVjuiNpcXlvsosQGeZHKXcRJdL
 D0rDSX1SSAojJfBUi6X5paISgg==
X-Google-Smtp-Source: ABdhPJx35XfmQ9a5vAe+IluaFKd4rJMZ59HzRJDUKh2SzNneZ8PeIFFdbSMv1mDfxBHcrx6eKZ/0cA==
X-Received: by 2002:aca:d490:: with SMTP id l138mr125899oig.102.1606760826670; 
 Mon, 30 Nov 2020 10:27:06 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id y18sm10102638ooj.20.2020.11.30.10.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:27:06 -0800 (PST)
Subject: Re: [PATCH 4/4] elf_ops.h: Be more verbose with ROM blob names
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201129203923.10622-1-peter.maydell@linaro.org>
 <20201129203923.10622-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66affa41-3c09-ca97-7619-7d9f45027224@linaro.org>
Date: Mon, 30 Nov 2020 12:27:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201129203923.10622-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/20 2:39 PM, Peter Maydell wrote:
> Instead of making the ROM blob name something like:
>   phdr #0: /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf
> make it a little more self-explanatory for people who don't know
> ELF format details:
>   /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf ELF program header segment 0
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


