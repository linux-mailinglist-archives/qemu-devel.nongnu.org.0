Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E93896C7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:32:20 +0200 (CEST)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRvX-0007qi-T0
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRd5-0001PI-7a
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRd3-00039h-JX
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByoRaIG8V3FPox0Sf6LiKRa389AQBXwrdd1DXFx0BQo=;
 b=gjjrjkKRUM0slQsRkTZmDOFhFjUB/E37Z9284kriyyg9NMqsICpGQnUATuC95TYvVZdWzf
 btZRjKFzcAz5ODcAYf988q4ah+58xTFnYSb8Cq7YGPm/wSFX54vR+5I65xcIDh3/OJMIip
 NQvaBIC4pqRziNZc0t3v7d/QdTnbTmw=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-HZPJziDYOZ2GOsOPbM1ktg-1; Wed, 19 May 2021 15:13:09 -0400
X-MC-Unique: HZPJziDYOZ2GOsOPbM1ktg-1
Received: by mail-vs1-f70.google.com with SMTP id
 n18-20020a67e0520000b02902351ac5b72bso3278131vsl.15
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ByoRaIG8V3FPox0Sf6LiKRa389AQBXwrdd1DXFx0BQo=;
 b=atAge1/r6QIn9aLPAkw6+n8fFY1uUOGcLg2HezLVuYHZrLhDUHJ9u8mT7N15nllQ6b
 BibQ/mMdZ1QPhy/quU2ijzPcKm8hWdImKxbPG7zrTVGpVNXMzoPN4TBxKH7q33y1gNgM
 O839lPh2KiDjG3Krfp1fh+08gK56pZG2e7ajSt3F7gTEtvYEqrJaBhQHwxdUiz1A41oL
 TvJ7t7znZWh3CQVLlePMUFu78/ouAUucexCcx5YfgrqHJNPyekaIIAaCJxLXG2T6WG8E
 ABtsezmwgidBbP6rWvrVoNuL7FdLKiNl/icwkz0x73NS1U1NTzFAZMaHbuDwg4Qe3g/f
 zlsw==
X-Gm-Message-State: AOAM530nFeFfGNtrdywtDHbgxOW4IpsNsi295pRZLT+tRNcEUUDem9dJ
 lCSYls71xoQiYoNtPOxAcfqUBn8SMsIJjTTh3K2qXFwDKteiXKzg214fy89NDHeDlvaV7jwDNRn
 65hwBhlKjPacVA7nv5CMIgTJJUTUA53o=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr1277182uam.5.1621451589038;
 Wed, 19 May 2021 12:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgkMQnAQOxL9bsCHXeppaoCvzTF5P1m+5pYUpoz0i3sWUutt2Kqcva+rwLk6Wn/OtXQFlflPVrBSnPWOq9EA8=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr1277157uam.5.1621451588875;
 Wed, 19 May 2021 12:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-2-f4bug@amsat.org>
In-Reply-To: <20210519184549.2192728-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:12:42 -0300
Message-ID: <CAKJDGDa6z9Nozt-YyeWtguAd+QNObUZT_z2j8Ta3Ew2h-WuE5A@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] gitlab-ci: Extract &environment_variables template
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 3:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to set the same environment variables to multiple jobs,
> extract what we currently have as a template.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


