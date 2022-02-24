Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0B4C2DB8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:59:59 +0100 (CET)
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEf0-0001B4-Ko
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEd7-00089J-Ce
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:58:01 -0500
Received: from [2607:f8b0:4864:20::42f] (port=33724
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEd5-00055R-9V
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:58:01 -0500
Received: by mail-pf1-x42f.google.com with SMTP id d17so1978040pfl.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HuSAMQd1Y3MnuD4XKB9Iav8CMCPh73vhsssF86HBcDY=;
 b=iYx3moiyV7IHo1dGoikStbaWZwFDtyNBJ1d7Gmo2kEHRFiOpA6GoZS5UKdbO6ry89O
 AXnG2uxk1IdEh0HxPFdid82RN5y9x6n4cNoQhys9oPBtru2x32urtNR819/I3d6dXcM2
 l/Wn8R5Nk2ehZooioFURXJ/f269W7BflsjHFn6YwNJOmR82N8lbn+TkcejNiDxIdQBoA
 yG7B9r2znl6DyLpPKbGXYHgjnhBkAsesthntZQaU7/SZm7NPQEndQk0EYpdPtvBPBMuO
 ByVyAzMF8ckIMogy0riA2v+uA7ZWVt5S4awu9lwGUXdPfZ2VjuT8ThB8++pSdPxsBIlR
 GDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HuSAMQd1Y3MnuD4XKB9Iav8CMCPh73vhsssF86HBcDY=;
 b=kNpe1EXkE9td6UAvw77MVmW/LxfvcpANu5lmnolo84cAcWG1SY/nsOlr52VKF03+Ey
 tzB3ZyK774z8ome1HcejizNAIwEhG2Gt5XXQIa1M0T87yOzE6QDhsSNWMhGgvmRAIJib
 qyZGpEw5lnwKA25CIMJd6uE4TWvPwtX8lLTgXQeUEq2ek1ko5OwQyEBZhnBVcU/fq59C
 EivUVFbzi52bK64PebcEC2jQqVWN7gsKjvRZ17G7Klvy6pAlQAOX7BBht4oz32FsznX5
 MOnIvPwPAxm5vYll0pAfjvBLlgavRH7pKqpNrRJe4e54mCgFy3UjEBoHGDOT4vXiZuu4
 tVKA==
X-Gm-Message-State: AOAM532Q/EcCecdPUG0sojmInoWzWWWrtTBoHFmWTr54PxGEylWY7Hd2
 HSkSFuf9qajhlTyZ281mGxc=
X-Google-Smtp-Source: ABdhPJwMvpojyT+MgL9+DTSG5EuZ1couAZwvw/UtFsYm8KpQAFiLPzhwhu7XQmdbMAuGP0HulD5GpQ==
X-Received: by 2002:a63:86:0:b0:36c:48e8:627e with SMTP id
 128-20020a630086000000b0036c48e8627emr2385141pga.53.1645711075915; 
 Thu, 24 Feb 2022 05:57:55 -0800 (PST)
Received: from [192.168.223.175] (140.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.140])
 by smtp.gmail.com with ESMTPSA id oj5sm2877830pjb.29.2022.02.24.05.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 05:57:55 -0800 (PST)
Message-ID: <24b7b66d-d2e9-c9bf-1ec7-91f6fe6de37e@gmail.com>
Date: Thu, 24 Feb 2022 14:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 03/12] mac_via: use IFR bit flag constants for VIA2 IRQs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220224115956.29997-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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

On 24/2/22 12:59, Mark Cave-Ayland wrote:
> This allows us to easily see how the physical control lines are mapped to the
> IFR bit flags.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/misc/mac_via.h | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

