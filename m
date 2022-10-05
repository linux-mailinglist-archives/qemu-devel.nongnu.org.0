Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6E5F5BB6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:29:17 +0200 (CEST)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogBx5-0004vI-QC
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ogBtD-0001sw-Nz
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:25:17 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ogBtC-0003rn-19
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:25:15 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3560e81aa1dso1165527b3.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 14:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gshs4ifmcuexheJBMLQ4YTSuZhC5JBibIdjSMH5nfkI=;
 b=e/K1sCw38SNFPIArtp0YKFX/mGXbIIV4CbGWCe0chSrP6isCJLkSXVo8c9sdFr53hs
 ioUB9g+DD3t9OO28JB4utDX4k+zhbfJeKHjZmprLcc6Mrkew0VAIOtlSuLbwlSy8KVk1
 REyTskyYoRiicFmPR1x+FdUoLgDj2cwzheKzmOBrN9G7aaDQY/RTtQm4kwADPXyvXA13
 s8kJCKBbor11BALHnnRePG0/cGX7YztO6y6CRHMFOWtbcXMWwuCmt020z+mWWIqRUg1G
 GGbMrE9hOYgqAvpLyXYEsHH7+kTf89CyXXZzDFuKjS9IhZGHs4PwTGQcc+xtOYNX4oGv
 p4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gshs4ifmcuexheJBMLQ4YTSuZhC5JBibIdjSMH5nfkI=;
 b=azWziP4XjdNiA0YX7T0P0nHHGKNj6EmeB1BeR2f3qMvb3HOdXS1xn9J5PHP5AmIwEC
 m8ZgXmuvSy2ND0hu2gj7ryB2/gsOP10IKvNbyTQHv+TispadOLtiMBURqCjz1xomBGWw
 D6lcEUz01Btw1LPfgwi18M6jcJd1dLZhBSrfh7Gy92TjR2m57bH5fN97Lvgu3JnOW7Hs
 dSAM3xORETnTEXR6AdvcYwqygUaoNz22BOFH105YR9BxWAFN84mua78NTv536L5q5z/d
 yTNWdB/2voZ7t0kCfgS6lHSKRurHlCCSi8g8Kkx+vN7POnsLkMgtN45oJpQz4qyiiW0P
 7WGw==
X-Gm-Message-State: ACrzQf0uB/NjVz+l5P46enMy4047VUHXftpvlm7rhFvAW9SmDve5pOxf
 GRegmSO6b14cpSrIFC6PyciZGC7xNm0gyIQzyOw=
X-Google-Smtp-Source: AMsMyM7pbJbD5HGmOx+Y1xi7wG2wQA2+lbbSIsmSJbynxV9P45dY1OZJvhErIP0lo6tlQcdW0RTWtQiFC3utKDD/Wz8=
X-Received: by 2002:a0d:fb45:0:b0:354:cb73:5f81 with SMTP id
 l66-20020a0dfb45000000b00354cb735f81mr1708640ywf.111.1665005112934; Wed, 05
 Oct 2022 14:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221005170318.3055568-1-alex.bennee@linaro.org>
In-Reply-To: <20221005170318.3055568-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 5 Oct 2022 17:25:01 -0400
Message-ID: <CAJSP0QUoU+tu6o5qL3eoyYYygukmNA74OONe35RoOjx-QitvUA@mail.gmail.com>
Subject: Re: [PULL v2 00/53] testing, gdbstub, plugin and gitdm updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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

Hi Alex,
This pull request fails two CI jobs:
1. https://gitlab.com/qemu-project/qemu/-/jobs/3132270506
2. https://gitlab.com/qemu-project/qemu/-/jobs/3132270625

Maybe there is an issue with the "tests/docker: update
fedora-win[32|64]-cross with lcitool" commit (I haven't bisected)?

Thanks,
Stefan

