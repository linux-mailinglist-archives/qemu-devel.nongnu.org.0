Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899DD3B48A8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:13:07 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqKA-0007yU-Kp
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqJ3-0007Ju-7z
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqJ1-00007u-Lt
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624644714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqbDVkuLWzG4z0vxoz7PtbFSmb0rh24kLFEWBk1ZjZ4=;
 b=e+bVelsG25+EPAMT+6mysm9c8ChASxCxYHZ4B1l+lY1j02ic7C9NNuThkKu9Hrvp/0Tkb/
 g4Qqh4G23HarCZmO3gV4Q5j3dZ2zWtcYXJu2xijfKsG4cjqQdCOnYbW8TiI+pchVXKWxUi
 VDd86uM/Dao7XVPFwbZnkgKyUfbH6Ps=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-jDOcVAHtOUu1avUZlFQKsQ-1; Fri, 25 Jun 2021 14:11:52 -0400
X-MC-Unique: jDOcVAHtOUu1avUZlFQKsQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 w206-20020a1fadd70000b02901fb33a39f7aso3306873vke.20
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eqbDVkuLWzG4z0vxoz7PtbFSmb0rh24kLFEWBk1ZjZ4=;
 b=CZjBK6JB8+tyauDyFdJbzfrHfDkOz1+a/AR1+JqEfSFbjvwZ3lQ8hatJFbgAZYv7dw
 MGyWj/7jgHedDHKHVYUuYTL/2CZCk6nJ1SKfEiul+kyEItw3Kdps1d6aIOYbjQIQ+88q
 56gau5piuCITQmnTGUGFKmUWZ0uXCP2QWG5zjZX1Z3TCK2tOPIdD+Fq9q3Mr+u2+yB0D
 wdCeKFQK3ZxQzdaIm3dFC5mjl901Xqg3PQRs20Bb6i7fO8fwLtI6XRXsYd7i0hFtiahf
 HPN9S3Vki7zFcjpGg090ddZKzvgskV3oTFU4iETE7npz0coAPKUdo7wX8u5Uk54v934v
 MNUQ==
X-Gm-Message-State: AOAM530zu4KiG/YPHfTIVyqqagFKbjiVXmVi2lMxCDzadk5nOGxX/BIp
 RtFzsx4SiKz0fQEid3ETrb92cyEih1ejMsR1U1nCu94+8gqBQ+kjP2Ib1xglikYPeUF4cEMIS+2
 ZmzVByGbOyR7Rk/ZLBUA4jnqD5yKdd6Q=
X-Received: by 2002:a67:3081:: with SMTP id w123mr10359905vsw.39.1624644712391; 
 Fri, 25 Jun 2021 11:11:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMLYY37uK/k1AzX6TtRs+5hUcVosfjM5MrAUG/cHZuXadUtgfsKgNi/nf7MRjE+bfJD/WmpCWg4foztST5ZAc=
X-Received: by 2002:a67:3081:: with SMTP id w123mr10359884vsw.39.1624644712209; 
 Fri, 25 Jun 2021 11:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-2-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-2-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:11:26 -0300
Message-ID: <CAKJDGDby+1DYTn3RP+1UEj2vdd0pmKS18qVjzAfptqX6f_R5GQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/22] hw/usb/ccid: remove references to NSS
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 11:23 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> The NSS package was previously pre-requisite for building CCID related
> features, however, this became obsolete when the libcacard library was
> spun off to a separate project:
>
>     commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
>     Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>     Date:   Sun Aug 30 11:48:40 2015 +0200
>
>         libcacard: use the standalone project
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .travis.yml                                | 12 ++++++------
>  docs/ccid.txt                              | 15 +++++++--------
>  scripts/coverity-scan/coverity-scan.docker |  1 -
>  tests/docker/dockerfiles/fedora.docker     |  2 +-
>  tests/docker/dockerfiles/ubuntu.docker     |  1 -
>  tests/docker/dockerfiles/ubuntu1804.docker |  1 -
>  tests/docker/dockerfiles/ubuntu2004.docker |  1 -
>  7 files changed, 14 insertions(+), 19 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


