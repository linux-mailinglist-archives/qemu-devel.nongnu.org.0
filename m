Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A933152B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:48:24 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJzT-0006Ko-3q
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lJJha-0002w1-JY
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:29:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lJJhW-0005gD-Td
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615224587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5OzQhHLk/tF7MVcWO4Sx1z06TvxIdoROKlR/q5JW5U=;
 b=PgS+CM067yjB2pY9lDkoGfCJuSIX+1XaEC9eWj4pJuMORLSjwTr5805t9Acfgyhfk7ANi/
 UsGDnNOP9j9CnDscUB+r6pg4Lj96bc5uAJnAXIRWJmU8b6GYv3gHc0+JiIe73TeGNW7AUY
 3L5TpOmsZDbdq19rRXCEBjU4O+Nc+Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-jRx4FiPWPAG9d3sw7I_r7Q-1; Mon, 08 Mar 2021 12:29:41 -0500
X-MC-Unique: jRx4FiPWPAG9d3sw7I_r7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BF5B1005D4A;
 Mon,  8 Mar 2021 17:29:40 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE07C5C27C;
 Mon,  8 Mar 2021 17:29:36 +0000 (UTC)
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210308154633.158915-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d01bcd9d-a2f8-1e47-6ad7-e7cd94bd3da0@redhat.com>
Date: Mon, 8 Mar 2021 14:29:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308154633.158915-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/8/21 12:46 PM, Thomas Huth wrote:
> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section.
>
> While we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again.
>
> Now to avoid that Alex is listed here alone, Philippe and I agreed to
> help as backup maintainers here, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Keep Philippe and myself as maintainer instead of reviewer
>
>   MAINTAINERS | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)


Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26c9454823..5c4c179abb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>   
>   Build and test automation
>   -------------------------
> -Build and test automation
> +Build and test automation, Linux Continuous Integration
>   M: Alex Bennée <alex.bennee@linaro.org>
> -M: Fam Zheng <fam@euphon.net>
> -R: Philippe Mathieu-Daudé <philmd@redhat.com>
> +M: Philippe Mathieu-Daudé <philmd@redhat.com>
> +M: Thomas Huth <thuth@redhat.com>
> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>   S: Maintained
>   F: .github/lockdown.yml
> +F: .gitlab-ci.yml
> +F: .gitlab-ci.d/
>   F: .travis.yml
>   F: scripts/ci/
>   F: tests/docker/
>   F: tests/vm/
>   F: scripts/archive-source.sh
> +W: https://gitlab.com/qemu-project/qemu/pipelines
>   W: https://travis-ci.org/qemu/qemu
>   W: http://patchew.org/QEMU/
>   
> @@ -3289,17 +3293,6 @@ S: Maintained
>   F: .cirrus.yml
>   W: https://cirrus-ci.com/github/qemu/qemu
>   
> -GitLab Continuous Integration
> -M: Thomas Huth <thuth@redhat.com>
> -M: Philippe Mathieu-Daudé <philmd@redhat.com>
> -M: Alex Bennée <alex.bennee@linaro.org>
> -R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -S: Maintained
> -F: .gitlab-ci.yml
> -F: .gitlab-ci.d/crossbuilds.yml
> -F: .gitlab-ci.d/*py
> -F: scripts/ci/gitlab-pipeline-status
> -
>   Guest Test Compilation Support
>   M: Alex Bennée <alex.bennee@linaro.org>
>   R: Philippe Mathieu-Daudé <f4bug@amsat.org>


