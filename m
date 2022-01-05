Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBA485524
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:58:06 +0100 (CET)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57jp-0004TI-4I
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:58:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n57cv-0003XX-0w
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n57ct-0005DT-8h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394254;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvkehBgiwsckRufiecBUsHCUUrgvoa1OYUBkfpGvJ3w=;
 b=NTrq81saqw7FkOIPid4XbvkoONSyKZ/TU34NCtkbSHGZc0And+4lIhLdWEZnK002Gi+xRa
 WAqCMjxrKsdksihAb+gLrVVz9cU/l3IUoSKpVAP8hF7MuyH2kiK2TmzGp8+Zq3YJCkeHyZ
 gBv9K9SGONZ/teuWQpkm+Mb2KDWdCu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-iKKgiUIWPqeoFcmF3VkaVw-1; Wed, 05 Jan 2022 09:50:50 -0500
X-MC-Unique: iKKgiUIWPqeoFcmF3VkaVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE69190B2A2;
 Wed,  5 Jan 2022 14:50:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 865577E5A8;
 Wed,  5 Jan 2022 14:50:46 +0000 (UTC)
Date: Wed, 5 Jan 2022 14:50:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH  v1 20/34] tests/docker: add libfuse3 development headers
Message-ID: <YdWwRENg0gA5na4v@redhat.com>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-21-alex.bennee@linaro.org>
 <20220105142655.GS1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105142655.GS1127@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 Hanna Reitz <hreitz@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 02:26:55PM +0000, Richard W.M. Jones wrote:
> On Wed, Jan 05, 2022 at 01:49:55PM +0000, Alex Bennée wrote:
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > The FUSE exports feature is not built because most container images do
> > not have libfuse3 development headers installed. Add the necessary
> > packages to the Dockerfiles.
> > 
> > Cc: Hanna Reitz <hreitz@redhat.com>
> > Cc: Richard W.M. Jones <rjones@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Acked-by: Richard W.M. Jones <rjones@redhat.com>
> > Reviewed-by: Beraldo Leal <bleal@redhat.com>
> > Tested-by: Beraldo Leal <bleal@redhat.com>
> > Message-Id: <20211207160025.52466-1-stefanha@redhat.com>
> > [AJB: migrate to lcitool qemu.yml and regenerate]
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> 
> I checked all the package names and they look good, so:

FYI, the libvirt-ci  CI pipelines validate that all package
names are correct by creating a job for each distro and
checking that every package known to libvirt-ci can be
installed. This catches issues where distros rename or
drop packages. These are some of the reasons why we'll
benefit from using libvirt-ci / lcitool for auto-generating
these dockerfiles in QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


