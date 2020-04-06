Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD5B19F2A6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 11:30:12 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLO54-0001wI-T5
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 05:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jLNl7-0002SB-DF
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jLNkz-0002mT-Pp
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:09:32 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jLNky-0002l5-Vh
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:09:25 -0400
Received: by mail-wm1-x343.google.com with SMTP id f20so5902795wmh.3
 for <qemu-devel@nongnu.org>; Mon, 06 Apr 2020 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ODvrgbntrYR+c5NW+GPbnJ8NbTUzTBdQLQq9ToxxXOk=;
 b=EmgHkCpSec60COah1Ba5e14TVQw/mMPaHiMYm3KslhkuVNn2cfcN7f7ZMyaqHK8SI8
 HGGAGwYd4k4B4nUY1MI2kAtwKAkfk27MKxP+jew4qeCZKmb3jmM0nItWlacjZ0Rwt9WF
 ydrWdDaiuDOMVJmIIMn9p+3dwVwviOlqdi3k0I47VqtyY/8XJBvrGnaygaNU+A9xT5Zm
 R0busLrgftgxBqUTHgnoW41TLm95+HBgxAnzUvuCK8dBbWoxKNwpV1oWcPOzBTXoqoKa
 IG1u5MmhhsdqpgexYLfFQJDCz7V80PokDjvPtFsUElsqoZlPHNWQLJFte8GJDzq0WdtT
 Fu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ODvrgbntrYR+c5NW+GPbnJ8NbTUzTBdQLQq9ToxxXOk=;
 b=mNKfHhi59Cyf2Xb22LV79ggAzEGDREUR4Stk7IU0e84XD5vEheiKWf0GYxy+m8BMxZ
 k2mJeCbAOts8gdZqn2VjMFGAp6UaGsqi2ipvLdPQYonsnKI7gFoO10RQ8B0YwMn6h5ds
 ndQjDLpjVCk0i0dC1/oaWKHhTUJYkQ4tAnsGU6BOONR/T2h1QVNgRIFCNc/ZEc6UB1hD
 b4KNBlUxmIH+ZB++nAWDh+csNyATaXjA08ONYh/jfrAuAc1ysgJLXeKn6QIPsKbTv/Ss
 vxjtvLTjDLiWlGvbAAILakk/7wFkVV0Tc531dONzhOWUIR7Y2ELnuKZpCR5Z3HZrzHED
 MsPw==
X-Gm-Message-State: AGi0PubWEyPU1c8ZB69rSBtlOuvwuVjznzLc/jHanpttKHPPxIHgZjgW
 yNhxmibBNYrqiJkhoNPb2ILuGA==
X-Google-Smtp-Source: APiQypK9QK/so2dXmEFZinsp1+8nptUh4gRV4nq5J6GA0PX8WCY4hq7SKbKA9c9CP2FLqAq80324ag==
X-Received: by 2002:a1c:b005:: with SMTP id z5mr20759541wme.145.1586164162384; 
 Mon, 06 Apr 2020 02:09:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm26812329wrg.49.2020.04.06.02.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 02:09:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B3511FF7E;
 Mon,  6 Apr 2020 10:09:20 +0100 (BST)
References: <20200403191150.863-1-alex.bennee@linaro.org>
 <20200403191150.863-9-alex.bennee@linaro.org>
 <830061f9-91cd-145c-4388-f2bfe9a3d7a6@linaro.org>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 08/12] linux-user: factor out reading of /proc/self/maps
In-reply-to: <830061f9-91cd-145c-4388-f2bfe9a3d7a6@linaro.org>
Date: Mon, 06 Apr 2020 10:09:19 +0100
Message-ID: <87pnclaslc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/3/20 12:11 PM, Alex Benn=C3=A9e wrote:
>> +                e->is_read  =3D fields[1][0] =3D=3D 'r' ? true : false;
>> +                e->is_write =3D fields[1][1] =3D=3D 'w' ? true : false;
>> +                e->is_exec  =3D fields[1][2] =3D=3D 'x' ? true : false;
>> +                e->is_priv  =3D fields[1][3] =3D=3D 'p' ? true : false;
>
> Drop the redundant ? true : false.  That is of course the result of the b=
oolean
> operation.

doh! Fortunately the compiler was smart enough to see through my idiocy...

>
>> +                errors +=3D qemu_strtoi(fields[4], NULL, 10, &e->inode);
>
> The root of the typedef chain for ino_t is
>
> /usr/include/asm-generic/posix_types.h:typedef __kernel_ulong_t __kernel_=
ino_t;
>
> so I think you should just go ahead and use unsigned long here too.  Or m=
aybe
> even uint64_t, because 32-bit has ino64_t, and could in fact have a Large
> Number here.

Will fix.

>
>
> r~


--=20
Alex Benn=C3=A9e

