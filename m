Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4F476F36
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:53:42 +0100 (CET)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoOL-0000CZ-QW
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:53:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoMU-0006iw-2T
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoMR-00043R-SS
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639651903;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gdU/EqN4AOL1GjxoJ1LLos7RaxXH/CyhYqatFwjjAUo=;
 b=C17eV9Jtmv/4I9OJnnv9q2ItXIAZmqMwVjdMlSyr0vaEgdM2jTR42d5yY7Q4ZFJQkpI25q
 9XC272qXeKSDdTyxeOEf/5BAHvxrL2k+l8h7S9+0JDmCNK7E+lO0Jzl9tEDQWJWgg0S/Zh
 gjegWp/emJXlBZlpw97fdPzeTPNBuPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-B12dJXWePimAlcJmOr47nw-1; Thu, 16 Dec 2021 05:51:39 -0500
X-MC-Unique: B12dJXWePimAlcJmOr47nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C5A2F46;
 Thu, 16 Dec 2021 10:51:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A91F092A6F;
 Thu, 16 Dec 2021 10:50:50 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:50:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 00/25] Python: delete synchronous qemu.qmp package
Message-ID: <YbsaCNlzcnQUOcza@redhat.com>
References: <20211215193939.3768033-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-1-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:14PM -0500, John Snow wrote:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/430491195
> 
> Hi, this series is part of an effort to publish the qemu.qmp package on
> PyPI. It is the first of three series to complete this work:
> 
> --> (1) Switch the new Async QMP library in to python/qemu/qmp
>     (2) Fork python/qemu/qmp out into its own repository,
>         with updated GitLab CI/CD targets to build packages.
>     (3) Update qemu.git to install qemu.qmp from PyPI,
>         and then delete python/qemu/qmp.

What timeframe are you suggesting step (3) for ?

In the series for (2) you're calling it version 0.0.1 indicating
it is liable to  have API incompatible changes.

For step (3), either we're going to have to fetch a precise
version number to avoid risk of API breakage, or we're going
to have to call it stable in (2) and commit to the API.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


