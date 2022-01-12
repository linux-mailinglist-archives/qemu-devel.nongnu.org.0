Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019548C74E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:37:19 +0100 (CET)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fgc-00031s-79
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:37:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n7f2q-0001EY-Lu
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:56:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n7f2o-0004vi-DF
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641999369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3rvAKDQeuUkNJHFRA0SV23pQrHpJahKqyTwFNE5hk0=;
 b=WjhuiZZYCF0De68zlZC3gX87kKbR6vhPyBZckAgNF8Ez/+9SAIyXN39+vrV5b93DKIy2pl
 +7nf3+lXQ94+5ZcghKS9VzI7PIoREY/dmmUxJWxcznoAkCy/tNSo0a2G09gKObmpneF1nh
 NGUxKWvwH22JEbmIW1sh9aVRP8lz+Nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-IItjPAlzPVG9Y_-rj6WuYw-1; Wed, 12 Jan 2022 09:56:03 -0500
X-MC-Unique: IItjPAlzPVG9Y_-rj6WuYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8D81926DA1;
 Wed, 12 Jan 2022 14:56:01 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03638105C74D;
 Wed, 12 Jan 2022 14:56:00 +0000 (UTC)
Date: Wed, 12 Jan 2022 08:55:58 -0600
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] nbd/server.c: Remove unused field
Message-ID: <20220112145558.kc72uypevy7uwbxq@redhat.com>
References: <20220111194313.581486-1-nsoffer@redhat.com>
 <9f0986b3-3878-72cd-33df-cd5f91bfc211@amsat.org>
MIME-Version: 1.0
In-Reply-To: <9f0986b3-3878-72cd-33df-cd5f91bfc211@amsat.org>
User-Agent: NeoMutt/20211029-182-90c72c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Nir Soffer <nsoffer@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 09:17:43PM +0100, Philippe Mathieu-Daudé wrote:
> On 1/11/22 20:43, Nir Soffer wrote:
> > NBDRequestData struct has unused QSIMPLEQ_ENTRY filed. It seems that

s/filed/field/

> > this field exists since the first git commit and was never used.

If my git sleuthing is right, that's commit d9a73806, from 2011.

> > 
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > ---
> >  nbd/server.c | 1 -
> >  1 file changed, 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks, I'll add that to my NBD queue.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


