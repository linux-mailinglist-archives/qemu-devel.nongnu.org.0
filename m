Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170104D9DF7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:42:48 +0100 (CET)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8Nq-0007bp-IY
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:42:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU8Ka-0006fS-LM
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:39:24 -0400
Received: from [2607:f8b0:4864:20::112a] (port=42512
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU8KX-0000tr-T1
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:39:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso204081307b3.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NB1hfBjaUZKdBvf4F4M7oYX8zRwdjasQSfhF1RI9/YI=;
 b=X4+BXsI9+XVFFpLd3Mzv6CKFzXJ0NMJeCfn+KiKalbZaQ0wPsveTFVGf6jENFl0mql
 NJ/vDMam6z7pQ+ro57OiSWGvsf09H5YWsTTKkRLCMIbD75WY+q81jU8FefKj05vdFg4S
 CZHbEr7d35UAkrT0c3o4Ju0pJ5PlXkacVg2NejRXHyWmDW4ciQXtL/8luADyGpAVQZWh
 JmW3kjk1ugJpHorpWCPHT6gMxhHbIxVqNhNKsgn+sYOELjHUinemKhgRVWKrw3mSGh9X
 8pkpZppnZDUMyeaN3HwwOZQcjrlES4Q4KG1Am+koG0wawe2+2pr6UKDqhvph5hLl1IGe
 sD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NB1hfBjaUZKdBvf4F4M7oYX8zRwdjasQSfhF1RI9/YI=;
 b=ZZ8SndbojM4kCJeBc3T+GGRPb89cq9So03u1L1VRuDRz8Rgh5BOAl9ik/CgaMa1YRA
 d1LRCVrUJ+L6eS88XymyO67WmvtmY5VUzZ0z7t9XFGgtGNo8nno5xo8Oaec/FudrKg3L
 XhLB8f1ekolRIseQCeHV6zCE8JPb1HQmCh3Dg7Iy4Fr3OvXHEuLqS0YtAo4GuAzJG9Fp
 WO69/x2Rkgej1t4ZJvS4mUOD7ZXrqj4UK95EqBRFPcTY5NSc3TCbG7ur9OKwHaZV0hai
 a4yuAtUZ1M2JnJuCo4nUbjZtrntITXHh1IhRqR5mMCssMKHH3gdlIXo5AEz0S+ivGzrS
 CAaA==
X-Gm-Message-State: AOAM532u1NjOj4OH7xN/fScbfY40tS7yJdjTh3gPurJGj6jHzhE7YBsT
 9r+CvZ6nMrKRzt4+KFwe6M2RDekmnATbgFsT283WHg==
X-Google-Smtp-Source: ABdhPJy4B+vafIOFLg0BuzJJbpHHezp4gvb6Zrwm+RyYtdfeGIgZxAqNF4TnZ2QC/RVTWlNjjvjVJMfN3kmG9sKlpVs=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr1056042ywk.455.1647355160761; Tue, 15
 Mar 2022 07:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
In-Reply-To: <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 14:39:09 +0000
Message-ID: <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
Subject: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18] migration
 queue)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 19:44, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Mon, 14 Mar 2022 at 18:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I just hit the abort case, narrowing it down to the
> > /i386/migration/multifd/tcp/zlib case, which can hit this without
> > any other tests being run:
>
> > This test seems to fail fairly frequently. I'll try a bisect...
>
> On this s390 machine, this test has been intermittent since
> it was first added in commit 7ec2c2b3c1 ("multifd: Add zlib compression
> multifd support") in 2019.

I have tried (on current master) runs of various of the other
migration tests, and:
 * /i386/migration/multifd/tcp/zstd completed 1170 iterations without
   failing
 * /i386/migration/precopy/tcp completed 4669 iterations without
   failing
 * /i386/migration/multifd/tcp/zlib fails usually within the first
   10 iterations (the most I ever saw it manage was 32)

So whatever this is, it seems like it might be specific to the
zlib code somehow ?

thanks
-- PMM

