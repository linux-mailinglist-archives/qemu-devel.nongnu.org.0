Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72750621E29
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 21:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osVfd-0004Si-Ui; Tue, 08 Nov 2022 15:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osVfb-0004ST-Tz; Tue, 08 Nov 2022 15:58:07 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osVfa-0003uR-I8; Tue, 08 Nov 2022 15:58:07 -0500
Received: by mail-yb1-xb30.google.com with SMTP id 7so14245415ybp.13;
 Tue, 08 Nov 2022 12:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cj8QwBWEkc9kNmgFJ9+RZDrxldyJXuEFWAGxVlyND4k=;
 b=kXDvdGbnJjncThVNcF+WoF/Pv24NiJBCsKyIqC2aDZVzmhCHy2wUC+9WZqp7bPXS5N
 uUj0VT/2QSqAZ0dmNRXZHFH+FWHmqKmhmLmg3dSIqM45iAqSgecbH672i893Txo8UIpJ
 bDZ5FOifzYP696JzUfwWpmoIOJyDQI8tqXdgO5r1TRJZgGcAU93PbJXMavulhY2x4Bt1
 9Xw0+qyVBajfB0sti4UMwk59rSHtmJOMnDB77FjrCuC7T22pJv0i4A3V4qhi4aepsTMr
 OohXVpxqhdgSBS9/PRgRkeH2n9qqT3OcH9VCYYSGqqjt4bA80Vot3fSldZFl9dkaumjr
 QaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cj8QwBWEkc9kNmgFJ9+RZDrxldyJXuEFWAGxVlyND4k=;
 b=1tpJUop+vGA8IjQf6sVwERj5KR29DLuF84GaRILmdADZeDffbfc/NJ5g6q/CKOf53E
 usO3GOO6CJbFg/Nyjj1nZe+U15i+HCGZRopSW+TzcoQwruNl7AD7/LwiPKBLD+Qfa3K/
 6+BN8T1nVDrEbfGagvy6wyKk4gNjyOlma7mh0mzh9pIspb7rI5bEfzDFPgY9fC/6DJeg
 9kMy82SIUtGY1XWd6/UitlF/tCwB8pZ6EX+ujgR5C961CEd1tLH3kY11cbF/pLzcLqd/
 3VZUXtoc1GD/W5rifM0tZGioITtluBPwdD08YQsliUkHOUFuwyKAeE5t93ccgYHEmxYn
 Gjfg==
X-Gm-Message-State: ACrzQf1Yd1xJBx2rvItl3UvoFQ+9vaHQ7DYT/Ay182E8knb/24B38/el
 jqqdFhdSP14sSTy8l1pdrONxSITtEKY51qh8HoU=
X-Google-Smtp-Source: AMsMyM5RoGJcD5fYQ+qFhe3kY/j1o1zd0tl8VlHqKLuotyHOMFLy8qKoPxF5I2hfWGHUdgqa1DJ3iaCprZuUkT/0XEE=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr57163323ybe.642.1667941084340; Tue, 08
 Nov 2022 12:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20221108183352.9466-1-philmd@linaro.org>
 <CAJSP0QVdQ=wTtgNVDChzu5U1ww3SZAa2HfXjuE4z5uOnFeT_bw@mail.gmail.com>
In-Reply-To: <CAJSP0QVdQ=wTtgNVDChzu5U1ww3SZAa2HfXjuE4z5uOnFeT_bw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 15:57:52 -0500
Message-ID: <CAJSP0QVZ8D59AM_tvgHzdhqF6EUefUgmyD9WMtfPUD=nn54v+g@mail.gmail.com>
Subject: Re: [PULL 0/3] Memory/SDHCI/ParallelFlash patches for v7.2.0-rc0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I've dropped the SDHCI CVE fix due to the CI failure.

The rest of the commits are still in the staging tree and I plan to
include them in v7.2.0-rc0.

Stefan

