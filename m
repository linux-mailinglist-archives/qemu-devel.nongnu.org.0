Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EEB3BCB09
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:57:00 +0200 (CEST)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0il9-0007Tf-QQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0ihb-0004zR-ND
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0iha-0006DX-19
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625568793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4afGJ1Rf8zZV0WhJLgEZos9eSyKALSPBbG/9IP7xbg=;
 b=YY4xLlhZ5kF0XXSRmmThISq2yaZiaruFohS7GSMutErPs5Z/cQG+4oqU0AGGC4ApQcGsWr
 gWZ5R/iBpGj/+hVdB9Xj0N7xmuSEfhiQtpNI93v3pd274NTA17MeS0E+rHjUAwNaiU3+Nl
 iCeUlYNWKhQUxGykuNvmgLVJkiu2UyY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-L9d04DeuMsi1y5T27CfLuA-1; Tue, 06 Jul 2021 06:53:12 -0400
X-MC-Unique: L9d04DeuMsi1y5T27CfLuA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f9-20020a7bcd090000b02901eca9a0d67cso417542wmj.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R4afGJ1Rf8zZV0WhJLgEZos9eSyKALSPBbG/9IP7xbg=;
 b=C7o+kpUVkBIvPS0Hm2Jv3Ez0BGiIGHFbxpgSPgFFzH1el8SCzomJgzcsQXtOMlQllf
 LH3Jp3+5d0iHEp/ztIJl+QkLPpXgzJo2KGZNPwpK+iJltm73Py6xGvM18DgUYIk93/4b
 K2pu0qwlrR+hFjdhNR+NVxpJGJvFBSPoItHuiiFuG+h70Rv1lRl+BkYQ8DRjaef3mMdz
 OZduaVQfDRxu+/bBaAej5gxzpeR/+oxs6KEBDXmiQQktCjcpFyY6QzhYhQshggj4CzEa
 eAw0DES/LBhVpm81dB4cpekD0Ohvj2iFketMNPoiWOVLwEnLal6AOTYY1lQtC7eyzH5R
 IULA==
X-Gm-Message-State: AOAM530/1R8XfrurUpXcJSp6DKaD2XAbaHb/552MP5vdT2Y8kAUbQbZ4
 J1xKecdElyhC5vW3BAfG0YIWs7YSf015r7nAjelRcpYiiJlUY57C1ZkZ1DtJXn7W+k8Qk8XFGs9
 PRMjFzTzQXiSI8o8=
X-Received: by 2002:a1c:5985:: with SMTP id n127mr19730884wmb.75.1625568791751; 
 Tue, 06 Jul 2021 03:53:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx/p2aBBxA6hLzW/cfD9N7R5GsR9ZH2T+6bJxbKRR5UMfegU/Vt+7kucDcKSSWSeIJrwCTQQ==
X-Received: by 2002:a1c:5985:: with SMTP id n127mr19730866wmb.75.1625568791606; 
 Tue, 06 Jul 2021 03:53:11 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id n20sm14807465wmk.12.2021.07.06.03.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:53:11 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c513eb05-b08c-8030-5916-cac1515148fc@redhat.com>
Date: Tue, 6 Jul 2021 12:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/2021 17.21, Alex Bennée wrote:
> We need this functionality due to:
> 
>      /* XRAM IRQs get ORed into a single line.  */
>      object_initialize_child(OBJECT(s), "xram-irq-orgate",
>                              &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 647b5c8b43..528f71bb9d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -368,6 +368,7 @@ config XLNX_VERSAL
>       select UNIMP
>       select XLNX_ZDMA
>       select XLNX_ZYNQMP
> +    select OR_IRQ
>   
>   config NPCM7XX
>       bool
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


