Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB312DD1B0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:50:19 +0100 (CET)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsja-00083f-4P
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpshp-0006wu-Tw
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:48:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpshm-00057s-UL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608209304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gx3RPDg/EnnMZh7CEkIsZzZDjxFh4K3S2/33OehUZE=;
 b=STUJCI+c90CgVwf5ljdmAw+XIBVGDMTIOEeRLvNqkBgb56zqxMiN5PjLBn+p/7Q8+4976h
 OMvCvFS0/J5Y0ryGW1RRZvMNrMwNauRFday+vUcxC2vfCjqBlWp9s9RHE00AdJBw9zF5sS
 brvEUobHlJdy3Nsv6TtLXOilEExIOWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-wIoD_BddMoGXK1a3ax_5Rw-1; Thu, 17 Dec 2020 07:48:22 -0500
X-MC-Unique: wIoD_BddMoGXK1a3ax_5Rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04E99801AC1;
 Thu, 17 Dec 2020 12:48:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-175.ams2.redhat.com [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C94C1002C10;
 Thu, 17 Dec 2020 12:48:14 +0000 (UTC)
Subject: Re: [PATCH 3/3] gitlab-ci: Archive logs of acceptance tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20201211183827.915232-1-wainersm@redhat.com>
 <20201211183827.915232-4-wainersm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <41467468-d940-a3dd-3b89-3fc89d18180f@redhat.com>
Date: Thu, 17 Dec 2020 13:48:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211183827.915232-4-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: willianr@redhat.com, alex.bennee@linaro.org, philmd@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 19.38, Wainer dos Santos Moschetta wrote:
> Keep the logs of acceptance tests for two days on GitLab. If you want
> to make it available for more time, click on the 'Keep' button on
> the Job page at web UI.
> 
> By default GitLab will archive artifacts only if the job succeed.
> Instead let's keep it on both success and failure, so it gives the
> opportunity to the developer/maintainer to check the error logs
> as well as to the logs of CANCEL tests (not shown on the job logs).
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  .gitlab-ci.yml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 85aa20ffde..bf3df843e2 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -49,8 +49,12 @@ include:
>        - ${CI_PROJECT_DIR}/avocado-cache
>      policy: pull-push
>    artifacts:
> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +    when: always
> +    expire_in: 2 days
>      paths:
>        - build/tests/results/latest/results.xml
> +      - build/tests/results/latest/test-results
>      reports:
>        junit: build/tests/results/latest/results.xml
>    before_script:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


