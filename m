Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469645B63A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:08:25 +0100 (CET)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnKK-00085e-8f
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpmod-0002nP-Im
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:35:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpmob-0008B3-2G
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637739335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnI9nWUaOp+naT9JETyuSRGMu6xg50n9FhqC3CSDZy0=;
 b=P0CpswA21PUgYJEXzeKYZ6COegQhXa3lGDOx3JLLgNuuFt3vcZWk/+0eO/MUMT9hfQ4R6W
 Mjq53MczCaptps/Mwa+OZUYnAyCTUC+q8vbiriHGSb/nv2Lby9wbDEwT9ytFqWZtVa61WC
 7UaO7oKtRO4sqr0C5DAdIoPFFzr2XmE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-6so3yQbOMnO2Ht-ihVL0Qw-1; Wed, 24 Nov 2021 02:35:34 -0500
X-MC-Unique: 6so3yQbOMnO2Ht-ihVL0Qw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so930955wms.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xnI9nWUaOp+naT9JETyuSRGMu6xg50n9FhqC3CSDZy0=;
 b=SLVuVYwuiKAmP3G+0dU2ifDquQr8mBCYvkHzWE13lZp8OjX7/MHdZWtCll+EeKxJNf
 Ty3zKQjw2l55sZg/blxRiC436w747RNO8UJXAwvgQDi7wJb0ytez/0XytDtiWzTOGPNh
 H3ERgKy+2VYCa8aJLikZITfb98lSIFLq7J9TE9woZUNX5Ra+KOx/scQmgwVQ+EzAfUOJ
 ww5e2sjHQaDeOCWLgrhOQFsXyUMKoyO783uLFcfqhIb1nmoNcxIJQtIaiV8PquUxZuHA
 l62pV89wXtJDVgoIDG+bhirNwllttSwjEUMUVzk4027Yzivp7zCDJeOu7Erb7ai8WdbX
 jhcw==
X-Gm-Message-State: AOAM53262DHOm30HETHmT/aioYNu62Zf7MutgglyCHM2IpPRq1HgDVvS
 GMKFbv37t4zYGPjhC3cODDYK+lD84NB4p80mTI7lZaTeGvzDx4m0UgX9rmdCh7HylqmwV6vEZhs
 R0rfa592tcLsvSto=
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr11981699wms.116.1637739333411; 
 Tue, 23 Nov 2021 23:35:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDF4r5lirgB6Mi6NuKicAq6ET8z8wGRNLCjZpUwGPWiNhD9GQ6+NudcNnM/kGSmq3h/+OefQ==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr11981680wms.116.1637739333226; 
 Tue, 23 Nov 2021 23:35:33 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id ay21sm3491174wmb.7.2021.11.23.23.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:35:32 -0800 (PST)
Message-ID: <129d4b5b-6118-239b-d1ed-c32f5193cc0f@redhat.com>
Date: Wed, 24 Nov 2021 08:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] ivshmem-test.c: enable test_ivshmem_server for ppc64
 arch
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211123211932.284043-1-danielhb413@gmail.com>
 <20211123211932.284043-3-danielhb413@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211123211932.284043-3-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2021 22.19, Daniel Henrique Barboza wrote:
> This test, if enabled by hand, was failing when the ivhsmem device was
> being declared as DEVICE_NATIVE_ENDIAN with the following error:
> 
> /ppc64/ivshmem/pair: OK
> /ppc64/ivshmem/server:
> **
> ERROR:/home/danielhb/qemu/tests/qtest/ivshmem-test.c:367:test_ivshmem_server:
> assertion failed (ret != 0): (0 != 0)
> Aborted
> 
> After the endianess change done in the previous patch, we can verify in

s/endianess/endianness/

> both a a Power 9 little-endian host and in a Power 8 big-endian host
> that this test is now passing:
> 
> $ QTEST_QEMU_BINARY=./ppc64-softmmu/qemu-system-ppc64 ./tests/qtest/ivshmem-test -m slow
> /ppc64/ivshmem/single: OK
> /ppc64/ivshmem/hotplug: OK
> /ppc64/ivshmem/memdev: OK
> /ppc64/ivshmem/pair: OK
> /ppc64/ivshmem/server: OK
> 
> Let's keep it that way by officialy enabling it for ppc64.

s/officialy/officially/

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   tests/qtest/ivshmem-test.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index dfa69424ed..fe94dd3b96 100644
> --- a/tests/qtest/ivshmem-test.c
> +++ b/tests/qtest/ivshmem-test.c
> @@ -463,7 +463,6 @@ static gchar *mktempshm(int size, int *fd)
>   int main(int argc, char **argv)
>   {
>       int ret, fd;
> -    const char *arch = qtest_get_arch();
>       gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
>   
>       g_test_init(&argc, &argv, NULL);
> @@ -488,9 +487,7 @@ int main(int argc, char **argv)
>       qtest_add_func("/ivshmem/memdev", test_ivshmem_memdev);
>       if (g_test_slow()) {
>           qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
> -        if (strcmp(arch, "ppc64") != 0) {
> -            qtest_add_func("/ivshmem/server", test_ivshmem_server);
> -        }
> +        qtest_add_func("/ivshmem/server", test_ivshmem_server);
>       }

Acked-by: Thomas Huth <thuth@redhat.com>


