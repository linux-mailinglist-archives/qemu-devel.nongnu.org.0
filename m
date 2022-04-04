Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60074F18EA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:54:04 +0200 (CEST)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP1o-0004iZ-0m
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:54:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nbOsT-0006gX-Da
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:44:28 -0400
Received: from [2607:f8b0:4864:20::1036] (port=55242
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nbOsQ-0008HA-67
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:44:25 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gt4so3270721pjb.4
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d79XWaXsjLoSbFrjAT0mbQjyupdsepHjEDexAdluI8I=;
 b=aXtz3vqmivrMrl0SBDi4bfEnNwfl/6qjCcx6ezBWPKNNbmUagdjqYmSzfVPupTP0U6
 5q4Cpb6EgIdpTG150t2+Q6Wl+JBpqxtqfp1vGfmGv8/9SYTPXYMeI3LhwepxhNmlWHwv
 9/+3d7JxPQcqYAq0HxiFHWbZKIkAH7tFfI9k+XVFwf1tU/qoSCap0tcb8igspeuK8T21
 SlPSsE7xZGWMWzdqkaIkJZuoLCxy4ow5sW3Q0QU9+LbtPmdFwja7jyqWMulOsToEPtFC
 56Ijegmfyj21p8wc2R1whnJFdrKa7kchSBKZS1Rx1Rf+hBVw4Npv9bKNd8qoTnvZNZQz
 ht8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d79XWaXsjLoSbFrjAT0mbQjyupdsepHjEDexAdluI8I=;
 b=KDMWln2U/+GDRdawSyrTpnIp1nr1QLlIcsWIQlUzO+bNYi9qFX8wbLalXCFyzawPgF
 YAehRIljjf+V9igiaz9JJU4ENu7aGew56VnMwf0VthqoeAX2pGh3I1XlC+NYQjWlWOcm
 EHZCw15Z+HuIie9uqL0YAZgw9Cty/4OX9WUZfuKFEed9JKJOOXCe51Yqc1MEt+iCYDP6
 iRiNxbsTLX97W7MkkOAxh+dcZCNlw3vavqv5N++EYj+qPpY7pBrLLnVYZNB++3E2zR+C
 WoDDPnyNB6Pkxu5Q9OB9z0qoIX3N8GEFOzTqcTX0za4mloiOlh4O3hxPMkqJsll/wz2m
 b1WQ==
X-Gm-Message-State: AOAM533jBQQSXo83wylBzNYed3dcq8ZzVTfLF34WMV8A4Vi4MlXVwiTK
 KvpgLGF5ZS3uNSCRoTUF8lGktLGXm9Wo27ZHHXs=
X-Google-Smtp-Source: ABdhPJzkuBVyq0F+mbXKUe4ZBMGjX750LujxviMvCAjw0dthUVCAW5F/F/jCIJ+Tb5s27QCwRAxObHnNZRXNp8wrUcM=
X-Received: by 2002:a17:90a:5913:b0:1c7:2b71:65d8 with SMTP id
 k19-20020a17090a591300b001c72b7165d8mr472500pji.87.1649087060835; Mon, 04 Apr
 2022 08:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220403072148.9248-1-sakshikaushik717@gmail.com>
 <Ykn5qQzvp/+s6ulH@stefanha-x1.localdomain>
 <CAFt73e_Rku3pgQ+YAj-zAcrq36JJd1A1pBA-AX8JMrqRY0f5TA@mail.gmail.com>
 <CAJSP0QW1Z-wVwNW7rKYwLLn5Sv5C8K_DwbTK1NE0MxN1rHpoxg@mail.gmail.com>
 <CAFt73e-2pf1XDp66PVCPq4kUiegChJGhaiEyHAvyWUf77jbNEw@mail.gmail.com>
In-Reply-To: <CAFt73e-2pf1XDp66PVCPq4kUiegChJGhaiEyHAvyWUf77jbNEw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 4 Apr 2022 16:44:09 +0100
Message-ID: <CAJSP0QUrgAX8PKg0b422bu_vyXyW0L4VyxRiEOqvjscjAHXG5A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH RFC v2] Implements Backend Program conventions for
 vhost-user-scsi
To: Sakshi Kaushik <sakshikaushik717@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Apr 2022 at 15:51, Sakshi Kaushik <sakshikaushik717@gmail.com> wrote:
> I am not able to find vhost-user-scsi inside build/contrib/vhost-user-scsi despite running the 'make' command.

It is probably not being built because the dependencies are not
installed on your machine. Here are the contents of the
contrib/vhost-user-scsi/meson.build file:

  if libiscsi.found()
    executable('vhost-user-scsi', files('vhost-user-scsi.c'),
               dependencies: [qemuutil, libiscsi, vhost_user],
               build_by_default: targetos == 'linux',
               install: false)
  endif

The build machine must be a Linux machine and it must have the
libiscsi-dev (Debian/Ubuntu), libiscsi-devel (Fedora/CentOS/RHEL), or
similarly-named package installed. You can run QEMU's ./configure
script and look at the output to see if it detected libiscsi.

Stefan

