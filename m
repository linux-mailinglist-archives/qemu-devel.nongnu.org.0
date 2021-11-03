Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A7444664
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:58:04 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJaN-0001ZX-Q8
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJYT-0000lv-9s
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJYQ-0007mV-9L
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635958559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ivVZ6aaB8vGnfpT2bNCTTaclEN1gWiQLKM1qLxh0e4E=;
 b=HTIkl2nZQCnf5McI50zgteCA9vgjm+XgOkQtJluOWcYccTnKJIOuEnYF2U7WaY4FKXmMym
 PXz1m09MLJ7ihDR9zAMdScpeM9KhimB4umDuMXZbSezrn33i4gBkzskIDFdU84xP8LBUP5
 /H54NPfgnOEjSE38K4WPpMpkQF6xk/4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-ssD4Oo7UOC2mid9tBAGBFg-1; Wed, 03 Nov 2021 12:55:58 -0400
X-MC-Unique: ssD4Oo7UOC2mid9tBAGBFg-1
Received: by mail-pf1-f199.google.com with SMTP id
 v62-20020a627a41000000b00492638b8ebfso1458544pfc.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivVZ6aaB8vGnfpT2bNCTTaclEN1gWiQLKM1qLxh0e4E=;
 b=DZMAlzMGtvdftqFDDkYiGkt6SC4Z+KUeNxpkMRX5LH0+Lzf2e8sCEEasMpAPMFCMq5
 H8LGzyZlAfoMNKJU2m+m4x+AMMHnyCMd3HxuQEgWgKoI0RY9e5fh96aI+0nP777clQkA
 PB3K6MAy+j0q72wSb5w/EKRb68Qjqldln+aTGLg4Mu3t/SEjLy4yBlFNQ/85ggo9YCn/
 yyGZncc2ZwR67swDttckFZjwcVU9zSQSA1HDO7Jp/N+VJwAafXaPPDxMO4tfOjmrjDCn
 amOJzWq+Nt79XPKt6IUV8mXBwhzTLVH8Jiu/qyCHYVG45j/IihTUo4nUB3X6zsMKZMNg
 r62w==
X-Gm-Message-State: AOAM532QqUgnUN0SqBnkOcaPWhYjH+9zyQ7t7z5KKV97SftF/5cBIg99
 rjxIy3YIzsjrkrbX28IHDiEwhcWyVYBkPVpm9U2+Pym2K3cPvjHM9q6S2P2p1fC4h80ceaOJGFV
 kPUY3v4HCDzOsyzdOcXZNi+wl9VALlM4=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr16168863pjb.10.1635958557303; 
 Wed, 03 Nov 2021 09:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUJflwtG+QLaLn0aZ8nokYTEjUv+qiTAwKWfDn64vh+vCBvlcKQ+cmkXBob1XiyZ/PWCb39zLX+GHStHWRBHI=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr16168840pjb.10.1635958557060; 
 Wed, 03 Nov 2021 09:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-4-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-4-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Nov 2021 13:55:30 -0300
Message-ID: <CAKJDGDbXtu6Vw_vsEiM=sTvYnGQ1wpFrAnfdNupJ0KihTD42FQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] docker: update fedora container to Fedora 34
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 11:50 AM John Snow <jsnow@redhat.com> wrote:
>
> Fedora 33 will be EOL 2021-11-23, before QEMU 6.2 will release. Upgrade
> the version we're testing as our minimum now.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


