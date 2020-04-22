Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C41B4BF7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 19:41:48 +0200 (CEST)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRJNb-0000oz-Kq
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 13:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRJLr-0000C4-Py
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 13:40:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRJLq-0001wV-Tm
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 13:39:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33666
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRJLq-0001vV-Ev
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 13:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587577197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKbhyEfPb2BHufzJnx33FhfH1c8NEA9JglNDpbyXX5w=;
 b=CtjGMFTpesqOsvHXKoSZdinaAvv0RgnZ9UZZE6M73S1AcUEb/VHVB6vbts2Wsdn+439AhH
 K/FsB0z+RV7gtVsBSL1MfdKhrGAgcM4MxG4TT+/Iu2nlWoWzg5JFe5Yt9Rgm+WDG4jKwnd
 kipe0WFiGMbmftTA8WhzllCDiPIdCqw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-x5lupnbnNKSWh6iyR04tWw-1; Wed, 22 Apr 2020 13:39:55 -0400
X-MC-Unique: x5lupnbnNKSWh6iyR04tWw-1
Received: by mail-wr1-f70.google.com with SMTP id y10so1426451wrn.5
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 10:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I53P72p67U6lBUBtYLiDh/mPOaYg7Cyq0la4t5pSmNc=;
 b=OGIU6NKkYurBCnygdMUknxv8XAF20eOpRmjxALw+VtHMab7MzKWqmasuXXeHnHKZKe
 Njdqbs1hFQS16tgkuefZ7R4QxqRlPm+TwEl6k4Y12+Mp7UY4LdJ7EYUyZYiZEvb5Sem2
 TKeRtT2eUgIx/b7zjxKm7GSdiPYikgFtsuUuQpoQP3o9mro70NU/a7o8mkcJGdAciO2M
 7bCHga5LCkcknaWsn02PpHwwOC9egMx56+5Uhwswl1vTudmiFkD+40RQmVOidJzKNzxw
 FD2UOiAX1lyl0e2T16KUij+dogcRUGzl9H0eUZH0XMzv/gEZ2GhGrP+fkTb1UZdDmpL4
 RIXQ==
X-Gm-Message-State: AGi0PuYDsvFnrrh6AXsT4r4di5ATKO4PIvAcrbCXNO9Iy45b8A25PY81
 ngsEaKL5xq/siaQoxDgPMO2PAv6ZfaheyqQXszhN39QU+TVyQSTCrA47eAza52hci+n3fn8XI/C
 ImhaE2VF5f/2gohA=
X-Received: by 2002:a05:600c:295a:: with SMTP id
 n26mr12887105wmd.16.1587577193822; 
 Wed, 22 Apr 2020 10:39:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypKGPTg+zyerUHCsaNr8zxMNnuYnvQjlWC75sXwy74xRO6KfMiPGLJiM28PhEUtiltTaxeq5Ug==
X-Received: by 2002:a05:600c:295a:: with SMTP id
 n26mr12887091wmd.16.1587577193635; 
 Wed, 22 Apr 2020 10:39:53 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id m1sm9182366wro.64.2020.04.22.10.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 10:39:53 -0700 (PDT)
Subject: Re: [PATCH 1/8] docker.py/build: support -t and -f arguments
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200422172351.26583-1-pbonzini@redhat.com>
 <20200422172351.26583-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <287d2eff-68e3-fc8e-d34a-cd1fef734755@redhat.com>
Date: Wed, 22 Apr 2020 19:39:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422172351.26583-2-pbonzini@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/20 7:23 PM, Paolo Bonzini wrote:
> The docker.py command line is subtly different from docker and podman's,
> in that the tag and Dockerfile are passed via positional arguments.
> Remove this gratuitous difference and just parse -f and -t.
>=20
> -f was previously used by --extra-files, only keep the long option.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/docker/Makefile.include | 2 +-
>   tests/docker/docker.py        | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
> index 43a8678688..262704663f 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -55,7 +55,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   else
>   docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   =09$(call quiet-command,\
> -=09=09$(DOCKER_SCRIPT) build qemu:$* $< \
> +=09=09$(DOCKER_SCRIPT) build -t qemu:$* -f $< \
>   =09=09$(if $V,,--quiet) $(if $(NOCACHE),--no-cache) \
>   =09=09$(if $(NOUSER),,--add-current-user) \
>   =09=09$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))\
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index d8268c1111..ad61747bae 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -391,16 +391,16 @@ class BuildCommand(SubCommand):
>                               help=3D"""Specify a binary that will be cop=
ied to the
>                               container together with all its dependent
>                               libraries""")
> -        parser.add_argument("--extra-files", "-f", nargs=3D'*',
> +        parser.add_argument("--extra-files", nargs=3D'*',
>                               help=3D"""Specify files that will be copied=
 in the
>                               Docker image, fulfilling the ADD directive =
from the
>                               Dockerfile""")
>           parser.add_argument("--add-current-user", "-u", dest=3D"user",
>                               action=3D"store_true",
>                               help=3D"Add the current user to image's pas=
swd")
> -        parser.add_argument("tag",
> +        parser.add_argument("-t", dest=3D"tag",
>                               help=3D"Image Tag")
> -        parser.add_argument("dockerfile",
> +        parser.add_argument("-f", dest=3D"dockerfile",
>                               help=3D"Dockerfile name")
>  =20
>       def run(self, args, argv):
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


