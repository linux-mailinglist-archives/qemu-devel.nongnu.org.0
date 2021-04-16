Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D23627A3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:23:12 +0200 (CEST)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXT7X-0006Su-9H
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXT5g-0005ef-QW
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXT5d-0005re-Lr
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618597272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbjAAgh/O7uS0t6LIBClWt5kutACPgzKUh1V9S6VQUo=;
 b=Jvvczv+CR21AmLv7BvncYoM5kJfaxZXVf3Xx1Lwo019QZ7033F7Tqgid3yjEGLicv6Mrgg
 bZp/uj5+osBeeVp3ij0iMZO3MG1XtvZYW2e0dRqRMuT31UJxxowFPSUhAu+uz6JzTWKww1
 RQK01pIqeXklwQMg4V8OQSDHaPrbVBo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-_z8IJk-gOgSPBnzpjFpeaw-1; Fri, 16 Apr 2021 14:21:10 -0400
X-MC-Unique: _z8IJk-gOgSPBnzpjFpeaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso4839198wri.6
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kbjAAgh/O7uS0t6LIBClWt5kutACPgzKUh1V9S6VQUo=;
 b=mZZY8FfhfB4UW5EDNFqZfksRxREoLjRAUEgd+KAP31KH11yhwv0L9so9DoPrFPgugX
 BJKXBFsMqhxX6OG+tKjVqE3JEZU+rSlEaAMYXVWWRItSdjOokMMFUrit0Mrme5X0xePT
 VebjxkbCDZyNJCm17xQ3SEFN2UgmGvE2VI76LVXwp2luAJPjEemxkWvuEE/YWJChAry/
 msPkXXXz7syhqdsjLYLJXvUCV6SD9mOdRDhisim8Pr5QUBCZhmi7oW/1koAWBBjfzc2x
 rnTfFTGhvH+MiB+L/ivXi6p0EuCJ8QlTSlxU2T2yMoFsSRWPCjhGrx7pmEItJ3/sgPuD
 IOxA==
X-Gm-Message-State: AOAM531FtT/LbS9IJxNz1ClTLq9YqWJvkeAd3UriR8hwbno/UYX81IZV
 0Vi+iE3oW/D//b4kw2Qv3XQhb72z0U0/IDVi6poyJkN99ACkG3IOpIgeFVUYYiOoNMN/Ct9S4mo
 RogFy6R+qJYj/U9s=
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr498285wrq.95.1618597269016;
 Fri, 16 Apr 2021 11:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaaleMi6eSYDLX2LIBhZ24MjtMnZ01EDXDWaTA7YxEgsKtP8SHJ/36BANQQRUJuVmm9JsHMA==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr498254wrq.95.1618597268728;
 Fri, 16 Apr 2021 11:21:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d133sm10124703wmf.9.2021.04.16.11.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 11:21:08 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM
 TCG CPUs section
To: qemu-devel@nongnu.org
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2151d1c6-95f0-e982-1126-4e9cbbd4d7a3@redhat.com>
Date: Fri, 16 Apr 2021 20:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 6:32 PM, Philippe Mathieu-Daudé wrote:
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 

Forgot to include:
Acked-by: Andrew Jones <drjones@redhat.com>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..d5df4ba7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -156,6 +156,7 @@ S: Maintained
>  F: target/arm/
>  F: tests/tcg/arm/
>  F: tests/tcg/aarch64/
> +F: tests/qtest/arm-cpu-features.c
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h
> 


