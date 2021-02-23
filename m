Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C8322977
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:27:57 +0100 (CET)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVrA-0007qY-GE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEVpJ-0006vO-GS
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEVpB-000464-UB
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614079548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/+pwpE78XHHBj/eGnas8ABPMEj5pKQiCoLBCjOCL50=;
 b=gOKjpw7ku55dpBF8/opEvJGs34KLtVICk1MiwR8FqdjAv6gMxqT15+xUiOt2VPqjxQmqgo
 L8Diw180LzVHs9RST8zvnuETB0rzcIPctLYGwr8urIjI+8nmxUhmsGjMwLpST3s4zpa66P
 ujGyGNZzvLaQtctFFM276oerXe2CLZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-d_ULOc0WPsS-oQ8Lvx7TIQ-1; Tue, 23 Feb 2021 06:25:44 -0500
X-MC-Unique: d_ULOc0WPsS-oQ8Lvx7TIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD97814302;
 Tue, 23 Feb 2021 11:25:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-219.ams2.redhat.com [10.36.115.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3532119C45;
 Tue, 23 Feb 2021 11:25:37 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
Date: Tue, 23 Feb 2021 12:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/02/2021 22.58, Cleber Rosa wrote:
> As described in the included documentation, the "custom runner" jobs
> extend the GitLab CI jobs already in place.  One of their primary
> goals of catching and preventing regressions on a wider number of host
> systems than the ones provided by GitLab's shared runners.
> 
> This sets the stage in which other community members can add their own
> machine configuration documentation/scripts, and accompanying job
> definitions.  As a general rule, those newly added contributed jobs
> should run as "non-gating", until their reliability is verified (AKA
> "allow_failure: true").
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>   .gitlab-ci.yml                  |  1 +
>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>   docs/devel/index.rst            |  1 +
>   4 files changed, 44 insertions(+)
>   create mode 100644 .gitlab-ci.d/custom-runners.yml
>   create mode 100644 docs/devel/ci.rst
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> new file mode 100644
> index 0000000000..3004da2bda
> --- /dev/null
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -0,0 +1,14 @@
> +# The CI jobs defined here require GitLab runners installed and
> +# registered on machines that match their operating system names,
> +# versions and architectures.  This is in contrast to the other CI
> +# jobs that are intended to run on GitLab's "shared" runners.
> +
> +# Different than the default approach on "shared" runners, based on
> +# containers, the custom runners have no such *requirement*, as those
> +# jobs should be capable of running on operating systems with no
> +# compatible container implementation, or no support from
> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
> +# reusing the GIT repository, let's enable the recursive submodule
> +# strategy.
> +variables:
> +  GIT_SUBMODULE_STRATEGY: recursive

Is it really necessary? I thought our configure script would take care of 
the submodules?

Apart from that:
Acked-by: Thomas Huth <thuth@redhat.com>


