Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F84DB1B5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:39:29 +0100 (CET)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTs8-0001Zg-4n
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:39:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTX3-0002ET-I9
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:17:42 -0400
Received: from [2a00:1450:4864:20::330] (port=41608
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTX2-00031y-4v
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:17:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so1419693wmf.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RCFFjc9kzrf/rZp/+zROl9GImouRjQHWkc512dZdYJg=;
 b=AnZBGlF09922kcjuRTUv8AJZNNWSnDlSbgcs8fZurToDigzdhODdDkHLo9CKM1LqcC
 wDKtRFDFty2oPRLHD1z2pga2XRZVFtKqtWqf6U+e1+cSt6uXtKQcKu3ltCNI2tVf5MoX
 c3q6TPl9BFwoD59wEZkM0mgnTL6/dgSHKU8EhqQqpFpYbmyH2cFyn4e7Lk4mMt/nY4Ep
 G9+fWh8QBAIMe7IxCOwP+qeq1TZ7beGzNCgyJ0vddG2tbxjPSFqF2SQny4V9IC+CUM6S
 FxOVKk3kKSmQTt7jElrnrk07QuM9JJuxMesXwMMHijmu/yaa36oYGxLZ8QjUlHLh6EQh
 4SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RCFFjc9kzrf/rZp/+zROl9GImouRjQHWkc512dZdYJg=;
 b=axZMs4kg/sJVQUq9CikWq8Up8X5wHPzx3z12caOhTez318YO2RZrJSccFPZLH34i9J
 /l+Fbn7kiA5V9CbsBi3un4sxVCMgvS7mPrG+j2L47EOiUd+3GY/9OMSQVVoSyfcu0Uqg
 hrHYopamgAIr78niJ6BDtDhzePDUHPgXgOkPKfK+3W8SjvWT0s6l8d0kL9OQoxmZONSD
 OsXzfwYvTowEFZpuFb8+fJVIKLPZuPd1RsF9KNebKbEPbEBuVdP0QMaWSL19A11muCe8
 Z8LGqYtFGs+i2cH5O6EAodekAjb+OM7nISjaDLyDf4nompH9M+3qv5uiCWzjmNDFssb/
 LlTA==
X-Gm-Message-State: AOAM530ymtJgrQDNVmnNJWacDLFvy8oYpos+Qq73ePxdNG+jNOh3VSyb
 L/38M2uFpIQbBO6kxEGFlPM=
X-Google-Smtp-Source: ABdhPJxRQ8gfSTB7dQTqmPVAbj75mjEVmXYYV2Yn9xOr0IcMM3f2Q/wHSrEDO0X0nuvT+uZFnJsofw==
X-Received: by 2002:a05:600c:216:b0:387:d3c0:8214 with SMTP id
 22-20020a05600c021600b00387d3c08214mr7262456wmi.96.1647436658649; 
 Wed, 16 Mar 2022 06:17:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm1650144wmq.46.2022.03.16.06.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:17:38 -0700 (PDT)
Message-ID: <c79731c4-e307-58b7-1575-c2b9a86971e1@gmail.com>
Date: Wed, 16 Mar 2022 14:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 16/27] util: remove the net/net.h dependency
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095404.2613742-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095404.2613742-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 10:54, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Move qemu_ether_ntoa() which is only needed in net/.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qemu-common.h |  1 -
>   net/announce.c        | 13 +++++++++++++
>   util/cutils.c         | 14 --------------
>   3 files changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

