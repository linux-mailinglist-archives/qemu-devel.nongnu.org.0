Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E277D4E1E13
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:57:32 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3YK-0003mF-19
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:57:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3VY-0001uF-QU
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:54:40 -0400
Received: from [2a00:1450:4864:20::32e] (port=43653
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3VX-0000rx-B5
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:54:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so7483983wmq.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nWl3WV3Num559yQYwqO/SVXzzudP7046zVA15EDSh6c=;
 b=PIk1gwUvRaCjDyUUSI+ZJRYl/BPIAgv4tcg2JRLn7HWCtWtNMqEMa+ohwU58Q07J47
 2sm6AqzWj8fG1j7ZRU/9GSRxEnjb8a3F1I8DzyzMQnRruZd5LPqXRBaJ55KkRa6d5h7q
 MCMfRrslco4imxwmcoYEQfJ2SNEILB5cg5uWCmeQp91KzoFTx05SktFs3dDgGGAlmDwg
 RZSFsfGacjQnwRZpq+pKITQHFvqwatZ4MrWGS/IVe5ylddpRl/2r+E2ZmaO2u614XzmR
 cy7Sk3Yi0DW9Pr/V1BZpoJILGZ/5t36r9UwLhTYZmLIJSpWSsz4AkE3uysNjiO9os5GD
 2CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nWl3WV3Num559yQYwqO/SVXzzudP7046zVA15EDSh6c=;
 b=gOEe4z0QWR4pcLM1VQYmXD50AgJK2uY3SZA30D+VMjbthBEOEQ7uOvcYDCrpXF+9cU
 UIZHPo722rtV19RapQuC6vL2zyahGVxYY4TqWGQeMTumF7LnNLXN503OC3W4VmKHuVEa
 wGA/SE3XXMHQqdgqP1j3pIfUCN+97kKzeH+bhpgWZHBRoEGMBm9cqVRj93Ei2V1Pxzqg
 TJpCx+jkv1ZR5p5/Nz/VW9mb01fkF2eegF174MT2+zhcsXPjBOIDME9u2qoeKPSHMVUG
 1rf8huIHG3XEzyeoNPzOc29DGDTaWQAetd1qK1inZ1JpxPXQ6KcJJW/XjNzzo7U6ZMIr
 AhOA==
X-Gm-Message-State: AOAM5308PBMNczz1GWoURm2WJRPSoKSZz81CH2A/0THQB6lLwZwKMyr8
 RQZqO88+IdMUAFJnfDgTDagzuTh8P2W62A==
X-Google-Smtp-Source: ABdhPJwD+VCHlzzu6nZsC6kI9IJCfMDfoa4sJ5oNl3Q4MFP6DYNo+KXfAGoN8LbH3SALOs8M2Qy9Zg==
X-Received: by 2002:a05:600c:1c09:b0:389:d0a8:d3b7 with SMTP id
 j9-20020a05600c1c0900b00389d0a8d3b7mr16604017wms.92.1647813277973; 
 Sun, 20 Mar 2022 14:54:37 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfbd8d000000b002040daf5dffsm3275140wrh.18.2022.03.20.14.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:54:37 -0700 (PDT)
Message-ID: <d4b70afe-e5bb-714d-8a27-0f1051da22a4@gmail.com>
Date: Sun, 20 Mar 2022 22:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 14/36] target/nios2: Remove log_cpu_state from reset
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
> This is redundant with the logging done in cpu_common_reset.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/cpu.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

