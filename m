Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB53370367
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:19:46 +0200 (CEST)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbU8-0000UW-RM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbT6-0008Og-6E
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:18:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbT3-0002d9-2F
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:18:39 -0400
Received: by mail-ed1-x52b.google.com with SMTP id c22so20696659edn.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sgH7Xc+JhEbXlE/S/ZuEZ1wzZmQvnH2wnbQUqCsZd68=;
 b=MokzxTG4w+vw0S6v1qCm+dIvBXJw+gJG25P189Kmx8HrXl/B9nni1PW8RV0mTljnsI
 lD6ngoLAzc1Q4fIKdwEZoxFrr1b7pPSlMj3U6ramQiiZuDIMuZd/rWrind59x+apGrj9
 S8tltb5n02plq/9eyghNTubZyMQ3kZuHJidD0/KqYtXxTc85g98lEsXkFU5zZDjh3rvI
 HwiOC2W1LP8brW7iEtmWP7uT5G2WZocGmvCJ4HNg4gjX8YUaM+GwmLX1GHBFq/R/YgSn
 ikxYR1AB7rJu4SXvoG1NptcTpSX27u7DsL5K0ovQWg4qME5KQXTKJ7Tc1tdOB5zdYLck
 Km1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sgH7Xc+JhEbXlE/S/ZuEZ1wzZmQvnH2wnbQUqCsZd68=;
 b=Wz+uAzlyRXfbFlD9Fp2c9W7WAH6yTsdcoTWDPcqyEJiBLv7Laq8xvRRJKDjsdMF42l
 PQrgN/JzEpIpN4dspu814N6QtVPo59uQIkTg3ALG0qkvRavNJpBJLG7zTeLjuFf7lD/Z
 MVQLMrLg3Sx+UyaQUxV74rZPoDIc+fZYCWgLfhqQ4jnF8WV82iLIZYecvnfBsuHlTCvs
 GahV4f9xMT9utTtAh6HMSJkUlTnzr3uQ1wkqcIqRxqYgdXl4TK4zFk6YA+OQATpGPnvp
 7+yUXg1rdhYvTM2PvPIkCHgcEvSkHYFY9U3PHb++tVj7GzDSfKXx9ATggzy0qOfxgMDC
 5wWg==
X-Gm-Message-State: AOAM533zB8EBZLFsELRbs2FsG1xquidaiD2zBiMd8hNS/WQZWLAtW4ym
 pNQG8iJCnS75zhdxRP5GTQ63eYsv36LjV/enq+AKQA==
X-Google-Smtp-Source: ABdhPJwp1RsTi8RMKC0TolJLx1cU4dujwJxl9ry7GqSThy9qtZ/AIvQ8nxzXoZac54bHxS8uxfJFtYwlhz65IUHEda4=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr8599727edu.100.1619821115092; 
 Fri, 30 Apr 2021 15:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210430163309.4182922-1-clg@kaod.org>
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:17:32 +0100
Message-ID: <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
Subject: Re: [PULL 00/18] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338e=
a4:
>
>   Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210430
>
> for you to fetch changes up to 1401dcd8aac9039797b995bfab078877a820c9c5:
>
>   aspeed: Add support for the quanta-q7l1-bmc board (2021-04-30 10:30:42 =
+0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * Fixes for the DMA space
> * New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
> * Acceptance tests (Joel)
> * A fix for the XDMA  model
> * Some extra features for the SMC controller.
> * Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)
>

Fails to build, OSX:

../../hw/misc/aspeed_hace.c:128:49: error: incompatible pointer types
passing 'size_t *' (aka 'unsigned long *') to parameter of type
'hwaddr *' (aka 'unsigned long long *')
[-Werror,-Wincompatible-pointer-types]
                                                &iov[i].iov_len, false,
                                                ^~~~~~~~~~~~~~~
/Users/pm215/src/qemu-for-merges/include/exec/memory.h:2439:33: note:
passing argument to parameter 'plen' here
                        hwaddr *plen, bool is_write, MemTxAttrs attrs);
                                ^
1 error generated.

(OpenBSD reports the same, but there it is only a warning.)

Same thing is also a build failure on 32-bit hosts (where the types
are genuinely different sizes):

../../hw/misc/aspeed_hace.c: In function 'do_hash_operation':
../../hw/misc/aspeed_hace.c:128:49: error: passing argument 3 of
'address_space_map' from incompatible pointer type
[-Werror=3Dincompatible-pointer-types]
                                                 &iov[i].iov_len, false,
                                                 ^
In file included from /home/peter.maydell/qemu/include/hw/sysbus.h:7:0,
                 from /home/peter.maydell/qemu/include/hw/misc/aspeed_hace.=
h:12,
                 from ../../hw/misc/aspeed_hace.c:14:
/home/peter.maydell/qemu/include/exec/memory.h:2438:7: note: expected
'hwaddr * {aka long long unsigned int *}' but argument is of type
'size_t * {aka unsigned int *}'
 void *address_space_map(AddressSpace *as, hwaddr addr,
       ^~~~~~~~~~~~~~~~~

thanks
-- PMM

