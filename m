Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA172F296D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:39 +0100 (CET)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEYc-00005W-Rf
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEX1-0007KP-4v
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:55:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEWz-0004ly-Km
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610438156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EqjScMat0yfr/RdJ7PHE1DpoTGh8ZdalgbD3aDdijgE=;
 b=OVc2+b0e3aFomivcKXvyaUIeQRqxd5p2FIS9wjgkTQijh3snDTmrJb8Dxf4JJS9HlIA/nh
 MKNUZbXsE0Xqu0hYYrhjwi5nhN6+aGrYxMGG5CEkvo0fDMAvF/NhMFGF/r8F7L6KO7hjmw
 D2jOpQKMMlMDhvLlxfxQQTzXudr9hU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-515ZSK07PxK2QhNWIe7Qag-1; Tue, 12 Jan 2021 02:55:54 -0500
X-MC-Unique: 515ZSK07PxK2QhNWIe7Qag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CFB818B6126;
 Tue, 12 Jan 2021 07:55:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 395BE100AE46;
 Tue, 12 Jan 2021 07:55:32 +0000 (UTC)
Subject: Re: [PATCH 3/6] gitlab-ci: remove redundant GitLab repo URL command
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-4-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <aa0c7f5e-ed26-e715-9130-bcf4fb1c1768@redhat.com>
Date: Tue, 12 Jan 2021 08:55:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 12.50, Stefan Hajnoczi wrote:
> It is no longer necessary to point .gitmodules at GitLab repos when
> running in GitLab CI since they are now used all the time.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .gitlab-ci.yml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 01c9e46410..4c2a71b934 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -18,7 +18,6 @@ include:
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     before_script:
>       - JOBS=$(expr $(nproc) + 1)
> -    - sed -i s,git.qemu.org/git,gitlab.com/qemu-project, .gitmodules
>     script:
>       - mkdir build
>       - cd build
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


