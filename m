Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC754426D6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 06:40:53 +0100 (CET)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhmXU-0003g4-33
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 01:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhmTj-0002xC-Rp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 01:36:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhmTf-00015v-Oi
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 01:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635831414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qlKprhKf9sz/a8k/Ws+tF+ljFLc+MMt1FoHztZKXko=;
 b=TL2egKQd16KGoWi56mxu+X+UKMVcFkk0nkgF5yghxknwoJ72Ak0Zqmp1SjmmjTuRPBu78B
 99vGDGO6ZsO/CkqPgVTDCNDPJH7huNSEA9XJV8xwWtrgRi6Nws9xJ6JPP9Vl+8Zp2wIDw5
 2RYE+u2FaHYhUBrQqYTp/C+Bo2xNeBE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-iuA-E0MxOH6ryMcm75nxbw-1; Tue, 02 Nov 2021 01:36:53 -0400
X-MC-Unique: iuA-E0MxOH6ryMcm75nxbw-1
Received: by mail-pf1-f198.google.com with SMTP id
 w30-20020aa79a1e000000b0048012d2e882so5390285pfj.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 22:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0qlKprhKf9sz/a8k/Ws+tF+ljFLc+MMt1FoHztZKXko=;
 b=S92/fwlQcJW4+cfnBc9zgv4dGZTzZ8zVE8o/6Z3738A6dXKT4TBYDULIBmJz3BJtqc
 EHl5ZaYBkA0PtyO2o3+gYkrSonf9S87BzROfTPpvFSi95absUkVUuHOlrsZmOhGnpPzR
 wuby8zgTyFNOp/J+qRWs94ifBxte6LZONzXXNZIIDczRYCqtp0nEOhNt1zetv1DXonhB
 /qUiKthdW+p49XyV9bkAk2yd53xxYJ+NFSuLWcvijUyI8ZmzuKCxCrvCoe9OsrYt4YSA
 1ISJzvUWPCGMW/rKAyG6jFwF2GCUhWpLpvxwRuhSYzxZjL0gk3h8GBpOGUqvnhW5nUWC
 lffw==
X-Gm-Message-State: AOAM532LiPcabXEMaR2Q5NVsRr0KJusWv3X2fUs5AHsEF73hkrlBFsxD
 Xf30LY3at2fkSGF4lQ951c6FDBsIfqoUbiPT19UJ5MS2PvRDrQIyaJo9Isz4KYzrCu55ICDINxq
 dL/6t56XxpUmK4Dw=
X-Received: by 2002:a62:7642:0:b0:480:fcd3:110e with SMTP id
 r63-20020a627642000000b00480fcd3110emr15479456pfc.39.1635831412128; 
 Mon, 01 Nov 2021 22:36:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbsGtfjCSSgvkrY6wzYtRSS8vOXpZ1EiZW+RTDW1pLNLNTRLZI94bru6SiR/xlYx9HK4k6Yw==
X-Received: by 2002:a62:7642:0:b0:480:fcd3:110e with SMTP id
 r63-20020a627642000000b00480fcd3110emr15479418pfc.39.1635831411853; 
 Mon, 01 Nov 2021 22:36:51 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w11sm14887120pge.48.2021.11.01.22.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 22:36:51 -0700 (PDT)
Subject: Re: [RFC PATCH v5 12/26] vhost: Route guest->host notification
 through shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <59e7f05d-6d1d-8c6f-cdba-d02034b49f20@redhat.com>
Date: Tue, 2 Nov 2021 13:36:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029183525.1776416-13-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/30 上午2:35, Eugenio Pérez 写道:
> +/**
> + * Enable or disable shadow virtqueue in a vhost vdpa device.
> + *
> + * This function is idempotent, to call it many times with the same value for
> + * enable_svq will simply return success.
> + *
> + * @v       Vhost vdpa device
> + * @enable  True to set SVQ mode
> + * @errp    Error pointer
> + */
> +void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
> +{


What happens if vhost_vpda is not stated when we try to enable svq? 
Another note is that, the vhost device could be stopped and started 
after svq is enabled/disabled. We need to deal with them.

Thanks


