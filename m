Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1AA4C7E1F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 00:08:30 +0100 (CET)
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOp81-0002Mg-VL
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 18:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOp6R-0000sr-GS
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:06:51 -0500
Received: from [2607:f8b0:4864:20::42e] (port=40580
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOp6Q-0005P9-5t
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:06:51 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z15so12435158pfe.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 15:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kjCT0v3LnvXEKTKxnqxb3xxeBlZI7ey0LpfjYpeubjo=;
 b=ZGzdOKFEfwJwwKuI2Ann64niYgoV+MhX/lE4F+s/d/uCHKttakzkUEU5z20XrNEYXX
 oMeyv0p7/tJVCKcHc8psICe5NwXwvzipD/Z3TwWaCw4UttS13TNl8RJxVV3WrgBAMcgr
 TAcHQlmJFcU0uUjw+4fz+FjITP7PG3DhzrAZQ9ljmJSXit1QcDs58f2FNE00rXUl/0Sm
 5uO1CVauuuu4btgrd2P4F5lkBkPF3hdZj+tiofOxVTCvtIn0jviC9iqOg3jXPnZus5Zn
 UuxI3hNYDdQnMXOV2tvHWeMiFloya7q1RKv7kxhyQQFtpyuy9mUvsM0fUY0b8Ywf3O8z
 s7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjCT0v3LnvXEKTKxnqxb3xxeBlZI7ey0LpfjYpeubjo=;
 b=bbnAvygZb++yXPWsqNWTj9WvjQ8axdgzYDS85mfmhhZzlniXIPyNMn+1+V5SQI6n7x
 0HYL2rzHaX3lwUsP32TafSdmNb/6WLFGH0qC2OPizVhaSKXmfVIAKSQQGSQ5MjPsM1+R
 TM1lDNDAxau3u5nj5wGY5jDxJeZNJGMs34UZF5sZhHdlwARd6CBdQh1doqRYBUckDtCa
 z3Rjo45F2Av98xSMTbQKIexzf2KiHqDF23C8Tf3dMCyUzzU3s7sP868UVCOGtKYLI3sJ
 4FHbemrLUnlcriEngm2vA9h6A7O/JwzoQyjdin3SHhlrPmy8IFOVaUAnAAJKwsYSMvwE
 ezuA==
X-Gm-Message-State: AOAM530RgLC4n+g5YFLOUX7A2JTV3HMLCVyVdYnrSGq2MXF3KwZuHjfA
 VsYoRfiDfge3X5zapKnPIzE=
X-Google-Smtp-Source: ABdhPJzMtNSYUEPB025sYFEyRshsNKvCym7E5UmJ25DIOMZQku5YWeq2RhCu4X/Cbhr+4O74JmoOYA==
X-Received: by 2002:a63:44c:0:b0:373:a7aa:9267 with SMTP id
 73-20020a63044c000000b00373a7aa9267mr19114957pge.107.1646089608999; 
 Mon, 28 Feb 2022 15:06:48 -0800 (PST)
Received: from [192.168.1.115] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00170200b004e0f0c0e13esm14317628pfc.66.2022.02.28.15.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 15:06:48 -0800 (PST)
Message-ID: <d00abb4e-4a0b-d48c-1eee-de44d4878453@gmail.com>
Date: Tue, 1 Mar 2022 00:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 07/10] esp: introduce esp_pdma_cb() function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 pbonzini@redhat.com, fam@euphon.net, qemu-devel@nongnu.org
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
 <20220228222527.8234-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228222527.8234-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 23:25, Mark Cave-Ayland wrote:
> This function is to be used to execute the current PDMA callback rather than
> dereferencing the ESPState pdma_cb function pointer directly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

