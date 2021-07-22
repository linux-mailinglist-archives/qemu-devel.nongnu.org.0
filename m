Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B393D2707
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:50:59 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ayQ-0004SZ-Od
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6awy-0003mC-S7
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6awu-0002no-Sk
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626968962;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGGDOYletrDTlz/tiOKSIANUZkaAa0M/AYASCp0EkTM=;
 b=Wcm58qzsG0MmL/HU0LYwxjfMNoGDLDmxUXjrzIJ6ahhVYYjiDly0ldlSE+8JZ+pq1QqzrE
 4b1CLVdPeXQxUvUEkxAhGjqRYADE5jE5DqJEmSvYZKx8ykQNR2+xFrwY4ixXmHcnnSNJcn
 qQjlEGglRu+Nueph6Yu35zeyEa54oUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-HkP-h2hkMRefEqjRmtDRAA-1; Thu, 22 Jul 2021 11:49:16 -0400
X-MC-Unique: HkP-h2hkMRefEqjRmtDRAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F4D2195D574;
 Thu, 22 Jul 2021 15:49:15 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C5901017CE8;
 Thu, 22 Jul 2021 15:49:06 +0000 (UTC)
Date: Thu, 22 Jul 2021 16:49:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract OpenSBI job rules to reusable
 section
Message-ID: <YPmTb2jC3Fp2yO+E@redhat.com>
References: <20210720164829.3949558-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720164829.3949558-1-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 06:48:29PM +0200, Philippe Mathieu-Daudé wrote:
> All jobs depending on 'docker-opensbi' job must use at most all
> the rules that triggers it. The simplest way to ensure that
> is to always use the same rules. Extract all the rules to a
> reusable section, and include this section (with the 'extends'
> keyword) in both 'docker-opensbi' and 'build-opensbi' jobs.
> 
> The problem was introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
> Add jobs to build OpenSBI firmware binaries"), but was revealed in
> commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
> container").
> 
> This fix is similar to the one used with the EDK2 firmware job in
> commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
> section").
> 
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Latent bug on CI, safe for 6.1.
> ---
>  .gitlab-ci.d/opensbi.yml | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index f66cd1d9089..d8a0456679e 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -1,10 +1,23 @@
> -docker-opensbi:
> - stage: containers
> - rules: # Only run this job when the Dockerfile is modified
> +# All jobs needing docker-opensbi must use the same rules it uses.
> +.opensbi_job_rules:
> + rules: # Only run this job when ...
>   - changes:
> +   # this file is modified
>     - .gitlab-ci.d/opensbi.yml
> +   # or the Dockerfile is modified
>     - .gitlab-ci.d/opensbi/Dockerfile
>     when: always
> + - changes: # or roms/opensbi/ is modified (submodule updated)
> +   - roms/opensbi/*
> +   when: always
> + - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
> +   when: always
> + - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
> +   when: always

In debugging why the acceptance jobs rnu despite their prerequisite
jobs failing, I've realized we've been making a mistake in most of
'rules' sections.

'when: always'  will make the job run regardless of status of any
dependant jobs. IOW, if you have a 'needs: [....]', it is almost
always wrong to use 'when: always'. Instead  we need 'when: on_success'

So this patch needs to make that change, and likewise the edk2 patch
with the same logic.

Alex has queued this one, but I don't see it in a PULL yet, so I
guess we can just do a v2 of this.

> +
> +docker-opensbi:
> + extends: .opensbi_job_rules
> + stage: containers
>   image: docker:19.03.1
>   services:
>   - docker:19.03.1-dind
> @@ -24,16 +37,9 @@ docker-opensbi:
>   - docker push $IMAGE_TAG
>  
>  build-opensbi:
> + extends: .opensbi_job_rules
>   stage: build
>   needs: ['docker-opensbi']
> - rules: # Only run this job when ...
> - - changes: # ... roms/opensbi/ is modified (submodule updated)
> -   - roms/opensbi/*
> -   when: always
> - - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
> -   when: always
> - - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
> -   when: always
>   artifacts:
>     paths: # 'artifacts.zip' will contains the following files:
>     - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


