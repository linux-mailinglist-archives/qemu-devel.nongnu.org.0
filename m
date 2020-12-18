Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAB2DE31E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:11:50 +0100 (CET)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFXx-0005yM-C9
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kqFWQ-0005QA-AQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kqFWO-00056P-Jh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608297011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKBqDMjlmVql5c5J082IvuiGSMlMWynBuk4BjR422SA=;
 b=RVmcaizvPbRcVnXccpvw1KbkWw8fz0b8M3uj9dEzHs/mZ6CKqco6LIE4LdazVX8uZVG2ap
 tqou2uDoDy5VGDUeKPwl92if0uuC0lTvAyTIRMe/idL4dPDQ7bmw/QhGzxVQG6EB7dSb2E
 7FMMVd911LfH12CsRIuw58q4EES9NJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-980hYy9RMtCnaPRXGjx03Q-1; Fri, 18 Dec 2020 08:10:08 -0500
X-MC-Unique: 980hYy9RMtCnaPRXGjx03Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5EC107ACE4;
 Fri, 18 Dec 2020 13:10:06 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE225D9D7;
 Fri, 18 Dec 2020 13:10:03 +0000 (UTC)
Subject: Re: [PATCH] tests/docker: Use lower case for centos8 powertools
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201218011158.13495-1-jiaxun.yang@flygoat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4b93008d-26f9-7410-e5a5-6c48f34b0505@redhat.com>
Date: Fri, 18 Dec 2020 10:10:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201218011158.13495-1-jiaxun.yang@flygoat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, alex.bennee@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/17/20 10:11 PM, Jiaxun Yang wrote:
> Our gitlab amd64-centos8-container pipeline constantly fail at:
>
> 15.36 Error: No matching repo to modify: PowerTools.
>
> Fix it by convert it to lower case.

They recently changed the name of some repositories:

https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes

Thanks for working on this fix!

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   tests/docker/dockerfiles/centos8.docker | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 54bc6d54cd..06b67962fd 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -31,6 +31,6 @@ ENV PACKAGES \
>       zlib-devel
>   
>   RUN dnf install -y dnf-plugins-core && \
> -  dnf config-manager --set-enabled PowerTools && \
> +  dnf config-manager --set-enabled powertools && \
>     dnf install -y $PACKAGES
>   RUN rpm -q $PACKAGES | sort > /packages.txt


