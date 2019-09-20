Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00353B90D5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 15:42:30 +0200 (CEST)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBJB8-0001Lx-2I
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 09:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iBJA5-0000ii-Sq
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 09:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iBJA4-0007De-FR
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 09:41:25 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:42998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iBJA4-0007Ct-AI
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 09:41:24 -0400
Received: by mail-ot1-x32b.google.com with SMTP id c10so6192560otd.9
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XpJ+gNv3unFsKBxplhY3gdsL7ZKgyrum6Opknx5Ff0=;
 b=CMUuQbZ5SIYsGTkJWLlt6S6WYxyLvOqdDGGRdl/ayRgg62u1i92+VF3SSz2Y4FmYcR
 lQ0TJJD0eJ9tnNmgY4OvuMsuaaTFFr05QpysG6AltK84pWBox+H1RYTXe0JolUMb068L
 sBXio5hcdwc417J/+EAM8481UhPmHLxp31PKqrj35lbZ1gyC4FYmpGQk3qpHqkDKeAFa
 YCosS7OLCOVI9tRGpIfCIb30Qqut7cKzve5hC7GCzLoZjEtTYMMXiprEUmO05wcLmNwi
 YMwzwlSMIFFy2gnlFIVPic4mk7EkVTb7cXpNmwRw5NzOtaGSEEQMK0Pjbptsw1+aZ04H
 h7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XpJ+gNv3unFsKBxplhY3gdsL7ZKgyrum6Opknx5Ff0=;
 b=K/j4eDO2hUkm5q0PNDwiduKTZY+FIl06S9VWxExL2TS46aITnfJ38vRUgn5Amdl58v
 j8VjeVn230JyRjg56iIp7/SKYtMIjgRQMJs2ozjidEV2vXI0pmgbsncWzaP+ZOWnv3pp
 6Yv899vUA7MwmNq9IqBNOWvHQXswWfh37GWUZqTbq8Es1WuZ6xGOINAVZ5sTs7uR6Tix
 sLEk9M9JYR4ZTmbguNaZx0rxJwAFZ1yL7AW5s4FoX1d42UNaEanawFjdsy+fBD/CALkc
 zXLFa5Kpq1LhlgUuvUt5CbYNZzRKFtjpx5X+mROMFmEWssRCXq7DQvMWfAa6cg+wYF01
 IzUw==
X-Gm-Message-State: APjAAAXfE8fzf0BXANd5lmJcunu9Ih8yM3ZDPSFO56e8tWeBy8FfcOgH
 tRC6WRDKhXQDLsoFsTUsG7wtOGezyMnN/PqBWPDaXw==
X-Google-Smtp-Source: APXvYqy1k0RMBnLYHN6eb0BPq39iE5GVyYKWRuExhqGSvlevL4DQ+JT8kkyBrTfUwPUl2nrRbxUjWyJ2/ZR5QEF/B4g=
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr10646596otp.221.1568986881835; 
 Fri, 20 Sep 2019 06:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190919124115.11510-1-cohuck@redhat.com>
 <CAFEAcA-WLayY+jL9mKV6zrstSZOynja7=k6Cjx4wR9g33jFPQA@mail.gmail.com>
 <20190920130038.4eaad8f0.cohuck@redhat.com>
 <2b470747-b881-d7e6-1c8c-0a446b044fb9@redhat.com>
 <8050fccb-e39f-1745-0728-129e42222ef1@redhat.com>
 <20190920153257.0e4302d7.cohuck@redhat.com>
In-Reply-To: <20190920153257.0e4302d7.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Sep 2019 14:41:10 +0100
Message-ID: <CAFEAcA9aMVTjv9pUrQVmx8Ygz55Qc_tAbo=nRD8t9Jdhoe5mwg@mail.gmail.com>
Subject: Re: [PULL 00/34] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Sep 2019 at 14:33, Cornelia Huck <cohuck@redhat.com> wrote:
> Peter, FYI: I'll be on vacation for two weeks (starting later today),
> so David/Thomas/Christian will probably handle any s390x-related things
> including pull requests for that time (I don't think I want to put a v2
> together in a hurry...)

No worries; have a good holiday!

-- PMM

