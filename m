Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FE4A8B21
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:03:05 +0100 (CET)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgRk-0006qu-Pd
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:03:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFg5O-0004Hh-Bx
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:39:58 -0500
Received: from [2a00:1450:4864:20::533] (port=37639
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFg5L-0003k9-Ny
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:39:57 -0500
Received: by mail-ed1-x533.google.com with SMTP id c24so7665106edy.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MLyjO6DTCqYmJjw6lLfP0bK9GZEQsRHxPERlb8NWt8s=;
 b=js/2gEJ2HptmEyw3tyJ02DOX7WWRStWhdRaQCmWvbB23w13i6fROJKj/2U/4CMRHlu
 yyLCaPKxizXaqoY+IiK3cmyL75wHwTHC81PQHO3qnNjqmmR60D1hJ1qVvt0Wi5XgGf1t
 Dou8qcZXHVuHkvrHLOllkZEKB7fVe+/HuM26gKUDQzUEcjYUXAMAkw0igwr7uAlKsh0w
 iRS+QkVzH/oueWNQf7do8MVTBlSTODBlv3RGzZTHk/1HgHwkmnf/Tf9hzvPKeISzeHVi
 CF93bNM8B5DwAWtK7ODWqrKYSQ+vaF4YyaSxA82JRP6GZMs551RSKEyw0tynW90Ag4ie
 uViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MLyjO6DTCqYmJjw6lLfP0bK9GZEQsRHxPERlb8NWt8s=;
 b=nEMDUJ81XMMMGhXa7mPUzfvRkTfNL1XkEwgaXXO8VDYSRm5qCI8sdLCrjWgsd58NkJ
 k6Op/159hKGXZtO1gvZ77BznmeWLnsS7HMsH/esvAoTd7y90wDbl3oYio/s5BY2heNlJ
 R2mdcdCGv8BLHlc0Tb13cxv+E6PS53qlaBT8L4VHwgi1MDbMCcnhxBvhH5LuqbNjx8h2
 41cMq2G6CNq0yCSHySJUo5P4K0YI2QIHmB/oWeFKkcjWfsa6KxzfnYeOMiMYy82/hyFu
 zqFJ7adPCCFmoJ+Fh4EOo7JT5mqtZbT91lP5xyAOIhtDgE6xkEG2jL5bZf0TR27f76Gg
 3DZw==
X-Gm-Message-State: AOAM530z3R5WWPLua+LqBMrtVcVxMmURCzLjH0E4TqIaSmkrG0WE0Yvx
 URf3zz+gWE7/+YWXm+f6yOu8eQ==
X-Google-Smtp-Source: ABdhPJz7ift570mDdSFMmj/a/CdApBvxUpTk4Vuy6pZOFy1ABrIxvSMZw2ZbhGFovE+EmcyjgAlemg==
X-Received: by 2002:a05:6402:5188:: with SMTP id
 q8mr36014046edd.173.1643909992551; 
 Thu, 03 Feb 2022 09:39:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c25sm4458093edu.103.2022.02.03.09.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:39:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F2251FFB7;
 Thu,  3 Feb 2022 17:39:51 +0000 (GMT)
References: <20220201101911.97900-1-thuth@redhat.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Date: Thu, 03 Feb 2022 17:39:21 +0000
In-reply-to: <20220201101911.97900-1-thuth@redhat.com>
Message-ID: <87y22rsvbs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Support for CentOS 8 has stopped at the end of 2021, so let's
> switch to the Stream variant instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Re-queued to testing/next, thanks. The existing centos8 image is now
broken and we can fix the naming later.

> ---
>  tests/docker/dockerfiles/centos8.docker | 4 ++--
>  tests/lcitool/refresh                   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index cbb909d02b..cf95cd4b4a 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile centos-8 qemu
> +#  $ lcitool dockerfile centos-stream-8 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>=20=20
> -FROM docker.io/library/centos:8
> +FROM quay.io/centos/centos:stream8
>=20=20
>  RUN dnf update -y && \
>      dnf install 'dnf-command(config-manager)' -y && \
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 033120e223..30196ef3cd 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -77,7 +77,7 @@ ubuntu2004_tsanhack =3D [
>  ]
>=20=20
>  try:
> -   generate_dockerfile("centos8", "centos-8")
> +   generate_dockerfile("centos8", "centos-stream-8")
>     generate_dockerfile("fedora", "fedora-35")
>     generate_dockerfile("ubuntu1804", "ubuntu-1804",
>                         trailer=3D"".join(ubuntu1804_skipssh))


--=20
Alex Benn=C3=A9e

