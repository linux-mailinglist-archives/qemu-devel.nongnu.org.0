Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558C17631E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:48:01 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8q6i-0003zW-7N
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8q5c-0003WB-Kq
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8q5a-0008Kb-Cr
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:46:51 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44723
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8q5Z-0008Ie-0g
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583174807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOgiW1RpaYCbmNnzkWKYkmQxLIJ5yc0wSSwavdZypgM=;
 b=c13Tm42gmCmChuQZAmw5R7duiN8/q81st6NVFVS7pfnsSXv6Mv+pSEiLXeRpD/RBDNVm5z
 De/nztxjet+VU5yWiHBrpi+jvXHs8p1+msrbZkF8P+/vpJ9yIn5LliFvZpBndcny7j3Jka
 vg96Z7ezb+2Fe8gaNeUT2PxZpQuQhWk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Z2wdYonwNCKb_O5tlPzZBQ-1; Mon, 02 Mar 2020 13:46:45 -0500
X-MC-Unique: Z2wdYonwNCKb_O5tlPzZBQ-1
Received: by mail-wr1-f69.google.com with SMTP id m13so102327wrw.3
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4G23sQWUc0ZIkgDa7bP5bU52DLbHTEgEh+S/Mo3+yb4=;
 b=bxbzSof5W2v0sCHQ5x76j3LzXlWU9wU3nbKZ6AfbMPC4mbwquq4p5uqZpYfqOrAepY
 uqkRRCgZam/tFY6qtaqNERXSZzsImNzBP+0A1x1iv/L7Np9XFdYXHcJ1iAan5YJRdUYE
 SE08f3LjS4HOd8muGQl1z3UWau81Nma1LGZpz6H38BNKXBWgYIQuz0r3mBrZ2xkll8Zp
 u11kp+4foR4WRBSS0HJ3asih1hcXlxBUk6h66WZ8jExw97Qjr54wchdRw8lsDcBNQfhG
 2cFWUBLZ0aBCiQYVNBAWs8l7iO8PzJn4MFjgxAKDuRwUO+L5V/LsMhWFO9gTvvSn4BBh
 PAXA==
X-Gm-Message-State: ANhLgQ22PEwIMoGjLMub4p5P+nzg43d5CZa82gghnKyjVoMlkO3HYZ5I
 3fEmI21YB4Vh2t2t4jHReMy9Ds5R4PhU/sBZ8JKYwYawrjc0q/aeVx37quzBibDE+9r5DuvuIR2
 veo5ZIou3aRpdfoo=
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr342450wme.153.1583174803819; 
 Mon, 02 Mar 2020 10:46:43 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv0LEHEtJSy+zw9aEXHv/pyUbqn2MzZ6Edu4WunIc7T5yVaK2DB/RSVNwjqLCPMcwNhX64ZtA==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr342441wme.153.1583174803618; 
 Mon, 02 Mar 2020 10:46:43 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id i7sm460689wma.32.2020.03.02.10.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 10:46:43 -0800 (PST)
Subject: Re: [PATCH v1 06/10] travis: enable tools build on OS X
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200302181907.32110-1-alex.bennee@linaro.org>
 <20200302181907.32110-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <723eeada-15fa-902d-e7ae-56eae7f4246a@redhat.com>
Date: Mon, 2 Mar 2020 19:46:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302181907.32110-7-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/20 7:19 PM, Alex Benn=C3=A9e wrote:
> From: Laurent Vivier <lvivier@redhat.com>
>=20
> As we can build tools on OS X we should check we don't break build
> when we submit new codes.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20200302154630.45620-3-lvivier@redhat.com>
> ---
>   .travis.yml | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index 9867272177d..70a24bf2fc8 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -273,6 +273,7 @@ jobs:
>  =20
>       - name: "OSX Xcode 10.3"
>         env:
> +        - BASE_CONFIG=3D"--disable-docs --enable-tools"
>           - CONFIG=3D"--target-list=3Di386-softmmu,ppc-softmmu,ppc64-soft=
mmu,m68k-softmmu,x86_64-softmmu"
>         os: osx
>         osx_image: xcode10.3
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


