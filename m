Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9302544F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 14:28:10 +0200 (CEST)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBH0j-000333-M6
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 08:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kBGzn-0002PU-3z
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:27:11 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24557
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kBGzk-0004Iq-Mb
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598531226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1VusLEjdBAONqEX1/Uzrv7NsDedAQLxju+zNG6hBhQ=;
 b=eElDs2sFNFcKL3RhwjuS7spjieJslg/W0P/zMdVAm+uGFG9xTrDgFSdzudtZFkbO6//FwQ
 PUEMrbmMLB8/uO0MuTyubHM9KpeIG6MaQn4mPCZi/Pxr90175COOw854eVuh8DWdieqHK1
 54UfVoBCyC48LdfNFIndLRemJcOI/Og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Dy7MU680Ora0pqQ5zRGDsw-1; Thu, 27 Aug 2020 08:27:04 -0400
X-MC-Unique: Dy7MU680Ora0pqQ5zRGDsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98C5185FD70;
 Thu, 27 Aug 2020 12:27:03 +0000 (UTC)
Received: from gondolin (ovpn-113-237.ams2.redhat.com [10.36.113.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57913757F2;
 Thu, 27 Aug 2020 12:26:53 +0000 (UTC)
Date: Thu, 27 Aug 2020 14:26:50 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] Enable virtio-fs on s390x
Message-ID: <20200827142650.7f427ca5.cohuck@redhat.com>
In-Reply-To: <20200827081857-mutt-send-email-mst@kernel.org>
References: <20200730140731.32912-1-mhartmay@linux.ibm.com>
 <20200827081857-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Aug 2020 08:19:44 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 30, 2020 at 04:07:29PM +0200, Marc Hartmayer wrote:
> > This patch series is about enabling virtio-fs on s390x. For that we need
> >  + some shim code (first patch), and we need
> >  + libvhost-user to deal with virtio endiannes for non-legacy virtio
> >    devices as mandated by the spec.  
> 
> 
> Please rebase, address Cornelia's minor comments and repost.

I think we're still waiting for someone to confirm the status of
vhost-user-scsi?


