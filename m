Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0F364818
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:19:40 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWcd-0001Tj-OC
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:19:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWbQ-0000gf-68
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWbN-0007bC-Rn
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618849101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Subzume6O2uKTAm8d0PUroSTBs7N2OFBfcUDNkDvLg=;
 b=NwUHEi2a/5i50R2k0uj+YiWm/ZRROP+Nrsk3uDjIYGtz0nmbNPhbSH9FoLPcZKmt3jtawp
 U6PKrkz2JF/lte6FX+LGQVH56I9KJsCj2IWEV1YhZbnrAHNFs79OAiie+ZQBATgJIIzlpH
 MVLxGMQLWwEYXzTdSr1vn+bq5R4sGEA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-n5b-gqElPLie8z2RLHsyHQ-1; Mon, 19 Apr 2021 12:18:19 -0400
X-MC-Unique: n5b-gqElPLie8z2RLHsyHQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 a24-20020a67ca980000b02902078c4153f6so3844413vsl.16
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Subzume6O2uKTAm8d0PUroSTBs7N2OFBfcUDNkDvLg=;
 b=au0+L/EMCH6GxZfKGZwoJNSl/90TITIR750yhis4Gp2Wg426jcH11wP/ChlwQp4e8Z
 JSmezI/WkzO9dGqTkK28O5sjzph+d2wj25GedHxBxQLzoERT4XaoBLffWeRJeS5UnIJE
 TPHoMeVDkf7q+n6TCXT4fX7dFgAPiLzVh7ac9vI0AWkgLNTLR1pEJzUxOrU1XljYHM+/
 ZOq+hLVZWuBlsjXlh5ptaH6aesX7nYQCqXVFdI6X8rXwsw2vDHI9hrjZsaV/piwszlLA
 PvOvE2YV/btzU1QauR/H+gBJp1B//WN/ar2TZFSZ3nxMDxXgIGZWY8AJOYlI/aSndqVK
 fEmg==
X-Gm-Message-State: AOAM532G79dhsgV2qPbTEbCjTjMNzWua17ki8Nk5S6H6Ruxah5+DSQm9
 aSQyHZwokIa7co/nYtdQVEz7AIUbF8YnVXlU1XffMS0Hrao/iA+OnxgHyO5eKmhOCK5qmtvNkwY
 M4J7Use+xiwJuqEZSo0WdiNmWEJgq8zY=
X-Received: by 2002:ab0:3750:: with SMTP id i16mr7585811uat.113.1618849098544; 
 Mon, 19 Apr 2021 09:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNiO5YNT5ZppplkLLIM0PqfjjETaA6VwhVWM6E9YAtWUY9Ab8a+XCCsWKqCC0e1PAKurIcSjGRRTMvYjx6ZTI=
X-Received: by 2002:ab0:3750:: with SMTP id i16mr7585792uat.113.1618849098418; 
 Mon, 19 Apr 2021 09:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-2-crosa@redhat.com>
In-Reply-To: <20210414221457.1653745-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 19 Apr 2021 13:17:52 -0300
Message-ID: <CAKJDGDbrWf0gJt+589BLCryoyirb7cdXMLc4k5UMkh3K4N92yQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Acceptance Tests: rename attribute holding the distro
 image checksum
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
> This renames the attribute that holds the checksum for the image Linux
> distribution image used.
>
> The current name of the attribute is not very descriptive.  Also, in
> preparation for making the distribution used configurable, which will
> add distro related parameters, attributes and tags, let's make the
> naming of those more uniform.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 ++--
>  tests/acceptance/boot_linux.py            | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


