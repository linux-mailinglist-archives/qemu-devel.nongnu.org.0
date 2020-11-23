Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD52C023A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:24:48 +0100 (CET)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh85X-0005CH-Ms
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh84A-0004Ip-L0
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:23:22 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh847-0000gT-53
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:23:22 -0500
Received: by mail-wm1-x341.google.com with SMTP id w24so16546657wmi.0
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 01:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=B47nsB/U5oE6iDZ8PpncllWSwS3chERLvd6kMjKzXyQ=;
 b=rUjhdi0G6qjlvoBcAfJYufa63xHVrBEFBUffywY0vJJdmOzYDTvrM6Qxv6NRpnGFUE
 hvaDS5RYGtO4xIf2ZnhdzLrzAp9myI8qtK9ZKWBjRfE7tA8F/1Ks8rRVrkznF6xjDLt3
 eLLxMVp4KxVr8PAA/nY5S+WGIORli+KQKD8en/L41ku/p+l0s19/jr7cKXctd0CLHvWf
 3qTA3K3NxI6M1PhmzKm6J1LBDArEMEwYGlCetGLAdQ5Rl7yczjetTY6e0yzKMYGj5h3r
 MsdYe6+hGb/3lye9zHaljdVjNe9iIeCrJHicGKkWr6YY/fnlsqqo/g7aFhMUBjdDx3UH
 w99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=B47nsB/U5oE6iDZ8PpncllWSwS3chERLvd6kMjKzXyQ=;
 b=MVypqEov7Ncb+fqCASPidF1e/D/I6Tj8AFBkuDboWsSyzj6IKkXjimrMu5nL2SYxYU
 OgNNUd3+5WjawJ3utDBFVtBKjKcBoeiduhJAVAG+NVNWdLWKtT6euxBIsTvKLl+ylo1c
 K2De/pdkbpn3qXNOv/TCOi8IefVqZJcsEtkcyHXn7xgOh/Ukh59ZpNmJxY7iprlsA99f
 zaiYkg2yFGIJu8EuYEzoYlhnNdMw3H5I9HhqvzQ9jjFlD+bvpXRjVTWz7tUz50avSpym
 J0angb+JVov53++VXhON2HppKmVDBuOu2uaNOBidamKvcYp3xcBQT17+Y8/QFFtGTVq9
 ktxA==
X-Gm-Message-State: AOAM533KAB3p5J3OVCJrKWrGmebB35CJ4undHtE77gSvGTW3EifKrLbf
 lWMrcRsdzRHFMW6X+xzbPbZVsQ==
X-Google-Smtp-Source: ABdhPJxvPAd+BERe4jJqMfoX3k+Y05qo2rbm8XM+mdN6XQ32Fao7F/VfWspndl1WHnJFQYfNBQ+sSw==
X-Received: by 2002:a1c:7412:: with SMTP id p18mr22581418wmc.8.1606123396639; 
 Mon, 23 Nov 2020 01:23:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g11sm19070051wrq.7.2020.11.23.01.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 01:23:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B668A1FF7E;
 Mon, 23 Nov 2020 09:23:14 +0000 (GMT)
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-4-alex.bennee@linaro.org>
 <3bc76afb-e459-1324-d1ef-aba53faf6220@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v1 3/6] tests/avocado: clean-up socket directory after run
In-reply-to: <3bc76afb-e459-1324-d1ef-aba53faf6220@redhat.com>
Date: Mon, 23 Nov 2020 09:23:14 +0000
Message-ID: <87tutgo29p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Wainer dos Santos Moschetta <wainersm@redhat.com> writes:

> On 11/17/20 2:36 PM, Alex Benn=C3=A9e wrote:
>> Previously we were leaving temporary directories behind. While the
>> QEMUMachine does make efforts to clean up after itself the directory
>> belongs to the calling function. We use TemporaryDirectory to wrap
>> this although we explicitly clear the reference in tearDown() as it
>> doesn't get cleaned up otherwise.
>
> This patch fixes the problem introduced on patch 02 of this series.

It didn't introduce the problem in patch 2, it just moved it. The
mkdtemp() was never cleaned up before.

>
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/acceptance/avocado_qemu/__init__.py | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptanc=
e/avocado_qemu/__init__.py
>> index 3033b2cabe..bf54e419da 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -171,8 +171,8 @@ class Test(avocado.Test):
>>               self.cancel("No QEMU binary defined or found in the build =
tree")
>>=20=20=20
>>       def _new_vm(self, *args):
>> -        sd =3D tempfile.mkdtemp(prefix=3D"avocado_qemu_sock_")
>> -        vm =3D QEMUMachine(self.qemu_bin, sock_dir=3Dsd)
>> +        self._sd =3D tempfile.TemporaryDirectory(prefix=3D"avo_qemu_soc=
k_")
>
> Double-checking that you really meant "avo" or if your fingers forgot to=
=20
> type the remaining letters. :)

Hmm yeah I should probably just be consistent with the name in both
patches.

>
> - Wainer
>
>> +        vm =3D QEMUMachine(self.qemu_bin, sock_dir=3Dself._sd.name)
>>           if args:
>>               vm.add_args(*args)
>>           return vm
>> @@ -193,6 +193,7 @@ class Test(avocado.Test):
>>       def tearDown(self):
>>           for vm in self._vms.values():
>>               vm.shutdown()
>> +        self._sd =3D None
>>=20=20=20
>>       def fetch_asset(self, name,
>>                       asset_hash=3DNone, algorithm=3DNone,


--=20
Alex Benn=C3=A9e

