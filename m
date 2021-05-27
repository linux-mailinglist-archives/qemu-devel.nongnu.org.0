Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1D3935FB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:10:52 +0200 (CEST)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLP9-0001pu-CE
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lmLNe-0000Y2-BQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lmLNb-0008Mb-Px
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622142553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95QhQJ+/SCu2fyVrmqBL9hCthJGvlO4CvNyvW4jBGT0=;
 b=FflgzeFT3yNzcKtLh4mUmw2vtH+uz+aEsJyTyr2/PpPkP3cge8+6nvZqat/EXBBTkXPVB9
 z3bDv9txbDHNivdgng72sQOgmL3SCfuSmbey//VD42NQPkXziM8lJvkkoOajeEalqmJ18a
 X9ZT14pN4+ilF3e1yqrcCoGapTnnAoc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-wzlOVFGjMSuszuX5hpTqqA-1; Thu, 27 May 2021 15:09:07 -0400
X-MC-Unique: wzlOVFGjMSuszuX5hpTqqA-1
Received: by mail-ua1-f69.google.com with SMTP id
 5-20020ab000850000b029020fb0e74c2aso597946uaj.21
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 12:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=95QhQJ+/SCu2fyVrmqBL9hCthJGvlO4CvNyvW4jBGT0=;
 b=kqdfmevAinEWpWqgDwmgmxHre/yWiS64w7PgxqQbm2xnicl3LSyG6f410TFKXESta9
 eAWlGJfisqvPrjnb+vnOB7atbU/bdQz+d+DKYf1GpdHLGmIkYPTIES0gd78N1JVKw9P9
 DkAcRnZxrRKLJHy8kw8Wr/3RCirIv2ZYC9ccczs9n7QA7l2KVjjsvXogQh6U22ame1yI
 mvuVa3oUvhaycy85kqM1sdFV7/QEgMJdEgbJew2kwcO1cFjfHXSC8zJo6h2+zsTvEV+Z
 6kCES/RRV7Go7Ox6g0VLSTbGV1ozx+Ukv543tQV6eAxsUuDPmgjVW/nH/crPdUQEY3NK
 tdPw==
X-Gm-Message-State: AOAM5328mTrOCsGjER0Ydvu8ZUtlRvYQIS30RI+SCPgT2on668SugwSl
 +toMI36wEVuuSyLcVDVY1jrksLYxLEvjvSydzdhHEphNx0VnE46RaKvDRVEUqvawWYS0TXn+arA
 x3gFPl0/SvoF29YL2uVQON4Rs3oT0YQM=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr4361445vsj.1.1622142547112; 
 Thu, 27 May 2021 12:09:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPni8auJ/7Nld3/svPtlZ0Q4JtcGqtXQp5fPtBITCXdIcILosPcTA+tWIpfVrkxGqFHpPjdLqf5fKlXwll380=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr4361415vsj.1.1622142546887; 
 Thu, 27 May 2021 12:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-6-alex.bennee@linaro.org>
In-Reply-To: <20210527160319.19834-6-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 27 May 2021 16:08:40 -0300
Message-ID: <CAKJDGDbwxU7XQ8zBWM43TfcgUF2TmvVpdsUyRP90SUuZNZ8QUw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] tests/acceptance: tweak the tcg/kvm tests for virt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 27, 2021 at 1:11 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Really it's only TCG that can select which GIC model you want, KVM
> guests should always be using the "host" version of the GIC for which
> QEMU already provides a handy shortcut. Make the KVM test use this and
> split the TCG test into it's two versions.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/acceptance/boot_linux.py | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index 0d178038a0..7221452d4b 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -75,10 +75,11 @@ def add_common_args(self):
>          self.vm.add_args('-device', 'virtio-rng-pci,rng=3Drng0')
>          self.vm.add_args('-object', 'rng-random,id=3Drng0,filename=3D/de=
v/urandom')
>
> -    def test_virt_tcg(self):
> +    def test_virt_tcg_gicv2(self):
>          """
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Dcpu:max
> +        :avocado: tags=3Ddevice:gicv2
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> @@ -87,29 +88,28 @@ def test_virt_tcg(self):
>          self.add_common_args()
>          self.launch_and_wait()
>
> -    def test_virt_kvm_gicv2(self):
> +    def test_virt_tcg_gicv3(self):
>          """
> -        :avocado: tags=3Daccel:kvm
> -        :avocado: tags=3Dcpu:host
> -        :avocado: tags=3Ddevice:gicv2
> +        :avocado: tags=3Daccel:tcg
> +        :avocado: tags=3Dcpu:max
> +        :avocado: tags=3Ddevice:gicv3
>          """
> -        self.require_accelerator("kvm")
> -        self.vm.add_args("-accel", "kvm")
> -        self.vm.add_args("-cpu", "host")
> -        self.vm.add_args("-machine", "virt,gic-version=3D2")
> +        self.require_accelerator("tcg")
> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "max")
> +        self.vm.add_args("-machine", "virt,gic-version=3D3")
>          self.add_common_args()
>          self.launch_and_wait()
>

This test is timing out for me. Maybe we should add a skip just like
on build/tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_q=
uanta_gsj,
@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might
timeout')?

> -    def test_virt_kvm_gicv3(self):
> +    def test_virt_kvm(self):
>          """
>          :avocado: tags=3Daccel:kvm
>          :avocado: tags=3Dcpu:host
> -        :avocado: tags=3Ddevice:gicv3
>          """
>          self.require_accelerator("kvm")
>          self.vm.add_args("-accel", "kvm")
>          self.vm.add_args("-cpu", "host")
> -        self.vm.add_args("-machine", "virt,gic-version=3D3")
> +        self.vm.add_args("-machine", "virt,gic-version=3Dhost")
>          self.add_common_args()
>          self.launch_and_wait()
>
> --
> 2.20.1
>
>

Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>


