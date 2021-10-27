Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE6F43C59D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:53:15 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfegM-00017Z-Jz
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfecx-0007WH-Cx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:49:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfecv-0005eW-13
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635324580;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNdfYIPCPP0CAAe2h5mdsLlJsvmSuuBz3ElYKgWv7Sc=;
 b=cGpUE5Wf/bnBoCoZyqasl/vG0TM43iWj9oxwZtn9W+V+wxkoyGp5nwiq/9WF/Hya5EqH5T
 xsm6weT4bD7EZv1/BdVf3GLlJGmD476Fh0nb7nz5lRw24jT4A9zpBqgRx5F7U3HjCYtU7h
 iGXL7neakmK+Ub8P+PR0fvE5Oy0gm2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-W-mbXH5kMKumvw4afgt7Yw-1; Wed, 27 Oct 2021 04:49:36 -0400
X-MC-Unique: W-mbXH5kMKumvw4afgt7Yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D9FE1006AA3;
 Wed, 27 Oct 2021 08:49:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9505860BF1;
 Wed, 27 Oct 2021 08:49:33 +0000 (UTC)
Date: Wed, 27 Oct 2021 09:49:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.0.1 0/2] gitlab-ci: Only push docker images to
 mainstream registry from /master
Message-ID: <YXkSm13RTFCWyWxR@redhat.com>
References: <20211027052656.1275436-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211027052656.1275436-1-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 07:26:54AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Michael,
> 
> 2 more patches to avoid gitlab-ci mayhem when you push the
> stable tags. See this cover for more info:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg846861.html

Please don't push this to stable - Thomas points out that it is broken
when any changes to dockerfiles are made.

> 
> Based-on: <20211019140944.152419-1-michael.roth@amd.com>
> "Patch Round-up for stable 6.0.1, freeze on 2021-10-26"
> 
> Daniel P. Berrangé (1):
>   gitlab: only let pages be published from default branch
> 
> Philippe Mathieu-Daudé (1):
>   gitlab-ci: Only push docker images to registry from /master branch
> 
>  .gitlab-ci.d/containers.yml | 11 ++++++++++-
>  .gitlab-ci.d/edk2.yml       | 11 ++++++++++-
>  .gitlab-ci.d/opensbi.yml    | 11 ++++++++++-
>  .gitlab-ci.yml              | 18 ++++++++++++++++++
>  4 files changed, 48 insertions(+), 3 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


