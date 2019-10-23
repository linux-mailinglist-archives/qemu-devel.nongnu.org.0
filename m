Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16625E19DA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 14:20:32 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNFct-0005np-4o
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 08:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNFYb-0003PH-31
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 08:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNFYZ-0001jA-3T
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 08:16:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13584)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNFYX-0001hp-98
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 08:16:03 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D9DAC04AC69
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 12:15:59 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id l4so8164900wru.10
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 05:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfrQui0+iLx24QK1KWYjwB0nlefc2t3iC9tpc/b2sFs=;
 b=n/REHBMgUBpYFo3bSr8odYtOjUrYKZCfv0tK9LS++zDphM/8VXLIBP+DVTmTPVre0F
 N6qfc3uIwzGesN/NURadEHoV/9ZJAqg8e5czI9D/BnhkXmG56Ft+utTD1o1QxK+F9mUp
 Tk41zUHVL/0v51+Y1JA+LrnkTbNiT+BkzI2/fYAIGf6kfe+SUuH/IxyQgJm0HR3Z0iNB
 HeyxwXsCEFs8lpZ425hO6hbjr6bY0D+bYKOR92hLFz0b4sr/SL0lXFmnm3B/8naCGvFM
 jd2lTd3W+S8J/CJE1jPXgbGK0mD/phPGzMpxCle9fOrmGNs7KPpEqRQKd5L8tiPZJCwA
 wa/Q==
X-Gm-Message-State: APjAAAXBdHvVBJE3nyp/FviCZmJIYz4yWUwvSaJP5eD4LnYiIHHjSjnD
 +tJgxIEc/NywMYl5OaHqzN3TeK6Vvto+2woJ3gMx4HY/fYUjlCs0mejVrl5g2l4yTZ0CEPfMju9
 E6DvSHr2ObAzm35g=
X-Received: by 2002:adf:fe90:: with SMTP id l16mr21389wrr.81.1571832955039;
 Wed, 23 Oct 2019 05:15:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfh8UdNoUUjl8mVOXPqY2LYuktE7V3hc1lwBtrQYePRL9fA7mieOBiPooy+enABnEASWNuIQ==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr21368wrr.81.1571832954878;
 Wed, 23 Oct 2019 05:15:54 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id e3sm19637335wme.39.2019.10.23.05.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 05:15:54 -0700 (PDT)
Subject: Re: [PATCH v1 15/19] iotests: Test 041 only works on certain systems
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191022191704.6134-1-alex.bennee@linaro.org>
 <20191022191704.6134-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dc0f5125-b1ba-e022-11f9-fa8ef96c4cd7@redhat.com>
Date: Wed, 23 Oct 2019 14:15:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022191704.6134-16-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org, f4bug@amsat.org,
 Max Reitz <mreitz@redhat.com>, cota@braap.org, stefanha@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/19 9:17 PM, Alex Benn=C3=A9e wrote:
> From: Thomas Huth <thuth@redhat.com>
>=20
> 041 works fine on Linux, FreeBSD, NetBSD and OpenBSD, but fails on macO=
S.
> Let's mark it as only supported on the systems where we know that it is
> working fine.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20191022072135.11188-3-thuth@redhat.com>
> ---
>   tests/qemu-iotests/041 | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
> index 8568426311e..0326888c980 100755
> --- a/tests/qemu-iotests/041
> +++ b/tests/qemu-iotests/041
> @@ -1123,4 +1123,5 @@ class TestOrphanedSource(iotests.QMPTestCase):
>  =20
>   if __name__ =3D=3D '__main__':
>       iotests.main(supported_fmts=3D['qcow2', 'qed'],
> -                 supported_protocols=3D['file'])
> +                 supported_protocols=3D['file'],
> +                 supported_platforms=3D['linux', 'freebsd', 'netbsd', =
'openbsd'])
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

