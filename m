Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE6FCBD0C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 16:24:51 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGOVm-0007Qa-52
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGOUc-0006p8-It
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 10:23:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGOUb-00078Q-B1
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 10:23:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40259)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iGOUb-00075A-5t
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 10:23:37 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72E737FDF5
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 14:23:35 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id o8so2729806wmc.2
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 07:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gnOGEM4gMwlGtsyvriy4yvuvnTYGWpJmvfvasi9DwYk=;
 b=sjvnxrndh+cvj6t8q5WpgYyos7UAgy9eHrvAZHsxzUD/Mx1HtJ66F1rbUYpSxGgTbV
 CdWF/yqwfBa7pJ/i4drL2ZKqPuPZaXT3rPfX+epUnxVYfdcyTCo8xK4VQKdIMwM9m/Tj
 QM4EJGjr3GW24GkeZwK4oYAWGGd5MalatXDJHB1m7ZQd33K+SV7Mwxm4QLOX9BWTm7QW
 MvnGdFrC21SY2onWDXJy2ntg8VQyXSDYHb2yxfq3eJ92WvrBfp8DtDXq60rAleVqNSlo
 HsE1ujylG05VghSAwoFFUbk+643ulz7fuQOA4oKScGldTznuHhcTLe0Z1wo0bPgih+Dk
 qN1A==
X-Gm-Message-State: APjAAAWBegLexsDxPScac6MjaULq+Nk9+BfACC3O15QIZhlA/DJSix98
 sml3dwxch/txjPLtlzxKpGGIPx9edWpud2qcWVe14RaODwUfg8A7v95mbLKZQ2rSoCJNWoqA1rj
 JF6Z3JOZ/hl+afA0=
X-Received: by 2002:adf:e386:: with SMTP id e6mr9402674wrm.91.1570199014281;
 Fri, 04 Oct 2019 07:23:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdp0C+dWmsO1BajLJqI1M+yAOVC9T/E9/qPwi9UD52L6AdYOszxKCZUlr4zLU4pko9acMflQ==
X-Received: by 2002:adf:e386:: with SMTP id e6mr9402663wrm.91.1570199014115;
 Fri, 04 Oct 2019 07:23:34 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id r20sm11210991wrg.61.2019.10.04.07.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 07:23:33 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 2/3] tests/migration: fix a typo in comment
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
 <c60e8741dec930089b42ebb83b0ff15f2270078a.1568170994.git.maozhongyi@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <75228ec8-d1e0-36ae-894b-d475366970cb@redhat.com>
Date: Fri, 4 Oct 2019 16:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <c60e8741dec930089b42ebb83b0ff15f2270078a.1568170994.git.maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/19 5:31 AM, Mao Zhongyi wrote:
> Cc: armbru@redhat.com
> Cc: laurent@vivier.eu
> Cc: tony.nguyen@bt.com
>=20
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   tests/migration/stress.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/migration/stress.c b/tests/migration/stress.c
> index 6cbb2d49d3..19a6eff5fd 100644
> --- a/tests/migration/stress.c
> +++ b/tests/migration/stress.c
> @@ -191,7 +191,7 @@ static int stressone(unsigned long long ramsizeMB)
>  =20
>       /* We don't care about initial state, but we do want
>        * to fault it all into RAM, otherwise the first iter
> -     * of the loop below will be quite slow. We cna't use
> +     * of the loop below will be quite slow. We can't use
>        * 0x0 as the byte as gcc optimizes that away into a
>        * calloc instead :-) */
>       memset(ram, 0xfe, ramsizeMB * 1024 * 1024);
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

