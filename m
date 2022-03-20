Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13494E1E19
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:03:20 +0100 (CET)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3dv-0003gx-Op
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:03:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3aZ-0007kh-JE
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:59:52 -0400
Received: from [2a00:1450:4864:20::433] (port=41856
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3aY-0003od-9c
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:59:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id h23so17847517wrb.8
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RSvecjA/IN85mk1fwcnG8gkfqPpqrEwQwBYCrxk+7kU=;
 b=KdHnn535B1W6nnfi2KX1AxBhJnUmUGupjthXq6CNw4/nnbrobSWCroLabjJD1ZYuw8
 lN0Vkidm0N+o46p29A6Lt/YQ1yixRZ7nLn3SkIOXVnaEigtqBgtEwCOP9b1w7voXVcU2
 lWVY0C/WbtUOWe4petfukh5Vn42gtLyKJ+MczB68kbz/Ic5SiIfVibDWdTu90ny7exZr
 ohpDMgaXMKGgFVPQbq58I7WIS7GtHMTHdOhuuD+iK9CDT3ZopNDbDbltN3NM3cQ866bv
 Hol+Its0u3N6Jaep47WN3nOABr3N20BoXRPD9nbkHpH/J+74ATlGtH0GKei68JBL1nzh
 Vnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RSvecjA/IN85mk1fwcnG8gkfqPpqrEwQwBYCrxk+7kU=;
 b=sazE1npTZ5GyiANdE+IvmwqtTW9UzBecfkkbmwnccDgieAKu9VelsM6sLWv+5kzDto
 qdrW6HxZtgpusWIKB+2dtzf27dibWY9jhXOTiSrysBZSPByXtRbdeY+XCFS81aQVn3sY
 7fbEVteZ5ll4Lr2WFginiHxBlyf9iwkM7f+PCiWQQ17342dvbWnt7IM/A6OvWJu+nOrf
 zogjwGQE+ny7yDm9SbD7TXK3MM87dSTDv4R7INoCErZDjL7JRs8mcIKyxRWH07WnbEF8
 sg36vthwSGXHJhhEYRu4xGzuK4X27cEwWXEDm3WevU+EeM3yX/prQlejIR3WphLf+Iee
 JQ4A==
X-Gm-Message-State: AOAM531WnPIBrPCa0FsCcuXlyP4+ZOYE9AVxNkuWPqyf31+S3JCM+nk5
 rMi7tLPmBQbfraAVKOeYZlmqBRVyWkWUEA==
X-Google-Smtp-Source: ABdhPJy7wDV9UsA2Lta7IqsPhD8KeuqiNw6HGSgJkjBuAhQudpp+3gurzRJHpWNFcKzmAWiuti3Zlg==
X-Received: by 2002:adf:c54c:0:b0:203:ed16:2570 with SMTP id
 s12-20020adfc54c000000b00203ed162570mr13975365wrf.646.1647813589025; 
 Sun, 20 Mar 2022 14:59:49 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b00203e0735791sm11157139wrm.39.2022.03.20.14.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:59:48 -0700 (PDT)
Message-ID: <e2939d80-4c4e-0d56-0ed2-6581d8f453e0@gmail.com>
Date: Sun, 20 Mar 2022 22:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 29/36] util/log: Rename logfilename to
 global_filename
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> Rename to emphasize this is the file-scope global variable.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   util/log.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

