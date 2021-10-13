Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB042C70A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:58:30 +0200 (CEST)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahaH-0008Bz-Ch
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mahWT-0005mz-CO
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mahWP-0003If-PR
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634144068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h9lt66LTAvPI6rLDynFgYEJdeJhbYEa59Nm+cr77zSg=;
 b=QIO1CjFu8m1x9q1gnU+TIMi0TAOfzkor7kzHAMNX4A9v+NKWw4fAs3/2tZzz/LU2qEFSjF
 E/XojZ3Gn79YAj07cGh50+Bl9TxDobmMpF8OHhV0vlQat2OfP5d8+YomyQWRomoKgcqj3r
 23uplX/3OSPOi62jyApxBP5ZtoqN5VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-mVfKV0z9MZC1YUdKlwgQaw-1; Wed, 13 Oct 2021 12:54:25 -0400
X-MC-Unique: mVfKV0z9MZC1YUdKlwgQaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD6B380363B;
 Wed, 13 Oct 2021 16:54:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A6260CC3;
 Wed, 13 Oct 2021 16:53:58 +0000 (UTC)
Date: Wed, 13 Oct 2021 18:53:56 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 00/15] qdev: Add JSON -device
Message-ID: <YWcPJMkvyn3IQ8uX@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211013112957-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211013112957-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 quintela@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@virtuozzo.com,
 its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.10.2021 um 17:30 hat Michael S. Tsirkin geschrieben:
> On Fri, Oct 08, 2021 at 03:34:27PM +0200, Kevin Wolf wrote:
> > It's still a long way until we'll have QAPIfied devices, but there are
> > some improvements that we can already make now to make the future switch
> > easier.
> > 
> > One important part of this is having code paths without QemuOpts, which
> > we want to get rid of and replace with the keyval parser in the long
> > run. This series adds support for JSON syntax to -device, which bypasses
> > QemuOpts.
> > 
> > While we're not using QAPI yet, devices are based on QOM, so we already
> > do have type checks and an implied schema. JSON syntax supported now can
> > be supported by QAPI later and regarding command line compatibility,
> > actually switching to it becomes an implementation detail this way (of
> > course, it will still add valuable user-visible features like
> > introspection and documentation).
> > 
> > Apart from making things more future proof, this also immediately adds
> > a way to do non-scalar properties on the command line. nvme could have
> > used list support recently, and the lack of it in -device led to some
> > rather unnatural solution in the first version (doing the relationship
> > between a device and objects backwards) and loss of features in the
> > following. With this series, using a list as a device property should be
> > possible without any weird tricks.
> > 
> > Unfortunately, even QMP device_add goes through QemuOpts before this
> > series, which destroys any type safety QOM provides and also can't
> > support non-scalar properties. This is a bug, but it turns out that
> > libvirt actually relies on it and passes only strings for everything.
> > So this series still leaves device_add alone until libvirt is fixed.
> 
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> I assume you are merging this?

Yes, I can merge it through my tree. Thanks for the review!

Kevin


