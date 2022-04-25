Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC60F50EC33
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:38:18 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7LV-0002hj-Vw
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7KJ-000230-RN
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:37:03 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7KI-0007og-Cr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:37:03 -0400
Received: by mail-pf1-x432.google.com with SMTP id z16so16177706pfh.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AwtRMUVVorBIKXsV2I3H0vAroa0LqeT+KGfbFzgIoM8=;
 b=W/56Hadd+3JBM7Py6av+TYUSSi9PPOfriA97q5WwoE0kHci57qyHhCzsjxURtcovD3
 NHfRSZ+hpV4BSTuLNw1ziQG6iAswovVJPOmsT0P1SH1mtbt6QibnhfII2H8IPiunzOID
 CN+9xzH5Jo+Dm4yrDuv4bv07NXwvz0p4RQCoqot79xUQcz/fIXu64IrWKBglAwgNIG66
 rGF9Po4sNMOeU9Fj+Rc+nxnG6vimeaFDYTp/YqIL//lMA/Ti3xehCv8iYxCKKJff2oKI
 Ley22htvbhBHfkDMJfELMzUBNgWQCcf9td1c5bTnq0GXWjcT3gc8e2RKUNTDAj2nK9hi
 E06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AwtRMUVVorBIKXsV2I3H0vAroa0LqeT+KGfbFzgIoM8=;
 b=gt6PkqkKnI4GI/nzQObIQJtUvlCDXt9vyIw5kW6UoI8a4p/YIqhWNc87pctWmas3i1
 aQiRxqN4MvVMJqOkC/PY8+ZV0rjA3pWUyCd871gccKBxychTzPlctlyYjF80bE7PtPC/
 YGsnuhQwBSFYM09URcGS9jV20d5mtMa6SrUK3CPgZaMCx4bw4EjIwHPSN4oDrlnmNudS
 bQQHnle7Sxlnm40NbK4Y3Z7JceQWusL/W+EvQUVq+XfwIH4OUnf6ut9ICRfkAo6Q9AV5
 PaJiM2J1z4schyJGdiUHAuQgtFM2dC/QtLplGkvEq/sQ7oYuWn7JPWEiM5j2F9+wlKCm
 YMCA==
X-Gm-Message-State: AOAM530xl+vUlpG0wTiEhZByr+7NaPmwh47gKaBA1Y6AAcDaYBv9USkV
 geu+IKomYxOi+flXKIqK/vrUHw==
X-Google-Smtp-Source: ABdhPJzERQELWufneZiWIlfq7MSqggyTBYtSxLUbewAjRBqAkyAR8oKc8trq6V/kkjq3HoDz/e/fHQ==
X-Received: by 2002:a65:6e0e:0:b0:399:26d7:a224 with SMTP id
 bd14-20020a656e0e000000b0039926d7a224mr16927859pgb.437.1650926220694; 
 Mon, 25 Apr 2022 15:37:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa79182000000b00505a61ec387sm12353121pfa.138.2022.04.25.15.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:37:00 -0700 (PDT)
Message-ID: <cfdd2247-8b73-63fe-650b-a45a8e9b35ac@linaro.org>
Date: Mon, 25 Apr 2022 15:36:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 19/43] target/loongarch: Add CSRs definition
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-20-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-20-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> +    uint64_t CSR_CPUID;

This should not exist; we're using cpu->cpu_index.


r~

