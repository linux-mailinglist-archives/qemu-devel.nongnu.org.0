Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B7F14ACB6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 00:46:23 +0100 (CET)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwE5G-00047q-5Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 18:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iwE4B-00036n-Fn
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 18:45:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iwE4A-00069Q-BI
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 18:45:15 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34756)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iwE4A-00068N-4R
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 18:45:14 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so13872595wrr.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 15:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ExdRy6VAl9ttBB0k1+O+8Kdxo6uu4LrPkBFtm3v/e8w=;
 b=NOnZbaTvB3JWKO5i1o+oU6OyFIK8cIKFtl9huWzzQqs2LfAnUPQb696jCZgGZEjQok
 otscINsBvHJaAH6QCSdpyLkvRwYviU0Xfn4Ez/xEnsRByreSi1ZjhBgE4ulFfhQcVqcF
 Q/RCPy5lrjYEhuglQzzuuGNknoELyZfEHCBd14rU9hPJyc5iGqe9CMoit0qxZi04mEEh
 qZUrqn1JKZMWb/KyDmfNFVl2Oh7VwsRV2kEg0nJ0PHR0eM0kaee2Tb420NlXgSxqDPoA
 AqQEvpqo/MvEqJ5gi6Vd6C7ZjK3RSnrUSZzoToyUcvqld0hLtQTxwY/XMWV/LvF/P8w+
 n/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ExdRy6VAl9ttBB0k1+O+8Kdxo6uu4LrPkBFtm3v/e8w=;
 b=qizne9OgFvTVIn7v6TaJWsH1lYBRQOWAiNxpPDMQ5QpD9CujgvC2yyEBHWSsp9HY7J
 wENEOY4QlT5kRCu+i/295JJ8VpBaYfBGiPEAmWwaP9BiGmAj9kj65krgyFlKmlfynC2r
 YYd7atkypnj3WqnksMXFcy4QaU0ofH70gbbWmvlpZZkGK2VDXJ7A5ntSSTA5bEigT+Ap
 7ZaBQeXFmn6Ic1wSOHYQFpGgTCdpqCRwje4TSfV1lPbyzDWPnLDhbRMXnMxEPm7DeHIW
 ieZhMm0yX+53XGHY7BCB62M73UaoWGrlVnmlwGphIgCdA+F1Ts8VkePKBo0mNuLYhpXH
 zkLw==
X-Gm-Message-State: APjAAAVXbkhVsrEOvEwDK7DzC3/WAvAhhF3TkPUe8QChchq2G3n8pxZs
 GvmmFTrHja+LGeEjxnOiX08I7w==
X-Google-Smtp-Source: APXvYqzqacxfo1lIB88UZddvnupCMnqFoyfkw4i+QKdPkYJVT/rMzqHK6YfAPEyVP2hNCgHyyl8HnA==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr24281045wrb.407.1580168712754; 
 Mon, 27 Jan 2020 15:45:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm24513703wru.9.2020.01.27.15.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 15:45:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0EBD1FF87;
 Mon, 27 Jan 2020 23:45:10 +0000 (GMT)
References: <20200125184217.30034-1-f4bug@amsat.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] .travis.yml: Drop superfluous use of --python=python3
 parameter
In-reply-to: <20200125184217.30034-1-f4bug@amsat.org>
Date: Mon, 27 Jan 2020 23:45:10 +0000
Message-ID: <87a768foqh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> As we require Python3 since commit ddf9069963, we don't need to
> explicit it with the --python=3D/usr/bin/python3 configure option.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to testing/next, thanks.

> ---
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Cleber Rosa <crosa@redhat.com>
> ---
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index 6c1038a0f1..ee93180283 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -268,7 +268,7 @@ matrix:
>=20=20
>      # Acceptance (Functional) tests
>      - env:
> -        - CONFIG=3D"--python=3D/usr/bin/python3 --target-list=3Dx86_64-s=
oftmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-soft=
mmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
> +        - CONFIG=3D"--target-list=3Dx86_64-softmmu,mips-softmmu,mips64el=
-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmm=
u,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
>          - TEST_CMD=3D"make check-acceptance"
>        after_script:
>          - python3 -c 'import json; r =3D json.load(open("tests/results/l=
atest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["statu=
s"] not in ("PASS", "SKIP")]' | xargs cat


--=20
Alex Benn=C3=A9e

