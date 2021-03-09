Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202553321CF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:20:17 +0100 (CET)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYXI-0005OY-4E
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJYVV-0004lC-63
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:18:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJYVQ-0007Ih-7f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615281498;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ySAo7r13pgsl9doU+y5ow+VmPas+FXFKh8ehc6I9/E=;
 b=ZFK7R/QsN/XDC7Quha8WSkvt127mAO0KnRsznwRNMH24AmvoI79FC7Njrt59ZWM3miTA4J
 w1wAQmGNqYyrp2SnhAZ3TWqRe3OioBNqhFbG/o8cwPJwqxY/iXpEnJi7oSqXzT6oshiD8h
 /6+9N3vFp+Mf6srQQz2agN5XwjKBlMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-b4kmFyI-P9eQw8DkO3e0KQ-1; Tue, 09 Mar 2021 04:18:04 -0500
X-MC-Unique: b4kmFyI-P9eQw8DkO3e0KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51DCD83DD24;
 Tue,  9 Mar 2021 09:18:03 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17AF460C04;
 Tue,  9 Mar 2021 09:17:52 +0000 (UTC)
Date: Tue, 9 Mar 2021 09:17:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 03/30] qapi/qom: Add ObjectOptions for authz-*
Message-ID: <YEc9PuQxKToBW7kW@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-4-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210308165440.386489-4-kwolf@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 05:54:13PM +0100, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the authz-* objects.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  qapi/authz.json                      | 61 +++++++++++++++++++++++++---
>  qapi/qom.json                        | 10 +++++
>  storage-daemon/qapi/qapi-schema.json |  1 +
>  3 files changed, 67 insertions(+), 5 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


