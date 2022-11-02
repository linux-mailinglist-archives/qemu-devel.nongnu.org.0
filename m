Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45790616284
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 13:15:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqCd3-00041D-VT; Wed, 02 Nov 2022 08:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oqCd2-00040W-NQ
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:13:56 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oqCd0-0004Nj-UU
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:13:56 -0400
Received: by mail-qk1-x731.google.com with SMTP id z30so11522804qkz.13
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b009GW/SNzasm1ftEAeSNuMmB9p5wzX1GwFu6qi/38I=;
 b=KTyXRekJmeBZEeqgewN+O8I8nXiXFIxCzfNxlnfMkjeCIc/QW0LCuZz2CC2vhpi3bA
 cW32puwL5Ta87goehRn7wSI3gvRrepRwVEz+bePE2vCQ9IBw3xvf1Z7Y8TfJEW3zNMbi
 201fQxX3qK5M2uiz34HiW6xT2IpK/o+DHJmnpkxtl0GdLjV8olxSImweP304vovA9Zpa
 d3T0MYUaj5DXnXTwjSI4QO3KcB3wSuN69ujxqJhkBzNHDzUSTp6qfjLNa6iVXYWK+Ip9
 kMcqamzm9wyU9Mv73HJkrZiZzDbckOQu4G5cPUo6wHU0RN9Yx18KZQAdh5RJwazJAF3G
 Qwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b009GW/SNzasm1ftEAeSNuMmB9p5wzX1GwFu6qi/38I=;
 b=IkoEaC3gC49al2sTUlEq4nFMElg0Zbme0uJ2oPmvqQnZRXc+E++DdUjun1DrKQmYM0
 0P1BZOViq59Ji5ymbn2sdsYlXngPdOSD4URSs4EZxzyoMvi1txfju5B1IngSG05qFi0T
 mdEq4ApyJyTaN4Ut+XsWVHmD1v8VYDLuiHPMf45tmBXGaZxI7mJUlew7Mq0HQzEWXK2g
 lQ3mfeJiwobzTDvOGgeygUT/F2J5y8R92EJDg9msISVqKNHPgpmSb7u5SaNsY2RIqpym
 qliYG+Zw+GdL3lA9lUkjy/bZQN8M+0dQnzP0NTTTsE8RdZQtkB3WffNmnXUBBOlXrESb
 W9cA==
X-Gm-Message-State: ACrzQf1A4/741pDNfDK5W36yWKZP9LPVaQOqJsyKcWbRHau4BhTE6tmt
 8RsC2ecuN8MSGhEDkvHSikNDct7qDksrgrsXeTE=
X-Google-Smtp-Source: AMsMyM4dj+nwbhHL1s7los2ayszck2mUX8oIV0ep+f09ydksmJKmlqrf8meIXkk7JS+PfbMDj6Hhpckf6TpQDS8mu20=
X-Received: by 2002:a05:620a:19:b0:6fa:2e2d:6103 with SMTP id
 j25-20020a05620a001900b006fa2e2d6103mr11497183qki.94.1667391232640; Wed, 02
 Nov 2022 05:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221102114125.58902-1-pbonzini@redhat.com>
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 2 Nov 2022 20:13:41 +0800
Message-ID: <CAEUhbmVpCk59Kq1QtEngYNq3MfUmVW9p5gSs9j8Pw1zGtDEoGQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc patches for QEMU 7.2 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x731.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Paolo,

On Wed, Nov 2, 2022 at 7:44 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 75d30fde55485b965a1168a21d016dd07b50ed32:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-10-30 15:07:25 -0400)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 03a60ae9cac546d05b076676491ed1606f9d9066:
>
>   target/i386: Fix test for paging enabled (2022-11-02 12:35:16 +0100)
>
> ----------------------------------------------------------------
> * bug fixes
> * reduced memory footprint for IPI virtualization on Intel processors
> * asynchronous teardown support (Linux only)
>

Could you pleaes queue this series?
https://lore.kernel.org/qemu-devel/20221019102015.2441622-1-bmeng.cn@gmail.com/#t

If you are not the right person to queue this, please recommend
someone else. Thank you.

Regards,
Bin

