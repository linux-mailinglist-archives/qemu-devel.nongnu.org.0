Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408385668D9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:04:36 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gM6-0000Ij-Su
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCa-0007hk-Rl
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:54:44 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCZ-0008FI-3y
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:54:44 -0400
Received: by mail-pf1-x429.google.com with SMTP id 128so11139131pfv.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qQmzxvcozvhNYBjlXcMaw9INsW1wQqnjFc6Lurc/WgM=;
 b=dsq/iyk6Jt8sAu7QCu1dtrs+fRiTeTAkOWwlLTNa/Rnyu6EXq8TaIchWDLxL6gfzpG
 PjbCFI0gxlVydOqcoCBdsQus55qt7BcHEyhsLLT72ND8/oNI8joXdpdtbE7mAg6A///K
 +DVOkD0JEpEi5SG+cGOVOnQNagApVEO8iMeB4Dfn6ruWl/HbcoPEEXEeJ6fPgMobMjcr
 Oc85EbQ8hqRNlrPuoq/rgY/p7Af47AdUlkmqcjYLwd9NMh3mmLpPHSHe8mU2FTE0zQSO
 6sr4gAdPS9dPj9RtutC1XCc6poX8lU7N60/fkHKZvSAHYGlkYoCovSQLgv7PEUon/wQ+
 Ua/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qQmzxvcozvhNYBjlXcMaw9INsW1wQqnjFc6Lurc/WgM=;
 b=vEld0uq7cBo0O6Shr5ang0N8NjHmV+mvWBUL5GSWPd2yVhyKGUZGFX4QKssPJplXGL
 DSvF1YEsPE5R25GXN/QT+aOnYdsPDAIQ7d3KjIJ3wLac0hjy0jhgRmz4wwTcOkikiT+n
 Yp3NJgo8IWad2ZufehtmVV+sOz1B+dR3ff7m4dAREWojWRkWV6gX6Muazi81M36mb+f7
 p2Z0bEPcG74M8b2bPqNvjWaysMacNiN4aNLq7I/bPZd/VJwpCFlC/BMR8HhMHdY/6uQS
 uCX7pbnk4+IFJAp6qkLud2YbA5YIgjkOTl43QJsJ0suv6BRr2Ut0e+OBLdCtwHeD+ReQ
 I3Iw==
X-Gm-Message-State: AJIora/vwzKrmgFVgy6XHbSmwL5QwQapG1GMN+oioaAYWkMXKqmYbRY5
 rBzkqXrpsJdU2MzUPK5dywwsfw==
X-Google-Smtp-Source: AGRyM1uzvy2/BPm7TFVA0syHURgcH05sj343yVTE3B7eh7HzwYPazcwA3mCUsimU29VsV8mPbxxVMw==
X-Received: by 2002:a63:7d49:0:b0:408:c70a:9496 with SMTP id
 m9-20020a637d49000000b00408c70a9496mr30577759pgn.616.1657018481651; 
 Tue, 05 Jul 2022 03:54:41 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a056a00179500b0051c4ecb0e3dsm22955001pfg.193.2022.07.05.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 03:54:41 -0700 (PDT)
Message-ID: <6d3e4de1-d457-2273-f3c7-f3ffc20acd8b@linaro.org>
Date: Tue, 5 Jul 2022 14:02:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] linux-user: Add LoongArch to qemu_get_family()
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, yangxiaojuan@loongson.cn
References: <20220705065943.2353930-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705065943.2353930-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 7/5/22 12:29, Song Gao wrote:
> qemu_get_family() needs to add LoongArch support.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   scripts/qemu-binfmt-conf.sh | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied.


r~

