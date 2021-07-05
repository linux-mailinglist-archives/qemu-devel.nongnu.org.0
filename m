Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394273BC38E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:09:26 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0VqH-0000gJ-AU
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Vno-0005yG-MS
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Vnn-0004LA-4Z
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625519210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nVVjISBgp2qUfObCEpd9nyCic+jcASBgUOJfhkCNfpM=;
 b=it/oWhJ/XBPnBaZPlGfVe40bBkUlrf3vkTW68mg2Anc2ZDwZLC6ELjFAe5BozVCrlpIO/1
 8bEWI/FsbVW1EVA0RAIQc/zAkAmpqhdrqQkfwSRZzNEF59Ib00iWTZBjoZpt8FL6/04oCx
 4ciFU7iTBMkRcdFya4a3oXrXnqRUCWQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Cz0KOZ-_M4eYdKX8yihMbQ-1; Mon, 05 Jul 2021 17:06:49 -0400
X-MC-Unique: Cz0KOZ-_M4eYdKX8yihMbQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 v20-20020ab076940000b029020b0b4ada34so6755245uaq.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVVjISBgp2qUfObCEpd9nyCic+jcASBgUOJfhkCNfpM=;
 b=j0KZ/E5k6qFS0c3II6rWmenQZ7rNrGKVF00/uQWyUpLkss5gPayBMDn77mOvNmTAvg
 X9Kcc/DSLts5N+scOFyzvTxJPc4yxxh2aPGNFAiJL7/wyTs6jvcFheLqBckkKL+SNbJW
 RY5MxaoB9w4cjJmQSg6NoINFcDTkJB/APBa2Y9hrRhVckzWmxnI07mk+mBwGZbIp+Mmr
 F9WI9sCoC1gz8f5KolRemd3Nom48Ycglxm/m3oNuU/fNExHHtV1mcfI6iAvor7fcmAvp
 TILm2ypa+vYeKD5BC9hYE8c2iGgI2sPkkziT6dj5M0Zu6+wAU7tuxcnAegiuhmQy1ucR
 NSxA==
X-Gm-Message-State: AOAM532laSZKNo1sxMqB8FRXq6nFOTv28TgYVHS4L6kYGwunj6j+I58f
 8ztc5DVUpSzTxqkDYI5IwTvMY7rh2xBBC5ohEhbXLet1WPozYU7zzJo/S3GbtfYK0ptSpBDjDYO
 /SdM+LCCGELseDmkzNZDzuNQSQudcsDY=
X-Received: by 2002:a9f:2473:: with SMTP id 106mr11943163uaq.124.1625519208875; 
 Mon, 05 Jul 2021 14:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz06mYgAj73Z2awae2hWGgFIosOGFHpCXdqSD5aAdEeejbk98fD48ryMRJ6RDqcU2Q0o5Si2cLq5xqk95PHjf8=
X-Received: by 2002:a9f:2473:: with SMTP id 106mr11943099uaq.124.1625519208369; 
 Mon, 05 Jul 2021 14:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <20210629143621.907831-3-eric.auger@redhat.com>
In-Reply-To: <20210629143621.907831-3-eric.auger@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 18:06:22 -0300
Message-ID: <CAKJDGDbt=SPvNbrgRRKwn6G9y=euNsoJGygiJRKbxcRRq94b_w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] avocado_qemu: Add SMMUv3 tests
To: Eric Auger <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 11:36 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> Add new tests checking the good behavior of the SMMUv3 protecting
> 2 virtio pci devices (block and net). We check the guest boots and
> we are able to install a package. Different guest configs are tested:
> standard, passthrough an strict=0. This is tested with both fedora 31 and
> 33. The former uses a 5.3 kernel without range invalidation whereas the
> latter uses a 5.8 kernel that features range invalidation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v3 -> v4:
> - add tags for machine, distro in the class
> - removed smp and memory overrides
> - set default param value of common_vm_setup to False
>
> v1 -> v2:
> - removed ssh import
> - combined add_command_args() and common_vm_setup()
> - moved tags in class' docstring and added tags=arch:aarch64
> - use self.get_default_kernel_params()
> - added RIL tests with fed33 + introduce new tags
> ---
>  tests/acceptance/smmu.py | 132 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 tests/acceptance/smmu.py
>

As stated in the thread, this test does not need to run on CI, so with
the skipIf statement:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


