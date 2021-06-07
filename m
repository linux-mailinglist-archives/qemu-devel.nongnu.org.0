Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7D39DDE0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:41:12 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFV8-0003bm-Mw
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFU0-0002r7-Ko
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:40:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFTy-0000sk-Hg
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623073197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBq7wls3KFErEV9Dm5UQhsUhRjSPfd6pHeakeShcHy8=;
 b=U90PhBNXPQaHjoO4NVIAm/B1mkx8q0DXXYivQanmNBx1tiYF6/m5L/16D+XpiwQ5RrUywl
 j+CkJpPB+RP44xYNeNXlsjrbTtqMpILb/tTo23C9XdMXTTSLwfywTfDbAIQ1Ms6cOEYoV8
 uU364kTf2tTLSLhRv9Q9VDX/T7baCcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-G_2lOnNUOh6Cu7FBF8-6dw-1; Mon, 07 Jun 2021 09:39:54 -0400
X-MC-Unique: G_2lOnNUOh6Cu7FBF8-6dw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so7864483wre.18
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBq7wls3KFErEV9Dm5UQhsUhRjSPfd6pHeakeShcHy8=;
 b=uhasiS7g3csW74BuhtAdedA+uzOumexoWshMcXhLQc/YWiB6W2Q+WpC4pH2IsW+xQ6
 5h3AaTLX+7lYMTcSqzD8ulsq+AG/Rl3qqD7odxrbW7vUbYJ7hKi1BMA4xxjVO8INJ1/2
 PXLK1bzqvlzXIoZ3KxQgWJc6X3SZT4ozXT+nGnt8PTnEx0sfN0UwlLHdJDp+BO4mYRiE
 o48L23gQnUJC6+VC91wOIMkSLAi6l0iLLT7Fx7lVdkADXrq3J/3mvcMmAgHww37nGrrM
 bP3EO4wTujgVyA3+6qph+zzKnGUguFYccPBk6K9pNppQwNtBaBKPTteryLPrVK1V1mzK
 HdYQ==
X-Gm-Message-State: AOAM533A9PpZDI6gV5nxblP1eAHEKwh9ToX+avV4KM50wFnTfyMw4acD
 bJhKckqIJZeyyLgHlZJ5ssthze8TRk4fUyhjXApc422GuJTy0maWTLWQs9rS3m9VKjYGr/dNL+p
 t9oB3DLyuB63ZkzQ=
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr17101624wmf.7.1623073192981; 
 Mon, 07 Jun 2021 06:39:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE6kuE18deXtkTm/4wgwP8Aeap8fOdq6uOBCycqKtbbdYRuzIPuOxe8zulg4qVfmAC7Sn7iw==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr17101609wmf.7.1623073192819; 
 Mon, 07 Jun 2021 06:39:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id 4sm2183532wry.74.2021.06.07.06.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:39:52 -0700 (PDT)
Subject: Re: [PATCH v16 09/99] qtest/bios-tables-test: Rename tests not TCG
 specific
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b6c4efd5-4ba9-48e0-e9fb-c821df7db5cf@redhat.com>
Date: Mon, 7 Jun 2021 15:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-10-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Various tests don't require TCG, but have '_tcg' in their name.
> As this is misleading, remove 'tcg' from their name.
> 
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-10-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 142 ++++++++++++++++-----------------
>   1 file changed, 71 insertions(+), 71 deletions(-)
[...]
> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc_tcg(void)
>       free_test_data(&data);
>   }
>   
> -static void test_acpi_microvm_pcie_tcg(void)
> +static void test_acpi_microvm_pcie(void)
>   {
>       test_data data;

This change is wrong: test_acpi_microvm_pcie_tcg() uses data.tcg_only = 
true, so the _tcg suffix indeed makes sense here.

  Thomas


