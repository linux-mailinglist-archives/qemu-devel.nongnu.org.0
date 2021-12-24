Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE447EF3D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 14:46:43 +0100 (CET)
Received: from localhost ([::1]:53584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ku9-0004gi-TE
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 08:46:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0kra-00040S-Gf
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 08:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0krX-0001WK-BY
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 08:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640353437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpkKnCyzSIDwRJmJIk+JUI1YdRlnZ2hDuOHQVKckpXY=;
 b=Luyb4pLkivn3ZI4+RhZexBtKJBi/7qbc/snPaNyPxlvGbaFfiwjlAhRcyNzpm1Kj1mPQyp
 CJo3lexl4aJCLrnaen8fAeG9DOlIQJPh+45GIlmgMbbEN6JTOF9Tnn6RNf/QS8tYtTy0tC
 x7s8USU4gytmMhxKQGESZV1dGz6o1gk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-JkDYcKqJOoCUzbZ88lY9RQ-1; Fri, 24 Dec 2021 08:43:54 -0500
X-MC-Unique: JkDYcKqJOoCUzbZ88lY9RQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a05600c1d9600b00345a25ea8cfso3178095wms.5
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 05:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kpkKnCyzSIDwRJmJIk+JUI1YdRlnZ2hDuOHQVKckpXY=;
 b=XWQAR9wQGMGoZx1Mh4m/9qjmXkZf9cnKFea/bdJC75JgiT9NTU+DKF3bAWjUOlpHGk
 SsIvSAu6wAuFsP0sOY/RE3diks7l1EQsrv519/gvcdGaB9TTf3wQPHUSHNkNvdQuyyYQ
 b6JS2VY9A0O4AwXx1RGr9J1NP36hRnNm8VUd6HTV8OY6KNPvHrxe059SNhQq8WKT8jKq
 MIGfYjKKnaqvO9ZMTKuf/s2Nw2aFiG4ywXuT3BXjgrzdRQh+wqPtnDRwgqx5IFcgQIZb
 B1b6ZEeoPlrl1CdI1kt+CECcf2BDCKwDabtEA7JQP8TKidV+RE7R0MfWftcGZ664t6HB
 7+dw==
X-Gm-Message-State: AOAM533kbS1b8LBiJ6MvAGScrS0X4pepkBnXRGTaEwqvPCyg/813zlOO
 8/855UjAQNf/LlwCtBXr0Sg/9k/Id0FbWaRKBPaR9/8SRNu8jOOqPDl8sWYGdrPcrZ3gBhmAlQ7
 LANzpewiCUwfuSD0=
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr4953763wmn.46.1640353433463; 
 Fri, 24 Dec 2021 05:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKAL6QjDNt8Lf0eI5qDyoU1C+eQ2HW+nhts+pgUxPfKE836xhIasj1ohKRxg4iGlQVdx9G4A==
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr4953748wmn.46.1640353433232; 
 Fri, 24 Dec 2021 05:43:53 -0800 (PST)
Received: from [192.168.1.16] (astrasbourg-653-1-189-85.w90-13.abo.wanadoo.fr.
 [90.13.172.85])
 by smtp.gmail.com with ESMTPSA id k31sm7852060wms.21.2021.12.24.05.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 05:43:52 -0800 (PST)
Message-ID: <e78ccda0-9bb2-a36f-071d-6225fb85f78c@redhat.com>
Date: Fri, 24 Dec 2021 14:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_file_open_tmp() to
 create temporary file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211222083652.776592-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211222083652.776592-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.133, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 09:36, Thomas Huth wrote:
> g_test_rand_int() must not be called before g_test_init(), otherwise
> the glib will show a "g_rand_int: assertion 'rand != NULL' failed"
> message in the log. So we could change the order here, but actually,
> it's safer to use g_file_open_tmp() anyway, so let's use that function
> now instead.
> 
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/virtio-net-failover.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


