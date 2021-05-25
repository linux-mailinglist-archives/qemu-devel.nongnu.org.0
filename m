Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D1E39074C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:17:35 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llagQ-0003Ne-0T
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llZcW-0000Qf-6c
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llZcR-0000tB-C7
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621958961;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNsQFrCZgvhqYIV6dVVQp5FKaKY9lAcmQysydm8kPd4=;
 b=bikp/X5wDhtixjlwZqD/4bN1JVoAx9i0Ye9b7J9x8/TSlxLPoZolVCX5hO2udBsu6SlD+H
 tDPZY6tIviw7U6wJeFm2iYSD7xzdUKUL4cw8Rm58dP9PvcbozpGFY9BYtb3XduHuMl7a4c
 l3mytjdUBrG90ONhWS/iwMdQ+d9tU1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-1eNfzTAUOOGPikijigP_BQ-1; Tue, 25 May 2021 12:09:15 -0400
X-MC-Unique: 1eNfzTAUOOGPikijigP_BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DD2107ACC7;
 Tue, 25 May 2021 16:09:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-171.ams2.redhat.com [10.36.114.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE2D5D9C0;
 Tue, 25 May 2021 16:08:58 +0000 (UTC)
Date: Tue, 25 May 2021 17:08:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Be ready for new default 'main' branch name
Message-ID: <YK0hFyf17lNKHqek@redhat.com>
References: <20210525153826.4174157-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210525153826.4174157-1-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Savitoj Singh <savsingh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 05:38:25PM +0200, Philippe Mathieu-Daudé wrote:
> In order to be ready for the GitLab changes in using inclusive
> terminology (replacing the 'master' branch name by the 'main'
> branch name), rename our use of 'master' by the $CI_DEFAULT_BRANCH
> environment variable, so new forks won't be facing any issue.

I've no objection to the actual config change, but the description is
little inaccurate IMHO. GitLab is not forcing a branch name change
into any existing repositories. It is entirely upto QEMU to decide
when to change our branch names. Forks of QEMU also won't get a new
branch name, because any branches in forks are inherited from what
exists in repository being forked and not arbitrarily renamed.

So, AFAICT, only brand new (ie empty) repositories will get 'main'
as the new default branch name.

IOW, I'd describe this as

  "We want to skip the checkpatch and DCO signoff jobs when
   pushing to the default branch. Currently this branch is
   called 'master', but we don't need to hardcode this in
   the CI configuration, because the $CI_DEFAULT_BRANCH
   env variable exposes it."

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa78..db4e8490483 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -784,7 +784,7 @@ check-patch:
>    script: .gitlab-ci.d/check-patch.py
>    except:
>      variables:
> -      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
>    variables:
>      GIT_DEPTH: 1000
>    allow_failure: true
> @@ -797,7 +797,7 @@ check-dco:
>    script: .gitlab-ci.d/check-dco.py
>    except:
>      variables:
> -      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
>    variables:
>      GIT_DEPTH: 1000

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


