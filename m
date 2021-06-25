Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798113B49DE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 22:53:11 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwsp4-0001gj-37
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 16:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwsnk-0000dP-QK
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 16:51:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwsni-0000XP-Ea
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 16:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624654305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMLUARK+F1ONepPDaHKUhMiMqXE6+v6gv5xylvK15+o=;
 b=hSCLsxQy7Zzy0K1UfCtpyPrwuj9d8eyQSIKR/SwKfckPKNX5hMhQ61mszcSlwmgmmxTcoj
 1xtsraHxKoFpSRPtHwvlXhuPO4Keoaar/sjXEAQ+4xTwNWihIZ5nfBTzyZ27s+EVbEF5Vx
 IEnH6qujz6HB1KUDgzsML0UIolRalZE=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-aKW62zMXNV6ZaKWCdVbKzQ-1; Fri, 25 Jun 2021 16:51:44 -0400
X-MC-Unique: aKW62zMXNV6ZaKWCdVbKzQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 e7-20020a1f1e070000b02901ffbfb6bcd1so3475807vke.22
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 13:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IMLUARK+F1ONepPDaHKUhMiMqXE6+v6gv5xylvK15+o=;
 b=UNgStO39IDOI2/F49Eo2HkliBOlTtf709UMSxme21tx15WhrbmzkejZ0ZhrMHRFi3L
 qFH0OnJT6LJxcEtIlC++aiFxkOhWXhMxVDkn/eDEx+9c98YRshKCk0U6ZZZw1Say3csE
 1IYo1n7QBv15LZaojTr1gMS06Eyo6jis5u4SweKWbzAPVnijtJafg0YKRiPB/O2JuUFs
 x8fyX4eXyRmg+a6oNCaZkRO/ACmdzHKO/OFSAw9BpZKwPpbHY6+Zi2P4GOumZ9Af42RN
 dUsDoQ1IavZEk1Y3KKKAkSiDceUUa1J+DXRmOVwuJsWfFr05X/9rhUHwUkoKRbcbprdb
 a7uw==
X-Gm-Message-State: AOAM531BQf2HowgKuZGRAv1/KXuDENEgQwBJmb0BIA0pAIP57Zr/tTbJ
 4v0aAfzvueONzg5J4ZLowEqVQKMXDsobOL4F9/fWjOK16tDjgEw03tKfv+/29t/RkaqZYO8H0CC
 RH08YpdgPE8auB+Q+yoN6B96r79681H8=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr10269276vke.2.1624654303546; 
 Fri, 25 Jun 2021 13:51:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJwFt/eiWD1Uq+F2xKshtmfhecnL2jWiat5KbZlEh75wrcPziojBJmGR8dWpDntRuBtSR8yi5g7hgQNmxvRwk=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr10269259vke.2.1624654303268; 
 Fri, 25 Jun 2021 13:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-6-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-6-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 17:51:17 -0300
Message-ID: <CAKJDGDaSvDFqtz9xPOcKFBdaPQxDfHnrXq7h1ywDt+7W0+tJ8Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/22] tests/docker: remove FEATURES env var from
 templates
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 11:23 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> In preparation for switching to auto-generated dockerfiles, remove the
> FEATURES env variable. The equivalent functionality can be achieved in
> most cases by just looking for existance of a binary.

s/existance/existence/

>
> The cases which don't correspond to binaries are simply dropped because
> configure/meson will probe for any requested feature anyway.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/docker/common.rc                        | 19 ++++++++++++++-----
>  tests/docker/dockerfiles/debian10.docker      |  2 --
>  .../dockerfiles/fedora-win32-cross.docker     |  1 -
>  .../dockerfiles/fedora-win64-cross.docker     |  1 -
>  tests/docker/dockerfiles/fedora.docker        |  1 -
>  tests/docker/dockerfiles/ubuntu.docker        |  1 -
>  tests/docker/dockerfiles/ubuntu1804.docker    |  1 -
>  tests/docker/dockerfiles/ubuntu2004.docker    |  1 -
>  tests/docker/run                              |  3 ---
>  tests/docker/test-clang                       |  2 +-
>  tests/docker/test-debug                       |  2 +-
>  tests/docker/test-mingw                       |  3 ++-
>  tests/docker/test-misc                        |  2 +-
>  tests/docker/test-tsan                        |  2 +-
>  14 files changed, 20 insertions(+), 21 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


