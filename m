Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6434EA228
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:59:43 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwSk-00052q-OC
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:59:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYwRP-0003nX-RB
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:58:19 -0400
Received: from [2607:f8b0:4864:20::22a] (port=44686
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYwRO-00010r-FS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:58:19 -0400
Received: by mail-oi1-x22a.google.com with SMTP id t21so12106895oie.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=acp7iUAi7BSbVlyRpMRnHKeI9ebjTka5ZXJsSBZZ95E=;
 b=TnOu190SfcpHsWVth00oRV1d1F9yG08zlqS9xC8rbZ3vJtIlOHCEcRt4c6vYZTxlP4
 dIijCbZ9ik5PqoBgn+lrytFsSaMT+xLTph4WhWgDk8+ibaAFeF7VtIrD7eWgC4ay8o9H
 7Yfr3ZCKUCeXwyoM2Sr0liPv5Jz1cXCXOV4LUnZ3Aveb2JJG6YUapw8aSSWLCTJy21QP
 ZI+auco34XNK3WisW78ELwhaOnIJdPJuPHuwVQ5N2SR2vzuszwWh3osE8F4xxzfjVQTc
 rxxTLJB69fAcMm37QqwjtTC76eaB10/YjFxBVjL5A6fJvcQvFGUHd9mSDv5Hb47ANyg6
 LaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=acp7iUAi7BSbVlyRpMRnHKeI9ebjTka5ZXJsSBZZ95E=;
 b=VInmiE5Ssn5KBu5fFLMQNXUnNzLWGwlspSM+kVvWJU3sm5vsr4tyS1XZTvfOFmqAmE
 o1646Z75idh+GaIccFczMz3K4fs933m0ymoRJ7AdfIVMKXIy+A9FAOJzKAkHS6cweNM4
 rHhPyhgYlkKE0AH21pRlBQ+Pcrn6tpqfnDOSwEIKq+3wbSKzv5OZ1Li/UDZfd6qL3Rzd
 mvkodhbA9JVMgKBMrEiRqen7w1xgktUVfl+qePVrOd7tVh7ecMOCa65SXq2808ozX+QE
 n2qkZ5fhwvLcWmYCfrNyBYKdD/y859rpBns00FYHpMt/9rgz7G7i/EsJz1y6cx4pqDcT
 8YhQ==
X-Gm-Message-State: AOAM533aZb2iMnYdlDE72EWZpgiDExuVpCMGqOox7p7go0rHhcAcwq+W
 ulVo+WtvtlbGCddpjFd8HInV3Q==
X-Google-Smtp-Source: ABdhPJzFh39cAISAZQMtr1b+GruXJ25Ezx2pomDzaduAqTfDGMdzq1pIFxS2avokJIGFvDyJUc0axg==
X-Received: by 2002:a05:6808:b14:b0:2ec:9f20:f55b with SMTP id
 s20-20020a0568080b1400b002ec9f20f55bmr523740oij.293.1648501097466; 
 Mon, 28 Mar 2022 13:58:17 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 l33-20020a0568302b2100b005cdad9100desm8031185otv.40.2022.03.28.13.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:58:16 -0700 (PDT)
Message-ID: <05185117-496f-0b49-c47a-0ba4ea62e1c3@linaro.org>
Date: Mon, 28 Mar 2022 14:58:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 05/29] target/loongarch: Add constant timer support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-6-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +#define N_IRQS      14

There are only 13 irqs, according to ESTAT.


r~

