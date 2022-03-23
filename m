Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E094E5AB3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:32:59 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8bC-0005bo-C5
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:32:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8Zi-0004QQ-W6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:31:27 -0400
Received: from [2607:f8b0:4864:20::52e] (port=34319
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8Zh-0008Hl-Ap
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:31:26 -0400
Received: by mail-pg1-x52e.google.com with SMTP id i184so2247496pgc.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ONUlt3nfYycNwnA5dv7YEY0yd9Ti+YJ6EdPvDjz7TQg=;
 b=K5A4DaUhmSlSNFFtzD/nkbg4ElqiEKSeVOqFuinu8p5FGkzFc4f5OOiV6iA4jaozca
 1+tCrntLl0lgvMOh5XVTbeIHAjMBdsr7IVWN2h1uskscl0V//kWhlK9FiOoEZv6VOjyf
 AOmivZK+eHzM62KfiPXTR1BqMGN2XpOfU/a4tVJ0HQeNt6uQURC/H3RRGKDuQxuzGCdT
 oyzRV+BwCWEF5nXBC+whZnQ28vypYzJ7KkD7bBMDdhk3vSlA4b/CVScztESLhwuhQevz
 OV/k+62eACe0mm2BERvFpnLGfot2/9Lqg1mm9wkh5Z5uyhs3Qamr4Ny56J0+dph/rTiP
 e8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ONUlt3nfYycNwnA5dv7YEY0yd9Ti+YJ6EdPvDjz7TQg=;
 b=VHdUXYGgXabBs++b+BmhOFON1utnZMmYU7daalT2CzLuF/Dbh9MR8Y52SzPC3uJs//
 7U8GoV8hmI5ab72SfjwDC8n+KeSMU67Yzlxa8D0fZXNbRHQ6bOvNklGKz4RqW3ig6OWF
 kB55oYgv296cXgEtkbPu5vbZ/n2JUG6ap/ETPkffoSESWzWRgzJGKfDlFL+fg8vr5pj5
 wQSTM8VQgHV7DYYR6DpA2joAFF97DMGQVMlFFTEagNsP6MSemeS1V8PVDsXHeWmNO3Dg
 m43U9u9oHPNPeuuN2giYLhrcASSQ5QSVwnETYRuOTOnX0/VmivLCDMOGrO9Pzq5qbkFS
 doag==
X-Gm-Message-State: AOAM530vzP+rksNDPhHTwQx0hdCDYpko4NucU6JBmrbKkBeJ1yiXUccw
 BjEgGiSUdZqgXBm1C1eotzQ2rA==
X-Google-Smtp-Source: ABdhPJyJAkxOPD2Wcn/eAqWav8UuNdPvK8Ty4WDT2jkWdc3QD6vEM/YakccWat7+MbTY47bcG9Q7Mg==
X-Received: by 2002:a63:4005:0:b0:373:9ac7:fec1 with SMTP id
 n5-20020a634005000000b003739ac7fec1mr1458008pga.12.1648071083883; 
 Wed, 23 Mar 2022 14:31:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056a001ad300b004f7661b0b5esm752671pfv.215.2022.03.23.14.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:31:23 -0700 (PDT)
Message-ID: <75a66325-ca68-04b9-eff0-3b18605adeea@linaro.org>
Date: Wed, 23 Mar 2022 14:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 06/13] accel/tcg: Reorganize tcg_accel_ops_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Reorg TCG AccelOpsClass initialization to emphasis icount
> mode share more code with single-threaded TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/tcg-accel-ops.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

