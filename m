Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05201762BF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:31:54 +0100 (CET)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8pr7-00022a-QK
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8ppT-0000at-71
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8ppS-0001PC-1U
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:30:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8ppR-0001Oy-Tf
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583173809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQ4A+MEHLJkFfuRT0BgolUdJS063jUQBK2A5XeH+cb8=;
 b=DtdevFKqe252rXiya3HyfpGpuDKGMJUplXxS+0GSLjwdjHxWc1yzDWfBCLE1tNl025q77F
 F+/uXZDM1yvhawezVeWYg5wfq8lKWSAhw7/vwsRghX4mwX7ZSXBPGqAgrbpK2WLw8il37h
 lzmRV1ys4iMYkaeK03yDff2hJhEP53g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-GLkXeWLBOjqEg2cZ6XVUpw-1; Mon, 02 Mar 2020 13:30:07 -0500
X-MC-Unique: GLkXeWLBOjqEg2cZ6XVUpw-1
Received: by mail-wr1-f71.google.com with SMTP id w18so85847wro.2
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8p2XBdclySkvIcyGV9gmvXkIgnrD3b/KzCVsgVOt1Dg=;
 b=a+IfTtDHjvhNPIpFPoCPqgtn8OUH6ZmReKWiZ4WkY6ovpAZiuHX2U72PgS3nMBsMm9
 +ikVJ7M88k/sK97ORplxKqev3bfkRU0RQgA05AcsyrHipRhrza4ztykRTdDjB4vLVrCs
 5Vwiv+iTgRCeMCCpcUOLEJ30lMQ+XqqzWZmGjjI7g/qHiIWK2H6BqzmVv0JDsZNReYMo
 cOdCrxkgUUwwH8OZkvw1i+U8D6BpyJLhG6nrvmcKx1ID8HJdgbOkRQuVf7cbN5wBjF86
 EDFKGfXp105r40PSRrYuN/CoHWGr4Y01rBDLEy1nuCgTZrOUpqHkX+JpswxallSU88OR
 yIww==
X-Gm-Message-State: ANhLgQ3Ha2q8E9F5JcwEgYs7mrtKe/AaCSX1mWlzLIUsEVaguIJq8hgB
 pZjMSAqW+GYPpive8JTp1kJbkImxZP/RSUK/WE/FrCNbaW0ZJepYQhdyPkKATV+r0LLoI7HJPoq
 eZEx7jjegxB8es1w=
X-Received: by 2002:adf:e546:: with SMTP id z6mr860158wrm.423.1583173806461;
 Mon, 02 Mar 2020 10:30:06 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtuO+8a36XiqR3Sl8a5eUTAAhyWRy82HylZOEtf4cwilr4XC4N/2k/4TfFDvW04L8LhJqd5qg==
X-Received: by 2002:adf:e546:: with SMTP id z6mr860139wrm.423.1583173806269;
 Mon, 02 Mar 2020 10:30:06 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id e11sm28431353wrm.80.2020.03.02.10.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 10:30:05 -0800 (PST)
Subject: Re: [PATCH v1 02/10] tests/vm: Debug mode shows ssh output.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200302181907.32110-1-alex.bennee@linaro.org>
 <20200302181907.32110-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b4b7d958-543d-e1b4-6ca4-ec96aaa2b2c6@redhat.com>
Date: Mon, 2 Mar 2020 19:30:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302181907.32110-3-alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Puhov <peter.puhov@linaro.org>,
 Robert Foley <robert.foley@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/20 7:18 PM, Alex Benn=C3=A9e wrote:
> From: Robert Foley <robert.foley@linaro.org>
>=20
> Add changes to tests/vm/basevm.py so that during debug mode we show ssh o=
utput.
>=20
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20200219163537.22098-3-robert.foley@linaro.org>
> ---
>   tests/vm/basevm.py | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 4dee6647e6e..c99725b8c0d 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -120,11 +120,16 @@ class BaseVM(object):
>           return fname
>  =20
>       def _ssh_do(self, user, cmd, check):
> -        ssh_cmd =3D ["ssh", "-q", "-t",
> +        ssh_cmd =3D ["ssh",
> +                   "-t",
>                      "-o", "StrictHostKeyChecking=3Dno",
>                      "-o", "UserKnownHostsFile=3D" + os.devnull,
>                      "-o", "ConnectTimeout=3D1",
>                      "-p", self.ssh_port, "-i", self._ssh_key_file]
> +        # If not in debug mode, set ssh to quiet mode to
> +        # avoid printing the results of commands.
> +        if not self.debug:
> +            ssh_cmd.append("-q")
>           for var in self.envvars:
>               ssh_cmd +=3D ['-o', "SendEnv=3D%s" % var ]
>           assert not isinstance(cmd, str)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


