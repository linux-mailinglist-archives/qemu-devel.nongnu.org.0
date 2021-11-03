Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CD443EF1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:04:22 +0100 (CET)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCBx-00039C-3h
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1miCAL-0002Jx-Jc
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1miCAI-0007w5-Ew
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635930156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plCBDtiuYOHY4Z8oVjNxzePQVLPFAFYCazlemZwX4QY=;
 b=arsdkKxobDyjFOOYIz9TCVOZmZierUDSnuWqRw8jNsDjuM0tiMzQSBvvb1RQXq5rYf1bV3
 IsyKWptdwce7eIih+9I67xJr5ZixvschbKXaavFZZU7rNXwZWpCZtNB38dim+RMcoqujxg
 CVbJ/R38piVPJyFnyBVzKkxOBsQlwqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-VOD6Vi75McisY24xZ43dQA-1; Wed, 03 Nov 2021 05:02:28 -0400
X-MC-Unique: VOD6Vi75McisY24xZ43dQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9527110B3941
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 09:02:27 +0000 (UTC)
Received: from [10.39.192.84] (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D27511972D;
 Wed,  3 Nov 2021 09:02:26 +0000 (UTC)
Message-ID: <2dd49846-a916-6d57-bc99-61b5ed546657@redhat.com>
Date: Wed, 3 Nov 2021 10:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [qemu-web PATCH] remove deployment phase from CI
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211103081459.369912-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211103081459.369912-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/11/2021 09.14, Paolo Bonzini wrote:
> qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
> not need anymore the rsync step to the QEMU project\s shell server.
> Remove it from the CI.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   .gitlab-ci.yml | 24 ------------------------
>   1 file changed, 24 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 129b2ff..dde0ef3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,7 +1,6 @@
>   
>   stages:
>     - build
> -  - update
>   
>   pages:
>     image: centos:8
> @@ -19,26 +18,3 @@ pages:
>     artifacts:
>       paths:
>        - public
> -
> -deploy:
> -  image: centos:8
> -  stage: update
> -  needs:
> -    - job: pages
> -      artifacts: true
> -  before_script:
> -    - dnf install -y openssh-clients rsync
> -    - eval $(ssh-agent -s)
> -    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
> -    - mkdir -m700 -p ~/.ssh
> -    - - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
> -  script:
> -    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -az root/ new"
> -    - rsync -avz --delete public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
> -    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"
> -  only:
> -    refs:
> -      - master
> -    variables:
> -      - $SSH_PRIVATE_KEY_FILE
> -      - $SSH_DEPLOY_DESTINATION
> 

Acked-by: Thomas Huth <thuth@redhat.com>


