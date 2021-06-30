Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD03B8525
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:38:42 +0200 (CEST)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybMP-00028J-KG
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybLB-0000lA-Lf
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybL9-0002sD-18
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625063842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tmaP/dG6MJVwJwAXmuGGQoRh6+McmrzYtRGLb2oHfrU=;
 b=U4rQT9pXSJSqxLHoDNBYJkcXquCUgbrR1XJcFye1Ml5tAlKpwQk5SGUNNG0njHBfZuJaG+
 AHMI9AvkWFmvlLYHg4Ysbi9DQozJlYr8nMq+GmjNsoj0XyXJldr0NicuiRN4YJWZ2zLKsQ
 qBNBZ3nXZ2XODyOIRQ1iyiOTq4HXQMI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-byLJfizoN0GOwl37OEaiiA-1; Wed, 30 Jun 2021 10:37:21 -0400
X-MC-Unique: byLJfizoN0GOwl37OEaiiA-1
Received: by mail-vk1-f200.google.com with SMTP id
 z16-20020a0561221490b029024cf7dcad61so569062vkp.14
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmaP/dG6MJVwJwAXmuGGQoRh6+McmrzYtRGLb2oHfrU=;
 b=B0z6+hn8bIFOp4zbHRjKD8RO2upfvP29/029Ou1vDkKXaD3Jl4FVZ9tAsCpdCL1p19
 iZHh81W0lGiaO9ObJBnh+TbCWq8mCLVYlo1RUFLUYpVncLXMAZIab/+fFlnUTh78MZNW
 k2NtphAhWogkwXaGYa06+lAD9anyay9AlXJ6+hAKRQEtTuGokikeMLudn5NguRh30Vfh
 LUbzR7g+iuMVfBGe4AkCz+hhmKhd2sabuBNWH+a0FtyrzsxHUOxiyI0bNkqWyz+9kpS7
 s7mK9AGq4STAaoErEuC4wplDGFma6PeK2qUDX78ayMKusd9Gplaji8TlJwE4UUa1Rry/
 bu7Q==
X-Gm-Message-State: AOAM531kkZqUrmMdQGOKpueg5ZSzK2wDzQDyvWtTlsV39Uyj1VqiqNLm
 dZ2UaTMIPWxbPbdFOWe7coNvpYioN+HgFbA3wOpjdXSpECRkHJZAgaDiYxkssfJ8YYGAxQ6mbMO
 rSG0TWfZUyGxraCCaWiqaShfxjk0F87k=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr33318983uaq.133.1625063840675; 
 Wed, 30 Jun 2021 07:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwomHFtfNid4PAuCf4/xFNE+LlApk/Wi3hfLZa47q/A9+3qz6Nb8oBbceqNyVQbXkgoTAcBI1r7K/51TA2giuo=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr33318952uaq.133.1625063840473; 
 Wed, 30 Jun 2021 07:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-11-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-11-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 11:36:54 -0300
Message-ID: <CAKJDGDYMWFLAR237LeUMoC4y5TvJhQNyXe5siE3emXuvWZ-tQg@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] python: only check qemu/ subdir with flake8
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 6:43 PM John Snow <jsnow@redhat.com> wrote:
>
> flake8 is a little eager to check everything it can. Limit it to
> checking inside the qemu namespace directory only. Update setup.cfg now
> that the exclude patterns are no longer necessary.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/setup.cfg       | 2 --
>  python/tests/flake8.sh | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


