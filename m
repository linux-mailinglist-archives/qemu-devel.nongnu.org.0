Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE535601260
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 17:06:33 +0200 (CEST)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okRhI-00088f-HP
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 11:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okRcH-0002xc-B3; Mon, 17 Oct 2022 11:01:36 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:36696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okRcC-0001iI-8A; Mon, 17 Oct 2022 11:01:20 -0400
Received: by mail-qk1-x733.google.com with SMTP id f8so6783642qkg.3;
 Mon, 17 Oct 2022 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsO1nGkDSwWGk4qjElelKMry5SVyfPNpxNU6je61czM=;
 b=Nx0YPf5eXg/l8KnYmA2lLyw2nl09ts3pVwOlfyCcbZziCyN302D/NsLDrTiNgOdEpB
 5j1GTR1oQYGsWa98Sr7ijqPkl7Gr6MXtgrWAaFSJl6e2/RMVDIqWo2xx0BrXURANjKJj
 XoHbfrtYvk9o1j7AWpwOD94fF/hm+3qKLz/uQeeQXA8Ue6CHgVDtmcmO/jdmj+J5B9NN
 aks4chOuMQu46UzvPGCmLVq5ym8kUoH1oCR1hoqsmB1kJvoApxySBz7B63VvW1NuYJuG
 QBdiAJft3X+C1h434Ki0crdJzOcjC8dDnpL7NAxU/NQH15gF5knbZGHVss6Z655gHh7L
 JzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsO1nGkDSwWGk4qjElelKMry5SVyfPNpxNU6je61czM=;
 b=EmeepgqqnxUC0z8KynOLRh+E4dgM66dl/weUZRxNco36jU5adCbVdDTAOKO7LZq/2g
 VPFbkuTz4Lf1jnlBuBf7nnuvTxF/KaKLgojXFnYH7v2tbh0q6a1NqlMztTvM9nVzmIhX
 Jeemrk9PARPNXkJuU17dG6Gg+26H5u0yFn36cF5MxwRkJkVbA9E7tD1bdk/exfAr9rSG
 OPs+EqVNfWxEcYRu7JS04ZteTATWvMzO9tgGTPu9sqrOwSjNTt3GU87HIQSZsZKcaxnP
 eXxCM8t12iwE/CSBH605Nm4Xg/14NCu8FvDgmyR5vtl+mY3+LDl/+ViVpZgSZ/05mHRr
 kvjw==
X-Gm-Message-State: ACrzQf2AnbSSosMt6+378zktyvTqhIbPBHfPJOVi8sh2RMaySSrgtrB6
 iItb3gRSKnpssvfLyR1c7RusIcxheivE4/lg+jc=
X-Google-Smtp-Source: AMsMyM6n+EmvjjKAcRRLQazaw+0fVHcu9Pv5CkGiV15HvLnqLqhDv1T+AR9sIolyInko4zmRnTsKFTPLB4a/N1yPwc4=
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr7848758qkp.389.1666018867690; Mon, 17
 Oct 2022 08:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <87ilkwitc6.fsf@linaro.org>
 <CAEUhbmUfm+V-pN5j17VxRvYd1RGJYa3KF=op9Z-nB5Xq4RhUmA@mail.gmail.com>
In-Reply-To: <CAEUhbmUfm+V-pN5j17VxRvYd1RGJYa3KF=op9Z-nB5Xq4RhUmA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 23:00:56 +0800
Message-ID: <CAEUhbmXc+7s6udZTNE7AeY+YkNr42fQ2HNHpDufZKDhB5qfL6g@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] tests/qtest: Enable running qtest on Windows
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Alex,

On Fri, Oct 7, 2022 at 1:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Oct 7, 2022 at 4:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >
> >
> > Bin Meng <bmeng.cn@gmail.com> writes:
> >
> > > In preparation to adding virtio-9p support on Windows, this series
> > > enables running qtest on Windows, so that we can run the virtio-9p
> > > tests on Windows to make sure it does not break accidently.
> >
> > I'm happy to take this whole series through my testing/next however I
> > don't have working CI for the month so need to wait for my minutes to
> > reset. Have you done a full CI run* with this?
> >
>
> Yes, gitlab CI passed.
>
> > (*make sure any CI run is only on a repo forked from
> > https://gitlab.com/qemu-project as you won't get the discount cost
> > factor otherwise)
> >

Patch 4 and 10 are already applied in the mainline by Thomas.

Daniel will queue patch 14, 15, 16.

Could you please help queue patch 1, 2, 3, 5, 6, 7, 9, 13 from this series?

I will rework the rest of the patches.

Regards,
Bin

