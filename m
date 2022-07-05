Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961B566578
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:53:43 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eJS-0007Rj-FR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eHn-0006S2-Vf
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eHm-0007CN-Dw
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657011117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+jeOCMkJENOvmKIVU7pw540gFXlc/X5tKy4NMgSNtE=;
 b=f9EaW0PNj9Z2bBRBcfjDD6r254BYTxHZEPUucQMXULyZH8VxqZwSZr/F5AGGiebBxI8+aJ
 x2dTKyiHqm2LmGIga+0SMXOF0u5hJ4bOzui+2C+PxHxVt0SHHodszwGOoYpXNbJUFNXEYM
 3bMjoRKJ1S69bqmdZn8tm/SEf3yoZ0c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-1J6dBR1cNpGvyaopREFbng-1; Tue, 05 Jul 2022 04:51:56 -0400
X-MC-Unique: 1J6dBR1cNpGvyaopREFbng-1
Received: by mail-ej1-f70.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so2527040eje.23
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W+jeOCMkJENOvmKIVU7pw540gFXlc/X5tKy4NMgSNtE=;
 b=icWiyuMK4ZT/Xn8yfh2eucP3KrKyub0tkmqMAFclTmoGCCwgdL699PFkJKnJ8sL1Pk
 LmFOA6VWh2N39ALEj5I0X6N3AgHKyRzQNw7UPFaZNrzQc7c7ydBuPVmVcpQ2XSy3VsDC
 sfJyO+6zEIyZgcv4gkkfrM0xEdgQZ2jEf9y/ETL8nz6RzAQhX3HixABLdRqEqVTEhI3K
 IA9YF9sPBo8LWyzANrKjo3444JHwd8+JzFmr7ShhAZy89BY9EAVq8yZIqby3jxIOqZMd
 1z9ZEzyRxfS9Df7aEW4L/HGBEBt40gkm+WIwjGqgNJrlarlsmks7Eh1rD4CFTr9aY/Uu
 WYUA==
X-Gm-Message-State: AJIora934qfDHEp2/zrQnfK7v/o2HGU6vLDrBuTKDNv6+i37L5mEnD2m
 xysvJRimtGd+whEaXpWtpRyTUbN2AhWQP0loBDb6hYQ2PTN6bWj1Ij6FlERMu3yhlASqR3531N+
 B9Hbf6qOE6Lna73E=
X-Received: by 2002:a05:6402:b9b:b0:43a:5aac:ed6 with SMTP id
 cf27-20020a0564020b9b00b0043a5aac0ed6mr11893577edb.131.1657011115308; 
 Tue, 05 Jul 2022 01:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZJ1irlU4gY9Qw3CYUoBCkBQJqIgwyuDzNocGIB4rAcb2PvUd18OU4uYamy+Sajwzk3Z0MWQ==
X-Received: by 2002:a05:6402:b9b:b0:43a:5aac:ed6 with SMTP id
 cf27-20020a0564020b9b00b0043a5aac0ed6mr11893555edb.131.1657011115045; 
 Tue, 05 Jul 2022 01:51:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 kv12-20020a17090778cc00b0072ac3f06615sm2928919ejc.133.2022.07.05.01.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:51:54 -0700 (PDT)
Message-ID: <710b396a-cf85-3d1c-a8e4-1989b0cd3e59@redhat.com>
Date: Tue, 5 Jul 2022 10:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 13/18] block: Implement blk_pdiscard() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 17.05.22 13:39, Alberto Faria wrote:
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 12 ------------
>   block/coroutines.h                |  3 ---
>   include/sysemu/block-backend-io.h |  3 ++-
>   3 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


