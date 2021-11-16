Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80021453391
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:04:03 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmz46-0000b1-6G
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmz2x-0007vo-Tl
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:02:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmz2t-0008FB-PR
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637071367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVeHuQGcCtXZPkRckTvfibjzOdxZo74PyPLpkzrPWgg=;
 b=ToWiNPulOz9ZKJOP9lVnp2cB0e5iS9KN4h+EiYhmTLKYW70r7v8kI2lgqeMo93aSNoYdav
 /IO+glPg10HNmnIQvkxijBSbsi2J0Z0n+sc6e2U4nc9Q89K/7Hy7Z8Yx7WgJr+pXts66J2
 24b4s82tVMvJpYjmjS4ZqhzFix2MKcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-V29BC7EWMeKOmttJkzQHuQ-1; Tue, 16 Nov 2021 09:02:44 -0500
X-MC-Unique: V29BC7EWMeKOmttJkzQHuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B91F98042F4;
 Tue, 16 Nov 2021 14:02:42 +0000 (UTC)
Received: from [10.39.194.244] (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C21460C13;
 Tue, 16 Nov 2021 14:02:32 +0000 (UTC)
Message-ID: <bf4a9f77-68ee-6a0e-6eb8-df1477fede89@redhat.com>
Date: Tue, 16 Nov 2021 15:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gitlab: skip cirrus jobs on master and stable branches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211116112757.1909176-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211116112757.1909176-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2021 12.27, Daniel P. Berrangé wrote:
> On the primary QEMU repository we want the CI jobs to run on the staging
> branch as a gating CI test.
> 
> Cirrus CI has very limited job concurrency, so if there are too many
> jobs triggered they'll queue up and hit the GitLab CI job timeout before
> they complete on Cirrus.
> 
> If we let Cirrus jobs run again on the master branch immediately after
> merging from staging, that just increases the chances jobs will get
> queued and subsequently timeout.
> 
> The same applies for merges to the stable branches.
> 
> User forks meanwhile should be allowed to run Cirrus CI jobs freely.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index e7b25e7427..cc2f2e8906 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -40,6 +40,9 @@
>       - cat .gitlab-ci.d/cirrus/$NAME.yml
>       - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
>     rules:
> +    # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
> +    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
> +      when: never
>       - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
>   
>   x64-freebsd-12-build:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


