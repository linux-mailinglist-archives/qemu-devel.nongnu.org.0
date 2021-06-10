Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD73A2E70
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:42:45 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLtM-00080C-3u
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrLsE-0006yJ-7q
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrLsC-0006e8-E4
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336091;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/ZJQzZ5gVIShV5vfrTmiChgX5LcFSJwlMNnRSwTOXTk=;
 b=MB6u31KVDY1LGbZbs7QGf6ar/YIvnxZsGv+nV7KO026xBE/I16HZTYkP+J4RLD9pp3XHpI
 cc39MigG0hrI5IA5RexBvpI9ZxovgIfiWES1QBiRLn7Okq5EE6WQqaBni0OQtXuAtMtODx
 uO5z31ym2bg0lb0rI7xcr1SvqXbqUjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-RwyrMwJ_NQKW3cDQoeMeag-1; Thu, 10 Jun 2021 10:41:30 -0400
X-MC-Unique: RwyrMwJ_NQKW3cDQoeMeag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76419801B14
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:41:29 +0000 (UTC)
Received: from redhat.com (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5365D6D7;
 Thu, 10 Jun 2021 14:41:28 +0000 (UTC)
Date: Thu, 10 Jun 2021 15:41:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/11] machine: add smp compound property
Message-ID: <YMIklXY8C+/KEwf/@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-12-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610133538.608390-12-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 03:35:38PM +0200, Paolo Bonzini wrote:
> Make -smp syntactic sugar for a compound property "-machine
> smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
> setter for the property.
> 
> numa-test will now cover the new syntax, while other tests
> still use -smp.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/machine.c       | 108 +++++++++++++++++++++-------------------
>  include/hw/boards.h     |   1 -
>  softmmu/vl.c            |  33 +++++++++---
>  tests/qtest/numa-test.c |  22 ++++----
>  4 files changed, 95 insertions(+), 69 deletions(-)

Needs to update  qemu-options.hx for -machine and -smp


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


