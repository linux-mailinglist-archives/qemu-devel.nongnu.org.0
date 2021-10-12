Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54A42A2E0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:11:05 +0200 (CEST)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFgW-0002e9-IH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maFEI-0005yI-4M
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maFEE-0001E3-8o
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634035309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+tYgCTjmwPZRj7XKDTrnndbE7jK+Ekls7+M45VF7lo=;
 b=eQxiLcMbIu3KcwQU2drtyIRDORCdE8uBf1rRxVgI3LFD/uNJkQln+KlOFfZc1jUBt1c6Fz
 L7Ku4tstE3IV1Ob2HRRONDmQv2li6U8MZEWXCijj9YGnpZBesx2RyaSFYYs66b4FqPEYEg
 0z6epeOoHl9ng5CUYSX/G6jDH8IrytU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-WAobTAwSMguBSqNSC6zQlA-1; Tue, 12 Oct 2021 06:41:32 -0400
X-MC-Unique: WAobTAwSMguBSqNSC6zQlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007A710A8E00;
 Tue, 12 Oct 2021 10:41:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7165D9D5;
 Tue, 12 Oct 2021 10:41:28 +0000 (UTC)
Date: Tue, 12 Oct 2021 12:41:27 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 2/5] qapi: Add feature flags to enum members
Message-ID: <YWVmV1gdJb66nN2+@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009120944.2858887-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.10.2021 um 14:09 hat Markus Armbruster geschrieben:
> This is quite similar to commit 84ab008687 "qapi: Add feature flags to
> struct members", only for enums instead of structs.
> 
> Special feature flag 'deprecated' is silently ignored there.  This is
> okay only because it will be implemented shortly.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Should we have a test case for an invalid value for 'features'?

Kevin


