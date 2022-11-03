Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667B618567
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdWE-0002O5-Ct; Thu, 03 Nov 2022 12:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqdWC-0002N4-9b
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:56:40 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqdWA-0006La-Dc
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:56:40 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e189so1869240iof.1
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pRY8Ae4prZVMRdxRLi7ci467FVR2rbHIHGsAWlKyl7w=;
 b=UpbzuOj+4hXgcxbsZr+wTwIKPon/jvHOoTzS64YGYdwAZTfUII6wcyi6dmMHILErUg
 nZLsjSlprDy3YxJBGt4XsvXBjMOM7HGL+yd6jHvYMKdmQIyXspRN+NA1+SKD64M++xsT
 +pyzX8V+QbECkzvL7ZuhCXuC3L45UYMglFDd2drtysLszACXfqcVmG7pm/kP56miQH0V
 Oo5igmR7drgpH3BxzpUR9fkI+u8OgXFdgl8zOYKHNKSXmCTjGJX7pXZm1W57f9S5aCzg
 WyqgNiGPfdOjINAQpzMGVjSXSX2y1nHW3R6rfpRFKSp714rwWz7420u5U+eAlEJ3B32j
 H4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRY8Ae4prZVMRdxRLi7ci467FVR2rbHIHGsAWlKyl7w=;
 b=hE4Tbk7HCR+o8s/wfz3KGzaqUoTIqpcoXtTNikIl/7zPzAvtGEa+yqvvHBXPIjM//V
 xAPZM51jhSWDK10ny6skBaNsbrs2s6x0D5jqEHG9bIaUvgbKYbqzIUhDT8phXCTrC8NB
 Yvb//3h3ATVRT2YB8ee84zrLZD3FHz+POCjNn1lsnjPlSKXtx+Mm3jHGS89/bMmXdXay
 bmoGcPXA6LegEBEUZHvz8q89p/LOslq2j6a4i1/iKoAJVMWfiUCR4FyEbjFkUIhi1Y59
 Fu67sHToLwkpSFNg0j2Tu3cvWcjZlqw9MK5SxhjmWgVjqJVRDGaFnCPJfc7w8DmrgXWl
 8y2g==
X-Gm-Message-State: ACrzQf0H4Ns1Scn2aYNxhjZzTlaK2/JIMtsE7/nUIcCSuqNeOkxr4d1U
 4DqkQK3zggFlPzcUyA4ib7yHWi9h/eRQ2h4mxHa7Zw==
X-Google-Smtp-Source: AMsMyM7SIDVurd4Toh9ZZNFaQmX9zLrmxsr7dI9UGx7rTwspLA/N56cS9B6c/bzAfzem6IhjZCDahyoggzCgS10WSis=
X-Received: by 2002:a05:6602:346:b0:6bb:f236:ae68 with SMTP id
 w6-20020a056602034600b006bbf236ae68mr18608543iou.161.1667494596904; Thu, 03
 Nov 2022 09:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
 <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
In-Reply-To: <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 3 Nov 2022 22:26:26 +0530
Message-ID: <CAARzgwyVA8M_9S2Hio5m9Zin9JyeWcHUeejQJj6=e98FkPYL2A@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: philmd@linaro.org
Cc: mst@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > To pull this image:
> > >
> > > > $ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest
> > >
> > > Actually the URL is:
> > >
> > > $ docker pull registry.gitlab.com/qemu-project/qemu/qemu/fedora:latest
> > >
> > > > (or to be sure to pull the very same:)
> > >
> > > > $ docker pull
> > > > registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> > >
> > > Same here,
> > >
> > > registry.gitlab.com/qemu-project/qemu/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> >
> > I pulled this container,

This is fc35, the same mst is using:

# cat /etc/fedora-release
Fedora release 35 (Thirty Five)

Hmm. Something else is going on in the gitlab specific environment.

