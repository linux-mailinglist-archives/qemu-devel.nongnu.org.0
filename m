Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A7645322F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:28:38 +0100 (CET)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxZl-00071e-50
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxXL-00051c-EM
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:26:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxXJ-0000pA-Ka
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637065563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8k1WdqJw6ikURBWShdTsa/R4SO0t+9GAtLNRHR9Cjiw=;
 b=EWUzYI/Ph+RIxGrHbDrVoAZZylX9474nYnR8mo3gvuCD5U5sZDr3jyeSbKWuwwyO65d6Tf
 MrBUzu4UfqUcemJxDzCbjvZqoWQeUyawhvzqCuJk5uwSSyBqY2lCVmkW7leGYajkgYgLq8
 cEzqUUayXCAG/EJeBUKmRhghzCSDvkw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-0Gdeyl0WMKiluF36xvUZMg-1; Tue, 16 Nov 2021 07:26:02 -0500
X-MC-Unique: 0Gdeyl0WMKiluF36xvUZMg-1
Received: by mail-pj1-f72.google.com with SMTP id
 lt10-20020a17090b354a00b001a649326aedso1213126pjb.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8k1WdqJw6ikURBWShdTsa/R4SO0t+9GAtLNRHR9Cjiw=;
 b=g4N/AC9U53qodo40oIatQu3LxpzSDaQ4o6b+RELmueuvA6Om4MnJB9uyEI9lNtB1df
 7OmqxZiz5082MtQYSM9J0GELc5x2VkMKWcSgKvdhnR03MfjtzI7yJR6tJ67nLjoE6P1q
 IE2bWxmw+KPU2GqJOB/8TlEMm8Onahip3+CcLn0oBgYe+S09HRPQKVCgVKVbK5W2WkU/
 2MlfIGiGY9FNs2EsXrJMVHao9PYhb0l8m9Mjz+eAhs/dUERA4FEe6ydw6Mhn2p4v+1rl
 vZEllOgyXwregBahKRye/Hfv1STSnPOkAUA8Y2tvn1k2iH4KPodbvNeWdfv3DvyIXzrb
 M/OA==
X-Gm-Message-State: AOAM531pEza9Bq/aaSojKUEz7/9QNipM/duyuOpcQ1pDxyi24F881DgG
 P9mKuNGc4j6YFI01cP2OeiP9AZOukYvysyqy1mM6WDCdETtZG63h54RmVeeYyRCR85fBDADGunK
 AR5nPGUZ8XNFeD7N7DVu08zhaqNqUYrM=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr8307221pjb.10.1637065561253; 
 Tue, 16 Nov 2021 04:26:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdVkV5O6bAt0FL9ldAILrvbmpPIO3j+LGiE7I9P3+t3mwsHlxEtY4VQP9KezeiTNzuyJiaseL+LiEyqbiJCOI=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr8307180pjb.10.1637065561000; 
 Tue, 16 Nov 2021 04:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-7-alex.bennee@linaro.org>
In-Reply-To: <20211115142915.3797652-7-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Nov 2021 09:25:34 -0300
Message-ID: <CAKJDGDYdGCYCRuPCpvjbF64twwAAM1gQM0T=4wqzxbCCwMLHFQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] gitlab-ci: Split custom-runners.yml in one file
 per runner
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 11:29 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> To ease maintenance, add the custom-runners/ directory and
> split custom-runners.yml in 3 files, all included by the
> current custom-runners.yml:
>  - ubuntu-18.04-s390x.yml
>  - ubuntu-20.04-aarch64.yml
>  - centos-stream-8-x86_64.yml
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20211115095608.2436223-1-philmd@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
>  .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
>  .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
>  .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
>  4 files changed, 268 insertions(+), 264 deletions(-)
>  create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.ym=
l
>  create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
>  create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


