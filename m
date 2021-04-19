Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCED364815
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:18:34 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWbZ-00081a-Rw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWZe-0006NM-07
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWZa-0006lQ-Re
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618848989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1U7BQ95yR722fxpjSi6lJ0uf1DA+L3y42eboTbEPJM=;
 b=C1FBaR2XhDNgCLW5AIp6DMua/cEnll8GwdbGgQyb6Mn1KCrR5WE8TODkEeTvs9tjxHX3l9
 56aASTNZ1zWnElPjkYP1rfhFgrB5yuQ8OWiq+cuDCiRUJiaaP3YtO1vBU+NGpa9hD5/gRM
 6s1IQGk0RE1hsAy3mEagR4BFm2I5rqE=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-GIRCQUfeO62G8vL7sDJnmQ-1; Mon, 19 Apr 2021 12:16:27 -0400
X-MC-Unique: GIRCQUfeO62G8vL7sDJnmQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 q4-20020a67cc040000b02902221bedbe6bso480218vsl.8
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z1U7BQ95yR722fxpjSi6lJ0uf1DA+L3y42eboTbEPJM=;
 b=B9jjTj5iIHwQyLr236m5YqmSVD5GinFP2oeJigPafPp42zBdcud0yH1KQ+hyYgSIE7
 At5oZErUhQW6BWU966YQp488Q0bQEjlwsZPyr2gnt7qkP6HZ1MVIByFl5VG31/M0OWJT
 ZrOUbO1C9ovsNMe8lnO5efDVGP++upB5UyQl2BX+ElY1wyVL7/gNZ3JQeYry/ab5EnR1
 MUQJA+3Fjaz8TmphskEQs/DJxGZGsypc8hQF8rxDdqy2kXUKSA+bukYVyhLR4iw3v90l
 iD8aPwLicrGJarDuchICsEzX243In/w5svoERCp0eXTg7U5UxBkTh0hkXAoYwM0adwfo
 VFdw==
X-Gm-Message-State: AOAM530Qq+QDLLXQby5OQxZBpvZ78ykLvVv7QHxzeEAWYclG+9nWE9sX
 69A8ENthhJfUZvcaMoAX7k4Y5mxYb1O3OfiV0W9xHv2oybrpG9ZwaEKYwJ3PMbidqwNpDAaMLf3
 b0O/wX0+1hZntqoRgGzdFhiw0aFoxyPs=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr15454473vsn.39.1618848987520; 
 Mon, 19 Apr 2021 09:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLcSxUTiI0dbVVRoN/YABIoYmajflbcU0K4aMCtSKYGrnCuRKCnxCR0HCSxsoOdrgcku3Uk0Ror/qHQbUYthA=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr15454457vsn.39.1618848987370; 
 Mon, 19 Apr 2021 09:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-4-crosa@redhat.com>
In-Reply-To: <20210414221457.1653745-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 19 Apr 2021 13:16:00 -0300
Message-ID: <CAKJDGDaFROB8unUOn4Qqh-DhgM1a1VdbAFhEa-+ac2kVLiBW5Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] Acceptance Tests: support choosing specific distro
 and version
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 7:15 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The tests based on the LinuxTest class give the test writer a ready to
> use guest operating system, currently pinned to Fedora 31.
>
> With this change, it's now possible to choose different distros and
> versions, similar to how other tags and parameter can be set for the
> target arch, accelerator, etc.
>
> One of the reasons for this work, is that some development features
> depend on updates on the guest side.  For instance the tests on
> virtiofs_submounts.py, require newer kernels, and may benefit from
> running, say on Fedora 34, without the need for a custom kernel.
>
> Please notice that the pre-caching of the Fedora 31 images done during
> the early stages of `make check-acceptance` (before the tests are
> actually executed) are not expanded here to cover every new image
> added.  But, the tests will download other needed images (and cache
> them) during the first execution.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/testing.rst                    | 65 +++++++++++++++++++++++
>  tests/acceptance/avocado_qemu/__init__.py | 47 ++++++++++++----
>  2 files changed, 102 insertions(+), 10 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


