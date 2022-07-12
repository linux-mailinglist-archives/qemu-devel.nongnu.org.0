Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF75723D7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:53:24 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBL0c-0007Ot-U3
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBKit-0003jx-SB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBKiq-0002Lh-JL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657650898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9KtC5++CFqiI2pcEzbnMMNEziUtuHVWvQ/a+dpw8C5c=;
 b=UYcu7IWmcFhOUpTOK3KM4tGaYx6x9lFxqwk7OBfInk7sYgoFKZby/ehwWyHeGwmzuKmAvN
 i9spRM7gdDD1yGAlLjRLkQJfPXGcmYbHWTc3Evu4FzzOBMzk8zHBbZZJ4y6SFToRdVw16J
 trT71EGo1cDh+0/Wt1wXYhu+1aWIPSQ=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-f-zAjyIFP_Gn_uH3czKgDQ-1; Tue, 12 Jul 2022 14:34:57 -0400
X-MC-Unique: f-zAjyIFP_Gn_uH3czKgDQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 r1-20020a9f2c01000000b00383196b2690so2392829uaj.18
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 11:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KtC5++CFqiI2pcEzbnMMNEziUtuHVWvQ/a+dpw8C5c=;
 b=zy8RFHmfQhla8d/1gi2bBMvOKI7blxACj87vM5gMqqPzPk7Ml6U6PamZr2fd43mP5q
 eqz63XNknZWThC14s56y8/fcD0D0o3ZoRs4WIE2VdEy/Rcn5vRiyp00KIJh6pB1kM1Gt
 UBUD8l2S+tlbiK3mMIIl+mRsIj3xJ5vLIUPxmq/3uaZtLLmhlNYkQ7pXjUUkTw6q19w3
 yDfGRUT2MwbYEH59hovU5Em8sUn5PWr/MfCbV49wzPYLGgbu80Vju5FdH8LZByw6PkHO
 oOP/1O5IiC77cREzzFapDsoDMOd3VzZpE0ta45I1u14K2FysY5Bfg6TNEjJpq92Kgwbg
 QVsg==
X-Gm-Message-State: AJIora8NJM4JZUNsJoVtqjhYl6Xjq51AbMk8U9xO5NFxz4G62Zr8ReMP
 4tZRykf+56DXqfBJjXMRxkBFYLsTz/c8R/KwzNQa3GMqPulZl9xQ0XA2zXRWPGiwVy3o8nW9o6X
 e7/hjUnwqw4IjnytNfhLK3S7IlSPNyX8=
X-Received: by 2002:a1f:2c11:0:b0:374:dd20:2e67 with SMTP id
 s17-20020a1f2c11000000b00374dd202e67mr2908240vks.3.1657650897027; 
 Tue, 12 Jul 2022 11:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQNSufxNhJR9Cqu5uiGjyalcpud79wCfdLX2rCN99JOcYJ8Qj9CqWS64bdlHSseDDJ7ACKIjhJumRRYL8G/Hk=
X-Received: by 2002:a1f:2c11:0:b0:374:dd20:2e67 with SMTP id
 s17-20020a1f2c11000000b00374dd202e67mr2908221vks.3.1657650896787; Tue, 12 Jul
 2022 11:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220708153503.18864-1-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 12 Jul 2022 14:34:46 -0400
Message-ID: <CAFn=p-aYePW6GKPqTgPYUR-b3__uoSa=dLqX3wbQu3jp3Jdd=A@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Improve reliability of VM tests
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 8, 2022 at 11:35 AM John Snow <jsnow@redhat.com> wrote:
>
> Note: patches 10-12 are included for testing simplicity, they shouldn't
> be merged. They will be included in a forthcoming block PR.

Patches 1-9 are fully reviewed. Whose tree should this go in?

>
> V4:
>
> - Addressed concern by Marc-Andre in patch 01.
> - Squashed Ubuntu patches (rth)
>
> This patch series attempts to improve the reliability of several of the
> VM test targets. In particular, both CentOS 8 tests are non-functional
> because CentOS 8 was EOL at the beginning of this calendar year, with
> repositories and mirrors going offline.
>
> I also remove the ubuntu.i386 test because we no longer support Ubuntu
> 18.04 nor do we have explicit need of an i386 build test.
>
> After this series, I am able to successfully run every VM target on an
> x86_64 host, except:
>
> - ubuntu.aarch64: Hangs often during testing, see below.
> - centos.aarch64: Hangs often during testing, see below.
> - haiku.x86_64: Build failures not addressed by this series, see
>   https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02103.html
>
> The unit tests that I see fail most often under aarch64 are:
>
> - virtio-net-failover: Seems to like to hang on openbsd
> - migration-test: Tends to hang under aarch64 tcg
>
> Future work (next version? next series?);
>
> - Try to get centos.aarch64 working reliably under TCG
> - Upgrade ubuntu.aarch64 to 20.04 after fixing centos.aarch64
> - Fix the Haiku build test, if possible.
> - Ensure I can reliably run and pass "make vm-build-all".
>   (Remove VMs from this recipe if necessary.)
>
> John Snow (11):
>   qga: treat get-guest-fsinfo as "best effort"
>   tests/vm: use 'cp' instead of 'ln' for temporary vm images
>   tests/vm: switch CentOS 8 to CentOS 8 Stream
>   tests/vm: switch centos.aarch64 to CentOS 8 Stream
>   tests/vm: upgrade Ubuntu 18.04 VM to 20.04
>   tests/vm: remove ubuntu.i386 VM test
>   tests/vm: remove duplicate 'centos' VM test
>   tests/vm: add 1GB extra memory per core
>   tests/vm: Remove docker cross-compile test from CentOS VM
>   tests/qemu-iotests: hotfix for 307, 223 output
>   tests/qemu-iotests: skip 108 when FUSE is not loaded
>
> Vladimir Sementsov-Ogievskiy (1):
>   iotests: fix copy-before-write for macOS and FreeBSD
>
>  qga/commands-posix.c                       |  10 +-
>  tests/qemu-iotests/108                     |   5 +
>  tests/qemu-iotests/223.out                 |   4 +-
>  tests/qemu-iotests/307.out                 |   4 +-
>  tests/qemu-iotests/tests/copy-before-write |   5 +
>  tests/vm/Makefile.include                  |   5 +-
>  tests/vm/basevm.py                         |   5 +
>  tests/vm/centos                            |   9 +-
>  tests/vm/centos.aarch64                    | 174 +++------------------
>  tests/vm/ubuntu.aarch64                    |  10 +-
>  tests/vm/ubuntu.i386                       |  40 -----
>  11 files changed, 65 insertions(+), 206 deletions(-)
>  delete mode 100755 tests/vm/ubuntu.i386
>
> --
> 2.34.3
>
>


