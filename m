Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B15FBB74
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 21:41:50 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiL8L-0001qA-4L
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 15:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiL0C-0004XI-JI
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:33:20 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiL0A-0006gi-S4
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:33:20 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-35ceeae764dso137206587b3.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cNn5rWeqnF4nR+R4KRcx8rwD8FHKEvqgZpg70aQ4usM=;
 b=OwafHYqmriNfpu18sWyvFHtualu4d5hrhvNZYi9feZtK938I9aYwRqf4gZ1c2hBxmS
 AdVagO7Uoy9wMJ1sXrwQeiIg2iJ2Yjkh0Kxgb01YRYUtdWAgXLIxQUHbS74HxDFMNdv1
 RlmINXjhJf5GmwM907df1+F9GzXNU8MhqDjnolFgIE3ERkOhkasFwgRtiq42aA3Pxhn0
 wNwQZLXDemltivsFCRhjR/BDNMbUuY+kcf3gK4OaYO0CVPUAdejg1WfhP4gG2NmqtLOD
 AwKsX9RvBSleDIuRHmuBpUBaApNKLIkgXnPAbDjwTEIOQQvOJgwRHXBgPYa6Uql/HZss
 aqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cNn5rWeqnF4nR+R4KRcx8rwD8FHKEvqgZpg70aQ4usM=;
 b=5DFYOhE3IBi808a9jqYMxkoIAurJ4Wq8ngWnjQ7IauNGWYbR32W1AFOEPK66U3Vhye
 U8JIRcnmT7HcKCqiLTqiDaLMZo/I38dRoOaM8172OKQeHAp8wvaz9B9dzuiVZkMUYOQS
 cUNYVh3Q/FjIyf/ezGkr45O7bAtrfo81EN0IpvpLc5nzZoz0k7YdU2AWEyHjK13k7VQp
 SamqyVm8kQ5Ic29oviqx6IlKI8GeUWncOiWoO7Cn38wKCUi5aO0BUWgnKwXo+BzdBtmI
 iU8hdbLFOHu5za7jhCdCrMqBpASXlp5OrjgQPjDT8hWmJRkGmeeWUHkWNbCwKQz6byVJ
 EwDw==
X-Gm-Message-State: ACrzQf1hEV0S6/ojo9e8H0laf1J9ii6KoxcoW680t6rbwgqL6CQrTWOP
 OharFoOmPDm+FMe2aKnKcY61OuvvsF4ZfATiIwM=
X-Google-Smtp-Source: AMsMyM5M131Huigw9w+1zQelb8MjgToj3gBAV+vzhJBrzQ32pZ1DOJee29kFwN6C3TedtJFfDzq7L/0N9cprUhkwQKY=
X-Received: by 2002:a81:16ce:0:b0:360:a701:ac1c with SMTP id
 197-20020a8116ce000000b00360a701ac1cmr14247345yww.62.1665516797664; Tue, 11
 Oct 2022 12:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221011192858.956078-1-alex.bennee@linaro.org>
In-Reply-To: <20221011192858.956078-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 11 Oct 2022 15:33:05 -0400
Message-ID: <CAJSP0QWEyp8yUmrvmPTGmn9+yumeNw4+evh34pD2MyYcfNLCAA@mail.gmail.com>
Subject: Re: [PULL 0/1] testing: revert pc-bios build patch
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
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

CI is running here:
https://gitlab.com/qemu-project/qemu/-/pipelines/664171005

Stefan

