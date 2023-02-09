Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60998690A66
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:37:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ771-0001HE-MR; Thu, 09 Feb 2023 08:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ76z-0001Go-OT
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:37:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ76y-0002vP-8W
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:37:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id j25so1793418wrc.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 05:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MpcFGg9LiDkUttsnwLoM8lSjHqGkugtXSq/nW0usykg=;
 b=rhkkr+hJc3iuWtyUMDJZ9MnSDcZxyeCEVlyxP3hYSvBiPIUZZPOIWU8OHZjSEzmRdm
 F3HoFNGYp+6EXeEkRtDOcF16ZGMvMMcbG91dSzu66CDrNf0TblM7/0h+1OyKSDmENZKb
 gt6efcch13i4liv+jnTrP350DuiQhDPDWEmfEChRZNTV3FySqm3VQww8YKoY2/VNfTJO
 atzBy/RZcl9Y3/k1EsqafGfL0GFH//6Xyr+YwJpOc53qxuLTpP2xzEECPJtojvSWwdKT
 QVQnC+AJb0Z/ae7zsuHpm3zmN4zWme2jWS2oyvHrc1+WBL5q1tQHBEQvVR4kbpY6abj/
 UUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MpcFGg9LiDkUttsnwLoM8lSjHqGkugtXSq/nW0usykg=;
 b=S+2mGlCvixJokVZ+uAbX6hOI6x1GsyoFaMe6/XCJ3Qzu81/yBL5OnBhmYdHxLZGvIk
 jzqbi8OzThuRE/NKYUj7R8wjlttPoZvxtUHWl7eQO2Matgsufxd4m/HhLoZFRu8pP9uP
 EbpNvrPYmSrdRRVuMDwhjd9Lr1hJHzN9Vea6X4jkWfrpuAkK+W7ZNsmQvrQuPBshE7TR
 uxp2UwfHcHU+kitFeOZa73h6j+ZlL3FB9ZRFfW7MU5l6adZfG0d+H3b5lLMfisV9Sg96
 HMNnTNYf3joL17pByBHsSQI6UFLjsRpmAuC84upUUAyc+LTcXi909pOD11xaib4iY1OW
 SVOw==
X-Gm-Message-State: AO0yUKUb+QD6QaAeoHenekI7Cvi1pNdS33mS6HkSdl3HXVFa1g05KAlD
 6EoIUk2yPW21KRKx2fv7A+f11g==
X-Google-Smtp-Source: AK7set8reuK42stuH4uAMZgrDjQn7i8U079vpP3hjSI4Mvdrp7dGaySoDY1NOSPP6xtBSXdOXKcL7Q==
X-Received: by 2002:adf:e9cc:0:b0:2c5:3ccf:e99a with SMTP id
 l12-20020adfe9cc000000b002c53ccfe99amr1521607wrn.6.1675949834590; 
 Thu, 09 Feb 2023 05:37:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y1-20020a5d4ac1000000b002c3be6ae0b1sm1265070wrs.65.2023.02.09.05.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 05:37:12 -0800 (PST)
Message-ID: <978accff-b1bc-1a16-7c4f-6fd8d82f8338@linaro.org>
Date: Thu, 9 Feb 2023 14:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 1/2] migration: Split ram_bytes_total_common() in two
 functions
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230209122610.30712-1-quintela@redhat.com>
 <20230209122610.30712-2-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209122610.30712-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/2/23 13:26, Juan Quintela wrote:
> It is just a big if in the middle of the function, and we need two
> functions anways.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> Reindent to make Phillipe happy (and CODING_STYLE)
> ---
>   migration/ram.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


