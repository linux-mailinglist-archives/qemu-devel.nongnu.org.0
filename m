Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3441AF1E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:34:46 +0200 (CEST)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCJp-0003rO-4B
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVCEO-0007xt-E9
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:29:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVCEM-0001tp-Ng
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632832146;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6aPqpfRH55ciVXKcZU+jke8KUeAjKCaA/I5eXmW84E=;
 b=c01k6NYyUr6mbZZShoAM6FdXqI0WUtvTFswl0eNQSCJUwQJ9H7wKcaOZJV6BtsfxbGyEU5
 eFn1kMXOxaaaOx8oyIzVvDmDEmhdMdv1DabmGoTPED8zWVI/78yWzLAraohG6lesh+kHG0
 0RAHELlAJtf0k32UCKcwooJtUcNevL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-WrhzrzD1Psm2oJVuLz27Bg-1; Tue, 28 Sep 2021 08:29:02 -0400
X-MC-Unique: WrhzrzD1Psm2oJVuLz27Bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D77BB1084681;
 Tue, 28 Sep 2021 12:29:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 991A25D9D5;
 Tue, 28 Sep 2021 12:28:59 +0000 (UTC)
Date: Tue, 28 Sep 2021 13:28:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 2/2] qemu-options: Add missing "sockets=2,maxcpus=2"
 to CLI "-smp 2"
Message-ID: <YVMKiZews5J0N8Wi@redhat.com>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-3-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, wanghaibin.wang@huawei.com,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 08:11:34PM +0800, Yanan Wang wrote:
> There is one numa config example in qemu-options.hx currently
> using "-smp 2" and assuming that there will be 2 sockets and
> 2 cpus totally. However now the actual calculation logic of
> missing sockets and cores is not immutable and is considered
> liable to change. Although we will get maxcpus=2 finally based
> on current parser, it's always stable to specify it explicitly.
> 
> So "-smp 2,sockets=2,maxcpus=2" will be optimal when we expect
> multiple sockets and 2 cpus totally.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


