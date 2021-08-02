Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADDF3DDFD4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:07:01 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdHA-0006fU-1j
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd72-0006W2-TW
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd71-0003GA-Df
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOk7Tx+y1Z+Qr/iyPZysfvF2UexkklecQnW+lVyCsrA=;
 b=KpzoKHx/8iUKxuDy+PnkxrVGmrLfonbWllq9B6sr4hQS79ZqMwXZawRBW3w7A50T3gd8ZM
 Lu5Y7YEKjkxnFr+fC3uB/SrDYdAgn88Cogmtgl50a85XMY/8oer5f2tNUrbHBJtUDYFttV
 KJnh1l3ttbyc/Jjvb4VLZBNVwXOZZjI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-v1dfaO3ZOLWlL8BAjbDwHw-1; Mon, 02 Aug 2021 14:56:29 -0400
X-MC-Unique: v1dfaO3ZOLWlL8BAjbDwHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l38-20020a05600c1d26b0290259bef426efso166290wms.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eOk7Tx+y1Z+Qr/iyPZysfvF2UexkklecQnW+lVyCsrA=;
 b=Z25lmbpHG28giItnZdQa6sU1E2XxgVQM0jpUxfdaynn2vMGr6DCcjoYAINx+LXK5BN
 Noprbjk3MlLuRtbSkc3NrUTDRV+576ig+CXfo0almU/5lG/X58ekIwSTwQn2cQ6fX+dS
 IeDH1HLwAs3InIEXLph7w1D/2rj7ecPjEHFFI6gzbARn2DGoaw9A+5WGadlN24bdLeZD
 1UgJy49Cmzn/xXfxluNX2TAIboa0bl81gpts5P/n6GfJegyqAOqd/mHZ8K6UzOE9JLy8
 NHhcUPJqkfCk6AMrZSP0yZzAm20D+/Gt39l0kUBJd60cvqisZQh9AZ0zxVVfTyT/Lh2O
 NczA==
X-Gm-Message-State: AOAM530simHkeNmmLDpLx4rPGf3Z/jU4zRIL+bpuZ0xSINOxBNoZZhqv
 KxS5V9vK+zrhDbMvzEbc6PCegTuw7lNTieacr9OPpWP8LvKZrnqZVOvFSuat/Xu3bgCqrcnPiU7
 nBA9dQRPmFIdaP2o=
X-Received: by 2002:a7b:c944:: with SMTP id i4mr18818701wml.23.1627930588142; 
 Mon, 02 Aug 2021 11:56:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDBDMNsIsPWDGEDBFc/djDih9EAL44FlznX1Z07pXLwynjL8tAp63BjNncubncrqe2/PzsSA==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr18818686wml.23.1627930587892; 
 Mon, 02 Aug 2021 11:56:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q63sm245197wme.36.2021.08.02.11.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:56:27 -0700 (PDT)
Subject: Re: [PATCH 12/16] vhost: Clean up how VhostOpts method
 vhost_get_config() fails
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-13-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <81d97f31-020d-3481-8ca4-aa766c5de92d@redhat.com>
Date: Mon, 2 Aug 2021 20:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-13-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> vhost_user_get_config() can fail without setting an error.  Unclean.
> Its caller vhost_dev_get_config() compensates by substituting a
> generic error then.  Goes back to commit 50de51387f "vhost:
> Distinguish errors in vhost_dev_get_config()".
> 
> Clean up by moving the generic error from vhost_dev_get_config() to
> all the failure paths that neglect to set an error.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/virtio/vhost-user.c |  2 ++
>  hw/virtio/vhost.c      | 10 ++--------
>  2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


