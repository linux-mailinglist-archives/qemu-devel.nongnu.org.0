Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DD55B901
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:50:17 +0200 (CEST)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lNo-0005cB-O1
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o5lIH-000845-Qm
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o5lIE-00069m-KF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656323068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iG7tDiGxU0wP99DKLLuS8vaWTrFaV92ThFHt4wNAi0E=;
 b=Jp4Nx0bboplnYdtndl2ClTgKPP5Qq/Be6UGDKuy3aMqIXy4dB2QVQo5gmIHHU4bqyDLTgO
 KAICEWgSmZJgVGpqQKPanogro0Wvu2krZqZZFdFt20A5106l070DVr5I9kClWfF5rkg2ma
 rHTuE++0MtV8F3oOOmzzeWtiE95d5MU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-sp5RvB_WOV6b06-QLgoIbQ-1; Mon, 27 Jun 2022 05:44:27 -0400
X-MC-Unique: sp5RvB_WOV6b06-QLgoIbQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so1043274wra.15
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:references:subject:in-reply-to
 :content-transfer-encoding;
 bh=iG7tDiGxU0wP99DKLLuS8vaWTrFaV92ThFHt4wNAi0E=;
 b=mXZM6HICzmNmJhWyNU9kCN+gFsiZp8RQ/wm95FLkvZtnymeMiVCr3XlaXnzL6TSX2I
 rVhT32HJG6vzHcCcnmcsOGXqcG3KFgkrSGDpGMwxEY8XOsgho0IbTG3deLN0DTO+iZXd
 RoQivNm40kPsnh0p3uxD7Jek8cn5JYtTWYQYsjXDyoDwWMemPDGaiewiL1XAAWhbvwSu
 h9i6xKGFAWs8dlKMxTHvxJMwKZQ7fcjqllvC+D/wkmknCZsdqO7FXnQSZmIPnjr4dkFE
 Jxnu2kPdiJhQo3UwMS7MA8nXe/DT2a8+BAv6QuFDd3+HfeOpR/9G6yltzj3E5pvx+rjT
 FKRw==
X-Gm-Message-State: AJIora8ji1vQL7t3xdLItWmaaoCaZFc/t1RBKsg/7cso0ePKEkC74yw0
 9UnIujG2yt91nQKZSq5DnxIw8Io2+H5nsnOJyptTqbGu6OLWysvSn2WM5hbP25WnUxnl3Fa+yGh
 8KQtkh4TLayfvI3U=
X-Received: by 2002:adf:e28a:0:b0:210:b31:722 with SMTP id
 v10-20020adfe28a000000b002100b310722mr11415463wri.65.1656323066176; 
 Mon, 27 Jun 2022 02:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHPBvE/yE2G/wLRM1HyezdnpL4LT+uPKFE9ct1WfEJ7MEs2dIyN3eFyj5y3Z0w9LWDdowW9g==
X-Received: by 2002:adf:e28a:0:b0:210:b31:722 with SMTP id
 v10-20020adfe28a000000b002100b310722mr11415452wri.65.1656323065947; 
 Mon, 27 Jun 2022 02:44:25 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-150.web.vodafone.de.
 [109.43.178.150]) by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b0039c798b2dc5sm16403912wmc.8.2022.06.27.02.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 02:44:25 -0700 (PDT)
Message-ID: <94c840e5-c126-f42a-666b-8375c7a4169d@redhat.com>
Date: Mon, 27 Jun 2022 11:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220624085037.612235-1-thuth@redhat.com>
 <20220624085037.612235-2-thuth@redhat.com>
Subject: Re: [PATCH 1/2] pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
 virtio_ipl_disk_is_valid()
In-Reply-To: <20220624085037.612235-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/06/2022 10.50, Thomas Huth wrote:
> The s390-ccw bios fails to boot if the boot disk is a virtio-blk
> disk with a sector size of 4096. For example:
> 
>   dasdfmt -b 4096 -d cdl -y -p -M quick /dev/dasdX
>   fdasd -a /dev/dasdX
>   install a guest onto /dev/dasdX1 using virtio-blk
>   qemu-system-s390x -nographic -hda /dev/dasdX1
> 
> The bios then bails out with:
> 
>   ! Cannot read block 0 !
> 
> Looking at virtio_ipl_disk_is_valid() and especially the function
> virtio_disk_is_scsi(), it does not really make sense that we expect
> only such a limited disk geometry (like a block size of 512) for
> out boot disks. Let's relax the check and allow everything that
> remotely looks like a sane disk.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   pc-bios/s390-ccw/virtio.h        |  2 --
>   pc-bios/s390-ccw/virtio-blkdev.c | 41 ++++++--------------------------
>   2 files changed, 7 insertions(+), 36 deletions(-)

I just noticed that this breaks booting ISO images via the "-cdrom" option 
... looks like this needs some additional fixes on top.

  Thomas


