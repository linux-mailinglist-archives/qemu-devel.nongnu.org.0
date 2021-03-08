Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D72733159C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:13:25 +0100 (CET)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKNg-0008Vi-JZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJJpD-0004ad-NW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJJpC-0000cT-26
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615225064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p41WGjEacJEZdK8ZYq3XjUoXvCwhJJPKYlyQ0ak6UEc=;
 b=eBR64wtIMSmYYihyqh0PLhcF2CMoZEQqkXfLu94kjGS8I2SsOS6ECQAYXsRTKqKV4Atcv0
 JVpww4YIZWzvkQsMBGPmx4PFvj2KrfxZbfLN7sMsS47xbkjXzMiYRdEpgVh9twpfzo5bvh
 paCoApkLNvBKxRc8ZTm9A8ifFvUS3Q8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-w3NxmDEqOfSUsELikXu09g-1; Mon, 08 Mar 2021 12:37:41 -0500
X-MC-Unique: w3NxmDEqOfSUsELikXu09g-1
Received: by mail-wr1-f71.google.com with SMTP id h30so5139301wrh.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p41WGjEacJEZdK8ZYq3XjUoXvCwhJJPKYlyQ0ak6UEc=;
 b=CVzBlQltUPj3gTti6RVZlyx/ajfHbAa/Dm9YSt/+hvNq6Oee9ibxspRW1CwNHRgR7M
 Ly/18VfpPx3+r2UZeLW+E6pvXe+5CvzkcQSrKvVYi2TXA7lYwuXz7UhcU5RkZNgoaReN
 gnq36tbbJAdTPx8wKsuJVMjyjPf/ufnV+Xad6Hvf1FvtHLXhKipQf7zUFp7IjALgTZmK
 raRGTeiSPDOmLLUILtyH2Y0lQmTqWxSsIbVUa1Uore1iOGHaGTbtOd8L4+15R8SgmBDH
 yJOwNZdftK4sZx/fxEKMslDdG4xwqIGnIySMbRLHgMdzSg10Ix8hp4sd//BqY/QgzOnM
 hRQw==
X-Gm-Message-State: AOAM533uapsHucapsWPWgliW+Mwq9eA90FoWE5MSVMmshJm52w7DJKp4
 XLGRJ6OYPsDcKF9QgxhLv+on4kxNbzwyT6cM5x3gfa33V6I2wqgpIF1fKMr8eCQA+XqBrIbXd0j
 QE0GqXcV4TFYYGlM=
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr22293802wmc.89.1615225060146; 
 Mon, 08 Mar 2021 09:37:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSmeB2dN1zdzZxpYGd58BfcLPchN7Pxl2J6J/U+2DLSVH+Yxp2L3UWoLJmud3lu/op6qFQJQ==
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr22293783wmc.89.1615225059934; 
 Mon, 08 Mar 2021 09:37:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x11sm48333wmi.3.2021.03.08.09.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 09:37:39 -0800 (PST)
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
 <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
Date: Mon, 8 Mar 2021 18:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/21 18:29, Anthony PERARD wrote:
>> If nothing else works then I guess it's okay, but why can't you do the
>> xen_block_drive_destroy from e.g. an unrealize callback?
> 
> I'm not sure if that's possible.
> 
> xen_block_device_create/xen_block_device_destroy() is supposed to be
> equivalent to do those qmp commands:
>      blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
>      device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2
> 
> But I tried to add a call xen_block_drive_destroy from
> xen_block_unrealize, but that still is called too early, it's called
> before object_property_del_all() which would delete "drive" and call
> release_drive() which would free the node.

Can you use blockdev_mark_auto_del?  Then you don't have to call 
xen_block_drive_destroy at all.

Paolo

> So, no, I don't think we can use an unrealized callback.
> 
> I though of trying to delete the "drive" property ahead of calling
> object_unparent() but I didn't figure out how to do so and it's maybe
> not possible.
> 
> So either drain_call_rcu or adding call_rcu(xen_block_drive_destroy)
> seems to be the way, but since xen_block_drive_destroy uses
> qmp_blockdev_del, it seems better to drain_call_rcu.
> 
> Cheers,
> 


