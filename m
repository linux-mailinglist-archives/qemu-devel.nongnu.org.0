Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA176D9CD4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:56:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRy6-0001rV-AR; Thu, 06 Apr 2023 11:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkRy3-0001rF-W2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:56:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkRxy-00078L-7h
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:56:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id m8so11929131wmq.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680796555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dl9yeDGPycRUWXJBZ4kpWjOqTsSZxzt8+xcLLupOJVs=;
 b=USW+1TiAuurTkSGNPhVN/s4cDQVD4iXoF55m84He29ki/FfgUDYoSE43JBH6vaZ4Y2
 +brDvxrmjEbztsnS6ucO4ehf+wKwWyftKZ46/uNAqRGLDuS+h71/I7+NNGGYp9r1X202
 D1f4Iz3mODruwRGQeNyneAmMD98VcYmnNOW+SKKEexV0VqddFnv/Z/o69eDrwhBAodDV
 RSM5a0rXQB8iAmud5Fa6ZZ6WfULg97Zk0xmpWL7G1cEQ4S2oyFpO/G2GclDxoqGUNWfQ
 h/Yr/C5up+E2o6ReHjrlYHqYc0A0DbIVHXXlrbPrl/IOmezQlu1IgJntFjpvtTuVIrMm
 fhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dl9yeDGPycRUWXJBZ4kpWjOqTsSZxzt8+xcLLupOJVs=;
 b=H+K/4+yqDmXhUuXET12vy4zeqL+GtAbHVnAfMoRqwEKsgM7h8ydOLw7q8qR4E8tt+/
 UAcCBNnXLHOg5fRfzO1t1eazNLenw4g2GtmlrY4vQiWcV9ndVsAsMifjGiSpzqEYYBo3
 G7N/5P8JSlZoXXKEFHoWTmhqOianbHkRfXVDZ1+Taa1KB25VCHhI/y1I2bldXrIKUUt0
 YRiEZFEtJs9pf2RGVQnWLOVXF8cTNkywLqOIP5pn707FSKDVJEFauPWetOJ9fQr8zWe0
 60zg66kr52sFNghvpp+9KBXpOmEfA4c0r3ap5Ub7Xv/nWuStwuDtbsZbi7hGsqrdBUjp
 1DLA==
X-Gm-Message-State: AAQBX9cPkyH1MRTCDnATdfju+jmYDyFSLcWFtJMWKcmcXX6iJytD+VyC
 kdd83LziPBYsQakzpXN6TkI5BQ==
X-Google-Smtp-Source: AKy350Zke/QPlLUmTU5ljzHE26y1jSuiSHYyWmCKEF8SEvM+5Vq0I3t0GSXJwA1UopLFoiaW7Z/3yA==
X-Received: by 2002:a7b:c455:0:b0:3ee:1afc:c15 with SMTP id
 l21-20020a7bc455000000b003ee1afc0c15mr7386372wmi.33.1680796555412; 
 Thu, 06 Apr 2023 08:55:55 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.142])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003edd1c44b57sm1930064wmk.27.2023.04.06.08.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 08:55:55 -0700 (PDT)
Message-ID: <857b3d28-212f-bba9-10d7-9bb4291cddfc@linaro.org>
Date: Thu, 6 Apr 2023 17:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] util/error: Fix use-after-free errors reported by Coverity
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, armbru@redhat.com
References: <20230406154347.4100700-1-stefanb@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406154347.4100700-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/4/23 17:43, Stefan Berger wrote:
> Fix use-after-free errors in the code path that called error_handle(). A
> call to error_handle() will now either free the passed Error 'err' or
> assign it to '*errp' if '*errp' is currently NULL. This ensures that 'err'
> either has been freed or is assigned to '*errp' if this function returns.
> Adjust the two callers of this function to not assign the 'err' to '*errp'
> themselves, since this is now handled by error_handle().
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   util/error.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


