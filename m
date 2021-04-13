Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6F35E4C8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:15:11 +0200 (CEST)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMd4-0003Fc-Je
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWMWb-0005az-Tc
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWMWY-00015h-8t
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618333705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zZMLp1JJMeuGe8X8bIHcoRMfS2dx0NHKl/wI3J5eis=;
 b=AI8EEhambJZyBFoEivJuAHfEXYjVrr+vkJmv6anscqzmkoVBOZDRJ0OJClJ4SG2ZPIxgd7
 M3wm0iX7gj50KzJqcyJ5gnhe3lPgY+xovGejsVSm1FhTwqoiYVDMqg02WYY5X0x7/VhYAa
 PBUcPpva6X1VWBAJtIO6R/L1xl3x90k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-mGhMA1L7MYiLE18cTr1Oyw-1; Tue, 13 Apr 2021 13:08:22 -0400
X-MC-Unique: mGhMA1L7MYiLE18cTr1Oyw-1
Received: by mail-wr1-f72.google.com with SMTP id y4so955297wrs.7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 10:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4zZMLp1JJMeuGe8X8bIHcoRMfS2dx0NHKl/wI3J5eis=;
 b=gOohn9M9ZvjFAc/Kj23ukLPLcdtrelrN6NfMeLTh5QqXOPk/KVmp4UMKqd6QCM2IzQ
 oRBnFU9G/w6sTZQhPUSTQXXikFjm0csj7c1J+Y/0pe+2Kk6Puuaw7xSZTUz9mgLw8TX0
 FonTZtErreKWZGpY2Y0vM5YHYZmY/nV+NT1l/Bjt8RH32EzdYZNu3zXtHwNFvfkXtBg1
 ZJha0gXyhZbU83N5iA7bmZ70XJ9Ow/OW3Z4+OjiT1tyBuEiXjORfZrpdF99NE3ikKe5Q
 IjqW8QZaZn4Ku2mZhAmbJjrYoUBnAysxvB9amfX6Jp4scOFZ8zf84kYs50mpQ1FRZ2Av
 8B2A==
X-Gm-Message-State: AOAM530Zf0X7FE4MrwtCRkkrnv15gII5o3zCG9RcLO+Sjkp+oX1P2s2s
 aFtxl8neqCYniIwvBKtus8dFORpxSvGAWXUKRmPuXGUx0c0bG51ypQUYK7t5dBHVGRh39eRbJHx
 DH+lm+kJj8dvsm78=
X-Received: by 2002:a1c:e3c3:: with SMTP id a186mr936887wmh.81.1618333701785; 
 Tue, 13 Apr 2021 10:08:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPDAPpfYJr1JVnjOvM4QzzUcaOfk6MKe7SJ6zZeYXlm0fxPJZHzKgEQKf6mOEOLNnzZYyVIg==
X-Received: by 2002:a1c:e3c3:: with SMTP id a186mr936865wmh.81.1618333701630; 
 Tue, 13 Apr 2021 10:08:21 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c8sm2909736wmb.34.2021.04.13.10.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:08:20 -0700 (PDT)
Subject: Re: [PATCH v2] vhost-user-blk: Fail gracefully on too large queue size
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210413165654.50810-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3bfcaca4-282b-ef92-65a7-dc75fb2794e3@redhat.com>
Date: Tue, 13 Apr 2021 19:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413165654.50810-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:56 PM, Kevin Wolf wrote:
> virtio_add_queue() aborts when queue_size > VIRTQUEUE_MAX_SIZE, so
> vhost_user_blk_device_realize() should check this before calling it.
> 
> Simple reproducer:
> 
> qemu-system-x86_64 \
>     -chardev null,id=foo \
>     -device vhost-user-blk-pci,queue-size=4096,chardev=foo
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935014
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>



