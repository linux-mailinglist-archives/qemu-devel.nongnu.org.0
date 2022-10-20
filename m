Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34A606141
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:14:49 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVNn-0007Ih-97
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:14:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUtq-0006jI-Dg
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTkM-000557-1n
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:30:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTkA-0000pR-Kx
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:29:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so2087758wmr.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Etn0iO4RaXjrrYAkCfqyH7NEpJhpaiQUoe/1LWlrvsk=;
 b=jgfqFJJA76hBb4Id76/FzlxQzhZxxDZHa/QokD907BllT473Y3XtB0P3wjlP8aRAjs
 A/vImCjO27LjnyjGVqISCkap3TTwwuTXs5yhGvHpTgJLBZNMBXpOAtfltu2/+hcw6/1I
 xAjjnkdZ+8HV9XT75WTa9V72ev87ToTseul173SsfyrvFZrlhKjY3cLigHEOaJ2BSaE9
 ptMKZxlSb1TTkfX8RNWPh0vHuNkQHkhmPovhsuivHoUtfJtu0sEEGm8sF7EvV4i+kDCM
 raaTT/wlNVSLk97Ua0KPfLgLDwwNttcaq0kdF61dFW6Zja5hZ0eFkFBilt0dkA6uBQDb
 U+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Etn0iO4RaXjrrYAkCfqyH7NEpJhpaiQUoe/1LWlrvsk=;
 b=ceJAM6iqLPqLstLdvtwrROnjB0ETo5lBBh4WliTtWHdsWdTAzVc9QVILXb/4WfanRb
 6lk08L2wN9wDNw9lEvRjRu5OuHiegYUkZv87vNrZ6z0RgRH630MQAsLWXn2meosRdKiq
 94VyYdgBMdhSxDPmB+2seDfAmZOlSJr3nclhcmxnYJYfGSn/g39OdaKNgS/24D51iGcY
 OGKRwXlZjy/N8fG6G2q2tZrQURk/hixEZwI82+LHEMfDS/2X3ntBHE0Nq+XsujCISus1
 jtv2ms8L76Dtum/IFvQ0AvtMCvBsb/dZKrcgz7GGysh25CD3Hb/D2QsE87fZ8m/vOwYF
 ma+Q==
X-Gm-Message-State: ACrzQf2hVhLqQretxdfa6K/3MVD7Tm92XMMCTLi3hrnGvHaxZlXl69pu
 HmT8iog7AzS7aS7VzfnLuKtAAA==
X-Google-Smtp-Source: AMsMyM4ij4BZ7TpeNLVFqunzyg4LLe78a5Dj/HqR1xaY4sjaEQmUcFv30JhQ5Lbs/FiYrzwUlIcU4A==
X-Received: by 2002:a7b:cbce:0:b0:3c6:fb29:6084 with SMTP id
 n14-20020a7bcbce000000b003c6fb296084mr12340370wmi.131.1666265382916; 
 Thu, 20 Oct 2022 04:29:42 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c310700b003b47b80cec3sm2785009wmo.42.2022.10.20.04.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:29:42 -0700 (PDT)
Message-ID: <bec2996a-3ea1-4245-64b6-ff53f9094cbf@linaro.org>
Date: Thu, 20 Oct 2022 13:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 09/17] net: stream: add unix socket
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-10-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-10-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 11:16, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>

Eventually:

   Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   net/stream.c    | 107 +++++++++++++++++++++++++++++++++++++++++++++---
>   qapi/net.json   |   2 +-
>   qemu-options.hx |   1 +
>   3 files changed, 104 insertions(+), 6 deletions(-)

