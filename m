Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DE3827C9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:05:58 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZCG-0005FY-Q8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1liZAm-00043y-1B
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1liZAd-0005UD-CV
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621242252;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHIWACYIGRASCEobmP2DCN928eVOA+uAvHzaOpT2lOU=;
 b=WK5/z8rJ8wDc+cGAfC6njSAKYy9sV8A2U2EyDPh1lG9aUBFH/yaM+1Rh7ivoy6jdPu7ZNo
 AC43e2wJY9zTR02aYwDE1BWbsh7hXMgPyYjl1FnN7+BcWkcb6dskZW/mWQQqJ1WCNgJsMU
 hbhR0XrKc8wOla5AfjO3bDnEni0WxL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-KVKoxI_LMI26KnPJPRWpXw-1; Mon, 17 May 2021 05:04:03 -0400
X-MC-Unique: KVKoxI_LMI26KnPJPRWpXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6CEA108C303;
 Mon, 17 May 2021 09:04:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE2606E709;
 Mon, 17 May 2021 09:03:56 +0000 (UTC)
Date: Mon, 17 May 2021 10:03:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v2 08/12] tests/vm: convert centos VM recipe to CentOS 8
Message-ID: <YKIxeQP4Umq73hTd@redhat.com>
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-9-berrange@redhat.com>
 <CAKJDGDagY-w0o++QV5qYccEmNaH8W=rOyzLNircYKT4116HQgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKJDGDagY-w0o++QV5qYccEmNaH8W=rOyzLNircYKT4116HQgw@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 02:31:50PM -0300, Willian Rampazzo wrote:
> On Fri, May 14, 2021 at 9:05 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/vm/centos | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/tests/vm/centos b/tests/vm/centos
> > index efe3dbbb36..5c7bc1c1a9 100755
> > --- a/tests/vm/centos
> > +++ b/tests/vm/centos
> > @@ -26,24 +26,23 @@ class CentosVM(basevm.BaseVM):
> >          export SRC_ARCHIVE=/dev/vdb;
> >          sudo chmod a+r $SRC_ARCHIVE;
> >          tar -xf $SRC_ARCHIVE;
> > -        make docker-test-block@centos7 {verbose} J={jobs} NETWORK=1;
> > -        make docker-test-quick@centos7 {verbose} J={jobs} NETWORK=1;
> > +        make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
> > +        make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
> >          make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
> >      """
> >
> >      def build_image(self, img):
> > -        cimg = self._download_with_cache("https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1802.qcow2.xz")
> > +        cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
> 
> I wonder why they didn't keep the compressed option for download.

Yeah, its pretty annoying to have a download that is 1.2 GB in size
instead of 260 MB :-(

BTW, if you notice a slightly older CentOS 8 image there that is
only 680 MB in size, don't get too excited because the image is
majorly broken. Many files are 0 bytes in size including "make"
so its unusable for QEMU :-(

> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


