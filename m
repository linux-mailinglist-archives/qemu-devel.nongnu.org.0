Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF362DD6EC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:08:20 +0100 (CET)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxhB-0007fd-AO
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpxfU-00071h-OW
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:06:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpxfS-0005kj-P6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:06:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id 3so6494268wmg.4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 10:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WIz585ar4YIyXTWDiab15oiwikT12YPWRYxM+Uv72WM=;
 b=TXc8vAu9FL/TUOXLid75k/pPrhf/v0koyoFm/7MlQbcS5zji+K9Hr/ngGmUTZjmk5W
 VM+A2WlXQyJ3kkRXqQ9ZW6BPjSi7gUKiLbdpXpkyq7HAic9jhtza2N2COQ9e4tIrX7so
 h+4fqbAXRZJSG7Zo54oUX4nJ6JbVOIDxmp2eYWPVztSEvmh/TkUep462p7nZQTZ7WDyP
 NMIVRDwbtCM0fkqDM434wCTC8h1SLUj/8uGHQVDpRz7yCVT6VSd/KnbY8zTUQe0GWyCa
 u0eJEpHTo//ljQa37mi26HE9g6GqtiN8OtwtGmJOSXYbxjkytteJ+VUFecxsrPakRqxE
 2DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WIz585ar4YIyXTWDiab15oiwikT12YPWRYxM+Uv72WM=;
 b=ul2SdNmPrt6oc97eed/3aYq1E9q2gX0wbeYpCutIhE8B30ug7fp1ndN9cH70U8KXUh
 ZvlW4yUrQZv3dOTjMDN/vRuXTeNQM6W7silSRwBq3L3W3IudtbO7EoVTIzVv55R49tNQ
 BLmz8gwnJDH4DDux1WcP3Xf2n9GwiTSwiZgOTysflBEz6z70GUcgmSzs3J+CytdScTUb
 hKvBIHhxlvHE/1SZGY9Ul58jr1HAn6uzihLY4Tqrv0REN1dYi1Flyt5maGS54bX8F/S+
 7ojnfW14U5//I682TrqSVOHGI1O1FvbNeZF/nL6GTWFFY36RyOI0OljhCbAramlkggkF
 DlRg==
X-Gm-Message-State: AOAM530i3CNb05PcuVuSF5FT90FBLnQQQwxSA3ICmygM/8IWD8/hLQKX
 h6zhegw4u+ih31GM3KSN9xIWkA==
X-Google-Smtp-Source: ABdhPJyXvcFum38tqBdiSdezqKxMys8Az/k3JH/pvDATbYj2vHI3Kg9jJqkaFmeHB7sdvJiO8txuaw==
X-Received: by 2002:a1c:3b46:: with SMTP id i67mr551357wma.108.1608228381328; 
 Thu, 17 Dec 2020 10:06:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h98sm11389919wrh.69.2020.12.17.10.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:06:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7447A1FF7E;
 Thu, 17 Dec 2020 18:06:17 +0000 (GMT)
References: <20201216013646.40799-1-gromero@linux.ibm.com>
 <87bleut3si.fsf@linaro.org>
 <16b08946-9f96-200e-231f-40e24bb21734@linux.ibm.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gromero@linux.ibm.com>
Subject: Re: [PATCH] configure: Fail when specified cross compiler cannot be
 found
Date: Thu, 17 Dec 2020 17:56:19 +0000
In-reply-to: <16b08946-9f96-200e-231f-40e24bb21734@linux.ibm.com>
Message-ID: <87y2hwqpd2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Pbonzini@redhat.com, gustavo.romero@protonmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gustavo Romero <gromero@linux.ibm.com> writes:

> Hi Alex,
>
> On 12/16/20 7:51 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Gustavo Romero <gromero@linux.ibm.com> writes:
>>=20
>>> Currently if the cross compiler passed to 'configure' (--cross-cc-<arch=
>) does
>>> not exist no error happens and only later when the TCG tests are run th=
ey fail
>>> because the cross compiler is not set correctly.
>>=20
>> Do they? They should just skip because of a non-existing compiler and a
>> failed fallback to using docker:
>>=20
>>    ../../configure --disable-docs --target-list=3Daarch64-softmmu --cros=
s-cc-aarch64=3Dnonexisting_gcc
>>=20
>> and then cat ./tests/tcg/config-aarch64-softmmu.mak
>>=20
>>    # Automatically generated by configure - do not modify
>>    TARGET_NAME=3Daarch64
>>    CONFIG_SOFTMMU=3Dy
>>    QEMU=3D/home/alex/lsrc/qemu.git/builds/bisect/qemu-system-aarch64
>>    CROSS_CC_GUEST_CFLAGS=3D
>>    DOCKER_IMAGE=3Ddebian-arm64-test-cross
>>    DOCKER_CROSS_CC_GUEST=3Daarch64-linux-gnu-gcc-10
>>=20
>> So what do you see in your failing case?
>
> I get the following (I don't have docker installed):
>
> $  ../configure --disable-docs --target-list=3Daarch64-softmmu --cross-cc=
-aarch64=3Dnonexisting_gcc
> gromero@pub:~/git/qemu/build$ cat ./tests/tcg/config-aarch64-softmmu.mak
> # Automatically generated by configure - do not modify
> TARGET_NAME=3Daarch64
> CONFIG_SOFTMMU=3Dy
> QEMU=3D/home/gromero/git/qemu/build/qemu-system-aarch64
> CROSS_CC_GUEST_CFLAGS=3D
>
> $ ../configure --disable-docs --target-list=3Dppc64-softmmu --cross-cc-pp=
c64=3Dnonexisting_gcc
> gromero@pub:~/git/qemu/build$ cat ./tests/tcg/config-ppc64-softmmu.mak
> # Automatically generated by configure - do not modify
> TARGET_NAME=3Dppc64
> CONFIG_SOFTMMU=3Dy
> QEMU=3D/home/gromero/git/qemu/build/qemu-system-ppc64
> CROSS_CC_GUEST_CFLAGS=3D
> CROSS_CC_GUEST_STATIC=3Dy
> CROSS_CC_GUEST=3Dpowerpc-linux-gnu-gcc

Hmm that is impressively wrong to somehow get the 32 bit compiler. But
I'm still failing to replicate the problem. Could you try the following
configure for a like-for-like comparison:

  ../../configure --disable-containers --target-list=3Dppc64-softmmu --cros=
s-cc-ppc64=3Dnonexisting_gcc

which gives me:

  $ cat tests/tcg/config-ppc64-softmmu.mak
  # Automatically generated by configure - do not modify
  TARGET_NAME=3Dppc64
  CONFIG_SOFTMMU=3Dy
  QEMU=3D/home/alex/lsrc/qemu.git/builds/ppc-linux.all/qemu-system-ppc64
  CROSS_CC_GUEST_CFLAGS=3D

>
> hrm It seems PPC64 is even assuming some default gcc...
>
> I'm at commit af3f37319c from Dec 15.

Yep I'm based on that as well.

> I'm wondering if tha happens because I don't have docker package installe=
d.
>
> Anyway, should we at least say we're using Docker as fallback?

Something like:

modified   tests/tcg/configure.sh
@@ -255,6 +255,7 @@ for target in $target_list; do
   if test $got_cross_cc =3D no && test "$container" !=3D no && test -n "$c=
ontainer_image"; then
     echo "DOCKER_IMAGE=3D$container_image" >> $config_target_mak
     echo "DOCKER_CROSS_CC_GUEST=3D$container_cross_cc" >> $config_target_m=
ak
+    enabled_container_compilers=3D"$enabled_container_compilers $container=
_cross_cc"
   fi
 done
=20
@@ -265,3 +266,6 @@ if test -n "$enabled_cross_compilers"; then
     echo
     echo "NOTE: guest cross-compilers enabled:$enabled_cross_compilers"
 fi
+if test -n "$enabled_container_compilers"; then
+    echo "NOTE: container cross-compilers enabled:$enabled_container_compi=
lers"
+fi

To be honest at the moment the information is a little hidden at the top
of the output. It would be nice if we could teach meson to echo it in
it's nice coloured output.

Paolo,

Any ideas for the cleanest way to do that?

--=20
Alex Benn=C3=A9e

