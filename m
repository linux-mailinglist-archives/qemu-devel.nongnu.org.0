Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAA186980
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 11:53:40 +0100 (CET)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDnNJ-0003iN-6W
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 06:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDmGy-0006Qb-La
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 05:43:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDmGx-0001bq-5J
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 05:43:00 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDmGw-0001Xc-UD
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 05:42:59 -0400
Received: by mail-oi1-x242.google.com with SMTP id r7so17082872oij.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Plxf05kOTrjUferyVPrm8azk5HMVdfSr1vXso76xQZA=;
 b=F6Et40ZbOdjUTxqgezGr+IVOk0u1M5CnTYKtggsyHTusfGmPbSaba++XTRUSWbTc4P
 cJ5+eRO2zIujGctgsXwiZ5rrADIzguZXjuTJXVl+dR3upWWFdObAYFSjDAXrMmhkvyse
 5DxkgcE2zUxwx2ORv4XRofVUHZJYYScivvSjcocsrHqAILwA8wSuA0UbMIfDi0exdtvQ
 6xtZHkQn9IKEdCeySLyT9glkUXlvp88f95ki1/acq1VbCfw9ZruR0/kQ12S+Q4J5PV08
 ie7Hv4NUWTWxJyuSt9gzxtIQQ6s94re/ujKERjvcKfeYCvUYj5+Jm+aeNg0+MV+uh1Cc
 dxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Plxf05kOTrjUferyVPrm8azk5HMVdfSr1vXso76xQZA=;
 b=SjoSJNDkHodX+jI7lIQ8nNmaox/AVX+2EmzjZB6qhhbQIQ4V4LtCbXjvtbrkNDcCl1
 VdbDsM9NixL6YSwCo+1BlxeOOV3+s2se7utMDXwWw5cbGSXRjq5ihgnQqLbtDevmEkZ8
 u6J4BwA4fa0b/H9SkldA77IBNXGCHuHxnLQP/B7c5U8ZjpnYUo3KV6R3WrFhzz/Q2BM4
 PJlLNmaRDxxJVaSpAh/lpZ/3C2ChiKiS/drGrhUrv1zqCjKPY0Suh7QdgBXuEzy0KADC
 wL3hoBwyPNeLbhpDbVSkGGQwaMd32KWL30kYIr4nYgslkxrpXZKfH/XbjN7uQhY+dEvW
 P85Q==
X-Gm-Message-State: ANhLgQ3TgDCtcy2VzKjC5KU4LOrZvd7MvDlSYcJFDqPo9pFXVo2kVyMV
 K6UJFYL8t3m395j0JVjsrdpU34Tt2/0MYzWvUF14Eg==
X-Google-Smtp-Source: ADFU+vuWk4EyGPpy2pSbzYzHnj1P0aYNfPdP+hoMUGWuCraYrFZDhxnqmo+mHgYzX0dNPoq7M5DBNbhGjHHdmHDblEw=
X-Received: by 2002:aca:c695:: with SMTP id w143mr16796754oif.98.1584351777886; 
 Mon, 16 Mar 2020 02:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200313163616.30674-1-peter.maydell@linaro.org>
 <8e2ccc12-6ace-46f1-c8c1-efa898b301b8@redhat.com>
In-Reply-To: <8e2ccc12-6ace-46f1-c8c1-efa898b301b8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 09:42:46 +0000
Message-ID: <CAFEAcA9dgUj8cNiNi6pDcBgcxc+UxL5J2FuGxW86X-LPQMn0eg@mail.gmail.com>
Subject: Re: [PATCH] docs/conf.py: Raise ConfigError for bad Sphinx Python
 version
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Mar 2020 at 22:30, John Snow <jsnow@redhat.com> wrote:
> When was ConfigError introduced, and what's our minimum Sphinx version?
> (Hm, looks like it's not versioned, so I'll trust it's been around a while.)

Yeah, it's been around a long time; our minimum Sphinx version is 1.3.

thanks
-- PMM

