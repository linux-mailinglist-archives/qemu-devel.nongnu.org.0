Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF439316F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:50:23 +0200 (CEST)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHL3-0001wb-Vl
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmHI5-0008C5-8H
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmHI2-0001KR-7h
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622126832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E9GhDII+DTZVIhRDSik7xvNzE4HFP82EOqYx8OfGxuk=;
 b=SMt7216AHhxpdzt5/UXE31eZ8Fvw6tu7nxOeYxPfwFLVU45kwaI9fJAJyLbHRuBXWqYCEh
 OEm673ExBghPUZDPKeQA0Y0rqfKwHTxC9dsjfpUeP4l6V3fUPCEAJG5jAMuI0t9awl1Ddc
 3Vcc7rRCnDIAIRZyQ8gv1fOhUzzWVv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-HXM_n-asP2aY4B_zI8qt_Q-1; Thu, 27 May 2021 10:47:10 -0400
X-MC-Unique: HXM_n-asP2aY4B_zI8qt_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F9D050200;
 Thu, 27 May 2021 14:47:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-201.ams2.redhat.com [10.36.114.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9EEC18825;
 Thu, 27 May 2021 14:47:00 +0000 (UTC)
Date: Thu, 27 May 2021 16:46:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/3] block: drop BlockBackendRootState::read_only
Message-ID: <YK+w43oKABDuqDOC@merkur.fritz.box>
References: <20210526211534.524597-1-vsementsov@virtuozzo.com>
 <20210526211534.524597-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210526211534.524597-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, codyprime@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.05.2021 um 23:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Instead of keeping additional boolean field, let's store the
> information in BDRV_O_RDWR bit of BlockBackendRootState::open_flags.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> diff --git a/blockdev.c b/blockdev.c
> index 834c2304a1..c36884c691 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -576,6 +576,9 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>      }
>  
>      read_only = qemu_opt_get_bool(opts, BDRV_OPT_READ_ONLY, false);
> +    if (!read_only) {
> +        bdrv_flags |= BDRV_O_RDWR;
> +    }
>  
>      /* init */
>      if ((!file || !*file) && !qdict_size(bs_opts)) {
> @@ -584,7 +587,6 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>          blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
>          blk_rs = blk_get_root_state(blk);
>          blk_rs->open_flags    = bdrv_flags;
> -        blk_rs->read_only     = read_only;
>          blk_rs->detect_zeroes = detect_zeroes;
>  
>          qobject_unref(bs_opts);

That we're now using different flags for blk_new_open() looked a bit
suspicious, though the new state intuitively makes more sense than the
old one.

Anyway, this patch breaks ahci-test:

# starting QEMU: exec build/x86_64-softmmu/qemu-system-x86_64 -qtest unix:/tmp/qtest-54104.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-54104.qmp,id=char0 -mon chardev=char0,mode=control -display none -drive file=/tmp/qtest.mGtxeg,if=none,id=drive0,cache=writeback,rerror=stop,werror=stop,format=raw -M q35 -device ide-hd,drive=drive0 -incoming unix:/tmp/qtest-migration.XVRZZi -accel qtest
qemu-system-x86_64: -drive file=/tmp/qtest.mGtxeg,if=none,id=drive0,cache=writeback,rerror=stop,werror=stop,format=raw: Block node is read-only

Kevin


