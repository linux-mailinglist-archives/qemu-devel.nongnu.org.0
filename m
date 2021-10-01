Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B5D41F10D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:18:35 +0200 (CEST)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKIv-0005pA-Mb
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWKHX-00057R-Ey
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWKHT-0001TX-EM
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633101417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Xiq9JZW3Z0ko76hWys98cF+zfkB35WXJn3lS564i/TM=;
 b=ZL8momtoGuzz650cztrAi8GO6ki8Wt8XoeIa25seANLZGPJKXt0BDdlcC/CN7m8+20qv4C
 1oJ9kc7cBks87LT5OoGYS2sLz6ieYu5wBpGeIY0lmNDzjK8qg5ZB8D3d+kcNX32EiW5vOP
 y4lh3OlHvx+KnftGQT73ApObuGjHk1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-ZEeUPmwKO429PjEe1K8UYQ-1; Fri, 01 Oct 2021 11:16:52 -0400
X-MC-Unique: ZEeUPmwKO429PjEe1K8UYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1780C8010ED;
 Fri,  1 Oct 2021 15:16:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5B65F4E1;
 Fri,  1 Oct 2021 15:16:49 +0000 (UTC)
Date: Fri, 1 Oct 2021 16:16:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/5] 9pfs: introduce P9Array
Message-ID: <YVcmX/lKmHrsivVJ@redhat.com>
References: <cover.1633097129.git.qemu_oss@crudebyte.com>
 <a954ef47b5ac26085a16c5c2aec8695374e0424d.1633097129.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
In-Reply-To: <a954ef47b5ac26085a16c5c2aec8695374e0424d.1633097129.git.qemu_oss@crudebyte.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 04:26:17PM +0200, Christian Schoenebeck wrote:
> Implements deep auto free of arrays while retaining common C-style
> squared bracket access. Main purpose of this API is to get rid of
> error prone individual array deallocation pathes in user code, i.e.
> turning something like this:
> 
>   void doSomething(size_t n) {
>       Foo *foos = malloc(n * sizeof(Foo));
>       for (...) {
>           foos[i].s = malloc(...);
>           if (...) {
>               goto out;
>           }
>       }
>   out:
>       if (...) {
>           for (...) {
>               /* deep deallocation */
>               free(foos[i].s);
>           }
>           /* array deallocation */
>           free(foos);
>       }
>   }
> 
> into something more simple and safer like:
> 
>   void doSomething(size_t n) {
>       P9ARRAY_REF(Foo) foos = NULL;
>       P9ARRAY_NEW(Foo, foos, n);
>       for (...) {
>           foos[i].s = malloc(...);
>           if (...) {
>               return; /* array auto freed here */
>           }
>       }
>       /* array auto freed here */
>   }

As explained before, I'm against the idea of introducing new ways
to automatically free local variables that are not using g_auto*
functionality. It is not following the QEMU wide coding style
that is documented.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


