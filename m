Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B187823091E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 13:44:53 +0200 (CEST)
Received: from localhost ([::1]:57958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0O2O-0007r8-Qf
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 07:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k0Nzb-00050d-SN
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 07:41:59 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24237
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k0NzZ-00030V-Uk
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 07:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595936517;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HoQ4X7Q822I9adhkqcwDr8iB/ZTdQeU3Svwj73aX6U=;
 b=RUde7IOJCUD6Sv+49iNiVwHEB2zClMoBPBahGK9K6tygy7JkmsmU4pNtuZmE9Mq0c8XqT/
 ObEjFWSUZOvAAzPoAzZGfNlFf+jA+Tf5Ma/rbiT77d8mDZChDVY+sd48WfmchJVYiSUXZJ
 /8GaJvFaTeCTh9jxJI/vOAJ7kwgoeac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-h7VeLwFtMpeXsLlFSwOTFg-1; Tue, 28 Jul 2020 07:41:55 -0400
X-MC-Unique: h7VeLwFtMpeXsLlFSwOTFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 667BB102C7F1;
 Tue, 28 Jul 2020 11:41:54 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C993B1C6;
 Tue, 28 Jul 2020 11:41:48 +0000 (UTC)
Date: Tue, 28 Jul 2020 12:41:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v5 7/7] MAINTAINERS: Add myself as maintainer for yank
 feature
Message-ID: <20200728114146.GG3437398@redhat.com>
References: <cover.1592923201.git.lukasstraub2@web.de>
 <c09e8bbd44783d9473e64994cad49da6fe2f8f74.1592923201.git.lukasstraub2@web.de>
MIME-Version: 1.0
In-Reply-To: <c09e8bbd44783d9473e64994cad49da6fe2f8f74.1592923201.git.lukasstraub2@web.de>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 00:06:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 04:43:13PM +0200, Lukas Straub wrote:
> I'll maintain this for now as the colo usecase is the first user
> of this functionality.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 955cc8dd5c..a403d59190 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2506,6 +2506,19 @@ F: util/uuid.c
>  F: include/qemu/uuid.h
>  F: tests/test-uuid.c
> 
> +Yank feature
> +M: Lukas Straub <lukasstraub2@web.de>
> +S: Odd fixes
> +F: util/yank.c
> +F: include/qemu/yank.h

For these 2 files,

   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> +F: chardev/char-socket.c
> +F: block/nbd.c
> +F: migration/channel.c
> +F: migration/migration.c
> +F: migration/multifd.c
> +F: migration/qemu-file-channel.c
> +F: migration/savevm.c

You shouldn't be claiming maintainership of any of these
files.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


