Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC243E551
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:39:35 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7V8-0007bX-57
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7T2-0005Yn-Q8
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:37:24 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7T0-0003X9-Vp
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:37:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m21so6707952pgu.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xTvbEaE+JYEY0XDAYt90hmZHLwXtpYvdVDc0l0vLcnU=;
 b=fZMwJzQaxkfX3GMxuK24aIfvzN/UbyyRoZyB3vqJQ+yWYC0gkl6YSOPkb4tKFpcVh9
 Uqwluru+p5Xp3/QDwi1ZA36vEMyaBQjzsPNrnsbX1nTXw7SgQiccd1B8yU1TaphPASS7
 ENj4FvKmpEOCgitP0PM+X9vgEAlArRLzOoc7/hhbTMWacdZxASygajV84zfqrpaFJX5k
 aDZvDGTC63A+5SuwdQFIDXIflyeQc3W44BpKZC9HVFb2/rL/nWo0szaCQkQmJdLII2wn
 yP78ubotlKIzoXi2751kWP/jq24xSGB9V9pijcjTez/AvTrMQsAsI4dBZZCIkulahI13
 ab8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xTvbEaE+JYEY0XDAYt90hmZHLwXtpYvdVDc0l0vLcnU=;
 b=d+CHE+ad2oHVIs5bZX+YHf70LwNrc2lgbXTN3Q3ZD8gJXYZYCNYYiamOxquv89Tiwn
 b6Sy0rd/oH0WyyQigTgOQ+JbeOspUU9eW6nRAn5e1NPsGGFItyseWiQx7CvI/toVgkUi
 QlDzXPn2NQtbVV5FovSj4vvcEaFPY7NAMYaKnUS6pzNLIWIMtt/GMHa1dLTCtKKReEUb
 /iDF3RFwGMjaNg1ZFKb8UhbN6PxmbLEd5rQMRNg+E2f07h33ESQkYwjw461TAC4xR7gQ
 EkHXml9toUsj9O08IOcUEcyg7nGN9jLem9gHo0L0RrL3NPwbB7QBK8LhS0/i+vqjZhWV
 cvmQ==
X-Gm-Message-State: AOAM532j5JZfhGHLtIEDHSiQf+IS/Wa9ikUvJ70soqULtTckqcn+1LLX
 7N8uQlxC1uxxvPJIKLuJTaXxD5UHkl+/uA==
X-Google-Smtp-Source: ABdhPJzOA1iiUKQl/cf0PvfJpSY8p8fSnpNS+a9XY3ccTWEfVxuD85hbiUCII58m3kuoKksVR5BtGg==
X-Received: by 2002:aa7:88d1:0:b0:47e:e73:7e49 with SMTP id
 k17-20020aa788d1000000b0047e0e737e49mr4579049pff.56.1635435441740; 
 Thu, 28 Oct 2021 08:37:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z14sm2722169pfe.78.2021.10.28.08.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:37:21 -0700 (PDT)
Subject: Re: [PATCH 11/24] bsd-user/arm/target_arch_vmparam.h: Parameters for
 arm address space
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5eca9dc5-7f8e-23bd-8a1d-86fed1b4080e@linaro.org>
Date: Thu, 28 Oct 2021 08:37:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Various parameters describing the layout of the ARM address space. In
> addition, define routines to get the stack pointer and to set the second
> return value.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 bsd-user/arm/target_arch_vmparam.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

