Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B45FB2EE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:11:58 +0200 (CEST)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF37-0008Tf-HU
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDP2-0006Kv-6G
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDOV-0001RD-65
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HX/WJX+6eQp3OzMFPNdLWWorQxBBjC8ejbhoMyUurmY=;
 b=gQ6IMDM25ULW8nx8gM5sqyzsQQjJq84Z+u7ITPMu66OyOK+aaNDnoVAJNit0eJHp2MJ645
 AjdoB04qrdMEyivyt1EeTySAI8cDHoUVG3U5XsoRu1I/lj2eVFhjDg8x8Z5Klkypu0sZe6
 GJPpRCLrXi8rr1UWE5KqR3CUl3khP/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-F7ByO6JXMM2n-y0fGxNOqQ-1; Tue, 11 Oct 2022 07:25:48 -0400
X-MC-Unique: F7ByO6JXMM2n-y0fGxNOqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso8316622wme.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HX/WJX+6eQp3OzMFPNdLWWorQxBBjC8ejbhoMyUurmY=;
 b=iSW8p71zlW752T1jrUiIH+rH9pYeASgQDt3TcmFRUSG0rrbrMoLHlPqv8TDxBexu16
 PpAWQrHKzfhNBQdw6H5+RXZBlErDER+SFy9Sdde46t1scZCLsXpkjCg37d+4VsRw0RgY
 DmTiyMaiiL7XYeb4BeCKH/msx2AItnUttv3vqY/o3kyj166FSsHs4ftwSk8nHRVr1o/y
 tqHlsQR4zAtApRQ/S9RTI103MbFGPUZXaKM3be2Q9QZRsxXME/XwAegL0gtrkfI/5oGa
 kLBgq6Ge4vhHMgkgM3hNH32YqTv9vhvKi2b4WLCATPmKsaseHojxBQEcD/HinKIFPlYy
 rIKQ==
X-Gm-Message-State: ACrzQf3Oa8zceC5nLM6thlboDle2W6fPgADszYXMrLtFEnd/qFSmaNuE
 ECXXssWf+H/dN6Jx5AT7+GRswsbZJCIhzScrxvFFNqvcwAHCkDjtkBD9k4vPz1nRiTLjGtl5mgZ
 onPLlmJbablzKdtc=
X-Received: by 2002:a05:600c:5490:b0:3b4:8db0:54d7 with SMTP id
 iv16-20020a05600c549000b003b48db054d7mr23003351wmb.62.1665487547073; 
 Tue, 11 Oct 2022 04:25:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7z0vFJEpvrNJsgfGwNC0NqYgix3KgXDDdGlFlgUaIjCf2hgznoqA0HBkQLpWKn9zZ0NAhQgw==
X-Received: by 2002:a05:600c:5490:b0:3b4:8db0:54d7 with SMTP id
 iv16-20020a05600c549000b003b48db054d7mr23003338wmb.62.1665487546913; 
 Tue, 11 Oct 2022 04:25:46 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 j13-20020a5d604d000000b0022ae4f8395dsm10916621wrt.96.2022.10.11.04.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:25:46 -0700 (PDT)
Message-ID: <7c18626e-1a28-e0c6-1da1-d338c9792423@redhat.com>
Date: Tue, 11 Oct 2022 13:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 6/9] tests/x86: Fix comment typo in drive_del-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-7-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-7-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/drive_del-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 467e752b0d..44b9578801 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -327,7 +327,7 @@ static void test_blockdev_add_device_add_and_del(void)
>       qts = qtest_init(machine_addition);
>   
>       /*
> -     * blockdev_add/device_add and device_del.  The it drive is used by a
> +     * blockdev_add/device_add and device_del. The drive is used by a
>        * device that unplugs after reset, but it doesn't go away.
>        */
>       blockdev_add_with_media(qts);

Reviewed-by: Thomas Huth <thuth@redhat.com>


