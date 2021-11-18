Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AA455618
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 08:53:04 +0100 (CET)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mncEB-0000iL-R8
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 02:53:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mncD8-0007oI-KR
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mncD5-0006Xs-1p
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637221912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5sFIOiq4YDIuRvciiCpC/x5IcoeaW4uwUt+segLg2Y=;
 b=ZLByOYBpbYEveBrvjmdACW3Mz1xm94/eeKohSY9iV5uJrgnKqhyy6aymLtvi783qrR9FFR
 d4l22KGoq8NH/vKDbdQaVOoabZelXub+otrrO9fWqTz8tg0UYFfnsjzCOCsulmrWZqd3zJ
 HgQK646Z4E6JHSRpTHw74H6/Lv5F9kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-aB9wpLRiN32t4mxwkCIRvQ-1; Thu, 18 Nov 2021 02:51:46 -0500
X-MC-Unique: aB9wpLRiN32t4mxwkCIRvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAAF01808328
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:51:45 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47A07608BA;
 Thu, 18 Nov 2021 07:51:45 +0000 (UTC)
Message-ID: <363b5548-513e-8c44-8405-588060c3094e@redhat.com>
Date: Thu, 18 Nov 2021 08:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [qemu-web PATCH] remove deployment phase from CI
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211118074702.216951-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211118074702.216951-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 18/11/2021 08.47, Paolo Bonzini wrote:
> qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
> not need anymore the rsync step to the QEMU project's shell server.
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


