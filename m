Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4FD618456
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:27:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqd2d-0005ah-TX; Thu, 03 Nov 2022 12:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqd2c-0005a6-4g
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:26:06 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqd2a-0001M1-AV
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:26:05 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3701a0681daso20443097b3.4
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiSsvdqQBs9RioGWqsp5Tt5JH0vo0tz9GUjnpJhLM4I=;
 b=hLIG6HzXY/vRnriMtyAXXdUwGsOQTf0LbhxPXnlG8QaKyBt7tMHjWGj2gRBKSldTBl
 9rF8WkEs24VdOyy6SCS4rUXzw4Ojy+SuDuUcXE+KfkZJot888nRpArwy2z5rHteojQQ9
 1/rDMh501nbMFnZDJKWf+yRF4UBWS50yOoyaIPXC6X+l0j1qZ+dt0oW+mrh0Q/jAzA2h
 ishAXHleZDV3KtwcoU6eJEO62+nVMyxhyl5YpMbMmWgfxGvnDa5P0k97wQ3GlNfbxjN8
 yyOlgjOEC02HvWQ7gWbzKST2JehDzgFTA16rf8iwGQuAfHesN7lrpBLOs9Soc3n6WPr7
 AqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wiSsvdqQBs9RioGWqsp5Tt5JH0vo0tz9GUjnpJhLM4I=;
 b=lla1MLZSNhWh2Qt3HyMHEJgAmqNt5zugjJn0IJ6v6mBtVB6m4YB48Lw6HBU1GPVR4Q
 72DAn1jWDWFewtPHy7lfcUjedLiuE8Ep3hKNigpoAsa6Ei1/7lqa3oH2x3TbfUiuzTKF
 8rpqJRRtcRy9KVNHH2KlxGFa1G+4BCN0kaPFQo0u/tWFKUVaGZtaBkcjRoHSPVVqWRwe
 bDp3GXpJHOYA4qCKRCXWfSf6wjnxYY+P24sjbBaciW0YInz2EQ/Exd+REmFbTMZu3vA1
 Ci/LOuJ/W7reDbzY692Se0Y06MW4k+axzA3zH3BmuKUoUxQuQb3fHt0X+SLK4q74NeA0
 qIgQ==
X-Gm-Message-State: ACrzQf350PfNyqDbIwrvwJ7wgYvNvYG9GplERH8HUGpkOd5o+p14epHS
 DrEfBeTn7uLLURvMameY8w8H2YLIzycakf4G71U=
X-Google-Smtp-Source: AMsMyM467jeAeb0fDZIyaNXhA79GdAsOa3O3msOe6cIITDatwSjhSJ0s9Qcx2b3ez1CgLe+qlQKziLLysbl0hKRjm60=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr30665681ywf.296.1667492761266; Thu, 03
 Nov 2022 09:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
 <Y2Plai60TK1kErl5@redhat.com>
In-Reply-To: <Y2Plai60TK1kErl5@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 12:25:49 -0400
Message-ID: <CAJSP0QUk4iWY6B7-oxjLtW22OMyAfR-KH7M6QMmQVjvOhwQ+nQ@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, philmd@linaro.org, mst@redhat.com, 
 peter.maydell@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 11:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Nov 03, 2022 at 11:49:21AM -0400, Stefan Hajnoczi wrote:
> > gitlab-runner can run locally with minimal setup:
> > https://bagong.gitlab.io/posts/run-gitlab-ci-locally/
> >
> > I haven't tried it yet, but that seems like the most reliable (and
> > easiest) way to reproduce the CI environment.
>
> IMHO that is total overkill.
>
> Just running the containers directly is what I'd recommend for any
> attempt to reproduce problems. There isn't actually anything gitlab
> specific in our CI environment, gitlab merely provides the harness
> for invoking jobs. This is good as it means we can move our CI to
> another systems if we find Gitlab no longer meets our needs, and
> our actual build env won't change, as it'll be the same containers
> still.
>
> I wouldn't recommend QEMU contributors to tie their local workflow
> into the use of gitlab-runner, when they can avoid that dependency.

If there was a complete list of commands to run I would agree with
you. Unfortunately there is no easy way to run the container locally:
1. The container image path is hidden in the GitLab output and easy to
get wrong (see Ani's reply).
2. The GitLab output does not contain the full command lines because
environment variables are hidden (e.g. $QEMU_CONFIGURE_OPTS).
3. The .gitlab-ci.d/ is non-trivial (uses YAML templates and who knows
what else GitLab CI does when running the YAML).

When doing what you suggested, how easy is it and how confident are
you that you're reproducing the same environment? Unless I missed
something it doesn't work very well.

Stefan

