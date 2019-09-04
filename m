Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EBA8058
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 12:27:38 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5SVl-0005MN-Sy
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 06:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1i5SUd-0004f1-9T
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 06:26:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1i5SUb-00022k-2K
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 06:26:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1i5SUa-000222-QN
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 06:26:25 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E65CC0568FD
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 10:26:23 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id c13so5648994qtp.21
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 03:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7T9oFRbhnhgsC227Z33IdsPMSutwb42fGTJ6nlX0FCw=;
 b=HKP+z0C+XyeTkjEbWWRisKwK7nL/H3zauksMy7HZjrcSoanoUtw2a/BZ2J7DPvJvzY
 HdSlLcaAi6WtAzwgfoeXOE3VioSoQl1AHUB2/Q57oI5dKSCNwSzvNRPPHQ4Ganx3ubGS
 jR3+XpgnsaBCuiitQrN9/0SS/mHtbwAzKJA3LaGNIoMFbiimeAyCy/FvMEbAXILHDtVR
 +lWqNx0KBROHJw13j+mgc05LLS9rjYVVmB6kwmZ7I3xy8oPRQzvn9Bqy8owl5KTZCn61
 iAQWqVjxUa6JVXtUWggXCYbmmAxHaZxrA7e7wker08vc9WseBBFwpV8eMd5BBPncXver
 0JQQ==
X-Gm-Message-State: APjAAAVzmcBl9rfrKRAGU5OEtAhaZJ8e2JhPsS4WS7qWAt03TqYsseW4
 Ypax9HMJyuWxAwyEzHjCHwOnLe0nheSsfusriLD1BxsmtnU6D23zduz9dTN2ENX4TX/H1UjIchC
 Ify1iN1RjoL5FG8M=
X-Received: by 2002:a37:ef16:: with SMTP id j22mr11711535qkk.198.1567592782592; 
 Wed, 04 Sep 2019 03:26:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2KSQJnLxCjFnVzy6XN1MaQWXj+25mofVbBjZft+HptBlVRLqv2vN9WuqV/GMmRghTVVTBVw==
X-Received: by 2002:a37:ef16:: with SMTP id j22mr11711517qkk.198.1567592782400; 
 Wed, 04 Sep 2019 03:26:22 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id m11sm4696589qki.111.2019.09.04.03.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 03:26:21 -0700 (PDT)
Date: Wed, 4 Sep 2019 06:26:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190904062608-mutt-send-email-mst@kernel.org>
References: <20190820160615.14616-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820160615.14616-1-lvivier@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 0/3] rng-builtin: add an RNG backend
 that uses qemu_guest_getrandom()
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 06:06:12PM +0200, Laurent Vivier wrote:
> Add a new RNG backend using QEMU builtin getrandom function.
> 
> v8: rebase on v4.1
> 
> v7: rebase on master
>     Make rng-builtin asynchronous with QEMUBH (removed existing R-b)
> 
> v6: remove "sysemu/rng-random.h" from virtio-rng.c
>     rebase on qemu_getrandom v8
> 
> v5: PATCH 1 s/linux/Linux/
>     remove superfluous includes from rng-builtin.c
>     don't update rng-random documentation
>     add a patch from Markus to keep the default backend out of VirtIORNGConf
>     move TYPE_RNG_BUILTIN to sysemu/rng.h and remove sysemu/rng-builtin.h

Applied, thanks!

> v4: update PATCH 1 commit message
> 
> v3: Include Kashyap's patch in the series
>     Add a patch to change virtio-rng default backend to rng-builtin
> 
> v2: Update qemu-options.hx
>     describe the new backend and specify virtio-rng uses the
>     rng-random by default
> 
> Laurent Vivier (2):
>   rng-builtin: add an RNG backend that uses qemu_guest_getrandom()
>   virtio-rng: change default backend to rng-builtin
> 
> Markus Armbruster (1):
>   virtio-rng: Keep the default backend out of VirtIORNGConf
> 
>  backends/Makefile.objs         |  2 +-
>  backends/rng-builtin.c         | 77 ++++++++++++++++++++++++++++++++++
>  hw/virtio/virtio-rng.c         | 19 ++++-----
>  include/hw/virtio/virtio-rng.h |  2 -
>  include/sysemu/rng.h           |  2 +
>  qemu-options.hx                |  7 ++++
>  6 files changed, 95 insertions(+), 14 deletions(-)
>  create mode 100644 backends/rng-builtin.c
> 
> -- 
> 2.21.0

