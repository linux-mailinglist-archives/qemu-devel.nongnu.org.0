Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1D4E3BDF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:45:50 +0100 (CET)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWb5J-00038Q-CV
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:45:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWb2a-0000zx-TK
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:43:00 -0400
Received: from [2a00:1450:4864:20::331] (port=34575
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWb2Z-0007ag-AG
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:43:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o30-20020a05600c511e00b0038c9cfb79cbso1045987wms.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YCY9a/a4MenThFfNJZyyscCdaTif3ka8so6/WuXcoC0=;
 b=QxuT9aOzzkBJ+lJW+05L0kIWoCXtrgTnC2q5M6dZsafW1MQOlEbiPQre8OzIMuPE27
 7qcS0WlQLrNptXoLVOhShkYvnI0rm3iRMeYLWFIfCQiX3zRPByur21+pah8g2uTHeqF4
 59bzoJ1KKMXrsC8+AgJjqt5rtA0eR7gDdC/iTBiwDIX9qjaGf+NIimhvMyLkSdOvV1Yl
 3ZJQJO93XQN6Zh4lAMt5d75Nz1AW2OQx1ENrtW7EdD7JGa5cSPTCG/XTeGoWyhat5ZZ7
 Z1c9q7g4f4goX8frYQkfSUsl+LrdEQTHO8zirNNUo8lWeKODLw8fdbZtU6/+alMaY+4v
 fymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YCY9a/a4MenThFfNJZyyscCdaTif3ka8so6/WuXcoC0=;
 b=OVygpHt163EbOCJVtu84MfDwv7VpOxlesmujqem1Ats3JZIGlkRefml+So0jqvCuyj
 erOiYmQYqT6wCqpIrC391+1urBH/D0GDtndQjU3eD375zbrDvyI4GK5JeM52BshzU6EI
 FIX+EAd8QCNi6DJxOS1AbYmkG3O1q5wqLAjQqQ1zUWMdP7Wy23bIq1cTilVZc3HFtPah
 kY6rNaGmZRIplMwWitI1i+YrOpDFuVEnQ27UeW8fR+fG2vLFKGVTYYsa0oGHtNqDmS6X
 H6/tnKO1uouKZbi5IDSwyJnGlhqkPT8H9EwAdpKV3ki3U4c+818EqWNcFm7nilAEzS6H
 jtJg==
X-Gm-Message-State: AOAM532zWxvDwlLQq2n1DTUmX7fHWtyjadr0NoOXvdjo/aGkeWTDklJc
 KLy7rkNdLkzYSqcpkyAh36o=
X-Google-Smtp-Source: ABdhPJzJJk01qsZsDWQJGGi9bxwuhAEC3Cz0geeAa2yliGRq+rvNOeOwZ9lHDeOVp8gMrxAys/K7RQ==
X-Received: by 2002:a5d:47cf:0:b0:203:edf6:480a with SMTP id
 o15-20020a5d47cf000000b00203edf6480amr19201461wrc.415.1647942177823; 
 Tue, 22 Mar 2022 02:42:57 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm1468849wmc.25.2022.03.22.02.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:42:57 -0700 (PDT)
Message-ID: <d5199035-2c98-d577-e6db-79df2778ae2f@gmail.com>
Date: Tue, 22 Mar 2022 10:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] audio/mixeng: Do not declare unused variables
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220316061053.60587-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316061053.60587-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 07:10, Akihiko Odaki wrote:
> The unused variables when FLOAT_MIXENG is defined caused warnings on
> Apple clang version 13.1.6 (clang-1316.0.21.2).
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   audio/mixeng.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

FWIW this patch is already in the tree as commit 832061a2fa.

