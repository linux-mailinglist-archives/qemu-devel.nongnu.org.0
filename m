Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B775681FD0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:44:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdpN-00046A-Hi; Mon, 30 Jan 2023 18:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdpL-00044O-2X
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:44:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdpJ-0002lk-II
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:44:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id q10so12733749wrm.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6y6m+GczQjA3miyvKwryPuhRdBpkPVhYWI3D0Dz8nY=;
 b=sGGkoXCvk0UAFB4qphRxtUv1saJIycZg+r1KKBIQR9RpH+5enC5J6d2fN+K9QLPocK
 bftIg2LGer7zeumxFCoNsJOo5ltHn29DAj4WUY3rKQkSDPboLYHEuXBoQ6dgCOltCSDY
 gb6nxoS3QuNDw0e1gW4RGGv8ShKR7rLR2g4jqSfO/aISrCFPggEKpBpYw14v62YcgS7h
 TCTdaCN73UEx7tGBL1g81PvTtYoe1MBRz9PbWkYeGTcTfd5uSkRE50mSUjDzr1UbQd6I
 A6ONRzqdrXobr6jKhL7XlDIpnYFsAskEiIV/oss1EV4cwyYyIxrincqKwmnA7g8lsddD
 gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6y6m+GczQjA3miyvKwryPuhRdBpkPVhYWI3D0Dz8nY=;
 b=TPYw9ASvSTryEkQ+TmQAzmd5oQmugCPFCvK05ZoV2ySSjkGEs3JLuMmCPGVhGS+aVQ
 7nGBX2PSsm9a972yL2Y2Qk9gxIzBxYYTTz9PQhD0nNOaJ9y5iI2uRcWT6Tj8jNjwVwJY
 2NK4TjC4BAOorb951zjBRUmBYwWPjfMyk2xjyncw2SgGNGQ18Va3uCs3nLKMxbca8z0i
 8F+rwrGSf6Yz/nsyo0mvEjOqTSa9jiKWOevjuCdDq/O2o6ipCLE3kgNgLCznZijEo2bM
 q1qy5CRCt2xUIudrRPgltUIg5StOSJFTnPe1aA9aq86UcGIJvQ+tVvm1YjfE8vZR0ymY
 swgA==
X-Gm-Message-State: AO0yUKW230w94Y+yroOPXd25ywDM7jol4IMiJbNBy9ZB1TpHZDTvsL3C
 cUM4axYJKi8I6t2s0NSIy3Ji7A==
X-Google-Smtp-Source: AK7set+j86A6UgAf0woRi6qCI3rJJ3CkyZ7QyB4iCbjHqJgMGOvq/NfpBtafFOu56//3tyJMlqgVBg==
X-Received: by 2002:a5d:5690:0:b0:2bb:ede4:5dd4 with SMTP id
 f16-20020a5d5690000000b002bbede45dd4mr1163870wrv.34.1675122280030; 
 Mon, 30 Jan 2023 15:44:40 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a5d44c4000000b002bfcc9d9607sm12066014wrr.68.2023.01.30.15.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:44:39 -0800 (PST)
Message-ID: <ac5db13c-79ab-0a60-ece3-6bdc1188fa14@linaro.org>
Date: Tue, 31 Jan 2023 00:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 24/27] target/xtensa: Don't use tcg_temp_local_new_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new_* is now identical, use those.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


