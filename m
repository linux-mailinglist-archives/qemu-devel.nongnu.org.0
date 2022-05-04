Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F751A60A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:48:58 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIBN-0001UV-Nh
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6P-0002c6-Ah
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:49 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6N-00085f-OK
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:49 -0400
Received: by mail-oi1-x22a.google.com with SMTP id m11so1716536oib.11
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=t3wGIEMTtGR7N7hjQqL2Idm89vNHgLu40SxrswcBDoc=;
 b=k73dpYgRNR1eMc3c1y0Gqv2gNyB6LyE2ewIonAzNB/RZ8lQZS2eax0ar6GigXwXwM9
 yc4q1Sf7xwaV2wLUgFsmVrsJl+fqMKTO+Hhwo36nqCmTBN9dXyQ4aUqaBTMHlhlQA6IW
 Y04iz/lTXx997zsEaXX0qkBXtgCv1Bb0BKq8OJv03OpORahsfMWFK3EPP0ePwak2wLF+
 oY72OmIE8lucFS9k8VXb0OrjL0WIx1iC9j/vhpqaJaijaCgmeFO7LMkfG8n+xW0r9hKs
 ET5nV44/OHAh40OK8aW3dHfKI6lvTe2tBC9ZhZzEaLqlzPhpuKc2adjHbObyexm8dG5C
 BCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t3wGIEMTtGR7N7hjQqL2Idm89vNHgLu40SxrswcBDoc=;
 b=ADDfvQZKL8HfxxHF2izfmaIgOXO2NvL/k+10cCLHPEDDika4IEJow9YYhTnxjX82Ne
 7/B4uoYX/Icj+C0Nf/LHOw2jaLdRt4imWfGV8/1k46u53YApHswI1htB2dsyOY5JBrkg
 DEOQQAI7kCfqs9SMsUyR15R/6SRdi+qIHpVBZH0GYl+zECuXv/9bvNcpx23d2wdn1e9M
 vqe98C2o7SEjQEv7yXtgA0Ra2K5TX77os6LXoSsVqHokjXDzCpRbxw2Pxn1i121/gSss
 i8J7EPJRMiysH7CJlK0xd9qicmmthYgfA0ZbewuVCrtFzg8bHSBcdx9rKo6zY7hCgA6n
 O06g==
X-Gm-Message-State: AOAM530vOj4Fu1XxTCKDESP/5bAyKjq+gFv6kzuXE3XSwIxnfONvQIMq
 +EOemUDRAOb+bpCOpr5qRRrv523pawL4qQ==
X-Google-Smtp-Source: ABdhPJzPOswHC5XJRh6CvGLk42rdH6nLNlrLVUDaLySpfqpAnvezEPqO/SfZhJ5rKc/MZqWMsLTbrQ==
X-Received: by 2002:aca:c182:0:b0:2ef:8fd4:7523 with SMTP id
 r124-20020acac182000000b002ef8fd47523mr175230oif.148.1651682626610; 
 Wed, 04 May 2022 09:43:46 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a0568301d4400b0060603221248sm5347953oth.24.2022.05.04.09.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:46 -0700 (PDT)
Message-ID: <7f40f9d8-3d14-31fe-c05f-5921dbf61fd4@linaro.org>
Date: Wed, 4 May 2022 10:44:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 02/50] dino: move registers from dino_init() to
 DINO_PCI_BRIDGE init function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-3-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 44 +++++++++++++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

