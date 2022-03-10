Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BC4D5156
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:48:48 +0100 (CET)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNqB-0003rC-0I
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSNmi-0002Y7-Jb
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:45:13 -0500
Received: from [2607:f8b0:4864:20::633] (port=42618
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSNmg-0008OQ-8b
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:45:11 -0500
Received: by mail-pl1-x633.google.com with SMTP id p17so5657724plo.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 10:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=498CSVltGMljIyX1aggoG/NM9Gg4XBqCcQAje7PluBE=;
 b=tNjrnrPq8XiR+VYduhmHlr+zOSMj4lKq7rToLkwN0RsOcUCKpSwq1SN7v86Ky17xsm
 Zuqu8A7HWK9YYGkoaib0Ji/iEwtEqNo4U2PhiM2kwiUco2X3OyaF3us58WQUZitaWUy9
 Ay1JNhfgGlX2laNZ56SpIfrmtYdkaJlBMui/Xiqh+ebDVH8c7kaMjxXrPE+FoojBo/Mn
 jfVHUWbM4a/IpITDBPqO4Xy3kzQAqD09O0vbwlmzmrErfZloOLYIADQd4eH7T421UNNQ
 nmWx4xWR2ucB0oIJxvXpKFr+EXBmjp4w2FXrK3xOw1ujmYmMT/DdHLX9OeR48c3Iqdjr
 3SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=498CSVltGMljIyX1aggoG/NM9Gg4XBqCcQAje7PluBE=;
 b=iehhh9p63AnhNpyvJK8EFnh4HtCyWQ4bIHO4f5M+luHV+v3lsP0DeY/dzwf5JX0Xbw
 LHPeAi1kc9TdoWfEOgw53LbnizfXnjyJQhBhXDGWeIapFtqOuqFoj/qawX73oQqRQSFb
 i+cgxr5nCcPwYOKZ6P6Rm24D3Z9x9MC5oCjHgPArIcEh57OzHFcBDN1XkPeJw4526wX7
 62VtUSkJ45pc49I3P7PDMsyL1p4f1pUdYrwQXFciqbGXfRlDfABwMSRLeE1Lz7WKUl85
 uoUvn5pY+9Aypw9lIFGDMg4V1gAP7VzPsJq0RT6Gio9Vag8PAPb5XtO7tVJUfFQmBgPn
 U0ag==
X-Gm-Message-State: AOAM533vFf3jgIVEXP639xHTG1agY+I3uHDZQAa4nrndV5UgHr6iLoIE
 Alg0mxK0IT0yQzdBAAJJqhI2vQ==
X-Google-Smtp-Source: ABdhPJyRYMPD4yljaLk9cP06AFxaj9UZTx9+lts4UtzQJqxn0t9h8VCP9GtuerboAojVkeS5uLITaA==
X-Received: by 2002:a17:902:ea12:b0:151:dbbd:aeb8 with SMTP id
 s18-20020a170902ea1200b00151dbbdaeb8mr6213137plg.157.1646937908408; 
 Thu, 10 Mar 2022 10:45:08 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm11460595pjb.51.2022.03.10.10.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 10:45:07 -0800 (PST)
Message-ID: <4fdb9043-1d05-dcac-3f7f-fdd84986b9ac@linaro.org>
Date: Thu, 10 Mar 2022 10:45:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 11/48] target/nios2: Do not zero the general registers
 on reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-12-richard.henderson@linaro.org>
 <CAFEAcA_5THfnvxkBG+7=z0h1qnj9feVJbJWaW5usV+KzoJo3cg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_5THfnvxkBG+7=z0h1qnj9feVJbJWaW5usV+KzoJo3cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 04:21, Peter Maydell wrote:
> On Thu, 10 Mar 2022 at 11:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The bulk of the general register set is undefined on reset.
> 
> They might be architecturally undefined, but for QEMU's
> purposes we want the state of the CPU on reset to be
> identical to the state it is in when QEMU is first started.

Ok, I've dropped this.

The intent had been to remove a user/sysemu difference when we get to introducing shadow 
regs, but it isn't that big of a deal.


r~

