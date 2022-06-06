Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEC953E558
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:20:04 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEWQ-0004FB-Tf
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyDv6-0006Gx-La
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:41:28 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyDv5-0001Vy-1g
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:41:28 -0400
Received: by mail-pf1-x42f.google.com with SMTP id e11so12866346pfj.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LAZqLghCm/i7dTss0BdB9gKflCCyU1Ag7Sq14FLF994=;
 b=pMdwACp6ng+/BaldQcMtW0QS5u+pqN++hblyik8Y9VW2NHmSJNkksx5vqr+729+sYr
 /BDMaH1nPdtaUvRAeN4aGjxZtueH0qNW1MEc0UFTxpjN8y7uWvlEQirlQZTCbxX/9qJx
 5JvqV6D/Vl+9EDLbRjWYanv0Gl6FmquxU1N3IfZJzmkesVBN8/wLDjbEZF7jTw2c7RFv
 gq67WsHAWWHlT9iyPSgsFKPA44vgcvvrcX9OX9ICRfL+WW1aoNjVZFOHn+F9zCpgy9jR
 aiP9jpGuSfCMjZ+NeZ1h7ufFFEE9+N3IvJ/HdHhrvKGlKm6PZtazTKBjgq2vf2phSS+D
 0vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LAZqLghCm/i7dTss0BdB9gKflCCyU1Ag7Sq14FLF994=;
 b=x2jxcXaBgCwdpXq2FLo4WknkYVP2KZx8j/cGCGtmoRNF1kb4/bB6Hgl5ZAol7h001w
 ijrpf4UscBtT2K4JwuJajCF9JlqskwocsUylkUqBdEzwu2N2K2EYJ0H1yQCuBhS3XIFV
 Tq5dxTk5vV39REuiSzCCKlVW/Wj5qrBZ6n5ukFbL+tTsMLO/+Q3bbNhnVMpyRorm/AqC
 JBF6kX+d1uU31Sa4vlPvWmvcRaNji9bLq4gjGvJiZ3xNqsAybOE15GiyOly8IluoqQrU
 K7DGakHHo+VRTtZs3HwhT7kzJVGFcFdI/ZlH55Y908fvt40E1uENAga+xalVPY7o6uAF
 CyVQ==
X-Gm-Message-State: AOAM532BjNPuoe2UGn8tUGij/Bxgt86P1Wm61sSTB1SBlXn0nKaPword
 y/9oTieJet1qZI0a/DStyBq6cg==
X-Google-Smtp-Source: ABdhPJz8BZTOkG5h5kVraeZo/7httBnvrkCpVbH0/8egEDgzba+mF0IrtSOKlBoPO5euw1wt5F9OCQ==
X-Received: by 2002:a63:e114:0:b0:3fd:97a1:7a5 with SMTP id
 z20-20020a63e114000000b003fd97a107a5mr7566843pgh.178.1654526485456; 
 Mon, 06 Jun 2022 07:41:25 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b00163f36005e1sm10628503plb.42.2022.06.06.07.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:41:25 -0700 (PDT)
Message-ID: <14816c96-e9bc-2c12-a558-eda3df15f36e@linaro.org>
Date: Mon, 6 Jun 2022 07:41:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 25/71] target/arm: Add SVCR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-26-richard.henderson@linaro.org>
 <CAFEAcA80uRfdLR+4pJU6p8wDBgottFUaKDOCmgiHPj7B-qL=qQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA80uRfdLR+4pJU6p8wDBgottFUaKDOCmgiHPj7B-qL=qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/22 06:40, Peter Maydell wrote:
> What about the "MSR SVCR*, #<imm>" forms ? I had a quick scan
> through the subject lines of the rest of the patchset and didn't
> see them.

They get alias names of SMSTART and SMSTOP.  Patch 30.


r~

