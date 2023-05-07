Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C956F9C13
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 23:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvmJM-0004tz-J1; Sun, 07 May 2023 17:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmJK-0004tr-RX
 for qemu-devel@nongnu.org; Sun, 07 May 2023 17:52:54 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmJI-0002dX-Rt
 for qemu-devel@nongnu.org; Sun, 07 May 2023 17:52:54 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-55a44a2637bso57565407b3.2
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683496370; x=1686088370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykufT6tX4Ww7ScREdArigv8YLkxWe7W99PYm7B1tFVo=;
 b=PHU9TK1uULzG30f8yO5CafsXgWasUz6O+vQSM+iI6rbnyAw6NEeKhpvf4o8Ju+673B
 aZoipmV9qroR86eNY56OFyIwPjLnQr848VO8DFMi5x14fazZgVO+sgxhM3hiWLLtF0Ij
 sVPyUnd4jKqMDlZMlmd1CzOqC0jwUJX4KKyFFfuKGCfQ98lghkTpnw99cQBxiOlMW2Ug
 Z1R0Am/MhloZrggrVQfzgLNZNwEzYFd0KJcioiybBgGhNOH5gT6/Hag4xEm2702/gOdn
 x4ryXld6g1ZWxk56+eSsvxr9Ij3wpPKDFQNNxSZLviskPr5/tg18Eme1wq330lpaMLZ+
 idBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683496370; x=1686088370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykufT6tX4Ww7ScREdArigv8YLkxWe7W99PYm7B1tFVo=;
 b=aXkY+TuvUnV3FqPd3LZ7AfHupbx+Djx2OBYC87Dyl71De/EcD07vk+ma+O2rf6GQRF
 wjqIlBs3C0SGe6C07iiQJiHE1uCsVy5G5xPbWAyX5jSstkkkxddAfR2r/Rv4kO9zgW4A
 hjNvCegOUuY8eqNaYrqsMH2Kr9g5BfW7lCUAi8ImTfT2jvI6x0a+kYw3HeiAJZnpjL1I
 Sn5VrOx7XGGI/ekgMOciR33aixYKWModScp3uBv8Mw1iqu1Dcnr2KcsFNvNUGNkwwqoI
 zckVrZFw4aJ5R55Urit/lJPK25Nzbnd6aNEtut+mvLzF6UkJWg706gCNv9vG1zc8UW4Z
 FnGA==
X-Gm-Message-State: AC+VfDzKgz84hhGsynaVeWExVhk2ftw8f4kOh09lFZWf+eDBbqTVSgfc
 qydd91Qq0FoMdmcS/WWgq2x7W88VPGfX8u1MPu/yzw==
X-Google-Smtp-Source: ACHHUZ65m/LDoX/1Apaufl34fkBRnfZd7tBRzxGeWMDlY7YihQCv+E3Kd/lb3T8VFp+f9BYNCuiuWKtE2QeLbJmAq+Y=
X-Received: by 2002:a0d:e2cd:0:b0:55a:72da:a9c4 with SMTP id
 l196-20020a0de2cd000000b0055a72daa9c4mr9325065ywe.10.1683496369842; Sun, 07
 May 2023 14:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230501072101.22890-1-andrew@daynix.com>
 <ZFIZupZseawPZEVI@redhat.com>
In-Reply-To: <ZFIZupZseawPZEVI@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 8 May 2023 00:34:11 +0300
Message-ID: <CABcq3pFXtAJ5j12M0jiA-LmccNKSJOq6d_iKkHmYVH_njQmMpw@mail.gmail.com>
Subject: Re: [PATCH 0/5] eBPF RSS through QMP support.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::112a;
 envelope-from=andrew@daynix.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

On Wed, May 3, 2023 at 11:22=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Mon, May 01, 2023 at 10:20:56AM +0300, Andrew Melnychenko wrote:
> > This series of patches provides the ability to retrieve eBPF program
> > through qmp, so management application may load bpf blob with proper ca=
pabilities.
> > Now, virtio-net devices can accept eBPF programs and maps through prope=
rties
> > as external file descriptors. Access to the eBPF map is direct through =
mmap()
> > call, so it should not require additional capabilities to bpf* calls.
> > eBPF file descriptors can be passed to QEMU from parent process or by u=
nix
> > socket with sendfd() qmp command.
> >
> > Possible solution for libvirt may look like this: https://github.com/da=
ynix/libvirt/tree/RSS_eBPF (WIP)
>
> Is that complete enough to be running guests ? If so, have you
> successfully tested with a QEMU running under qemu:///system
> as the qemu:qemu user, to prove it works without any extra
> capabilities being needed ?

Yeah, but still working on it. Overall, QEMU doesn't require
additional capabilities.
Map update through mmap doesn't require any.
Tested with qemu://system.
There is still an issue with cache for libvirt.

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

