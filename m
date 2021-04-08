Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA7E358082
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:22:46 +0200 (CEST)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURoE-00036Z-2w
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lURkw-00015f-Kc
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lURkq-0003CI-Sx
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617877152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jF5OMQUBQvZn0YyAelu70HqbpdCDL6j5L3Knpi5LjvM=;
 b=gVs9lPR78w4HR2aZUc9mOZS1oInfRtKfJmR6roWEi7Ox3cJgSMUmu/jyN8nm9YoYSal4ZO
 WSzSWdVq2gRiXf4+66YjF0Bce91Ugi3Z35y6uNhf00CQRjr+0pOvQdeVxfBtMnb/kLTICS
 70MhFcJ3Qd5b4icpyGrwEdtB7mwpkBA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-27d_uyi6OsuCuNVZYMZlNw-1; Thu, 08 Apr 2021 06:19:11 -0400
X-MC-Unique: 27d_uyi6OsuCuNVZYMZlNw-1
Received: by mail-ej1-f70.google.com with SMTP id d25so178946ejb.14
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jF5OMQUBQvZn0YyAelu70HqbpdCDL6j5L3Knpi5LjvM=;
 b=YITlmkDWUnuVPkdrpV0fJ9KWmq5FldReGYUlvLg992PySNT4ex3EEZuswOaz+4CbSg
 7OeFOjVEbJl+CCXmcv9Yi4273Au2leqT6x+I0DSAwbck3ByFqQGfVQcRN5ETTmZPSr2X
 zP4iSoxbDfI53NbarCzRbvmMK8tQaX/kqx3W7CAkEW5kgBqUThUFl9HLqHlkgpJlCG8U
 JFDFh3vYxiTEQ9IlZHyVrCPSVhcGHmzx1MBSVZLt3xlx8y5P3Sg/sUOejnRetyq/PuDb
 YaxJmIw2B1v1HmuRtn9q2HyFK0Cjp3OoIiqOo3UokdI82IqZZudgAzKSQctLBU9gIoMm
 Sn6w==
X-Gm-Message-State: AOAM531QCfGxNXwgOXbGv6tRKgLoeIN/4gXCkT7qEbE4d+jokMy5JV4d
 k24fbCLRpdGAPhz3y6bxaIZ3W3iwMCRLpHNa8UA2T8jUGlAZ9MGiDbPBqlPdZqOyhNrncBpyqfe
 QVqBBIGv/wnjrIe5Ye6POAraZyVPqH26KxlLLUV64LPpS//7twf4r17BxUoUqr8MA
X-Received: by 2002:a05:6402:278c:: with SMTP id
 b12mr3425374ede.145.1617877149436; 
 Thu, 08 Apr 2021 03:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznWS71Hu57vin8nwRlOIYzziU5JbZmlwWgGhFgx1JGeB/Bj8nMlhl25gPo+No3yVDYH8lfyQ==
X-Received: by 2002:a05:6402:278c:: with SMTP id
 b12mr3425344ede.145.1617877149226; 
 Thu, 08 Apr 2021 03:19:09 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id hd37sm13435362ejc.114.2021.04.08.03.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 03:19:08 -0700 (PDT)
Subject: Re: [PATCH 1/3] vhost-vdpa: Remove redundant declaration of
 address_space_memory
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, raphael.norwitz@nutanix.com,
 lingshan.zhu@intel.com, changpeng.liu@intel.com, jasowang@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-2-xieyongji@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <878e2075-042b-6e36-2745-d51c3cfc4fe1@redhat.com>
Date: Thu, 8 Apr 2021 12:19:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408101252.552-2-xieyongji@bytedance.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 12:12 PM, Xie Yongji wrote:
> The symbol address_space_memory are already declared in
> include/exec/address-spaces.h. So let's add this header file
> and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 1 +
>  include/hw/virtio/vhost-vdpa.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


