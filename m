Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1F38FD44
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:57:45 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSsi-000458-LK
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llSrk-0003QE-7b
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llSrh-0001L3-G9
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621933000;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7t2z1dC82o9c/6hBg4RftG0fVnd/IjQ7fAZTyLw6M4Q=;
 b=fj0u4gqgd8bM7AW2mQ5v+6tDdrSE6xcICZEfqyMoUepxLrmsX4vPAaPMaFSLD9Y/0GO6/f
 qFOFsn3G/TxIB2ZzajT43cCklfJPgPAZLKPgLKVXH5ffTnFiG5cJuDBjZhC3So/80JeRkO
 4W3Voh+X5hOLgyrsiNgiIXxlEhE8DEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-dtAt0slpNQi9Pfaxvd7h7A-1; Tue, 25 May 2021 04:56:38 -0400
X-MC-Unique: dtAt0slpNQi9Pfaxvd7h7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4506803622;
 Tue, 25 May 2021 08:56:37 +0000 (UTC)
Received: from redhat.com (ovpn-114-171.ams2.redhat.com [10.36.114.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 986BB5D6AC;
 Tue, 25 May 2021 08:56:28 +0000 (UTC)
Date: Tue, 25 May 2021 09:56:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 9/9] gitlab-ci: Use absolute path and simplify firmware
 jobs
Message-ID: <YKy7uXb+lmICJVY/@redhat.com>
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-10-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210525082556.4011380-10-f4bug@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 10:25:56AM +0200, Philippe Mathieu-Daudé wrote:
> The GitLab 'add job on file changed' feature doesn't work well
> with relative paths: use absolute paths instead.
> 
> Change the 'rules:' section by an 'only:' one which is easier
> to read.

GitLab docs say "rules replaces only/except", so I'm not convinced
we should be going back to the old syntax, especially as that means
some jobs will use 'rules' and some jobs will use 'only'. Consistency
across jobs wins for me and "rules" is much more expressive.



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/edk2.yml    | 11 +++++------
>  .gitlab-ci.d/opensbi.yml | 11 +++++------
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
> index ba7280605c4..f543a10fbe2 100644
> --- a/.gitlab-ci.d/edk2.yml
> +++ b/.gitlab-ci.d/edk2.yml
> @@ -1,10 +1,9 @@
>  docker-edk2:
>   stage: containers
> - rules: # Only run this job when the Dockerfile is modified
> - - changes:
> -   - .gitlab-ci.d/edk2.yml
> -   - .gitlab-ci.d/edk2/Dockerfile
> -   when: always
> + only: # Only run this job when the Dockerfile is modified
> +   changes:
> +   - /.gitlab-ci.d/edk2.yml
> +   - /.gitlab-ci.d/edk2/Dockerfile
>   image: docker:19.03.1
>   services:
>   - docker:19.03.1-dind
> @@ -28,7 +27,7 @@ build-edk2:
>   needs: ['docker-edk2']
>   rules: # Only run this job when ...
>   - changes: # ... roms/edk2/ is modified (submodule updated)
> -   - roms/edk2/*
> +   - /roms/edk2/*
>     when: always
>   - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
>     when: always
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index f66cd1d9089..7bc96a29366 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -1,10 +1,9 @@
>  docker-opensbi:
>   stage: containers
> - rules: # Only run this job when the Dockerfile is modified
> - - changes:
> -   - .gitlab-ci.d/opensbi.yml
> -   - .gitlab-ci.d/opensbi/Dockerfile
> -   when: always
> + only: # Only run this job when the Dockerfile is modified
> +   changes:
> +   - /.gitlab-ci.d/opensbi.yml
> +   - /.gitlab-ci.d/opensbi/Dockerfile
>   image: docker:19.03.1
>   services:
>   - docker:19.03.1-dind
> @@ -28,7 +27,7 @@ build-opensbi:
>   needs: ['docker-opensbi']
>   rules: # Only run this job when ...
>   - changes: # ... roms/opensbi/ is modified (submodule updated)
> -   - roms/opensbi/*
> +   - /roms/opensbi/*
>     when: always
>   - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
>     when: always
> -- 
> 2.26.3
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


