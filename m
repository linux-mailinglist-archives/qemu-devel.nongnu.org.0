Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A2590942
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:42:55 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHpG-0005wN-Ab
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHm4-0002Mz-7O
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:39:37 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHln-0005Bz-Er
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:39:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so6804249pjm.3
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=6dwYoSzBWTgVH4VPfd0vRvpSS0WpanLJf1cAfcT8WVE=;
 b=ha5l35QAl7NzL2CXRI8sM4qTQnTut1FkVKqbdNLqlEybWnnXu3knYH8zGesuxfTXqV
 vyIvpOPWuIzCFdzaqyYQRkB0ztzXMHxUtcTR635+M69SdJtfGyu+TdG4WX4xusaaTZOP
 0035qVOMfD00wYvcwCwFsam194oXcLh9CVLF1VA5rbbvFdrHzpnmBTvHbNEXyxKZCXY9
 60KJjaJzhPPDiNW8p+nH4+14rcoWrQjmklJPKE6QKFZF9IPQgx7OMipsdyocbWB2rcxq
 jBzT8HiZGswcBOMAPkL33HVTfXcvcb7Pu7+4b0oDJwgkYQRoeNMYmbi6sElH0+eg1e6O
 9qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=6dwYoSzBWTgVH4VPfd0vRvpSS0WpanLJf1cAfcT8WVE=;
 b=QPq3VixCoRHJ9ZLmUz2pSZJ7w/iMcxOJdlKXMSfuXFO30eMGYzdB4kPTrvfRhz3+wP
 /vMVbtCH3Z117pv6drFElZyhSAjd3OEvkMHloHbssmvEz9oICA0f4emrLXhlcE9lyT1G
 aM8PSIC7jSOmi+uTvQK7zxfjngnC1OXA+5qGkI03cPwruTRrAkaf/2pbtW1s4Ge3/taN
 AAOXaeUE24M/DpClTzJSBRzq6w/enSUjpajmpDdPMklfsVQo/cKoEyW1F8noQO7oeqzd
 HsaG8l/wokWyCtbatL8xlF38RIWDFXOhSc+3dnBwVD0CWKgjvfQ7ZlVvCnFk0eudL3uz
 ZVfA==
X-Gm-Message-State: ACgBeo0VeJUpzvtDFoIoORgXP0dDShlM/jF/dNT31f1LI/pLgidUol0J
 GPKn9h6cZ8U05XKzQzWsr3E=
X-Google-Smtp-Source: AA6agR5j2bumrS8yQTFdFOlxVQl3bPweHd6piXFx+fYyA15xiu7ajotYbjzZlCe6B7snm2hqAK6z+A==
X-Received: by 2002:a17:903:1ce:b0:16f:1c1f:50e5 with SMTP id
 e14-20020a17090301ce00b0016f1c1f50e5mr1529172plh.132.1660261153570; 
 Thu, 11 Aug 2022 16:39:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170903405200b0016dc2366722sm234931pla.77.2022.08.11.16.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:39:12 -0700 (PDT)
Message-ID: <9100b26b-1aa2-2e52-dd91-3aa2071bdfa0@amsat.org>
Date: Fri, 12 Aug 2022 01:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 4/8] cputlb: used cached CPUClass in our hot-paths
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-5-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/8/22 17:14, Alex Bennée wrote:
>    Before: 35.912 s ±  0.168 s
>    After: 35.565 s ±  0.087 s
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/cputlb.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

s/used/use/ in subject (also previous patch).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

