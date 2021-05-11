Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B037A112
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:43:15 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN2w-00012v-26
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgN0U-00050M-8y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:40:42 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgN0M-0005kb-VL
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:40:42 -0400
Received: by mail-ej1-x636.google.com with SMTP id c22so208627ejd.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e9GvOWR/deBPIjb97v9+LHGVIOlOwzEGJrJtD7H/fW8=;
 b=hh+7ccQ7zPHDYhD1ZsqiQYQqNaMHkI0EpwJi4Qc1vtwxd/GGmNNo2Fe+XgBWDFw9Up
 4GhIzC6LdpjIZxHjrX1dqXt0OxeUYXowhH6B7UzgsWNRZaich1dmjEvIlDAbJFl1/sRs
 UhPJTMs7cCyBiNf9Xn9gUUSKNMi4lQ3d0rHhv72sFnW0/z0amX045jWdGQWQBP4O5XCd
 W12qCf+18CmtkumtBXV5o3kPt+irARUqiqSj0yJQNbN7byi9wA7CxZUll4SCOhS/Ivpz
 rSKtGCsDSDKu+0M5eNLLiPADRs9x4FKgPZkcrRJnkodUgAWUM9YxDLqe5TmjNO3gJwh1
 XMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e9GvOWR/deBPIjb97v9+LHGVIOlOwzEGJrJtD7H/fW8=;
 b=s2bbNpXNo2AtbltjpoDcu/snYkVA/ph9N5g+icgNXgiU11EieZ9G02Ns7ZKlFc86BJ
 7XNhsTqlyEUwXodSaa8lowjGq7Pg8/fe6ew9/koREAXe/JQsgXsSdEu3DiFW4JKnaKZJ
 yas76icFpiNUbs8NFJyDXheuBxD3uGRHj40cDrpgRO1nJeq3dRe+GyxhQxrrq4ZvJmSQ
 wClQ7IEUV3Gc9ZDhSjPSNiIHqODHZQK3SkACdOzGtJdznX8VztZVlwXc7HL31XpTbFE4
 4L45jLxgKgPQAmGM1XEkADJuXsNZe5HmXgio9a/ZndHxUglwy4vjdT9cHNYe8mkGEqLU
 f2YQ==
X-Gm-Message-State: AOAM530sglVWMUmZmbLCmgFcJAYlp436f5V9j5/IPqBoku+M5znZO4JC
 Fym1M7y/8fuBGcvy4b7h/zj/AGgo3l8tRKHt7NSDWc50fpw=
X-Google-Smtp-Source: ABdhPJx0jD19C0NmRSKQnjSEbmo+I38Z6wFgOjnQOgZw+sBs1dxcW2mzr4SX6bEMxo5Q01mz6MLB+0ovdxnzTCSw05g=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr8094091ejb.56.1620718832508; 
 Tue, 11 May 2021 00:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
 <e54ddd00-b0c0-a998-60fc-ab491c23b5f7@virtuozzo.com>
In-Reply-To: <e54ddd00-b0c0-a998-60fc-ab491c23b5f7@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 08:39:20 +0100
Message-ID: <CAFEAcA_GEth6Ar9PW4YppAUgQ2+20iCZKLnB-AYATeiHvc04VA@mail.gmail.com>
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 06:59, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> Hi!
>
> Kindly ping, or what's wrong with it?

You've never sent me a pullreq before. Pull requests from new
people are a pain and take more time to deal with, so I only
look at them when I have the time to do that. Pull requests
from established submaintainers are easy because I know they
know the process and they have their gpg key set up and so on.

-- PMM

