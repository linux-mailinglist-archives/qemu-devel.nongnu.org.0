Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B2437736
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 14:38:01 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdto8-0008OE-0I
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 08:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdtkT-0006j6-AE
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:34:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdtkJ-0001Sf-L7
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634906040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YStKGiNuIAlthxUBC+6xUoN6I4sXYycKSHlwkzuMbOY=;
 b=aE20DuO0yWv4C43ShKoVDKw6cHXjZjQg3xNZLILnwt/OBm1VtQVG1ftL2NHdCJitQobtbk
 M3L/EO2mWU0lo4mzeCluDYDaLUjzibqq50W4htlnHhaC/CiIoP1hpB0R23z3U0sDQfxOSM
 rNyxIm9V75Od3MKK3rbuqhXfysTwjMI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-vs6_x0HCMFuTLDViiloXjg-1; Fri, 22 Oct 2021 08:33:59 -0400
X-MC-Unique: vs6_x0HCMFuTLDViiloXjg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f63-20020a1c3842000000b0032a621260deso1091944wma.8
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 05:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YStKGiNuIAlthxUBC+6xUoN6I4sXYycKSHlwkzuMbOY=;
 b=xKUeVMR6pt3DsXB5GbZMihTT/IRXSWwLsV8S9E5DgPFiqPCvpsfHs+5P893+XXMXIo
 pLJoZb/5Z6VAOYLuTqGxZkh2Q4Z3jc0VeZ1d4+5plRlG7F6ziSZHv9BZbAEvkCZeEuN5
 wLOS8M6mk1SobycP4Pf3cMYUuu5/9hfUf2/sXq+uNrrJEJg9X6zTc0KHKrQ1DTviwlQf
 ZadEng5eDZ/Xdz/oMR4kNsaO0W85uVy4wPbTATnF3iLcYPY1RilFfSKKpjisfMXOuANA
 beZ94svfskQes92/DemqJLpupDy7SEyAMO2xT7brY2t++RDnytpyB3tr7fcd9JKJaXu+
 sVYA==
X-Gm-Message-State: AOAM532KkYVrm+6ZfYCBjOg4K8tnLfecG601dyGdYuzHrvtDWDzT9I4W
 hyngSa9wK3vTDU9J1B0L8+4wFcLGWqX5Rd4xoZKAT9NivarnAC6paPJAM7rgmq6ALRgGdRCMbD/
 FwKxceFr6is+d9w8=
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr15122334wry.422.1634906038533; 
 Fri, 22 Oct 2021 05:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5q/iFPrFu33Vbx3j8ElhGG6UsKH3kQnlgRq7hxIgh/Wf8vgo/Jefg1a17IyRXbPDSDBviKw==
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr15122296wry.422.1634906038242; 
 Fri, 22 Oct 2021 05:33:58 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j16sm8903300wms.16.2021.10.22.05.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 05:33:57 -0700 (PDT)
Message-ID: <4e20b179-58de-22b7-f874-5e82a1225c52@redhat.com>
Date: Fri, 22 Oct 2021 14:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RESEND PATCH 0/2] Fix machine parameter default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, pbonzini@redhat.com,
 peter.maydell@linaro.org, Markus Armbruster <armbru@redhat.com>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211013160607.649990-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.742, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-stable@nongnu.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 eauger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 18:06, Jean-Philippe Brucker wrote:
> The machine option "default_bus_bypass_iommu" is broken since commit
> d8fb7d0969d5 ("vl: switch -M parsing to keyval"). Fix both machines that
> implement it.
> 
> Resending with Review and Tested tags, no other change since last
> posting:
> https://lore.kernel.org/qemu-devel/20210811085842.2511545-1-jean-philippe@linaro.org/
> 
> The fix was suggested by Paolo:
> https://lore.kernel.org/qemu-devel/6e233344-dd09-598f-082a-afe73d788b33@redhat.com/
> 
> Jean-Philippe Brucker (2):
>   hw/arm/virt: Rename default_bus_bypass_iommu
>   hw/i386: Rename default_bus_bypass_iommu
> 
>  hw/arm/virt.c | 4 ++--
>  hw/i386/pc.c  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



