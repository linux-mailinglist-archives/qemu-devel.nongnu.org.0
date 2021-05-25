Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27F390409
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:35:38 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llY9h-0007uc-Kv
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llY5L-0000So-Ay
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llY5J-0001Kf-Br
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621953063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfJUh+EvTujJiFjHqUlKSmYPOW993ByNI9hTf9OhtCQ=;
 b=Ti3n0PfOpWNv0EVNnsZDTXzXRaJYuWp0EupvWdly9isqhHGXVmMQUcluMswEaZYSgFs4Zj
 DYVkjdWQ+14TdtF/Y+5qyPwIjT5EP64vtTz6XtVFZ/G0dQEYS2MR7DqzNFFR0VmsmC9Xoe
 i1cTIDfgRK13UAKSGA4pl2+sndTv0lo=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-MXIZnNskOxS7VDssWxqnpg-1; Tue, 25 May 2021 10:31:01 -0400
X-MC-Unique: MXIZnNskOxS7VDssWxqnpg-1
Received: by mail-ua1-f71.google.com with SMTP id
 w5-20020ab028050000b029021072f0ea2eso10103267uap.19
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PfJUh+EvTujJiFjHqUlKSmYPOW993ByNI9hTf9OhtCQ=;
 b=rAIsWXRo6zmwNulsMwmKFaTcbSlhJ4TmXImAdr2GSCSbaHgSgsK5azqq8PKvKyBRTO
 3sTYTzCFCj3Ns+ZnXk6q3SKlvO9ihAxNI0zrD8BhNE9Nb0C9+fL0RjWUcKyrIOSUzhkl
 HRknEtjQVd7c0d8yGsDCRQ7otGl6pEaLYG8khKNOp8Yy32G2L+QfE51+oK+n54rJGjO3
 9IK5+QbBKhRe9fR30J6WaAfO7pmwPLBsNVUWN8OHI9mXEIsmgumZzi08gtPbGYoBEqZi
 1qD7sfUm+rF8AnqaKYNkaCmtAfkAqKknp0dzguUAiEkHMGlkASsSyB4D0b8z+1oY0das
 hl8g==
X-Gm-Message-State: AOAM531sihAZUMwvJ2DkY1FLpZnR2X9u+fy+DGrviUpEcWMpJszyzA7a
 SGLwsuy6ywtWqrI9GKGFY+Mgmgqa02yJ7NLsD+Lw9gQjXaIu81hi9VheN9XgZgYjaFYKsJEojjK
 8ScQAApS5jG8KclcPk8SmUWvlL6vTNAo=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr24755992vsj.50.1621953061240; 
 Tue, 25 May 2021 07:31:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwovtMll9nIVUl8K7I/eXubm/45WDw4c2Y059FyiuWTaJYH6TO7DIDkwXk+N70hpaZff6UXMZgdG2uWJU0WMYI=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr24755957vsj.50.1621953061016; 
 Tue, 25 May 2021 07:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-4-f4bug@amsat.org>
In-Reply-To: <20210525082556.4011380-4-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 25 May 2021 11:30:35 -0300
Message-ID: <CAKJDGDY20jG=skbTbEjsOoWZpTK_ytMB9H57wqUxLA0+mUmrfw@mail.gmail.com>
Subject: Re: [PATCH 3/9] gitlab-ci: Document how forks can use different set
 of jobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 5:26 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Document how forks can use different set of jobs and add
> a big warning so no new configuration is added to this
> file.
>
> Suggested-by: Daniel Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 533a7e61339..8c843e5f20e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,2 +1,16 @@
> +#
> +# This is the GitLab CI configuration file for the mainstream QEMU
> +# project: https://gitlab.com/qemu-project/qemu/-/pipelines
> +#
> +# !!! DO NOT ADD ANY NEW CONFIGURATION TO THIS FILE !!!
> +#
> +# Only documentation or comments is accepted.
> +#
> +# To use a different set of jobs than the mainstream QEMU project,
> +# you need to use the "custom CI/CD configuration path" option in
> +# your GitLab CI namespace setting and set it to option and set the
> +# location of your custom .gitlab-ci.yml:

I found it a bit confusing. What do you think about the following:

To use a different set of jobs than the mainstream QEMU project, you
need to set the location of your custom yml file at "custom CI/CD
configuration path", on your GitLab CI namespace:

> +# https://docs.gitlab.com/ee/ci/pipelines/settings.html#custom-cicd-conf=
iguration-path
> +#
>  include:
>    - local: '/.gitlab-ci.d/qemu-project.yml'
> --
> 2.26.3
>


