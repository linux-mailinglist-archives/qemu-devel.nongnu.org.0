Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACAB46C063
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 17:12:57 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mud5M-0003ze-13
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 11:12:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mud4S-0003LN-JQ
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 11:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mud4M-0005S3-K6
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 11:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638893512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rk5Wb0nTl7dpFc+B6HZg1Jm+8+ET8pC+slZKxVgZrRA=;
 b=hLyA4HxP8X++jUWbGZdrRS/nNAz3Scgj0pN4FvN3B5eR9Z6/N1BFwfN4iALCsDIAb6S1Gr
 BMFAiMuWLY6xD8MzSeRoecxjfJxvero0ZcNy2xCGtz1iE16HpZmXKn+eZXW+bT3/YNyJ4l
 pJ5YktFQPgRhnMBwG/5kgNGgjoOLa8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-Fd06OOzFO6Ktc3FOQ7dnoQ-1; Tue, 07 Dec 2021 11:11:49 -0500
X-MC-Unique: Fd06OOzFO6Ktc3FOQ7dnoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE281006AA1;
 Tue,  7 Dec 2021 16:11:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 916595D9C0;
 Tue,  7 Dec 2021 16:11:47 +0000 (UTC)
Date: Tue, 7 Dec 2021 16:11:46 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] tests/docker: add libfuse3 development headers
Message-ID: <20211207161146.GQ1127@redhat.com>
References: <20211207160025.52466-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207160025.52466-1-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 04:00:25PM +0000, Stefan Hajnoczi wrote:
...
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 7f135f8e8c..a2dae4be29 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -19,6 +19,7 @@ ENV PACKAGES \
>      device-mapper-multipath-devel \
>      diffutils \
>      findutils \
> +    fuse3-devel \
>      gcc \
>      gcc-c++ \
>      genisoimage \

Just for my own notes, it took me a while to work out that CentOS 8
does have fuse3.  It didn't appear in EPEL 8 etc:

https://src.fedoraproject.org/rpms/fuse3
https://ci.centos.org/search/?q=fuse3

However it turns out it is built from a source package called "fuse"
(version 2.9.7!)  Also I am able to install fuse3 on RHEL 8.  So I
guess that's OK in the end.

The rest of the changes look good too, so:

Acked-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


