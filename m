Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B86C37B6B4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:14:58 +0200 (CEST)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgj57-0007Lu-Be
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lgj4F-0006OZ-Gy
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lgj4A-0007YZ-JO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620803637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4c+ACL/FmYHZANdsFz+No8Sb0t9xliMHFRhLilsUY+8=;
 b=hbNXZllCl1y2cf+OoajcUwFGtzeVHMnyGhQRXiwyejpyahVsiqPZJmCzVBm4D6+yOtftL+
 xkODoa4Yt5kL9p23bfMe+Y8LSHnbIaE6wwyIvgssUfFMX7ld3h5STtV0BdhYNHvgb6SP77
 kOLvVleVziASwljCOVBoOQ38ky7Ntos=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-BWrv0Qm5NaWZGW5NN3RBlA-1; Wed, 12 May 2021 03:13:53 -0400
X-MC-Unique: BWrv0Qm5NaWZGW5NN3RBlA-1
Received: by mail-ej1-f70.google.com with SMTP id
 zo1-20020a170906ff41b02903973107d7b5so6769407ejb.21
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4c+ACL/FmYHZANdsFz+No8Sb0t9xliMHFRhLilsUY+8=;
 b=sdcJM2+pxD2Bt/DZDGzhyEd+Q9FHWlMA+rruoRigz0K95wgP83w17477w4DaCTydX1
 ysSmezb3tHGXnycyS5Tr6FLcAP32EJUzMGZbbTLbcMJbR4dcFsrabr/KzGCACY94hQjj
 e7hlRd7JYbNXFhPsU8YJ0R878xozWJx89FHd9F4yJTVZ8v+aXa/HDYhuQr1aWquF10aX
 mTNFjAwSlsEwdlwAMH33DQZmKUTadyURg7DFPafKrqUwKcLtQluYF6i4dc8bqHtz/YHs
 LuzQoa2cEZecGBt5LFeM6sFeq0tAwKL06uRIEbTJqfmqXTOT89dk3shlSTvHA1+myZGy
 3BNw==
X-Gm-Message-State: AOAM532sDmMp1niwA/vBA9zI5dALFdbfGtSKKhK44E6zIhCaPw2TrIr+
 Sbp2zvCp20vyxm8j8A6tz97tAPzhhCJ6lruicJZ6GJ045EFKBJEbpvZ9M0FN4A7SMJ/12gpXvbz
 nt6lK3qryqPNU+PA=
X-Received: by 2002:a17:906:d285:: with SMTP id
 ay5mr35123760ejb.222.1620803632799; 
 Wed, 12 May 2021 00:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDg1s0sDoXH3QTv5KbfkC4rFA21BbjRM8FRzJoJ6FNxL4Gsr4IW/udtxFv0AznWs5bqKM3SA==
X-Received: by 2002:a17:906:d285:: with SMTP id
 ay5mr35123744ejb.222.1620803632644; 
 Wed, 12 May 2021 00:13:52 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id h13sm10967876edb.65.2021.05.12.00.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 00:13:52 -0700 (PDT)
Date: Wed, 12 May 2021 09:13:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
Message-ID: <20210512071350.a7qnxgf3inzmm5j4@steredhat>
References: <20210511104157.2880306-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 12:41:54PM +0200, Philippe Mathieu-Daudé wrote:
>Trivial patches to keep VirtIOFeature arrays read-only
>(better safe than sorry).
>
>Philippe Mathieu-Daudé (3):
>  hw/virtio: Pass virtio_feature_get_config_size() a const argument
>  virtio-blk: Constify VirtIOFeature feature_sizes[]
>  virtio-net: Constify VirtIOFeature feature_sizes[]
>
> include/hw/virtio/virtio.h | 2 +-
> hw/block/virtio-blk.c      | 2 +-
> hw/net/virtio-net.c        | 2 +-
> hw/virtio/virtio.c         | 2 +-
> 4 files changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


