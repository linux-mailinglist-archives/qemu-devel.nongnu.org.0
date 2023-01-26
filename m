Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D367C454
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKuse-0002dl-H7; Thu, 26 Jan 2023 00:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pKusc-0002dc-SJ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:32:58 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pKusb-0001xy-9y
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:32:58 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15b9c93848dso1251164fac.1
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tJAQgBRuwpXxWSXisMFNNhhlbaGmkLss4fzFxsPQzfU=;
 b=ZncYNnnhEqhhPst6qVkgMxts8Sll+Kn9+2JRpLXBY3R65P7i30YnBafkiw3FrMNrjI
 b5eowmqak/1Hr3HrdXfZIHLT0in8n3XmdGvzvLOtcZcZq8UVIqfmr3VhPyM94AXMIgzM
 VrGS1D0FF6sNcpqT9z/M1kvMJk/m1H7U2aEQ7s8G6xwfVzzWEqA9rVQEADyJkIsqPP+2
 ZIr9LRKHgWyIaY5AQ9JB+e3jy22GstNGyDyuZatwufcnX/1qQQWegKRUeV91Qp0mqs+z
 Tn+5/Ezk8sMmWltYWN48rWaoKlvGq3qGTW2Zau5SAJ2/ImOxmTCu2zNRMgN/w1Vwsca1
 5iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJAQgBRuwpXxWSXisMFNNhhlbaGmkLss4fzFxsPQzfU=;
 b=jk0bfge8jrfhbTXDiHd6wjV3c9oTDFsGDZBDEYpvrLtCghMDMVR9Fo1dJ9WMdF9hwP
 W8lRTyhx39lYmWwvXOqF6o8RP/zlCZqGilkTwOy0cWamI7Wi5ULXoRCo0u8YZeGxeMig
 +dK5f3Q3ai/I/Hr+Y0c2A3NDdsiGoWu1aiVQ/dTM5KyQgMHq46yCWC+UNsxZ6xgr9az9
 AVSP55S6WHt5dsw7PWw/yChw9i942PJTFCvG0X1q6qzBy9D4GZRdJlv5H7Q46uirmA8b
 dLUv9sRcEKnwVutZ1FEeKtB7WTMdjpu/SZIPtMQI4M47zK54Ou3+79m91owRRF+MP+w1
 P70A==
X-Gm-Message-State: AO0yUKV0rDJgC5rjD3fxYcK6399naE3CXxEDJaJgVEVhIWlLYEvPm8bG
 Hk0fPVIr4Kv5ah3nD1llSXCmkk5h5hJql22Ej5Y=
X-Google-Smtp-Source: AK7set+WOpkr7U5MlgMG9N0kqnSZnb4s8gS05hCP8kcZmvzBkPLTQWkfRVn8IbmO+1hkpeSQe1aYQ+dCrZ4xa40gl2c=
X-Received: by 2002:a05:6871:829:b0:163:2d87:3a90 with SMTP id
 q41-20020a056871082900b001632d873a90mr413948oap.1.1674711175744; Wed, 25 Jan
 2023 21:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-8-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2301251406170.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2301251406170.1978264@ubuntu-linux-20-04-desktop>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 26 Jan 2023 05:32:44 +0000
Message-ID: <CAHt6W4di4kUQxrXtE9Y8Nrv-H_r0OdhMBk7fo9CwDBDUaDkhnw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v4 07/10] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
 alex.bennee@linaro.org, Anthony Perard <anthony.perard@citrix.com>, 
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=freddy77@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Il giorno mer 25 gen 2023 alle ore 22:07 Stefano Stabellini
<sstabellini@kernel.org> ha scritto:
>
> On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> > Replace g_malloc with g_new and perror with error_setg_errno.
> >

error_setg_errno -> error_report ?

Also in the title

> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Frediano

