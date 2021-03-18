Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E745340A4F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:39:11 +0100 (CET)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvfy-0001JN-Lk
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMvLY-0006nK-1O
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:18:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMvLV-0001v9-CG
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616084278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=paTI3hVR1JiRKGRwheB/QrGWCdHi0eWAJ9qmmKhvR0s=;
 b=WgyfLlELp7/+hPKh2UmDzRPlfZplhWFLQWcptEESQatriWVB84GQwtLN51FbUKb3TdlUDV
 4vSAe5LaZrgQU3eVGOwo20dtZUCkruiqPZpp9w9u0QZuaMi7VCPNrKA5L34Su92hwMfU0Q
 Jy1r46EuzYebb9UtMsSk0KDmKLjER1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-frPFwn-GNNqaZP7LxIZNZA-1; Thu, 18 Mar 2021 12:17:54 -0400
X-MC-Unique: frPFwn-GNNqaZP7LxIZNZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1309E180FCA7;
 Thu, 18 Mar 2021 16:17:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C0D5B4A6;
 Thu, 18 Mar 2021 16:17:51 +0000 (UTC)
Date: Thu, 18 Mar 2021 17:17:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: zhao xiaojun <xiaojun.zhao141@gmail.com>
Subject: Re: Can not use hmp block_resize command with -blockdev option
Message-ID: <YFN9LtEBpVsykSwV@merkur.fritz.box>
References: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
 <ac58e1ea-6745-7e62-f8c2-68fceebe1c2d@redhat.com>
 <YFMwWFbRi6wNWFtG@merkur.fritz.box>
 <CAAeqyDsxuwuyeMR4zd-=LSSt3U-Ma-AzJmnqaBk0=V4zRzvGww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAeqyDsxuwuyeMR4zd-=LSSt3U-Ma-AzJmnqaBk0=V4zRzvGww@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.03.2021 um 16:15 hat zhao xiaojun geschrieben:
> Thanks you, that's really good idea. And I also have the following question:
> 
> There are some hmp and qmp commands in my scripts, they need the device as
> an argument. Recently. i used the -blockdev replace the -drive to
> specify the disk drive, then use  qmp's query_block to query the device,
> but the device is NULL string. For the hmp's block_resize, I can use qmp's
> block_resize do. But the other commands(qpm's block-job-cancel etc.), they
> only support the device argument. So I can only continue to use -drive to
> specify disk drive.
> 
> I was trying to see the source(qemu v5.1.0):
> qmp_query_device()
>   -> bdrv_query_info()
>       info->device = g_strdup(blk_name(blk))
> the device is set to blk_name(blk), and the blk->name is set in
> the monitor_add_blk()
> 
> the -blockdev:
> qmp_blockdev_add()
>    -> bds_tree_init()
>      -> bdrv_open()
>    ...
> the qmp_blockdev_add() doesn't call the monitor_add_blk().
> 
> Questions:
> Why can not qmp_blockdev_add() call the monitor_add_blk()?
> Will the hmp and qmp commands that only support device as an argument be
> compat with the -blockdev option?

QMP doesn't have such commands. For commands that operate on the
frontend (the guest device), they accept the id of the -device. For
commands that relate to the backend, you can specify node-name.

It's only HMP that may not support these alternatives in some places. We
can just extend it.

Kevin


