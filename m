Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3424D1B68
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:12:46 +0100 (CET)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbW1-0004tT-5n
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRbLt-0005wB-UB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:18 -0500
Received: from [2607:f8b0:4864:20::52d] (port=45952
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRbLs-0001Im-Am
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:17 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z4so16673895pgh.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2PCsqigI+nh/7dmhwcmSIgaWiZaPwrBatNfBKPPnxFY=;
 b=JKtB4uk7n47+FU+TeF6IyXUtuCtTFg1D27L43PzmeIAlSUbpUFAi0oKrLuWjux2XPZ
 UQAHCP3KRUsDeAX/I7THYeB6A9MehW2BuWecYHQwcMXWBIo4UO2czejx7rtXsNiWVsyI
 ZxHAtVMe5Kc/iBrugXUQfR3Vl/3kQgy9G8pIN5RANBR2H0pHlRJCaLYqhq9DuxqG5IET
 RkyZemO9W3N5hw6XzLUu8nrvB4nTfzKlrP0T/lBvrUBi+wxwABM2BA6BiJOMOJW8xANO
 nafRwSI1nKX61NOa2z6Il27aG2z008PhpjSiBgGTrkLSyVTOpOXKfeeBBrqYTDYcAe0E
 fKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2PCsqigI+nh/7dmhwcmSIgaWiZaPwrBatNfBKPPnxFY=;
 b=OCOsbEc9K/gxpPQ1bhLBltq+sMyv/xl//OfH98p101cwXJXvTH/egjYiGhOfG5dYOo
 eEAULCzs2U8tYnR3mlWwEo1RzqguIU6BvA2GU/DUVmc8qrOEppKw2zBtBNEsegXeHU06
 awyq0xadjsqcoC16ekxH08QdaWtzcbC77vgWk3LfglWiIZlqX2JQyAH+5HIVq0CJaw6m
 g3EmNDbYhq6nh/aBVLssWk2DNbvCN4gIEg3JpxWMEFjX9w1VdG+/MsHQ/pSErK1XEm0Y
 tNCMyqjiGmxVFFH1DIH2KWEopk6bZoQF04/t8/Jeg6kwv6iM73As0qeMNB23sig/z1hg
 cSUg==
X-Gm-Message-State: AOAM533/Hn5FYoeCowSASDf7EpD723dBOLIiz7VUA6upNZR/hsC2gk7E
 ECYKD2o0U9vcflYoX7AZuMo=
X-Google-Smtp-Source: ABdhPJymW2R4NXA2RoKiIZm25huWAuq2y3LAOwwSOGRB4IxDdRzNfGgx5IuomdqfS7l6JBJyJMiswQ==
X-Received: by 2002:aa7:8b13:0:b0:4f0:f393:ec42 with SMTP id
 f19-20020aa78b13000000b004f0f393ec42mr18666462pfd.6.1646751734830; 
 Tue, 08 Mar 2022 07:02:14 -0800 (PST)
Received: from [192.168.16.175] (11.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.11]) by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b001bf564e624esm3356122pjj.39.2022.03.08.07.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 07:02:14 -0800 (PST)
Message-ID: <518b418e-9b74-284e-7d57-d25a177fd9e1@gmail.com>
Date: Tue, 8 Mar 2022 16:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 03/11] edk2: switch to release builds
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-4-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308145521.3106395-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 15:55, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   roms/Makefile.edk2 | 17 +++++++++--------
>   roms/edk2-build.sh |  2 +-
>   2 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

