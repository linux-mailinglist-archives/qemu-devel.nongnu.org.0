Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE332B8BA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:51:52 +0100 (CET)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSqt-0000dj-Lk
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHSpO-0007zq-81
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHSpK-0003PZ-W1
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614783013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGCeRUbQJYaGqqCZXUf7394Corkfhh78u/223p42Rho=;
 b=bHpfxwKu7BfVdPiD7K1oIjRGf6ocHAfryo/o8WhtL98ZUBPX4pdLR2FUHcf4ZCoGkIaB12
 m6B+QwlT+Ysy0h/4FZm7HLqMuDw6ogQRx/eC3zI3MlSBLzL3DovbtAH1hrwRuMwXO002Hf
 pe3ZNWxcqNLWI+nYMGMZQp6GbE5isMc=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-jS4tq0TiPGC0SFOShikbcg-1; Wed, 03 Mar 2021 09:50:09 -0500
X-MC-Unique: jS4tq0TiPGC0SFOShikbcg-1
Received: by mail-vk1-f200.google.com with SMTP id u123so6407757vku.15
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 06:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gGCeRUbQJYaGqqCZXUf7394Corkfhh78u/223p42Rho=;
 b=c7+XrB7GR6dPY2HNkTv9dJ6vGbztBFKgHFXQqrm/mtI2TRfrRXyQP1WOeFWvv8FhcS
 K51s59M4fzLf3F9aabpdYJOIR7fudygldgCuafXSEINVNmGUcsoWQbfRDPX8bh5NO5+J
 dEUEPZXuHS616qXymfr/L2VExCof6sfHxdYprf8yhs4byzil4hTTznMtoNf6PpJA0jVc
 AsdnmtCv37XY4sSGSlSfBrd1yBogxR8ohJK+klG1SXUDTIb3kB+Ge5QHjeeEGS7GBUGV
 przv+idV206B4IU/TRRY8/jCpf6zi2Vsd1xLCI/IbJeEzbuu5NSjykJqcjwFOEAH5jQQ
 wWIg==
X-Gm-Message-State: AOAM532wdf0tfCP9g2DhiRXCl4XjUoQYxLfOzkuCHNgeAjBbulLJiM7s
 q5jZs5IlOH2TVK6Ez44Xo1hXPaHLRWbPOrwME3F8fyHkhgwDbSEONNjyEtyDIKG/VaN93bUG9lF
 AWnldUOrmRy4I6P0HrCI/LpvQDZ4BKLg=
X-Received: by 2002:a1f:8f17:: with SMTP id r23mr6349741vkd.2.1614783009284;
 Wed, 03 Mar 2021 06:50:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyln8jFGmWo8NcUvlaQiJfShdWB0fKlaagLQgjUb7cXvkB2S1Hig6f9Rt4nKoX3ISq4vDpek4tfNAU4RIrskpc=
X-Received: by 2002:a1f:8f17:: with SMTP id r23mr6349725vkd.2.1614783009102;
 Wed, 03 Mar 2021 06:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20210303130646.1494015-1-philmd@redhat.com>
 <20210303130646.1494015-2-philmd@redhat.com>
In-Reply-To: <20210303130646.1494015-2-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Mar 2021 11:49:43 -0300
Message-ID: <CAKJDGDZiSra=keFxnSpTZJkz6U6sJsggQ6re2ijS87Y+psgWLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] docker: Alpine build job depends on Alpine container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 3, 2021 at 10:08 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Add missing dependency build-system-alpine -> amd64-alpine-container.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


