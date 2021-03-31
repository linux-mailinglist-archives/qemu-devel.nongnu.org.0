Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA59350002
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 14:16:13 +0200 (CEST)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRZlc-0005Ny-4s
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 08:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRZjp-0004wi-Hg
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:14:21 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRZjn-00011z-Rr
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:14:21 -0400
Received: by mail-ed1-x52d.google.com with SMTP id w18so22123997edc.0
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1U6BJslwdxqdRa3VUD00HCQsnqom4i8x2Cwr08Gz4E=;
 b=JZot2P399DS1uM6dMsOE3ggKUHpmuKPt81UCN1bbupO5LNuiJ+25pC+sCM39MQPV6e
 0QWOaSgVErHNPDoaqtyi1c/zAjUCW9RAOZm1ts+T72HNAeHrsfkzmCjKTMdWVl/RnMqe
 lbvHLZscOeSYydtM7JQ7goyP31GrPBKANxsmyyf3KjkOONo8xyEIORh1D6+92CZ4ve5u
 GBC7wEHY2V3ywdgPWHeLNGOcbD9KsHD0O0PiKVMDU6OTfQz4Xazcwm/1uIcZ0ARwQlYj
 RwLQxlTYio2U8iStLIN2yphPyFvskE3TfYGaeorS75hx1iuBs4vh5VdLxS6vf8+ppVqj
 nXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1U6BJslwdxqdRa3VUD00HCQsnqom4i8x2Cwr08Gz4E=;
 b=gtI0YbRUzZbF+Yev4IMtJVav6LcJIaJA0gqxuniOkltPs5jB5hOMNgeTCb6lb3b45x
 PqqvX3XwFazroLDSppAKGhSEoezAByM8a1pn1G2b4PcE7estKJdM9p1LpAXwOuYBSreF
 n/qOK/Dm5sofVorYNzkcqbugCqF3zKknB/8unl4XWghZmMfjsorWF71jd60vPiBV/yPI
 nZYvJn3NJAc3yCwpzV987qdDCMeo1E5vU3mwGdsLbJ9Tc0yW0y3XBE+ECt06owILEsTl
 SKNZtk8tu1ApRE9Yf4Ww7H0kyudzw6xkonKe88ldevdcJ9ahAA+WXtlrFa5M8r9GvRcZ
 rjAQ==
X-Gm-Message-State: AOAM533QM/SEsSqhcQROuSLU2bHiskw+apDBmSpT2XLHjDvhKiUveZ5x
 I9HsIqz4VhEt14rdYa75toon+XpS2+4+gc2oCKV5og==
X-Google-Smtp-Source: ABdhPJy6PfJlu0geRbveSRGlu2OyVN8NqTwx5YW5ghAGyo+X8XiPuW8YS4XieS/laOCF68f8COzQOJWUiJJevoZemzs=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr3335755edu.52.1617192857252; 
 Wed, 31 Mar 2021 05:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210330143846.721955-1-laurent@vivier.eu>
In-Reply-To: <20210330143846.721955-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Mar 2021 12:13:44 +0000
Message-ID: <CAFEAcA88ym8_xP24iXwP9eY2x5YxwpymQJuQFROc4+YTx+hXCQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 15:49, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-=
> request' into staging (2021-03-28 19:49:57 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 13e340c886679fb17df02a35e7d82cb8beb6e9f4:
>
>   linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its length is 0 (202=
> 1-03-29 21:56:18 +0200)
>
> ----------------------------------------------------------------
> linux-user Pull request 20210330
>
> Fix NETLINK_LIST_MEMBERSHIPS with NULL/invalid pointer and 0 length
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

