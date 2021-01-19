Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FD2FB512
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 10:56:16 +0100 (CET)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nkF-00036U-PT
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 04:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1nhp-00028t-AS
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1nhl-0000x7-3s
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611050018;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CvcV3rOdumqojYfCKlaABTI4MWFMb889tPJjkGIS8SA=;
 b=KKQi0/baz3pHk2JHy7gzmMfTnXxc/8+2JBC36gkd+7eMZzeiD9JkBz2PJbB/z7kXZp0sKs
 kt82Nhmo8Q9KacSVYxKzySuHGw6HieenestG8IQ5kjKDTF7tFl4PSEpENBJQC511t7KM1Q
 Cpf6Z4MkgB4SDY3ehKPmjyrmQ+q/PB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-Ubgs5eyxOjibvjvsX9oVhg-1; Tue, 19 Jan 2021 04:53:34 -0500
X-MC-Unique: Ubgs5eyxOjibvjvsX9oVhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 429DD80A5C6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:53:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B93E10023BC;
 Tue, 19 Jan 2021 09:53:31 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:53:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [qemu-web PATCH] deploy to qemu-project.org from GitLab CI
Message-ID: <20210119095329.GA1830870@redhat.com>
References: <20210119093746.293342-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119093746.293342-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 10:37:46AM +0100, Paolo Bonzini wrote:
> Currently, the website is rebuilt on qemu-project.org using
> an update hook.  We can reuse instead the Jekyll output of
> GitLab's CI.

Are there any files present on the qemu-project.org webroot
other than the published output of Jekyll ?  QEMU had the
good sense to use sub-domains git.qemu-project.org and
download.qemu-project.org for other content. So maybe you
just turn the root qemu-project.org and www.qemu-project.org
domains into CNAME records pointing to the gitlab pages site ?

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5fa3041..08b6d20 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,6 +1,11 @@
>  
> +stages:
> +  - build
> +  - update
> +
>  pages:
>    image: centos:8
> +  stage: build
>    cache:
>      paths:
>        - vendor
> @@ -14,3 +19,26 @@ pages:
>    artifacts:
>      paths:
>       - public
> +
> +deploy:
> +  image: centos:8
> +  stage: update
> +  needs:
> +    - job: pages
> +      artifacts: true
> +  before_script:
> +    - dnf install -y openssh-clients rsync
> +    - eval $(ssh-agent -s)
> +    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
> +    - mkdir -m700 -p ~/.ssh
> +    - - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
> +  script:
> +    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -avz root/ new"

Why copy the old root into the new root ? This means that any time we delete
a file in git, it will never be removed from the live webroot.

> +    - rsync -avz public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
> +    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


