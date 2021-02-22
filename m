Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55D32153F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:41:50 +0100 (CET)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9b3-0007wY-Q2
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE9Z4-0006zj-Pp
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE9Z3-0001Ui-9U
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613993984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKHu9S1Mr/EaUPMfyA3jdRcPUi0PKYfE+yzu7DPX6N8=;
 b=IpO50tcEVf8+TtDS/PU/Y4E9/3VuBUevsX6ALv+x6b9mvxalHpgAgcEkVAvU8kWP5APsP3
 6PY6coTAAPG36N+NMO9MKL+zlm+2wWqLaMsXwoqhihhXObA3X/PlNvAd/OceLDwV53tpZn
 nvYqbiKcEGObsBaFZCvQBTWzzaEHAHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-v3A6LftSMWuPGzG2mHMZGw-1; Mon, 22 Feb 2021 06:39:43 -0500
X-MC-Unique: v3A6LftSMWuPGzG2mHMZGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC730107ACE3;
 Mon, 22 Feb 2021 11:39:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-97.ams2.redhat.com [10.36.112.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC7C19C45;
 Mon, 22 Feb 2021 11:39:36 +0000 (UTC)
Subject: Re: [PATCH v2 4/6] docs/devel: expand on use of containers to build
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210222101455.12640-1-alex.bennee@linaro.org>
 <20210222101455.12640-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <af0dbc9f-890e-36b8-0fcb-e25a6234ffec@redhat.com>
Date: Mon, 22 Feb 2021 12:39:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222101455.12640-5-alex.bennee@linaro.org>
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
> Expand on the usage of containers for building tests and why we have
> some that are not used to build QEMU itself.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/testing.rst | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 00ce16de48..488d4e3537 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -272,10 +272,10 @@ Note that the following group names have a special meaning:
>   
>   - disabled: Tests in this group are disabled and ignored by check.
>   
> -.. _docker-ref:
> +.. _container-ref:
>   
> -Docker based tests
> -==================
> +Container based tests
> +=====================
>   
>   Introduction
>   ------------
> @@ -1001,10 +1001,17 @@ for the architecture in question, for example::
>   There is also a ``--cross-cc-flags-ARCH`` flag in case additional
>   compiler flags are needed to build for a given target.
>   
> -If you have the ability to run containers as the user you can also
> -take advantage of the build systems "Docker" support. It will then use
> -containers to build any test case for an enabled guest where there is
> -no system compiler available. See :ref:`docker-ref` for details.
> +If you have the ability to run containers as the user the build system
> +will automatically use them where no system compiler is available. For
> +architectures where we also support building QEMU we will generally
> +use the same container to build tests. However there are a number of
> +additional containers defined that have a minimal cross-build
> +environment that is only suitable for building test cases. Sometimes
> +we may use a bleeding edge distribution for compiler features needed
> +for test cases that aren't yet in the LTS distros we support for QEMU
> +itself.
> +
> +See :ref:`container-ref` for more details.
>   
>   Running subset of tests
>   -----------------------
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


