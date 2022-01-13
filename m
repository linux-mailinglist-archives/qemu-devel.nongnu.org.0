Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CB048D334
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:52:38 +0100 (CET)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7uuT-0005Jm-Om
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7upV-00022W-Gr
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7upS-0008Gs-Rt
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642060045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJmS3Z4eC80LOV0Ekw3nYwsjaZ5QiyK4aLVEL3xe1Ug=;
 b=C4ZSs1SGbK6srh1xySXA0o0iC1wmXWS+/2M7PRXtgTrDL38xfagm3SsVP9BUibudxRHB2T
 LdijeJEPQeRV8J5ivCkPxFZlNZUsKpLXiZWbTh3hAU8xgfN5Uv1LJY2841AUsfr6NDsgKF
 fYnuXkEumci4+RgH4XOrrdmiJo+nRZs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-K-J3pgKMM9mbjld2TaL2Qg-1; Thu, 13 Jan 2022 02:47:19 -0500
X-MC-Unique: K-J3pgKMM9mbjld2TaL2Qg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so1033715wmq.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mJmS3Z4eC80LOV0Ekw3nYwsjaZ5QiyK4aLVEL3xe1Ug=;
 b=ylyqCOvJFMJsdD7MdZ09RUTDRifSpQKawfJR5jyCqqiMJ+wc2crubQl513cNVQc1OH
 dhVOQbPZQfTtgsq/SqiASG3kSOooU+X2cB/GiXT8xTuhd0JIVx0RmKDuhvRI9m+VEZoe
 UvfzwQ7PnxtUr0S0LDt7ss0yf7D6SRwSqXaVWxSxkYxkLjQCnszAxSn86VffAfhyXC04
 sfld4BnMWYvw7J63QDD67pYM55bFc5Ggm0AfYHLdAPmY9YEPVLoHzF5KYE3hQm0Y/3AT
 gtUJkfKe3mTM8QnLqdg3AtBBOp56rXUuIFNTET6uY8uQ/5glKmB4OWORf2hSoBmBQgb4
 PgTg==
X-Gm-Message-State: AOAM533QS1TdhrUBlfL5+1wFXzi1U/mcXBL6nKRhnfKuyJLDZOpY3UfW
 nc8k/UAzRD9wtjFqYyIZsSVSCHbX1srKyW0Zx3Cx2D+30fR1flc4ciCiZb6i+l5GtRxbeAEV9IB
 oeKelEImsNM0rUq8=
X-Received: by 2002:a05:600c:3acc:: with SMTP id
 d12mr6882454wms.85.1642060038353; 
 Wed, 12 Jan 2022 23:47:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+0N2ue7wq8JpfgT8Rkr4tyzIB0oW3twz5QC3YBYaHyvcDWpLnNL7tSoZ9MOOqIDpr4ooT9w==
X-Received: by 2002:a05:600c:3acc:: with SMTP id
 d12mr6882428wms.85.1642060038098; 
 Wed, 12 Jan 2022 23:47:18 -0800 (PST)
Received: from [192.168.42.76] (tmo-065-240.customers.d1-online.com.
 [80.187.65.240])
 by smtp.gmail.com with ESMTPSA id k23sm1658870wmr.36.2022.01.12.23.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 23:47:17 -0800 (PST)
Message-ID: <8274b1ed-c20f-cde1-2dee-0e13544210b6@redhat.com>
Date: Thu, 13 Jan 2022 08:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] softmmu/device_tree: Remove redundant pointer assignment
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220111032758.27804-1-wangyanan55@huawei.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220111032758.27804-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2022 04.27, Yanan Wang wrote:
> The pointer assignment "const char *p = path;" in function
> qemu_fdt_add_path is unnecessary. Let's remove it and just
> use the "path" passed in. No functional change.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
> Based on: softmmu/device_tree: Silence compiler warning with --enable-sanitizers
> https://patchew.org/QEMU/20220107133844.145039-1-thuth@redhat.com/
> ---
>   softmmu/device_tree.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


