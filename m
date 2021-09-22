Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C6414A5F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:18:53 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT29E-00089d-3G
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mT24R-0003fA-6y
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mT24O-0004as-Sk
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632316431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N7zI6WeuhkIhXIbj5UUyC4ClsB/GADoXi9RosmRsdxE=;
 b=Uh3tO7xQjvud9Daa7vdiBSy4rVNBNUmizxDpXHoTMVT+hbtjbmUJniA7vbfNJ5WNXCQkaO
 E4isji70jZtaae4byQdhfAaEsm08ZGZncR8cWmrgT0Mv3BlZ/1hQQ39dJ9hONkn34P1snG
 9lRomHqq5iw9aLdsCfDk6A8/1Aers1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517--77ICfp8Nb2sJczGxZXzpA-1; Wed, 22 Sep 2021 09:13:48 -0400
X-MC-Unique: -77ICfp8Nb2sJczGxZXzpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F239B824FB8;
 Wed, 22 Sep 2021 13:13:44 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F11C60854;
 Wed, 22 Sep 2021 13:13:28 +0000 (UTC)
Date: Wed, 22 Sep 2021 08:13:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 00/11] 64bit block-layer: part II
Message-ID: <20210922131326.hpi2ir4hq2t7s23u@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <9029492b-5b9c-2697-8d87-716859f96382@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <9029492b-5b9c-2697-8d87-716859f96382@virtuozzo.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, qemu-block@nongnu.org, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, ronniesahlberg@gmail.com,
 pbonzini@redhat.com, idryomov@gmail.com, philmd@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 10:52:20AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Ping)
> 
> Not reviewed: 6,7,10

Also on my list to see what I can get in this week's NBD pull request.

> 
> 03.09.2021 13:27, Vladimir Sementsov-Ogievskiy wrote:
> > Hi all!
> > 
> > Sorry for a long delay:(  Finally, here is v6.
> > 

> > Vladimir Sementsov-Ogievskiy (11):
> >    block/io: bring request check to bdrv_co_(read,write)v_vmstate
> >    qcow2: check request on vmstate save/load path
> >    block: use int64_t instead of uint64_t in driver read handlers
> >    block: use int64_t instead of uint64_t in driver write handlers
> >    block: use int64_t instead of uint64_t in copy_range driver handlers
> >    block: make BlockLimits::max_pwrite_zeroes 64bit
> >    block: use int64_t instead of int in driver write_zeroes handlers
> >    block/io: allow 64bit write-zeroes requests
> >    block: make BlockLimits::max_pdiscard 64bit
> >    block: use int64_t instead of int in driver discard handlers
> >    block/io: allow 64bit discard requests
> 
> 
> -- 
> Best regards,
> Vladimir
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


