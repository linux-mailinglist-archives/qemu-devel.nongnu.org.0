Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A2C45B916
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:31:06 +0100 (CET)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpqUS-0002Jb-VV
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:31:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqSk-0000R8-RI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:29:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqSj-00070D-EH
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637753351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bW/J0PLSWlaDLLAkjWdWCkSgRoZzPJcFVGUjJnyIBE=;
 b=QZHogoW3sanBLzc9v3S3DxKtRQLTDvlrXR4D3ZMIY2yerf/L6rtZPlNQyWw39GlBU43kHN
 Eaj53EqStMWZSVa+ziogCALZ9mqFXHrs6u7RfLi04Jzm80IWEhfDj4/0UxbUWkz9XlCX2u
 5+lhjZpPZnsAMxU79eit0oReLf14Ms0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-_P2QLLEPMCqFs5kjr3Ly4w-1; Wed, 24 Nov 2021 06:29:10 -0500
X-MC-Unique: _P2QLLEPMCqFs5kjr3Ly4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so1267307wmb.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 03:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7bW/J0PLSWlaDLLAkjWdWCkSgRoZzPJcFVGUjJnyIBE=;
 b=Bn/IFYCgQ2AJqlsuWV5C8yqDQGDrPxjMZeIjI2Ib3XnNSqvh0qLKdRRNbZVRlKFvX8
 g2Dvk0tkKUTRrbc4AuKaMvmD04Tmzj16CnL7LF3s1T6f+RZYBuw4uUNbT9rJPv5pUxsR
 0mt9p9IHg6IPXwPQ177CI9ShP2WuUx275IyOwYNFWtI9Zv4zGa0Xaqf7mztKVP0J3NRm
 CWF3H89zdvhvA5LVrkclh/PNJ7BKF5fLmvVjPbhKmODvVwoo6k3DF+9RYen8IvAL3I6H
 Yk9FLA9YgqYCM7iI4S/YZ7oBNP8uD7FQGlTD7+mz5zBW9z3SUzssGVmG8/oYrvKi0ziT
 qQbQ==
X-Gm-Message-State: AOAM532jkFForOGqn9FmlkyPAo2NSahb0W4AH/CdoeWc/mGbVSkWtkoL
 EQt8T2pBVvU5P0NeLexuzs0HlKzkOKoVR6NXVii4r9nWTWjenglM4aOStcBLt7dTf3aHcwa0W89
 ceex171d0Xx4I8QA=
X-Received: by 2002:a05:600c:3ba5:: with SMTP id
 n37mr14130382wms.168.1637753349079; 
 Wed, 24 Nov 2021 03:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDPzj1b6aTpI50n4XsCDZ2HPXSjfbWsPWTUWaxPEaB/1qym4JrsC4ZqqpZJDGIxnG8e2wAtw==
X-Received: by 2002:a05:600c:3ba5:: with SMTP id
 n37mr14130352wms.168.1637753348888; 
 Wed, 24 Nov 2021 03:29:08 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 38sm15396492wrc.1.2021.11.24.03.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 03:29:08 -0800 (PST)
Message-ID: <c5958c18-312b-e5bd-1e1a-f10a0619ed89@redhat.com>
Date: Wed, 24 Nov 2021 12:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0 v2 2/2] ivshmem-test.c: enable test_ivshmem_server
 for ppc64 arch
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211124092948.335389-1-danielhb413@gmail.com>
 <20211124092948.335389-3-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124092948.335389-3-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 10:29, Daniel Henrique Barboza wrote:
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
> After the endianness change done in the previous patch, we can verify in
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
> Let's keep it that way by officially enabling it for ppc64.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  tests/qtest/ivshmem-test.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


