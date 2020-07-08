Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCBE2193A8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:41:09 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtIkW-0007k9-BF
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jtIKa-0003BM-G6
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:14:20 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49599
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jtIKX-0008Hn-Ku
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594246456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foKCPCHuOWEo6TsYfm8Oz8Dioah9AubWatTSQdaIZYM=;
 b=gC64K18tylWFqXLrEtPJ36pHr1kj8AnJxdU/ZUdMzzEdM1d35JMhPD8IH6+bIJAqfTQ5bx
 1IH6xn2RGBqpmQAu1AGgIZ50P6Vtf3RbxU5uv3TefyrO/+asg5q9Lu1zv4gTJ3LBNMjN+R
 sENgtMVniEaZTfjqWYQCaHYqerDaj5E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-Yg9OZbQZMkyP-PlzKBgvqw-1; Wed, 08 Jul 2020 11:11:49 -0400
X-MC-Unique: Yg9OZbQZMkyP-PlzKBgvqw-1
Received: by mail-wm1-f71.google.com with SMTP id e15so3271490wme.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=foKCPCHuOWEo6TsYfm8Oz8Dioah9AubWatTSQdaIZYM=;
 b=BQxBLwXxnO26M32T/KnKDGWVygTcb4gfZ62We0BuKxxsJ3oKzgtxny1+R61H8PZ18m
 V+2ysNAjey9JFEJTyIfQ50k27ErB9yut2WOUg2R24ElGNK4qb8snW1yIdWiAEywDvEZm
 XSInS7Q5mBpvLB/sETolDFDthzChdGYgusYn8cI+OkhYaxEq64PefwH3WjxtEqi+Vz5D
 zTiQxu4PGqMvJncNkkpdEzarQ3rzidk1f2tqP/E0ZUTTs/BCpmX9ANDyxJTgeMg6hX/X
 CK88qZHC2rkPtS6FePPGyr7OnNR3X81iSQDs1uAL7rXC0pXwL0jdee597KvSr7H692qK
 Y39w==
X-Gm-Message-State: AOAM531vLiDClcN+z2c+/mEH5Ru/TcO9PGRvRUl0LseCDD83geMm+UKe
 9JctdZCJ1CIYm6CA9sScQsoK7R8C9qt/+9ykKg1IkJrR34wY859dmQDidGMr5LE7KxySc438SS8
 s6a3eKJMNRdXp/34=
X-Received: by 2002:a5d:4607:: with SMTP id t7mr63362033wrq.251.1594221107960; 
 Wed, 08 Jul 2020 08:11:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8epqkGG0hPzjwi7fsacmxpcpyLFUFaJEdIjJI6eQTHRExlT67/ceBGD3fYNPHuf8qNhmKUQ==
X-Received: by 2002:a5d:4607:: with SMTP id t7mr63362019wrq.251.1594221107760; 
 Wed, 08 Jul 2020 08:11:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id v6sm318194wrr.85.2020.07.08.08.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 08:11:47 -0700 (PDT)
Subject: Re: Questions about online resizing a lun passthrough disk with
 virtio-scsi
To: lma <lma@suse.de>, qemu-devel@nongnu.org
References: <af3e33e4a5bb15d9f0b30c8de4941a37@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a1d96da7-444e-d3b0-abd5-63cdab92e869@redhat.com>
Date: Wed, 8 Jul 2020 17:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <af3e33e4a5bb15d9f0b30c8de4941a37@suse.de>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/20 16:44, lma wrote:
> 
> Is the 'block_resize' mandatory to notify guest os after online resizing
> a lun passed through disk? I'm curious it because I found there're couple
> of ways can make guest os realize the disk capacity change.
> e.g:
> * run 'block_resize' via qmp to let virtio-scsi notify the frontend about
>   capacity change.
> * run 'rescan-scsi-bus.sh -s' inside guest.
> * run 'sg_readcap --16 /dev/sda' inside guest.
> 
> I knew that the purpose of 'block_resize' is not only to notify guest os,
> but also to update some internal structure's member, say bs->total_sectors.
> What if I forgot to run 'block_resize', but run 'rescan-scsi-bus.sh -s'
> in guest?

Request start and length are checked even for passthrough disks (see
scsi_disk_dma_command in hw/scsi/scsi-disk.c, called by
scsi_block_dma_command), but the maximum LBA is snooped from READ
CAPACITY commands (see scsi_read_complete in hw/scsi/scsi-generic.c).
So as long as rescan-scsi-bus.sh results in a READ CAPACITY command, it
should work.

It's not recommended however, because block_resize will report the
change to the guest directly with a CAPACITY HAS CHANGED unit attention
condition.

Thanks,

Paolo


