Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81151EAE6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:24:40 +0200 (CEST)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWb9-0005Qo-G0
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWaB-0004mH-FH
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:23:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWa9-0001L7-UZ
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:23:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id i17so10917806pla.10
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=VL3ekentXvxB9zP57YAJbrX4AtRhETZgLJUMp1C4hnQ=;
 b=kIQsSgDs2yyUsB3ko/3JhZQ7FwDab/SQFF25nd8UJEvegJfVs/Zio1KERuz3zWeZ+3
 9la0L2vEG+8BXGTKbROaIrVwzRtA3qa0yAWRKOO7KN0NA7sENnY/ekiduS5o/1OLxgBc
 0D/Ocq2evuZFGw+OoxCPYZ4mLCYjKNGzi5/z7shjX/vF1PAmJSJ0i6I/sbZpAtz8dJu6
 Jl1X/UQ9M/maENyXepug9KVDBLvGIERlbXrUxBKSQ7UdR6Xw7S/D7505+uuQHefjgIn/
 J6r2p7pLb4fbLxQN13SLU65Jol4OiPu+hR3f9SadtAwyTH53BMF7MGSCC4Ymzm15n/ko
 45Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VL3ekentXvxB9zP57YAJbrX4AtRhETZgLJUMp1C4hnQ=;
 b=cT3UDhYPHAVB389rh4Zwea+oQRgqNNfOapfWGI/Y/CVwa+ucBCFYg0Xw3LprE7cRxn
 rrV9YH/Fjw6+gbQ0qH5o9JzMgY9V6emAkQ6ieGSG7VlLeNkAcy2QI2+7NvioYGD+ngR5
 R2wlaU4im0VsQcR+i1nDHDUVdzsajZjCMKL8gH+YhUa2XLQZlZwt39IKNs9bV6sq90EV
 ++o3PXcoZJtXWWEuSqBKWv2/Sx4Iabkw9EW0MqQKJqxCeD2xKMiplAKkymd3rN57vzJx
 Y3QbyZlOJp2ahAqkUXTlEjkEANGDJyD94uggdE/RXqIrh8K9m4xuQvfsWm+wB8xmeVJd
 6Aig==
X-Gm-Message-State: AOAM531l45Fj2S2M/ej7tqgvRXI1ud8s9ILPOoHGLkQCKO7YG7y8z838
 Z/NeKpiQpY9tePrWso9csNsCKw==
X-Google-Smtp-Source: ABdhPJwkrWSxJrzNahE5yilfwWKuBvfjyMVelir0tuyL3hLZy2/8t2UqhybM3juGwJDILTA7jmgb9Q==
X-Received: by 2002:a17:903:120f:b0:15f:99f:9597 with SMTP id
 l15-20020a170903120f00b0015f099f9597mr1124343plh.45.1651976616481; 
 Sat, 07 May 2022 19:23:36 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 f4-20020a170902e98400b0015e8d4eb28csm4242375plb.214.2022.05.07.19.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:23:35 -0700 (PDT)
Message-ID: <265c635c-9898-47ec-fcdd-90399c2ce30c@linaro.org>
Date: Sat, 7 May 2022 21:23:33 -0500
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

