Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9E51FF61
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:20:59 +0200 (CEST)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4Fu-00027h-CA
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1no1UV-0006Kh-NZ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:23:51 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1no1UU-0003kV-7f
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:23:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id q4so10654371plr.11
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SFt0Z7qlK61QQhRLWbDtCrFITsDBkRhGreEWPjsO7Xk=;
 b=Ye1RDs5RFZLC2IbNjcJA8Bsdq2lIZzmuL47Sv62T67NnwK1GfcQjpv9Oo9rsZXWNO+
 0SjDxdnDSFaKG5oyVEfXON3/M+ML37N0qXhi2EOle3uaUveqL6yA9mTlUby5foQx0mAn
 5aXR82WqNfv3EkvgnUKTab8G5SMjeQDN6iG/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SFt0Z7qlK61QQhRLWbDtCrFITsDBkRhGreEWPjsO7Xk=;
 b=GukKx9C1dl204sl7dn4SWf9SZBNYFhlPdSnYyu3Z2d7B8S/dcgo2gq3n7mKHDbTgAU
 Vv53P2s9yzfm0VmoN2ta/2s/8Oh0xWFrjpX1I7RR5iILVx/3fes9yxnL+L5OiX7EoeAS
 FyuZDov7GNxfjtaOSec8Ymcd61XiiCnPtA5ZX7mrfbIB6vkm2irabYWFzWfS072b/xgA
 66w8oEbiEeb4sPdvFXI9OOBQQ+O3oKr4jqMBHQGdliliKLSiGxcTt/6o8UVK8m02V9CU
 kTHlgRn9ug9qlfFfGgLmSSOMybzy9RUj+u0gARoU7sLNNkZOalPCHEterxrM3+rsJ5oB
 YYpg==
X-Gm-Message-State: AOAM531hyIZtWhJvs2OW7g6NJG5CP3eE4O8i+HNozXEdfGFlVE+A0LgD
 K1L5V7lcUj+drwdwuSmjZ9KbVQ==
X-Google-Smtp-Source: ABdhPJwfPDv019mdRmhRq7GIxZ3gCeRRoGxycZLdV+58wjGndlG2Uy/DhNROvm1izo/ejZFRp9QmLA==
X-Received: by 2002:a17:90b:f03:b0:1d9:a8e9:9e35 with SMTP id
 br3-20020a17090b0f0300b001d9a8e99e35mr26091938pjb.48.1652095428815; 
 Mon, 09 May 2022 04:23:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0015e8d4eb233sm6861372plk.125.2022.05.09.04.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 04:23:48 -0700 (PDT)
From: "=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?="
 <philippe.mathieu-daude@fungible.com>
X-Google-Original-From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Message-ID: <5407203c-9dc0-52e0-8081-5d7d4f7da896@amsat.org>
Date: Mon, 9 May 2022 13:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] Fix 'writeable' typos
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
References: <20220505095015.2714666-1-peter.maydell@linaro.org>
In-Reply-To: <20220505095015.2714666-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu-daude@fungible.com;
 helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 May 2022 10:16:49 -0400
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

On 5/5/22 11:50, Peter Maydell wrote:
> We have about 30 instances of the typo/variant spelling 'writeable',
> and over 500 of the more common 'writable'.  Standardize on the
> latter.
> 
> Change produced with:
> 
>    sed -i -e 's/\([Ww][Rr][Ii][Tt]\)[Ee]\([Aa][Bb][Ll][Ee]\)/\1\2/g' $(git grep -il writeable)
> 
> and then hand-undoing the instance in linux-headers/linux/kvm.h.
> 
> Most of these changes are in comments or documentation; the
> exceptions are:
>   * a local variable in accel/hvf/hvf-accel-ops.c
>   * a local variable in accel/kvm/kvm-all.c
>   * the PMCR_WRITABLE_MASK macro in target/arm/internals.h
>   * the EPT_VIOLATION_GPA_WRITABLE macro in target/i386/hvf/vmcs.h
>     (which is never used anywhere)
>   * the AR_TYPE_WRITABLE_MASK macro in target/i386/hvf/vmx.h
>     (which is never used anywhere)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>   * commit regenerated with new rune to be case-insensitive; now
>     includes fixes for 'WRITEABLE' and 'Writeable'
> ---

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

