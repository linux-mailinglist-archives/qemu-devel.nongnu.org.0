Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD937B06F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:02:03 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZVy-0004c6-Gm
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZU4-0002qo-BU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZU2-0008Fw-G9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU3fD1BJEcCAPT5lFUd0vDJveqJPLbuvvFVFvtvuxIc=;
 b=i4B7tc0W4X+HrkX0psLaeEI1k8S1qBeaBfttFsXh/zc0nimElVf0/NTe4d4FzLeNvdbH9M
 jeM/8LvvzjcIINupM2MoOM29a+i2eNrU6MLJqgfcIWbBFt+AV+L/arJU4KZ084E0R0jgMP
 DC0LYLVlCcoUApqBn5Q88imK4Su3/bk=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-fCUveHWdP4a0h0DF80hzQQ-1; Tue, 11 May 2021 16:59:59 -0400
X-MC-Unique: fCUveHWdP4a0h0DF80hzQQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 f20-20020a67d8940000b029022a675e6e86so6959266vsj.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZU3fD1BJEcCAPT5lFUd0vDJveqJPLbuvvFVFvtvuxIc=;
 b=VtG8iL5Cx5EryVdlYIFbm9rRMwN/RMS/KcCGMVGGndYbPYUFfh65ut4ra1Rk8a1QPO
 j3qakx4z+A8/6O1zVZlZa2EKt9o6gZFztf/3DI+tZuiyLXhSK1BIBBMy8QJTQe9QmzOv
 bH6dZMJE9xj5M4u1oEl8/ht/1NYYXonzo+y0SN2c7E+W8Erf7CgHdfYxyzI5XnEQTVfa
 GXGThRBc1CnsJLwhp+O77SvXDQCUlTNbgZmfHy8yvjmPRsTGWm/QYOpRd3Dx4RSnLEPQ
 jsvD2zXLI1+lS/TZF/gTApNWxDOVXf9vuwvdj/m8aNBS7iMA/QDVUD5yLJIhE5O/j8e5
 hqFQ==
X-Gm-Message-State: AOAM530wPggD7BNebmjMy29ifWVFGefYpmNKIPUYhHWkcc5oQMAIL7V/
 wqY8PYh3DcPParBeBtm+TpeUGKN9bJFg1K6NMja19mbNr4/eon5MKSYbbFvODFXHUZR9LNHW2hH
 kyiolD/Wc3Q9TV8u5mSzsrSWXutgMQkk=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28381894vsg.45.1620766798774; 
 Tue, 11 May 2021 13:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQQQsQdHA8lk8rrY0l3T8kphEC+P9b4eTPKtNu+nKiDchmArDbrIHv40QLjfwOrUeVmzc8PGEogu3ySwYIlro=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr28381876vsg.45.1620766798559; 
 Tue, 11 May 2021 13:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-7-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-7-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:59:32 -0300
Message-ID: <CAKJDGDYsDv66pLr_zEadFCMXhJh8OH9du6gj0-unB1aGyOFq3w@mail.gmail.com>
Subject: Re: [PATCH 06/12] crypto: bump min gnutls to 3.5.8,
 dropping RHEL-7 support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gnutls version
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 3.6.14
>      Debian Stretch: 3.5.8
>       Debian Buster: 3.6.7
>  openSUSE Leap 15.2: 3.6.7
>    Ubuntu LTS 18.04: 3.5.18
>    Ubuntu LTS 20.04: 3.6.13
>             FreeBSD: 3.6.15
>           Fedora 33: 3.6.16
>           Fedora 34: 3.7.1
>             OpenBSD: 3.6.15
>      macOS HomeBrew: 3.6.15
>
> Debian Stretch has the oldest version and so 1.7.6 is the new minimum.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.yml | 15 ---------------
>  configure      |  2 +-
>  2 files changed, 1 insertion(+), 16 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


