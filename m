Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882286D0509
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:41:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phraQ-0004fK-KM; Thu, 30 Mar 2023 08:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phraO-0004ex-2T
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:41:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phraM-0003BE-D5
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:40:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so11630790wms.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680180056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=juLaoq1zcew413QdeMK/6Yqh/LY5jy0SClOxSugOT20=;
 b=oyCC4ftOoi2Oa7PUnhG/hwxsoHc63qVmMZGsXSUhUM1cpPQuDG/bPbcnk3gbAzytTS
 ongXlTRGtbGMrg1CUvcYXojZez+vI5e9lyl2wi1bfIR2bw5uLjwMdI/BZg8Hl1DhWbSE
 PLHGcYQH6Qp1gvO0DEiRNE32AzSM65qMrOX7k5x7BVGINiAeD5uxwSsevS3vtqOKFzkq
 dbswqfBBu94ESey2abX5qq9lN9iy5F4HJCy3MWi3qYmYyrtG/ZDfGmcAzmDOx6FN1ikt
 a/Hk3bOklMtzXp6SMo4P2zXyi6DDzMOINHLveXRevS6vDpuYTdw2zsANCf69kHGCj5pZ
 nFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=juLaoq1zcew413QdeMK/6Yqh/LY5jy0SClOxSugOT20=;
 b=NM+Hj1xItRne1KXOUf/BXA7pfjjGHVkc3zrkiB8SvW6wSdiS5pvCvj/4/OwfCeL2/Q
 L8O4vPfLib18ykEpA6y/Hgw8U7xRD/kJJ3tTkqFxPUaz8Az5817XDyuyf4QHuFj84dYk
 Xe8Vv1J1wixzsGVSAXCxs/iTT20nJLCOrRMENQRkJ0fkAx2hq81EYGbVZTtuKEeBbJLw
 C/Sis7VaXvULEVbxtftg6Oz9/LtNSS7ZI4Ygpr+Vy7dweNwYmJPUhrDh5bJ6/b0IBoSw
 svODMTaQuHygQr3SGNfPBhpZ0QZN/tGQLH6HJCuC2307TQKTSS8vCbvAv4riPR7rTPvm
 /nIQ==
X-Gm-Message-State: AAQBX9ebE8vzBrczFmIRBUi+o8EFUJBNcuzH671wwl+Ex6HUk+aeZ4iH
 VaND7sAF0zB/zTr1ygfjHViZ0g==
X-Google-Smtp-Source: AKy350bszQzETKb2oKlsm6HS4ajQLYjAKbBxrgDYH/f0dnIyuu0PZP8rSvm71AMmtJEKKdsfJyhMhg==
X-Received: by 2002:a1c:e90a:0:b0:3ed:29f7:5b43 with SMTP id
 q10-20020a1ce90a000000b003ed29f75b43mr14485666wmc.27.1680180056308; 
 Thu, 30 Mar 2023 05:40:56 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y21-20020a7bcd95000000b003edc11c2ecbsm5842120wmj.4.2023.03.30.05.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:40:55 -0700 (PDT)
Message-ID: <e240b358-18b6-ddb6-c45e-61c5558929a3@linaro.org>
Date: Thu, 30 Mar 2023 14:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com, quintela@redhat.com,
 dave@treblig.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
References: <20230330095524.37691-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230330095524.37691-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 30/3/23 11:55, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> I'm leaving Red Hat next week, so clean up the maintainer entries.
> 
> 'virtiofs' is just the device code now, so is pretty small, and
> Stefan is still a maintainer there.
> 
> 'migration' still has Juan.
> 
> For 'HMP' I'll swing that over to my personal email.

Thanks! (and for your tremendous previous contributions)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   MAINTAINERS | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)


