Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110637AFBB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:54:48 +0200 (CEST)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYSs-0005FQ-Nb
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgYRT-0004Ng-UC
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:53:19 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:35422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgYRS-00083L-Ed
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:53:19 -0400
Received: by mail-oi1-x22a.google.com with SMTP id v22so15244785oic.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=No9d8SHyefe5+pffPLk1H/yT7ajB5YpX5bZ6oy8CoKU=;
 b=RECWgyl2ys9WGu9r3Q9TJybueihJqYAlmZx9wdVAoyKuyGUJ/zdoXdLMex2tQi/XIj
 R3wqY88Ged38vr9XTrLMJwfAR0qEr1fvIsd3Z/Nj/ikt3Yfj9eaxrH83VuXUyOJ+gSW1
 pCQynxtAyyQ10vFl6vlVw7fAO/BHhpy5VI+OoxP1sOWNF3UI33gD4JEabz6HTTtVB9wP
 KMel2WXakTG367dHfkzgnY8XCWy84Ym83iJo4jpamAckcgJuh+l1lNiAxDLZ76mxkJdE
 by5CuwFpA1aUBM42xzZX7nJQs6CRWN30zvmERc6WiHOks/Kb+KsCUqxQbGLB3D0W+Fcn
 a/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=No9d8SHyefe5+pffPLk1H/yT7ajB5YpX5bZ6oy8CoKU=;
 b=hTtb5g+o5qIyOSZog79KZoIS0eaqBRB16zfao6rUUeI4gu8+mOg+d3CfOgXQcV2rhN
 +Bv7gBS54cBHZ1TSzzCHFIMeaJTvFvBP9V35RjNjw2xMyJfPxR5yxRWp8PlplSwuP8HP
 Aw38orQLz5visi42mTHj1tx5QUlQ/ui5WiojKS1KmsXvZfKf9Z3uO7IRI9cu5G3h5z7w
 zW6fyCZFJP2/jkFiu/NS2v7l2pu9qPI5mg3jQcSRyxA1P5DeBUOxuEmPnY6AxkdeUN7W
 kOA2GvvPA1eu4HLGErQSe+E7pYUEG5g7USff3HBNtpeyPnT1cZRWCa5h/UmsvhevXhPi
 E9qw==
X-Gm-Message-State: AOAM530AsfZybmw4A4Luw9r5OR3vrp2IUJmCzM6XGVp4Rpowd02hbtwO
 zxiB12wvjJFF+1fjkbjoqk8bXw==
X-Google-Smtp-Source: ABdhPJypF7sW51+DKX2GBAagP+UMszsW6HvqfFQAH04ya//ISHHLQ26VIQcWdWjpiZjvbGEo1QcKCg==
X-Received: by 2002:aca:47ca:: with SMTP id u193mr4851641oia.69.1620762797193; 
 Tue, 11 May 2021 12:53:17 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 68sm3954860otc.54.2021.05.11.12.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 12:53:16 -0700 (PDT)
Subject: Re: GICv3 for MTTCG
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e85f403-c6a6-d341-55c3-079bac85be2a@linaro.org>
Date: Tue, 11 May 2021 14:53:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1f157423cc544731beb743287a4be5cb@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 12:51 PM, Andrey Shinkevich wrote:
> The version 3 of the Generic Interrupt Controller (GICv3) is not
> supported in QEMU for some reason unknown to me.

It is supported.  You have to enable it like so:

   -M virt,gic-version=3


r~

