Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C83699D7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 20:39:23 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la0i2-0001X9-H1
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 14:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0gS-00012o-49
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0gM-0000PQ-CG
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/12v71bHt6M87PpxE4ipxjP+HcnjnI2pU9N9aliggSw=;
 b=cBupz2I4oNPC/ydJU5Zx46CNa+xpYQ0smgwmTtJd3Wxnut3KANn5553g4bU9TJVRVOuF2Z
 JYUrndmJzKld2hUyPD1cQIafDBvvc6KJfvLa+qRNZ3Oj+/k1/Ic7ufI+lVcH77++3lcvy2
 pFPFTjU38EBSzGBbEuLqS/PeaHwgG5c=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-lOoLKtYTNWa3j4-U_rvNaw-1; Fri, 23 Apr 2021 14:37:35 -0400
X-MC-Unique: lOoLKtYTNWa3j4-U_rvNaw-1
Received: by mail-vs1-f72.google.com with SMTP id
 l11-20020a67ed0b0000b02901f3823e11e0so8569675vsp.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/12v71bHt6M87PpxE4ipxjP+HcnjnI2pU9N9aliggSw=;
 b=CFE94Sq8/uvmIeLpJPYlUMC1QbCBnTTYouYE+4rggnsznk0R1hCOU7saz6FiT71TQQ
 JBrASicGngfG52MrKoVsLsEQlUFpGItpJ8xsu6QXv/+riF31XUeiIjWhSus/9Giicis7
 g4EG32J/ar6miFYjdkEUUSNnu/awMrwQsniXS8cof2OhMJK2P58zhd1k4T93AWYP4Hix
 vb9ozRrJjNiYKCN6VAj8Vi2dy5TMm5oc163Ub3UYmkcl6Xb7+9XIAnqvEZJ0Vajkkgkc
 jL9+QBjkfj6yT80ThZrfe9ynaHvPkRgTG2SOAVV5PUqBVT77TSbp7GI00eWL0AFlTK8o
 rDiw==
X-Gm-Message-State: AOAM533iFvIuy/uIH2BQ9/TQxIPOJ/hTD1oxJ5keLZc30XEDxucYmasW
 BjV9Glwnrt11CBCx1gHs03q/M+6QAB5LEt5sriCWIxWNj68W37z9wQDPRxgL0tnTgWPMdEqsghP
 +me4AA52pPvudv5weTgnz5aWI8fFHs+s=
X-Received: by 2002:a1f:1f4a:: with SMTP id f71mr5246498vkf.7.1619203055469;
 Fri, 23 Apr 2021 11:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt5g6BGWNB/BFr95dWM8p5aPmPOgEW/f0EPy12P9HvXbCnRA46ezrlAmxOXCSPw2npI1nD7t7mXzzLRZ9uXTg=
X-Received: by 2002:a1f:1f4a:: with SMTP id f71mr5246485vkf.7.1619203055325;
 Fri, 23 Apr 2021 11:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-6-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-6-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 15:37:09 -0300
Message-ID: <CAKJDGDb5jQWpCpTCZcT8Mbovf7EynU5nvuv9pkNfycEAL2S4JA@mail.gmail.com>
Subject: Re: [PATCH v1 05/25] tests/docker: add "fetch" sub-command
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 11:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> This simply wraps up fetching a build from the registry and tagging it
> as the local build.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


