Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC351EAEE
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:35:15 +0200 (CEST)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWlO-0007Lt-PF
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWjc-0006eF-8P
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:33:24 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWja-0002hw-Oh
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:33:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n8so10957127plh.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=VL3ekentXvxB9zP57YAJbrX4AtRhETZgLJUMp1C4hnQ=;
 b=P3xh6aUbI9GZr4GlTIv1NhSHGKzXFeTs1Sih49zizJ61gxmWx7m1pkcZralhq+bish
 gQ2eT/HYvBYiOpHuA2csQdDY7UlTeg7InEdqqrrFf1EhIDRg/PXIYfLs4eyQjGzWfZLy
 Gs638WjSTTxc+cHCKL5zVbV9PLrqcTSfUiizczMIyjzvrlfWtF6SQlhG8lG1eBvOa2Ug
 Zrwf84W4B/csLzDqd+KGf+pyO7fQp8ozOewp26cnY1kkTYsBCF11WVpFwh3NwPQUtOLY
 IHdQXuhdIhDTdNlFyjHrC7000ocA/5HPmSkyWvaEKR3mbodoPHt69ELCPQgr/ZtiIHxE
 Owug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VL3ekentXvxB9zP57YAJbrX4AtRhETZgLJUMp1C4hnQ=;
 b=YLOQQywTriCecFP4ncRfjIqp260AxKEINVu8J3YoexO8EvSArR2tKVH8d5ix4sNX7A
 dxCGnRsfBc2pbrXIoBTW76Dph5GvOgHXsbSsmerEYCF3uex4BxE+TVXpadl7efpuOQbs
 ZRqu3Ng50bm1RJdX/EuMrHC3kslYZA2X2aHyv6T2+M0f7+J5kgeG44Ar8GpgSYCalicg
 GrR3nnIYf+H6O7cSLux4YAWIyPi4Oz22lsTK+TdDcGds4D2wWZmyoKxe8ltq7v5CrwLJ
 qgyvF5/Gvo+r79SYHpjtO4A5AV1KJIqmKfZpuBTryqHiZVioOOxOWB7r7BDmwn15lyOG
 Kbfg==
X-Gm-Message-State: AOAM532OVlahpnyVT9efj+npPNfAiLDJVcKE3JE5ndneVIjGeIhiwzdW
 vZayov7u7DKwif/nRN+uVh1zMQ==
X-Google-Smtp-Source: ABdhPJzlgr8EFO6EWGnj+YGmI6BncfD7FNTwves+POcHb98T+a/NcnvgYNHjZp6j46ed34l4kpRmXQ==
X-Received: by 2002:a17:902:ecc8:b0:15e:9e46:cb7e with SMTP id
 a8-20020a170902ecc800b0015e9e46cb7emr10286231plh.111.1651977201163; 
 Sat, 07 May 2022 19:33:21 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 u6-20020a17090ae00600b001daac75511esm9801529pjy.51.2022.05.07.19.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:33:20 -0700 (PDT)
Message-ID: <aed2671b-54c2-2010-296d-4dcb1267313d@linaro.org>
Date: Sat, 7 May 2022 21:33:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 31/50] lasi: fix serial port initialisation
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-32-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-32-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> The existing code checks for serial_hd(1) but sets the LASI serial port chardev
> to serial_hd(0). Use serial_hd(1) for the LASI serial port and also set the
> serial port endian to DEVICE_BIG_ENDIAN (which also matches the endian of the
> existing serial port).
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

