Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3734976A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:57:16 +0100 (CET)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTIJ-0005Bn-Gy
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTFv-0003vt-CA
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:54:48 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTFt-0007nc-Hf
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:54:46 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so2573153otb.7
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U+ej29+7kE0lZkUL0/wc8CBsxzjdN2TCviPmiVuowaw=;
 b=Q6fsHtJ9wO1TPvWWEDwHVt19t5kYBdOlaaRXeYnTRUDeAv+qlMMBNeqS8LoT73zEun
 4tHL1PKM5HH1dir9zJnk/KxtZrbx57u6miMV7X3fyxZSiFOszOMfrDAevJQnQWZ1DobF
 8Y9b02iyZ6ukVdAf4F8GWdluD8YrXEVt3JhEzwCcT3aIyL72pgR5tCDLmpf3IPLB4IVD
 QvoRjECc/oenz0Aar6bU4Zwiwsekyo/T6qgMuY/gboNTWBIOSwdp0lijyDMBu3Se4xDY
 UMOLmkfCLnv41uvFkVsCTN3S3MkSB+y5NPS427tEX4vR1JNE/vec4ERuGw6Vq3OdfIf4
 IiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U+ej29+7kE0lZkUL0/wc8CBsxzjdN2TCviPmiVuowaw=;
 b=ZFxMMbteNk7etBMQirIYmZ+fvbdpukMccKY659lFF0q2uAWvVluhEZIIskJUzGPVbU
 W5wyqMv/dy8AHD8xYTL53DCoI4PFNVn68TERpS+b8ig0TZmTDt069G6iYz7uko3jJpR/
 2uNcDDvzlhs6kvW+hKokjns+/Z++yQVSgiFHYH7eeyi78OYVVAuVerOivDqtMMVcueNS
 lqPdS5RfJZCc8/89LKb4nTxoPiO8n7N6opfsYtrg8ocupens7/saQQZBAIKwSeZDIKbi
 If4rNoA/WjUOFBPAtPhRWBin7tqGln0od4E5XVi7LGx+Z6DWNBurFR4xlnVmiaCl1LRt
 Hh1w==
X-Gm-Message-State: AOAM530HAerg2DwfZMdfyodP53r2Lr17KiMoyWiKNSDcnzwKWMGXbVqM
 Dpnqq2tt5J0N0mCFLAvAhDtMRw==
X-Google-Smtp-Source: ABdhPJy5CEd5VfAp1/clv4Rq70ymj1+pbz1J5+iXxzA4fRjpNfz3rYT9Amb4+Kg8STcAHZ1iunoEQw==
X-Received: by 2002:a9d:7545:: with SMTP id b5mr8101989otl.223.1616691282958; 
 Thu, 25 Mar 2021 09:54:42 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id x20sm1032493oiv.35.2021.03.25.09.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:54:42 -0700 (PDT)
Subject: Re: [PATCH 15/15] Hexagon (target/hexagon) CABAC decode bin
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-16-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d902ade2-729b-898a-e4a2-6e2002153cc9@linaro.org>
Date: Thu, 25 Mar 2021 10:54:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> +#define fINSERT_RANGE(INREG, HIBIT, LOWBIT, INVAL) \
> +    INREG = (((HIBIT) - (LOWBIT) - 1) ? \
> +        deposit64((INREG), (LOWBIT), ((HIBIT) - (LOWBIT) + 1), (INVAL)) : \
> +        INREG)

The -1 and +1 on the length of the field doesn't look right.
Which really computes the length of the field?

Did you in fact want the test to be HIBIT >= LOBIT?


r~

