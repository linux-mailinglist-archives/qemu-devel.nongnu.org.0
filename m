Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB03A3378
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:42:32 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrPdP-0000eW-Cs
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrPcO-0007jo-NG
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrPcC-0007Zw-5D
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623350474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4g3rbfYBgNPcVjnJkvxk8WXfj7Scnz18l4TisOowMls=;
 b=E5q0g85IHaHNei43lwmu0fh94LSqefRL3iG4lzfklBfccScFnK8HkgUd9xBV6ACaxqF53Q
 uQNBmQ4pUQSGR5mrSyFqzDieE//bTwXBepRKvtpcilGrDlt9+SpNCUc9rky15WR4FBEJ0+
 iNv2VyI3touYK4txqh7iAQTNTDeFrh0=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-UW__i0WeNxmF6dDgswWaVQ-1; Thu, 10 Jun 2021 14:41:13 -0400
X-MC-Unique: UW__i0WeNxmF6dDgswWaVQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 63-20020a1f14420000b0290219c98718e8so1925691vku.15
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 11:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4g3rbfYBgNPcVjnJkvxk8WXfj7Scnz18l4TisOowMls=;
 b=TPVFSaCk6cQAmdatEbJy5BiVNyY5A3eADKcur/stVfqF/lZsf7ucAq20Ch7TZ+ssyj
 fsupR7cT+C0yNbndsj4ThVowecKp0WhADX9x+c8O2fCEOL2fzvCvDWnDXuAy1MhM5SYC
 0fKJye8ueBVGM4XO8JoU3uAvb9z+Vaxitf3T6Y6lbhIDNYV43Ac6xMK40lc8C7c9ei3Y
 rGiQD1MUVSCYKabnjU+Cu6eQjsCnlxLsJyzT8/KTHxV7MvXZrR2b8fUpN9MRJ6VuNJ5z
 f7DPyT3M/rVzX3O3iVjMNLGhdhMXKI1pIP5VViyzH9KG0s5YlPtWHVALAL7vbXeOU8YP
 pfVg==
X-Gm-Message-State: AOAM532iKmkZqy+OSfgO2nqySBR2L/kbdXTaGEXS+86zxgiwXZeFuiIH
 7jfg7HpyDX8Rn0QeRTg8IjFSFiujja3/xzlhDLCNoo8DWVCd6q6KWa+r9RQHrtFXH2c1IDn2cjG
 Sde2lyyWzsntVh43426nXV3WNgPfLKas=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr1458021uam.5.1623350472380;
 Thu, 10 Jun 2021 11:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6HBH1+0sAWEw9OIvYHmI4McAr3Qj8f6KqyXwzOARN+4fm5ObUSVAS4j9uMCEw0NryB7SV7x1lXoCWDa+i3mA=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr1457992uam.5.1623350472152;
 Thu, 10 Jun 2021 11:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210608140938.863580-1-crosa@redhat.com>
In-Reply-To: <20210608140938.863580-1-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 10 Jun 2021 15:40:45 -0300
Message-ID: <CAKJDGDbdJwEsNW=gi7Qm8AH5qK034ZteuRSyX=519yHuMC6RLg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Jobs based on custom runners: add CentOS Stream 8
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 11:09 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> This builds on top the "GitLab Custom Runners and Jobs (was: QEMU
> Gating CI)" series, showing an example of how other entities can
> add their own custom jobs to the GitLab CI pipeline.
>
> First of all, it may be useful to see an actual pipeline (and the
> reespective job introduced here) combined with the jobs introduced
> on "GitLab Custom Runners and Jobs (was: QEMU Gating CI)":
>
>  * https://gitlab.com/cleber.gnu/qemu/-/pipelines/316527166
>  * https://gitlab.com/cleber.gnu/qemu/-/jobs/1325976765
>
> The runner (the machine and job) is to be managed by Red Hat, and
> adds, at the very least, bare metal x86_64 KVM testing capabilities to
> the QEMU pipeline.  This brings extra coverage for some unittests, and
> the ability to run the acceptance tests dependent on KVM.
>
> The runner is already completely set up and registered to the
> https://gitlab.com/qemu-project/qemu project instance, and jobs will
> be triggered according to the same rules for the jobs introduced on
> "GitLab Custom Runners and Jobs (was: QEMU Gating CI)", that is,
> but pushes to the staging branch.  Still, the job is set with mode
> "allow failures", so it should not disrupt the existing pipeline.
> Once its reliability is proved (rules and service levels are to be
> determined), that can be reverted.
>
> Even though the formal method of tracking machine/job maintainers have
> not been formalized, it should be known that the contacts/admins for
> this machine and job are:
>
>  - Cleber Rosa
>    <crosa@redhat.com>
>    clebergnu on #qemu
>
>  - Willian Rampazzo
>    <willianr@redhat.com>
>    willianr on #qemu

Acked-by: Willian Rampazzo <willianr@redhat.com>


