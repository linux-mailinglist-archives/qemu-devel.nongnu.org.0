Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8422C2B6F48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:49:51 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6z8-0003wj-KM
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6xQ-0002zr-3D
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:48:04 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6xO-0002w7-La
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:48:03 -0500
Received: by mail-pf1-x443.google.com with SMTP id c66so18009698pfa.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DIUXeoA3lk+w4RURriBvHtMBcIS7LrYTyXNTTVsuak4=;
 b=e4kzEMnTWHyq8+GOL79UE+or0ikPU2voYAke04JBolYIgzZrg1wVixwEEbDyDsKE4n
 5/UTxsS6IIRrVkNg0bHhWT1B4RvlyqRQMSBxv7am0/Y+sGpAjOb1xNk/yGOUFJVcMjzD
 9Ya7jqowgP6C8VQGBBkV2y48QROoqsT8cRCPMIS1jx5xLN6eKk2agfg6+DEh9+gxAi/z
 46QswlsBHleahwsXNLZtLARdc8HosAl+cuEwsmtO00itCDga9/XkhWZQCGn567TS2y+e
 PXNKc/qV0I1xe86ekp7ajScCJj9rO4Lzfe37lx5cslYys4AhCbGv8G9LK84NERrF39s6
 bWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DIUXeoA3lk+w4RURriBvHtMBcIS7LrYTyXNTTVsuak4=;
 b=SngrOjVZkxD74PIVaDs7cXN9tjzg8dqEcCtmn2bwG4gsNA0iWFThxAoCHMW5iZ/VxK
 rr+d22bJkLvssD0F1yc237AXmE6jMENFk1ZbTfXpW6RHsfDXjoHhS511znE5opbz1iyi
 IXWkMG5Aeb7nZOfM+IdSvkRXuSytWYGyl4b7VboX0J6ingi1JNopXd5JfaWs2QUqBdQC
 DjUgEvFUTc7KVH5/kT5/v1vxfgnoxrTA6RqYcLj6PkC+LjWlFA+lo8h71mv9ablKr6pE
 Btg0o65l1B/vIPpNPdsoIjRDApdCUXzcDOxuUcbZT7r9RLI+c5GnmVLfI87s4TwpaJrO
 9xuQ==
X-Gm-Message-State: AOAM5304Esp2bkut6JrPZZxhr5KhfoDPs2f1S2/OU56DdcC28ZL6PySA
 n44ORx0G6VCOYHFNDBBQnVnpYw4rC2EOHg==
X-Google-Smtp-Source: ABdhPJxDwjj0byI8NnuSoztjD7pvK7OlvdtB6mAzL3CEJUjTLTho8upl1QBBZ6y/y4jz/Xf++RULCQ==
X-Received: by 2002:a63:570b:: with SMTP id l11mr4933852pgb.110.1605642479168; 
 Tue, 17 Nov 2020 11:47:59 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id c6sm15160690pgl.38.2020.11.17.11.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:47:58 -0800 (PST)
Subject: Re: [PATCH 08/15] target/arm: Move general-use constant expanders up
 in translate.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21e3448e-2574-19d9-3573-193af7795913@linaro.org>
Date: Tue, 17 Nov 2020 11:47:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> The constant-expander functions like negate, plus_2, etc, are
> generally useful; move them up in translate.c so we can use them in
> the VFP/Neon decoders as well as in the A32/T32/T16 decoders.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 46 +++++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


