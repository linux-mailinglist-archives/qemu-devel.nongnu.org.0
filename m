Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EB2F76CB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:37:55 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MUM-0000on-Ml
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0MKY-0007uU-IZ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:27:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0MKW-0000wK-RO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UYpoCaiLTcfbrYxA/WJkqTVhOI4HqmpOexXqRpXY2wc=;
 b=GgWLE7L+m1PshHpCt622gC88QehNxt/gTDVN2+LHnBYD2lpQAdc+cGCfIn5LgMO/lItib8
 bUwi1+jsg2EccHbaWOLuxruFIK9bmRs7rE2s2eNu2EOY5cY/fqM+4Z2BU6c/VpR1iwwhJj
 JDxJ2UkJRVn2qgjTub3OQki1v4TCdYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-kqq5x24_MxOKgDcSajd8pg-1; Fri, 15 Jan 2021 05:27:37 -0500
X-MC-Unique: kqq5x24_MxOKgDcSajd8pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABFDCA0C06;
 Fri, 15 Jan 2021 10:27:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-76.ams2.redhat.com [10.36.115.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA6327CAC;
 Fri, 15 Jan 2021 10:27:29 +0000 (UTC)
Date: Fri, 15 Jan 2021 10:27:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC 0/2] Add debug interface to kick/call on purpose
Message-ID: <20210115102727.GC1692978@redhat.com>
References: <20210115002730.1279-1-dongli.zhang@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210115002730.1279-1-dongli.zhang@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: ehabkost@redhat.com, mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, joao.m.martins@oracle.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 04:27:28PM -0800, Dongli Zhang wrote:
> The virtio device/driver (e.g., vhost-scsi and indeed any device including
> e1000e) may hang due to the lost of IRQ or the lost of doorbell register
> kick, e.g.,
> 
> https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html
> 
> The virtio-net was in trouble in above link because the 'kick' was not
> taking effect (missed).
> 
> This RFC adds a new debug interface 'DeviceEvent' to DeviceClass to help
> narrow down if the issue is due to lost of irq/kick. So far the new
> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
> e1000e or vhost-scsi) may implement (e.g., via eventfd, MSI-X or legacy
> IRQ).
> 
> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
> on purpose by admin at QEMU/host side for a specific device.

I'm really not convinced that we want to give admins the direct ability to
poke at internals of devices in a running QEMU. It feels like there is way
too much potential for the admin to make a situation far worse by doing
the wrong thing here, and people dealing with support tickets will have
no idea that the admin has been poking internals of the device and broken
it by doing something wrong.

You pointed to bug that hit where this could conceivably be useful, but
that's a one time issue and should not a common occurrance that justifies
making an official public API to poke at devices forever more IMHO.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


