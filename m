Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038584E56B2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:44:32 +0100 (CET)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX463-000579-3q
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:44:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX3yk-0000aE-GX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:36:58 -0400
Received: from [2607:f8b0:4864:20::629] (port=35425
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX3yh-0001zl-Qv
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:36:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id n15so2044647plh.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZN8QmKaMxETdymVRSy4kKVVI8TUWqQ9z+Hbf83oe9fA=;
 b=fU4PqgwYyItpO75O5yqhGPLMG8/yu0iihFiP604RFWSqIpCV/D3i6cWBnEWX/2xokW
 H4TcIY9tjmVTSvg5/MTR2gimt+ssgmEPvGnPiSABsU67qHGKW6wciV6ESypPebIf5vQA
 LErhtUEPMB8MaCSg53/Es0BV9lClC1KArssS42fM0VzszyIECOVYrCsN6f8V2jTyESgI
 rlJdy/5GYyaZ2Eeu3H4LUiHDZU/Zb9mBfIFyR6poHWkxgsoQcpg0NiASJtWF6I1oDgpi
 zr/FvDB//7EuLg8Tl3qtFCeucwMe+dhGG4kwAhoWNTOaRdrAIFjjuewK/nylS1Dqlg8k
 LaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZN8QmKaMxETdymVRSy4kKVVI8TUWqQ9z+Hbf83oe9fA=;
 b=vmELJgMwB7qM0XO33WH2CPH3xilpI5poT+8IznPIVUH0LPOGG62pOdY5DXZSHGNYT3
 rSQyZfyUzdmLCnieV8TGwrb9A8RhkobOvfhKm5ZLTvaeEu4Vw7HbMS5D6LI9OazugbBc
 K9NLA2BUCMrFBzKGv5kOsssJF0YOiyzxixVC0OxKXqn32jTIdbV/cc/faArqEjifRY5c
 /nGj1zI6bZu8a0FQc7zVyx+QvKBCXbtmxhTqzxsTS50rKdQJ7/F6vAGVt9r6LnGaQ/x+
 F/UryiE3P9FLQ8XpUKlWLx5g8WGMYSXzxo/NZU/outPchFiQIkl7sv0wDUznvAXaQESN
 EQNw==
X-Gm-Message-State: AOAM533bI0tDA4rSG5+QGS2atReeHO/xIJnXVjGw7IaHnqjmis+misx+
 Uj6GQ/bMlw/LqhjThx/860EeLQ==
X-Google-Smtp-Source: ABdhPJyRpSvJ2E1dA80QnX2FSQgmH7/+vQo9lryxbdQTqmOPlzSYq2IOKnJa5ss4hR2D2hL7rXMctw==
X-Received: by 2002:a17:902:b697:b0:151:4c2e:48be with SMTP id
 c23-20020a170902b69700b001514c2e48bemr821448pls.70.1648053413449; 
 Wed, 23 Mar 2022 09:36:53 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a63b14c000000b00384332d9026sm289434pgp.23.2022.03.23.09.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 09:36:52 -0700 (PDT)
Message-ID: <df1b5e3d-01f7-72f1-563f-6f6f82e59482@linaro.org>
Date: Wed, 23 Mar 2022 09:36:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL for-7.1 09/36] util/log: Remove qemu_log_vprintf
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-10-richard.henderson@linaro.org>
 <87bkxw6bh6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87bkxw6bh6.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 06:32, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> This function is no longer used.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I don't know why but this patch failed to apply automatically.

Yeah, I saw a conflict on rebase.


r~

