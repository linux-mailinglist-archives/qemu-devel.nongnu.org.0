Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92732155E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:47:47 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9gj-0001ok-C1
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE9fY-0001Ok-Bs
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:46:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE9fW-0004Sv-O8
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613994385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VD2XtLuB6grX/qDZ38kDPoPVysapU85/QZrUj/ZbxEQ=;
 b=dZai2UFaEkc89Mk0sClfOwm96xSnVMFpQcP+v+gXl5qRHfeAmMz6FT8cMmgyucKy+gITRy
 9VpHEmXBwgkzXX19d7Wlbzb7kFbQtVEDvJNTcqpgqtcfb5s8vZQd4eAiLoM9HP6Nzt5clb
 WfmxGkQAm5Pio7mQSdvSJBrPdbxheBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-KsUAVqUfPc2SFV7uqbkMCg-1; Mon, 22 Feb 2021 06:46:23 -0500
X-MC-Unique: KsUAVqUfPc2SFV7uqbkMCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65581107AD4E;
 Mon, 22 Feb 2021 11:46:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-97.ams2.redhat.com [10.36.112.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AA719D9C;
 Mon, 22 Feb 2021 11:46:16 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] docs/devel: update the container based tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210222101455.12640-1-alex.bennee@linaro.org>
 <20210222101455.12640-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a28b2c23-418b-83f7-c045-e82a11b95ae3@redhat.com>
Date: Mon, 22 Feb 2021 12:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222101455.12640-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2021 11.14, Alex Bennée wrote:
> This section has grown a little stale so clean-up the language and
> examples for current usage:
> 
>    - refer to containers at the top
>    - mention podman can also be used
>    - add podman prerequisites section
>    - move to using "docker-help" for online help
>    - mention the registry and it's purpose
>    - don't refer to out-of-date min-glib image
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/testing.rst | 61 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 46 insertions(+), 15 deletions(-)
[...]
>   .. code::
>   
> -  make docker-test-build@min-glib
> +  make docker-test-build@centos7
>   
> -This will create a container instance using the ``min-glib`` image (the image
> +This will create a container instance using the ``centos7`` image (the image
>   is downloaded and initialized automatically), in which the ``test-build`` job
>   is executed.

We're going to drop support for CentOS 7 in three months (May) ... so maybe 
it makes more sense to directly use centos8 or another long-term distro here?

> +Registry
> +--------
> +
> +The QEMU project has a container registry hosted by GitLab at
> +``registry.gitlab.com/qemu-project/qemu`` which will automatically be
> +used to pull in pre-built layers. This avoids unnecessary strain on
> +the distro archives created by multiple developers running the same
> +container build steps over and over again. This can be overridden
> +locally by using the ``NOCACHE`` build option:

Thanks a lot for adding the information!

  Thomas


