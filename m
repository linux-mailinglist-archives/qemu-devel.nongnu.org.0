Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E551FE04
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:21:15 +0200 (CEST)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3K6-0000Y7-7w
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vf-0000vx-OQ; Mon, 09 May 2022 08:56:03 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2ve-0003Sy-8o; Mon, 09 May 2022 08:55:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id bo5so12166788pfb.4;
 Mon, 09 May 2022 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3xRskkMzsNP+opBZJ/hVCwrOgu52YA+x9XqJRMcvXM=;
 b=nGC3Ny0VOEjKn73B3O96Xm021SoJLWHfrVvCtQHRMLxfDXAuHar5pQ9peasSEhZRSR
 YKbyqmctyHJkSSHE5e07gH6TB6zWSV90OURESnLyUpIYTm8UqtIOrZUgopE/CEHULGcT
 6OS0EvyqDZ702uu8EST02nX/AhrxhJiyXZbRa/SyxWCnEbutFhsOCT45FOZVxza7oUgT
 zkzedyHDYAWWhsYabRSmzCbsAneR/LwF9O5cGHGLf905UA4FT9Pj4Fs5EDMw6dtHq3G7
 X0odkWkEOi3zblDHQb66OmGY1wPWkQ81JdAmH0NxjXidg+4wg3acfuYJ1qbLRnHkGhwo
 VwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3xRskkMzsNP+opBZJ/hVCwrOgu52YA+x9XqJRMcvXM=;
 b=oZXmftsD3a+3PLYAGA8Zk5Jr9TGvBv2j7kA2sjs0yPW7CPb5EszPF6q5EnxBkR9D6D
 KkPXEEahQG81Wfj88I7CQGyEHh7VzmlTxR2s/aKr3yL75CtDCAIEuCIW/qL2ecAzmM1B
 nWvmZ3jbaU3ArMU+4m0N+NiImHEZKeHg/Ju6O1O00uvFWgA2D8N2BBE7X72+CH17YlaL
 VQC5gMzYOaI7Gcm5Zsf2IOHcI0WSdaNdyvyHbCLZlYKRsA8cxLItB36zVmYhLS8SkyZY
 cUQ+wRyYb2N/nGHWRhy+sKgO4ffb6U9Khiw8RhegE9OOGPWKxMTkny1A1h7A3xv5Od5N
 XOtA==
X-Gm-Message-State: AOAM532H4N7NHjxEioSk8N7H/8RPJzSu/ZEThWOvHzXucgPVvFl1Cfh8
 HmtyrfJ8q1loqmezd/MJCLQ=
X-Google-Smtp-Source: ABdhPJwg/rGiFsK8NxyKdGHudwaHr/TmhDal+TKzZ6XnNNy9xx5XsbTYnOO2KuzinkscyllVQNO9hw==
X-Received: by 2002:a63:4e61:0:b0:3c6:9e14:5511 with SMTP id
 o33-20020a634e61000000b003c69e145511mr6561462pgl.446.1652100956714; 
 Mon, 09 May 2022 05:55:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i21-20020aa79095000000b0050dc76281ddsm8540378pfa.183.2022.05.09.05.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:55:56 -0700 (PDT)
Message-ID: <88b70fbc-637d-95e8-49df-d551a9f10685@amsat.org>
Date: Mon, 9 May 2022 14:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 05/11] hw/i386/pc: Unexport functions used only internally
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-6-shentey@gmail.com>
In-Reply-To: <20220505161805.11116-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/5/22 18:17, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc.c         | 4 ++--
>   include/hw/i386/pc.h | 3 ---
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

