Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B34ECF07
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:48:42 +0200 (CEST)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgBF-0004Oy-BZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:48:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZg7z-0001bo-LO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:45:19 -0400
Received: from [2607:f8b0:4864:20::234] (port=41861
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZg7y-0006Lf-0Y
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:45:19 -0400
Received: by mail-oi1-x234.google.com with SMTP id e189so23439074oia.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O4Ffq8w220/BtNIrqWXnIUrWDq/OEocKW6AvUv5xdwQ=;
 b=wEnTFQBDyv3g1hY8wOHzB3BSmyyPvJdIe0k2acXt6jaiWsGREoSHy7DlKtz5BzgTjW
 OnTD8ADkdmfRLx/g0rDGdp2RsBkyN6GVgYan9rzHOkfhnq/3n17d0GfHZsGI9sRl2TBB
 NKRlSPTKqc6OiH4oqMymE29rMF+diCzrVY59v3h0yldzWkViLjAFJaJLPC1sGuzxOVNz
 tvWiyVpSF5eGP6NJKmGhLb7CbnWnEGqFc9FUuPLWym82vpVvI5mmDSAW99zjmYaFoXlX
 3WG8Q8do3CTWv/+spvMe9Ju9KFPMbLuFCydBz6V9Y4qgZ+ExwaZeQn0sF6I6wvhTXOoL
 YfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O4Ffq8w220/BtNIrqWXnIUrWDq/OEocKW6AvUv5xdwQ=;
 b=vAVfhMoPRev9uzXi9l7m+Li+2/oBiXsAQsx5dTVqRdVTtV/QHW5NqvRpfi2qVpMxsO
 1NUvA7GdHVBNaOzP7SsVLZyYN+J5ENDRiRQN1KUCs3/7N02WLp4oqqijFkVqVJmv7JcX
 G1Vqaj5Lh8WmmEuktZQ82lxHF2y6wDXkvZBkzdAH/pGBjo8AqFEGymgufUdkO9tK16Gv
 kvySIEzwoWhb+EmHhA+u1UErjVTYBtEa8szc549zivDym+bWDSjoxAj+oy4BKNILaSh0
 3c60lRMiS9mf/fQ6Xu5TzT6ABcrGKziM+3J1ekr6a0rw9qCsgOfGKbCaFRfOZ3hkciiT
 skjg==
X-Gm-Message-State: AOAM531oyt9doWCNl4T7ynvIFdUtTGMvJcPwvB+weJKEdWq1jnAZXoMq
 P7Gq2uoo37M7Y5lq2LFRlYbsGA==
X-Google-Smtp-Source: ABdhPJwt+afrinkUkUzNQ8k3no3yhZw8IYojb5gebtfdQqzbQPkYKN6QT5/Hy7w5XILf8QGRQsqFww==
X-Received: by 2002:a05:6808:302b:b0:2cb:2fea:cf9 with SMTP id
 ay43-20020a056808302b00b002cb2fea0cf9mr1125485oib.117.1648676716707; 
 Wed, 30 Mar 2022 14:45:16 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 z82-20020aca3355000000b002ef73b018absm11185680oiz.9.2022.03.30.14.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:45:15 -0700 (PDT)
Message-ID: <f31fdc26-868a-9fe6-ffbc-075c645da5bd@linaro.org>
Date: Wed, 30 Mar 2022 15:45:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 07/10] Implemented signed 256-by-128 division
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
 <20220330202515.66554-8-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330202515.66554-8-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, danielhb413@gmail.com,
 Luis Pires <luis.pires@eldorado.org.br>, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 14:25, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Based on already existing QEMU implementation created a signed
> 256 bit by 128 bit division needed to implement the vector divide
> extended signed quadword instruction from PowerISA 3.1
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   include/qemu/host-utils.h |  1 +
>   util/host-utils.c         | 51 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 52 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

