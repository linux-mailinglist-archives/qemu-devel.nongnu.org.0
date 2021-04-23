Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49763699F1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 20:43:29 +0200 (CEST)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la0m0-0005qQ-Nc
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 14:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0l2-0005QS-Ig
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0l0-0003FB-Gp
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOKN3eZ6yYI6jr4VD0jVO8JzrtTu177J+EC8aSBZ7OQ=;
 b=dSdrjnjtTeclbwi1vNX5tZS01Nz4NPf4TrZjZ8liNr1FoXnUwo47eucYdBJxWOUOFzvySD
 9tgW5qvbiioPcXF7VIbGPpsNWJHiLF+lV/t3G3IFWvHoDbZEndDlyunc30cDfiqrl2BrMl
 D2wgiieI551L5hPivkSALxLAnoJELzs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-NZWRkjBfOEWFEhqLe8PJfg-1; Fri, 23 Apr 2021 14:42:22 -0400
X-MC-Unique: NZWRkjBfOEWFEhqLe8PJfg-1
Received: by mail-vk1-f198.google.com with SMTP id
 r68-20020a1f8f470000b02901da0222892aso8543763vkd.16
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zOKN3eZ6yYI6jr4VD0jVO8JzrtTu177J+EC8aSBZ7OQ=;
 b=S/FERpP/a6jv9+v7DVRGj6IILQOYhRKJ7XWFe32Tz78gxW2D+fftCw2cog+jbqwyYk
 3/oWwswmS4R0RvNhdnSTgbcCtBv2qVrkU/v7hvsUp4/9HFbkqy9/0biVnandUpMu12Vk
 Oeer1FLJEPKA1tEXEb8zdHF8LaDQ3ce1+LW3eNRLz6lW6PWzedJ61rV2Cq1wMbzBv7Tk
 V0WhqfXFXjHvYGYWVJ6cPKtTGV8gVvEx4Lg179haKkQCS7kfJgGLPAMsi6DXmHuO3kDq
 8UYRVZFYXSHgw0riIKWI9LIcirbUK6zGXOucE472aMxP2BAURmVEgVAV1XujYDzJ72UA
 mjvA==
X-Gm-Message-State: AOAM533eAYAFDxBQE+8kAzgwJq4e6ibVUozqMc361yQEMA1claBbNDmy
 /F5LbKJNFodDWg1c+PFPvMg8ZEuzXXFMaVCrkuJIXIgEl7wZ6FXLI6+KgGMFf734iAQb5MNdyO9
 IKULmW4DWkbsXFTx/7P6S1sFZ1IXZXyg=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr5288402vsg.45.1619203341503; 
 Fri, 23 Apr 2021 11:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIuBxJPPlKnr4fyj1kCDHatp5GG1KAR59kv14cjX86QTMi0SdnTUFJfIDasJd2g32x0sLeYRIE84fsOUmkv2w=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr5288393vsg.45.1619203341311; 
 Fri, 23 Apr 2021 11:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-7-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-7-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 15:41:55 -0300
Message-ID: <CAKJDGDZEUXqNr2zpaQj4az0Sf9vm6SibxONGo4OahZbxj6KRxQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/25] docker: Add Hexagon image
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Fam Zheng <fam@euphon.net>, Alessandro Di Federico <ale@rev.ng>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 11:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> From: Alessandro Di Federico <ale@rev.ng>
>
> This image is a little special because it takes a long time to build.
> As such most users don't want to be doing that and just pull random
> binaries from the ether as intended by the container gods. This
> involves someone with credentials and a beefy machine running:
>
>   make docker-image-debian-hexagon-cross V=3D1 NOCACHE=3D1 J=3D30
>   docker tag qemu/debian-hexagon-cross registry.gitlab.com/qemu-project/q=
emu/qemu/debian-hexagon-cross
>   docker push registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-c=
ross
>
> With a suitable binary in the "cloud" a normal user will run:
>
>   make docker-image-debian-hexagon-cross
>
> or have it run for them through the dependency mechanism of our
> over-engineered makefiles and get the binary they wanted. There are a
> few wrinkles of course including needing to tweak the final image to
> have the credentials of the user so we can actually do our cross
> compiles.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Alessandro Di Federico <ale@rev.ng>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Brian Cain <bcain@quicinc.com>
>
> ---
> vAJB:
>   - dropped all r-b/sob due to rewrite
>   - split into a multi-stage dockerfile
>   - make dockerfile standalone
>   - play fugly make games
> v2
>   - update LLVM version per BN7PR02MB4194DF5752EF3BADE858018DB8799@BN7PR0=
2MB4194.namprd02.prod.outlook.com
> ---
>  MAINTAINERS                                   |   2 +
>  tests/docker/Makefile.include                 |  22 +++
>  .../dockerfiles/debian-hexagon-cross.docker   |  44 ++++++
>  .../build-toolchain.sh                        | 141 ++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
>  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.=
d/build-toolchain.sh
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


