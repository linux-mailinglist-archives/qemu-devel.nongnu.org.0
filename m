Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E5141741
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 12:34:05 +0100 (CET)
Received: from localhost ([::1]:39338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ismMe-0006Lm-0C
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 06:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ismLa-0005ay-E7
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 06:32:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ismLZ-0001Ol-0k
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 06:32:58 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28398
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ismLY-0001OA-Jy
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 06:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579347175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZozbygElQ3D5YEwEwr0Pi8i549AAjppTJ//0wDiohk=;
 b=GNxTQYGghsFoCWbkqG+dRoMrpS9kMQH9o4iGSeilD0izAvih9siwh7sETiwa2DclTS8GCH
 /f07x81ZRv4kBxJt85kURxa5CLgfD6fIEHzgq4HibGz2a49UPzYKLIutf/r8roKSS2OuQR
 6ddwHHhPW2CM3CaW4LBteAMOc/4K53c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-LaPWo7orMayAq2PcxW_9Pg-1; Sat, 18 Jan 2020 06:32:52 -0500
Received: by mail-wr1-f72.google.com with SMTP id j13so11635173wrr.20
 for <qemu-devel@nongnu.org>; Sat, 18 Jan 2020 03:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SLxmTlzrjNSUDiI8rhbL4IUv6Z4/a5sY3ZWCABktNyI=;
 b=n9t0wkMBnnliJvV4bHSNCB5TnqE8iyO9TOmvws4f/V5MOXsBgP/A/zAPK+iwlgaxsh
 36Qf7POeOxRzWv+mdkaLmin+9ALQZSIqXR1Fn8elE6diZ1DQqpnuQWQZltAaxnLmRlVA
 zz4X3AXO1FVARgsgEsTZGnt79WrFZw1JUoOOtLJaYMinswziOETxkfjxWIOIQ9XGWfzA
 eFUWil0PfCjOvEV2dBAPpf2YKS12uIdB6CAjPMbaH8qKkEYtnJM94OjmPubDtLmwuPxl
 hiNpJZBhBUTAuwalK/uK1mEoyZb/zXAxrCewdLa0gAngpq8MlCJcI4s1fm/KrppaGYdc
 prAQ==
X-Gm-Message-State: APjAAAXhVgs315eSmzgVttNyrdhGK49DsOoD2Or8ChI7C3Z8Mu9fLuTO
 aGuFX8bITKx2vfJoEpZlTt1OXV4l5lAn33d/REe2/F4T+dy09e4KOkRqc6jLIAxZO5LUo3IchWi
 Q8HrkSLxRtp5O0n8=
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr8784177wmd.96.1579347171254; 
 Sat, 18 Jan 2020 03:32:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJ//ApfHdDp0zyWa2zdR+xIVP+V4kWmHbxjLj3s5v3dQALlGdOAKW6uEcqPT9710iTxd0ziA==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr8784168wmd.96.1579347171042; 
 Sat, 18 Jan 2020 03:32:51 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id d14sm40472391wru.9.2020.01.18.03.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 03:32:50 -0800 (PST)
Subject: Re: [PATCH v2 07/11] tests/ssh_linux_malta: Run tests using a
 snapshot image
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20191019153437.9820-1-f4bug@amsat.org>
 <20191019153437.9820-8-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <276200e0-9754-6770-496d-195b80587866@redhat.com>
Date: Sat, 18 Jan 2020 12:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191019153437.9820-8-f4bug@amsat.org>
Content-Language: en-US
X-MC-Unique: LaPWo7orMayAq2PcxW_9Pg-1
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleber, Eduardo: ping?

On 10/19/19 5:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> If a test fails, it can corrupt the underlying QCow2 image,
> making further tests failing.
> Fix this by running each test with a snapshot.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   tests/acceptance/linux_ssh_mips_malta.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/=
linux_ssh_mips_malta.py
> index ffbb06f846..27907e8fbd 100644
> --- a/tests/acceptance/linux_ssh_mips_malta.py
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -90,7 +90,7 @@ class LinuxSSH(Test):
>           self.vm.add_args('-no-reboot',
>                            '-kernel', kernel_path,
>                            '-append', kernel_command_line,
> -                         '-hda', image_path,
> +                         '-drive', 'file=3D%s,snapshot=3Don' % image_pat=
h,
>                            '-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0.=
1:0-:22',
>                            '-device', 'pcnet,netdev=3Dvnet')
>           self.vm.launch()
>=20


