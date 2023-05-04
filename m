Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6A66F66B4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:03:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTv0-00054j-IM; Thu, 04 May 2023 04:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puTuy-00054H-I6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puTux-0005lO-02
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683187342;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=acxbqWXq2u5C2WrcDZ87BeWmYiEhqGZMcULhRLTCgX4=;
 b=WBC1wZUEHgFAGkHEPMk/6cpqtO/8vSln7PhrJvEnoqc/CKLqZncKTzvlzFm0T+0a0IAViq
 OsszTy+oAa5ckX5JKArJqdtLwYEEUz7vVsS2Cn9/rMw36iagP8+Da104pdPzDohvuirmwN
 EVshfYw9ZCmnGrE18Yo2OXPwzE4cFFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-2Mjc3aFwP7K3NnmP9lBfGQ-1; Thu, 04 May 2023 04:02:18 -0400
X-MC-Unique: 2Mjc3aFwP7K3NnmP9lBfGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C189857F81;
 Thu,  4 May 2023 08:02:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9C02026D16;
 Thu,  4 May 2023 08:02:16 +0000 (UTC)
Date: Thu, 4 May 2023 09:02:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, alex.bennee@linaro.org,
 philmd@linaro.org, wainersm@redhat.com, bleal@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Message-ID: <ZFNmhT9Fosay1bee@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
> On 03/05/2023 16.55, Ani Sinha wrote:
> > mformat and xorriso tools are needed by biosbits avocado tests. This patchset
> > adds those two tools in the docker container images.
> 
> tests/qtest/cdrom-test.c already uses genisoimage to create ISO images, and
> the containers already have that tool installed. Could you maybe switch the
> biosbits test to use that tool? Or the other way round? ... at least having
> two tools to create ISO images in our containers sounds IMHO excessive.

It looks like this series wasn't tested, because it doesn't even install
the alpine image:

ERROR: unable to select packages:
  cdrkit-1.1.11-r3:
    conflicts: xorriso-1.5.4-r2[cmd:mkisofs=1.1.11-r3]
    satisfies: world[cdrkit]
  xorriso-1.5.4-r2:
    conflicts: cdrkit-1.1.11-r3[cmd:mkisofs=1.5.4-r2]
    satisfies: world[xorriso]


We definitely need to have either biosbits or cdrom-test.c changed to
use the same tool. We can't be requiring deps that are conflicting at
install time.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


