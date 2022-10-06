Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7835F6DAE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:45:04 +0200 (CEST)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVri-00033g-UC
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ogVKE-0007Dn-V5
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ogVKB-0007vS-QW
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665079822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dYs6I/qvwXw5nK7QQnMgF3NBl78b/q6pDuTyJVcv/1w=;
 b=aqTZYG4eE1OMzSTZjU05vyILnWrj7aAism6jSLA5/AI6cPuyFCRxd36N1XuC6CZe8rffHH
 Vpy3uYuy8Kzggmi+UtuUSohII9cfYugxxIbFFctddzKw+iZrMnL1kDBLuIpfH7Wc65j+zA
 sXaKVwIDySYSh6I2OWcurEpD5KtbaHQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-vriowyIVOuOOmVdUFChYzA-1; Thu, 06 Oct 2022 14:10:13 -0400
X-MC-Unique: vriowyIVOuOOmVdUFChYzA-1
Received: by mail-il1-f198.google.com with SMTP id
 z4-20020a921a44000000b002f8da436b83so2074172ill.19
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dYs6I/qvwXw5nK7QQnMgF3NBl78b/q6pDuTyJVcv/1w=;
 b=LnecpSQUDeE26s3GcTgVDaPty9BOL2+jhnUpBuE9RuFaJBnzKPJP6D9eWPPzV7ikvD
 fst01D0VJAjKI0kS4WyElVOLuRCuKk9RHCHZnsEEapdc913pv7s+gfUPMnLQacJKvII7
 p/EmWRb2JoAqWczZNiW3EWnrewNN9Dm9LofJNWp7njYtfhS+rThHYWXsmLyB6qSI4wSv
 QJj7/NDUl1qk54Vo/JooSKfWG30C3LYSEo+HO9uEOCKVFtYjTSdBxRKlo+BakbNP691c
 ZH2cCsrhoZap1YccFDHAfO7okxEvQW34/+BJlHNIIaUlKJ8BrzZiIvLz2htuTM4r7cY3
 CacA==
X-Gm-Message-State: ACrzQf0L1Yu4XDgVgBCEjOXSftN2ivZdgqBZacqTPUDuS32lR8icYdb4
 cEeoaIV0V2V49z81Dn4H/6ogXxSMCR+TNELnvtDCS9jjuVd9RYOVj9st/PVqzD6V5a1mNmBXgql
 ieItFnleeItXp08KRo4tkqa9V6/elmWI=
X-Received: by 2002:a05:6602:1554:b0:6a1:de25:9ce8 with SMTP id
 h20-20020a056602155400b006a1de259ce8mr487309iow.202.1665079812823; 
 Thu, 06 Oct 2022 11:10:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5szYrEps4FuICkoJt37xdHxo8KMQ5U6uYeOZgUvGQQmHFxnZd+5QhaGP0GpbxfNH+80yks8xifV6yr9m5t3N8=
X-Received: by 2002:a05:6602:1554:b0:6a1:de25:9ce8 with SMTP id
 h20-20020a056602155400b006a1de259ce8mr487286iow.202.1665079812637; Thu, 06
 Oct 2022 11:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-12-stefanha@redhat.com>
 <YzSex5t0UIAT+LPU@fedora>
 <CAELaAXyURC9YJvtjY3O5iXsA5Q0WCTxM21++iqJ__pna9CSNOQ@mail.gmail.com>
 <Yz8Xr81Dw8M9rj3c@fedora>
In-Reply-To: <Yz8Xr81Dw8M9rj3c@fedora>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 6 Oct 2022 19:09:36 +0100
Message-ID: <CAELaAXw+sLHOX9drshJbZmpryRkQFd4ozuX-ZoCq+uTRwXsaWg@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>, 
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Xie Changlong <xiechanglong.d@gmail.com>, 
 Eric Blake <eblake@redhat.com>, integration@gluster.org, 
 David Hildenbrand <david@redhat.com>, Wen Congyang <wencongyang2@huawei.com>, 
 Laurent Vivier <lvivier@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 6, 2022 at 7:00 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> s->needs_mem_regions determines if we'll use libblkio memory regions at
> all. When it's false we skip blkio_map_mem_region() and therefore it's
> safe to set s->mem_regions_pinned to false.

blkio_register_buf() calls blkio_map_mem_region(). Is the
bdrv_register_buf callback maybe skipped somehow when
needs_mem_regions is false?

Regardless, I'd say we want to map memory regions even if we don't
strictly need to (in cases where we can do so at no additional cost),
since that may improve performance for some drivers.

Alberto


