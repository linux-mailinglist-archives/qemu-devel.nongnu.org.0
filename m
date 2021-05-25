Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF10390700
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:58:39 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaO6-0006FN-FX
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llaAI-0004Ie-2L
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llaAF-0001P9-1z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621961057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3SFUfW8+hD/moUNPOmNjzT4F4NLnCXjq2/wI/cCsnU=;
 b=jWOmRUgI3xGccrVWXLreglZk8wsTOlMT09UKLEPBXxsBxeQRXZMbI6gMqmWxwP0UoJyNbZ
 8MD4wFWQ0FjraUbWFbqPkSILDB1JpzratZ5UucWC1IYCQ2EbXBTinyUwA6F8yRnwsd7Cq4
 jv2hLTCFE0/2j40HU3akaFSbEl1Qrlc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-tf8sDPtmOtOrrLWhBYPJiA-1; Tue, 25 May 2021 12:44:14 -0400
X-MC-Unique: tf8sDPtmOtOrrLWhBYPJiA-1
Received: by mail-vs1-f72.google.com with SMTP id
 a25-20020a0561020159b029024067c780c1so3094705vsr.20
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 09:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t3SFUfW8+hD/moUNPOmNjzT4F4NLnCXjq2/wI/cCsnU=;
 b=JSFBx9cIVqxbBf2OVU57IO4qXmFNlatRHS/eikdqTcu4x1oKcP6O4jZeZxuagZq5nb
 TPbV2Cu5ZDBw0qC2IHMpZjmHPmQMX6Udk1hauS1grOhYck6LjM5j2WBTsqJ7UU3hfmCH
 Q80HScQiapexY/Y4yjxmbjec4PRCmZVUvTj9WbS2sRAxoyeQBA9XIwMwkPw7jPY6RqrS
 dCE8OE9oZgCOCP0u1IZS6M8nv6QV7c5UlQOstuwgjNh0jpuSVkbrtf6qfYVqNZlYRvlb
 4uX2WkyYFVY8//6QUacXW55T3zi+oH6uDO8pqx7IfOx+y4LDhPS3YuCaWfE6uk99Sa6d
 1ojQ==
X-Gm-Message-State: AOAM532/xml3rwzqjnG6b4FkRS3d0553kmBx04Ni++sNP9YmKa+swKWf
 K8QVBGvXDdRl09GPoHoNjLq7tyX06h17qtZ6fgurNnVBInIeDebpKNKlb5YIm+UZNE13h2vO5Fe
 WjWY6maBU1rMtEI6FqqWpBXvS4gfQP/w=
X-Received: by 2002:a67:f357:: with SMTP id p23mr26723583vsm.50.1621961054355; 
 Tue, 25 May 2021 09:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSFLHeRuSpEHRz0wNjQb+aW7z78MGyIIYEwBl99MegHUNRSiRbXwEW879u08erefLHVoozmEWXVABaRzXaJ5A=
X-Received: by 2002:a67:f357:: with SMTP id p23mr26723545vsm.50.1621961054131; 
 Tue, 25 May 2021 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210525153826.4174157-1-philmd@redhat.com>
In-Reply-To: <20210525153826.4174157-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 25 May 2021 13:43:48 -0300
Message-ID: <CAKJDGDaY7cQKVS_yjK2=6VVmPoREAWdnTomeA3wQj_vpRcnR7Q@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Be ready for new default 'main' branch name
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Savitoj Singh <savsingh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 12:39 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> In order to be ready for the GitLab changes in using inclusive
> terminology (replacing the 'master' branch name by the 'main'
> branch name), rename our use of 'master' by the $CI_DEFAULT_BRANCH
> environment variable, so new forks won't be facing any issue.
>
> References:
>
> - https://sfconservancy.org/news/2020/jun/23/gitbranchname/
> - https://about.gitlab.com/blog/2021/03/10/new-git-default-branch-name/
>
> Suggested-by: Savitoj Singh <savsingh@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

With changes to the description proposed by Daniel:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa78..db4e8490483 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -784,7 +784,7 @@ check-patch:
>    script: .gitlab-ci.d/check-patch.py
>    except:
>      variables:
> -      - $CI_PROJECT_NAMESPACE =3D=3D 'qemu-project' && $CI_COMMIT_BRANCH=
 =3D=3D 'master'
> +      - $CI_PROJECT_NAMESPACE =3D=3D 'qemu-project' && $CI_COMMIT_BRANCH=
 =3D=3D $CI_DEFAULT_BRANCH
>    variables:
>      GIT_DEPTH: 1000
>    allow_failure: true
> @@ -797,7 +797,7 @@ check-dco:
>    script: .gitlab-ci.d/check-dco.py
>    except:
>      variables:
> -      - $CI_PROJECT_NAMESPACE =3D=3D 'qemu-project' && $CI_COMMIT_BRANCH=
 =3D=3D 'master'
> +      - $CI_PROJECT_NAMESPACE =3D=3D 'qemu-project' && $CI_COMMIT_BRANCH=
 =3D=3D $CI_DEFAULT_BRANCH
>    variables:
>      GIT_DEPTH: 1000
>
> --
> 2.26.3
>


