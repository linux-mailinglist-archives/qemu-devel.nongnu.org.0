Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F140FAFA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:00:04 +0200 (CEST)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFLP-0006AI-J8
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mRFEv-0003BL-9L
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mRFEs-0008Qa-Vy
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631890398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zvnNEd9V1osr9J+R2QaNSc5gl5jv+WrMO+KT4P3J2ug=;
 b=iT4RUC9hJ+7JY6PRkb+GxS8P2NX5opSQnFaYUqD1nalgPlWzIO1zNFJNYuUNiiYgJTMFHM
 cpBrcQGowVRuJqlv5Po3IR6gfczxzM6IwBSQHcuMnR5JxxkegNiRef33nGOYpGr7+amgym
 GV95n2A1YyGGLXEi01QWN6SLNG4E8zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-7TjVlB7pMEKt7PBuwSynpA-1; Fri, 17 Sep 2021 10:53:15 -0400
X-MC-Unique: 7TjVlB7pMEKt7PBuwSynpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C53C10144E0;
 Fri, 17 Sep 2021 14:53:14 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1864660583;
 Fri, 17 Sep 2021 14:53:10 +0000 (UTC)
Date: Fri, 17 Sep 2021 16:53:07 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC 2/5] qapi: Add feature flags to enum members
Message-ID: <YUSr0xStz4I4PVjZ@angien.pipo.sk>
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915192425.4104210-3-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 21:24:22 +0200, Markus Armbruster wrote:
> This is quite similar to commit 84ab008687 "qapi: Add feature flags to
> struct members", only for enums instead of structs.

For now in libvirt I've implemented the validator for the 'deprecated'
flag:

https://gitlab.com/pipo.sk/libvirt/-/commit/1fc69fd78fbca8b93287e368f622abfcf1464b6c

I'm not sure for now whether we'll have a use case for probing
non-deprecation features, but extending the query mechanism in libvirt
will be simple if we'll do need to do that.


