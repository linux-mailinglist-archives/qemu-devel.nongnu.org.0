Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EC3B89F3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 23:02:52 +0200 (CEST)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyhMA-0000gg-KB
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 17:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyhJg-0007T1-F9
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 17:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyhJe-0008K4-HD
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 17:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625086813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IpPic7AiBCmtqEEBHA6P4bDlmRs+h6Vet9L5+KjQSPI=;
 b=AzRUiEtsP3JrkuPgvfJluTUEtrKetSOeHl64HO24PMCLxCbPwGHiFJKYcA+J8XMHzTnxyy
 lmzx4lBOvxqTWL6HeXjy4DzZdtfWr4EVjUM2K+watk0edkhDOW58vOKz3gFmHSf86Cby5B
 GfVeQtS3nt+yya8eiOonW5j6TGfPPnY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-dxvZz9zZNl-J5Z8ipTIwvA-1; Wed, 30 Jun 2021 17:00:11 -0400
X-MC-Unique: dxvZz9zZNl-J5Z8ipTIwvA-1
Received: by mail-vk1-f199.google.com with SMTP id
 s1-20020a1ff4010000b029024e2e9504e3so855200vkh.16
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 14:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpPic7AiBCmtqEEBHA6P4bDlmRs+h6Vet9L5+KjQSPI=;
 b=LKclRiyYQiRN67ri7XO5P1bdg7lUoEOeYwQ3x+Ka0aOH9dLNyc0vahq+7f2xzdwIv8
 DDSQaz3ZMDDPna+6Q8HcBpddfc2xyMI7/Knc2Ni+z+jW1qk1Tl+h91IIUxfntEH8UnKQ
 pGsHGK1mOxLtmR9Vkd/NKm3T4h2s9UdwN0YrTUeEVnp99Yx/7rsp9D5eG0lqqBHIiwBT
 XwTOjJLcRtAK/3MRCalS+GeZ64KtzMyPuTlY7H5ePsgZ319K0F6L0VDv6dodWNnDIAxE
 HAHDUw/6JT0WY6CaL4eCW4L7+KKlIjWU3pIGnwHKhDL61udZmDXvvZvKe3B7IOCmwVRu
 yriQ==
X-Gm-Message-State: AOAM5326aTM+nU6dvKmTVtWZuqx9rlLoGSoFS1/32TWb56kH6fu7qFKQ
 CYLjsaOvLaCMfjuTRwbQlFr7VqqkvTbSbLXuZpiMubvQhiI9uAIXTaF7e6YqRueGMQaHlDaXD5R
 zrVjoYzmiK64ydjPakdZxrh1xJQvmpnY=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr33611083vsq.45.1625086811423; 
 Wed, 30 Jun 2021 14:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlOn5hEPNHefaWT6RHaTyDkIxUdf8Ulf1fJY23aCxw30Y74s48j8TfJ24dopR/3/llqa53JhXsIMLn4W34Le8=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr33611070vsq.45.1625086811290; 
 Wed, 30 Jun 2021 14:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630184546.456582-1-wainersm@redhat.com>
In-Reply-To: <20210630184546.456582-1-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 17:59:45 -0300
Message-ID: <CAKJDGDYv5xo+qCBcksAfMXx1b5i5hkc9NDcyzSNfkgbmYE996Q@mail.gmail.com>
Subject: Re: [PATCH] python: Configure tox to skip missing interpreters
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa Junior <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 3:46 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Currently tox tests against the installed interpreters, however if any
> supported interpreter is absent then it will return fail. It seems not
> reasonable to expect developers to have all supported interpreters
> installed on their systems. Luckily tox can be configured to skip
> missing interpreters.
>
> This changed the tox setup so that missing interpreters are skipped by
> default. On the CI, however, we still want to enforce it tests
> against all supported. This way on CI the
> --skip-missing-interpreters=false option is passed to tox.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
> Tested locally with `make check-tox` and where I only Python 3.6 and 3.9
> installed.
> Tested on CI: https://gitlab.com/wainersm/qemu/-/jobs/1390010988
> Still on CI, but I deliberately removed Python 3.8: https://gitlab.com/wainersm/qemu/-/jobs/1390046531
>
>  .gitlab-ci.d/static_checks.yml | 1 +
>  python/Makefile                | 5 ++++-
>  python/setup.cfg               | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>

Seems reasonable.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


