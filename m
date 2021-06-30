Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C723B89EF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 22:56:42 +0200 (CEST)
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyhGD-0006Gx-BP
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 16:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyhEc-0005Gl-6X
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyhEa-0004x8-Ig
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625086499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhV/HdaqBerdLmyKdfEMAHXmGYdOBE4tv9Orojc/IAw=;
 b=jDuAfSYgC8mGwelHUtqdR4ka5gSlDccRf/50K+OfQkRiuKfshbl0GYjkoJaG5gBflJ/6a1
 HEFSWWIp4qg+3YO2XSIWpN42raVE+AhHBpQfDOFPFjzsytydaqskc22LkfRwOgYfA2BrR9
 CIzAzfpCJmwrwRgvcSkelA1HyhYcx4k=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-6nPFjtpCMOiakLEA_IUlng-1; Wed, 30 Jun 2021 16:54:57 -0400
X-MC-Unique: 6nPFjtpCMOiakLEA_IUlng-1
Received: by mail-vs1-f72.google.com with SMTP id
 j12-20020a67e30c0000b02902826cb2208eso1300089vsf.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 13:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UhV/HdaqBerdLmyKdfEMAHXmGYdOBE4tv9Orojc/IAw=;
 b=ZHGGen6wHXj9lZBs+OzGBmfVwYcmv/bFKEZaY6PsfUEJ/88q5SjDqBTMBTLe+ERakp
 h1AeDkvqtoWKcgDYIQf9/KMTvD3kufYJbcDSGONcvc0X2psZocta0FF8Q0dYEqGDXhsp
 4JRMNYvlpwNbcgzY9B0NBrLTkS4FCww2dfFxJ7E8SDwgrubHHix+ghquwmeHc7ppgsjv
 UDkcdd8kl703dX0DzAPOfQ8+p9Tzi80vkIYvMXypcTw00SrsP8jLU2Pu/aCGKXAYT9Y6
 3onO3FTH3ehVW/WmUY/+kNshcq3z5zmjxymTVEQ2w+fw9OHHxMnJKAyQVyIDqlqAcacE
 WlKw==
X-Gm-Message-State: AOAM532jCUN/JWeCwUBnqy40xnD9+zCVvZoN2+dj+GwRI7SuBahG28g1
 nLHv9cv0bT0rt+0Jm/fpZyx3LPDP1rXKLAdSQTpqLRtZR+fEZFLvwRfwZbrPNeL5wqZkaEx2wiA
 QCHXwCUv74XKcWdhpzh7/1TV55RUu0EI=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr29623032vko.19.1625086496710; 
 Wed, 30 Jun 2021 13:54:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzxDUMypIwZGvmHkShiRmARyHaeSOCa8GxNDlSXUpHGyN5gd+Nywo2Qep8yX1ALuQ4dD2N61xl8cll1kcwZmo=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr29623020vko.19.1625086496569; 
 Wed, 30 Jun 2021 13:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-2-berrange@redhat.com>
In-Reply-To: <20210625172211.451010-2-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 17:54:30 -0300
Message-ID: <CAKJDGDZNBHwmCz_1vu75ZhBiXGE9K=h8VkepTJFr6WqjBb9QbA@mail.gmail.com>
Subject: Re: [PATCH 1/3] build: validate that system capstone works before
 using it
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 2:22 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Some versions of capstone have shipped a broken pkg-config file which
> puts the -I path without the trailing '/capstone' suffix. This breaks
> the ability to "#include <capstone.h>". Upstream and most distros have
> fixed this, but a few stragglers remain, notably FreeBSD.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  meson.build | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


