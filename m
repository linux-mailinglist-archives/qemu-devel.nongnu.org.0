Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E812FB579
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:52:01 +0100 (CET)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ocC-0000PS-E8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1oY8-0006rK-NQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1oY5-0001UW-SR
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611053263;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWWu54k33f/OZtSIxNWxwQ8YpLLjFbfI9tf5OhjgaMo=;
 b=MhPLuKs+Iq0y6tRLxsQfP0i0vKkhAsn4zlhCpXjIwB/CowcL9FR2Y3Cr0Pt44PDoXwMQsB
 FamZaAfIfJpTnQTROfMITm+/PXDq6TYujXybfYEp7FxYYQkCs9fzHRM+5nId5abcqVd0QA
 Zqn31L5i9srgWxN/5oCr2h5aJLnZnmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-LxvjP3xYPTq2RuY6gPdjFA-1; Tue, 19 Jan 2021 05:47:38 -0500
X-MC-Unique: LxvjP3xYPTq2RuY6gPdjFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B77E580666F
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:47:37 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D2F971D61;
 Tue, 19 Jan 2021 10:47:34 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:47:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [qemu-web PATCH v2] deploy to qemu-project.org from GitLab CI
Message-ID: <20210119104731.GC1830870@redhat.com>
References: <20210119101549.294716-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119101549.294716-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Jan 19, 2021 at 11:15:49AM +0100, Paolo Bonzini wrote:
> Currently, the website is rebuilt on qemu-project.org using
> an update hook.  We can reuse instead the Jekyll output of
> GitLab's CI.
> 
> To do so, a new user qemu-deploy has been created on qemu.org.
> The private key is stored into a file variable SSH_PRIVATE_KEY_FILE
> (be careful to include the trailing newline after "---END OPENSSH
> PRIVATE KEY---"!).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5fa3041..129b2ff 100644
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
> +    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -az root/ new"
> +    - rsync -avz --delete public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
> +    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"
> +  only:
> +    refs:
> +      - master
> +    variables:
> +      - $SSH_PRIVATE_KEY_FILE
> +      - $SSH_DEPLOY_DESTINATION

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


