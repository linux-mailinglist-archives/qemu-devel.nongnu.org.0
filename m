Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C2209CB9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 12:21:45 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joP0q-0007ke-9L
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 06:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1joOz7-0006mR-Ut
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:19:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21824
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1joOz6-0004qJ-1g
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593080395;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dtZQl4SfDExZ8IZ3rj+jtkq2HKdik8QAr1ComnNLyt4=;
 b=Cxt6YdTpZA6QOFmFBC713zfoaBxtjn4IgXkhdR2yaAFnct49OlxzmCwLo0m9iRkXhNLaXa
 vtV4myfZe3dZS1M04XvFsAIP7zJj/B8zq/5Jx2ekMNQAvThoqVsm00kcz13Obx4IktXLlS
 CpKe71gxkCGy7mTl/vqNN368aDtHP18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-CgmBDKZ6OoGAPOWWTamJ8Q-1; Thu, 25 Jun 2020 06:19:51 -0400
X-MC-Unique: CgmBDKZ6OoGAPOWWTamJ8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FB70107ACCA;
 Thu, 25 Jun 2020 10:19:50 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 714C9619C0;
 Thu, 25 Jun 2020 10:19:39 +0000 (UTC)
Date: Thu, 25 Jun 2020 11:19:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Subject: Re: [RFC 0/4] Enable virtio-fs on s390x
Message-ID: <20200625101935.GF1009994@redhat.com>
References: <20200625100430.22407-1-mhartmay@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200625100430.22407-1-mhartmay@linux.ibm.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 25, 2020 at 12:04:26PM +0200, Marc Hartmayer wrote:
> This RFC is about enabling virtio-fs on s390x. For that we need
>  + some shim code (first patch), and we need
>  + libvhost-user to deal with virtio endiannes as mandated by the spec.
>  
> The second part is trickier, because unlike QEMU we are not certain
> about the guest's native endianness, which is needed to handle the
> legacy-interface appropriately. In fact, this is the reason why just
> RFC.
> 
> One of the open questions is whether to build separate versions, one
> for guest little endian and one for guest big endian, or do we want
> something like a command line option? (Digression on the libvirt
> modeling)

When you talk about  big vs little endian, are you referring to TCG
scenarios with mixed host/guest arch, or arches which can support
either endianess, or both ? i guess it doesn't matter actually, as
I think the latter forces a specific answer.

Considering that some architectures allow the guest OS to flip between
big & little endian as they boot, libvirt cannot know what endianess
the guest is using when it launches virtiofsd. It thus cannot pick
between two different endianness builds of virtiofsd automatically.
This would force the user to tell libvirt what arch the guest is using
at the time they define the guest. This is an undesirable restriction
for use cases where the admin of the guest OS has no direct control
over the host config.

IOW, I think the only practical answer is to have a single binary that
automagically does the right thing at runtime according to guest
endianess that currently is in use.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


