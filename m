Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D294E5EBF49
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:10:33 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Xs-0005i7-Gi
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od7VM-0007w8-50
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:07:56 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od7VI-0001h0-RF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:07:55 -0400
Received: by mail-il1-x135.google.com with SMTP id i16so4874269ilq.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=KhErUp0IwiRTnTDJKozqs/81qzfcaCYsLqXvJNJ+4n0=;
 b=aAtG2cQtcxzRsTBvCLKeJTKfSboxN3cPnfGNVqSuPSdATGYIjd03DjcQQNhcPYDmGt
 xHiulC4D8z4Je3RpuQ5KlWaIGLaEOEUEPbt4SyBbAVVvPSI7XmogxWOFFvtwDB/RCESJ
 lsPy0/6pyFn1vH2zlwCZnxS6+gsAR1m5ae9kn8MfzxSv7A8JxA0ZhDL1YZLo3S8BqJAr
 Pvmi+ZuKWU9J/W/Qk3Z4B2Z9+hPcTAmnSgLdI8+ekW0F+TGM18vZXUhN5KvfcFqQu3L0
 ZDJNu1cI6C2abg5nps71ErvcP17yL5J6S0mGKEQQ19t0YVVB5UoxXixIGPbXZpxC3FMc
 bcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KhErUp0IwiRTnTDJKozqs/81qzfcaCYsLqXvJNJ+4n0=;
 b=bN2c3LpF/eIGuIQTq/FTPMlZGJfdGBb5FnrcBRph6Xy2HRMyrfmxY9AeoDz+Awe90d
 WkrrV7P3UNjoZOqZMoos4saNNfJ9Bpo8mIGLAoXOKZShCcC2eiib1o3bfrpHGekxYD8Y
 OdWJpWVMvbVe0YhUGS5OQARecyMb2Q28TbBrjm/pieFJh/w6i8D+Ka4TLBRoygTrkCrh
 u6pxyhjjV+Ljt84DabZovhpGEb1lhLQ4g6HhIevncwje+5ZsKB1fD2z1O2HPZCqFrXVF
 Z7DjK5N2s8G99hm8HliX3yxQduYLthstVa+kR8mJIperxnl23KGcpPj/nr5/aQ9oEluj
 6/OQ==
X-Gm-Message-State: ACrzQf2/HvYEuGKcPJKNP7D4psHD+ZR+ckWC+K1tm/ENkGHZ9e160VYg
 MUG1wJgYsVgx7YmNwIoLmZACrForedrO4Ps4sMQhtw==
X-Google-Smtp-Source: AMsMyM4dOPbqaKOFKjYdkjzMX9Rj8snhrGjN79Ez8p6EjPo+5iFaL9B7mH2lArLGBpe84XPCpicIqXp8pw6XQfY8NmU=
X-Received: by 2002:a05:6e02:1a84:b0:2f6:2bba:8b60 with SMTP id
 k4-20020a056e021a8400b002f62bba8b60mr12302253ilv.129.1664273271255; Tue, 27
 Sep 2022 03:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
In-Reply-To: <YzK1VzoU05vnlxY4@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 27 Sep 2022 15:37:39 +0530
Message-ID: <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 jsnow@redhat.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > > > >
> > > > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > > > > the binaries in some other repo first. Everything else hinges on that. We
> > > > > > can fix the rest of the bits later incrementally.
> > > > >
> > > > > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > > > > keep the binaries?
> > > >
> > > > Can we please conclude on this?
> > > > Peter, can you please fork the repo? I have tried many times to reach
> > > > you on IRC but failed.
> > >
> > > Probably because of travel around KVM forum.
> > >
> > > I think given our CI is under pressure again due to gitlab free tier
> > > limits, tying binaries to CI isn't a great idea at this stage.
> > > Can Ani just upload binaies to qemu.org for now?
> >
> > I agree with Michael here. Having a full ci/cd job for this is
> > overkill IMHO. We should create a repo just for the binaries, have a
> > README there to explain how we generate them and check in new versions
> > as and when needed (it won't be frequent).
> > How about biosbits-bin repo?
>
> If QEMU is hosting binaries, where any part contains GPL code, then we
> need to be providing the full and corresponding source and the build
> scripts needed to re-create the binary. Once we have such scripts it
> should be trivial to trigger that from a CI job. If it isn't then
> we're doing something wrong.

I was thinking of commiting the build scripts in a branch of
https://gitlab.com/qemu-project/biosbits-bits.
This would separate them from the main source. The scripts would build
a version of qemu-bits based on the version information passed to it
from the environment.
Before I committed the scripts, I wanted to check whether we would
want to do that or have a separate repo containing the binaries and
the build scripts.
Seems we want the former.

As for the gitlab-ci, I looked at the yaml file and the qemu ones
looks quite complicated. Can someone help me generate one based on the
build script here?
https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh

> The CI quota is not an issue, because
> this is not a job that we need to run continuously. It can be triggered
> manually as & when we decide we need to refresh the binary, so would
> be a small one-off CI quota hit.
>
> Also note that gitlab is intending to start enforcing storage quota
> on projects in the not too distant future. This makes it unappealing
> to store binaries in git repos, unless we genuinely need the ability
> to access historical versions of the binary. I don't believe we need
> that for biosbits.
>
> The binary can be published as a CI artifact and accessed directly
> from the latest artifact download link. This ensures we only consume
> quota for the most recently published binary artifact. So I don't see
> a compelling reason to upload binaries into git.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>

