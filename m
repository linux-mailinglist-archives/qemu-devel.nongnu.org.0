Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C133D3E9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:34:33 +0100 (CET)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8u8-0001mZ-8q
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM8r7-0008UC-4S
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:31:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM8r4-0001QA-Rm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:31:24 -0400
Received: by mail-ej1-x62f.google.com with SMTP id p8so71791211ejb.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h1lmt2VgIcJCBCg8oBWWlCYBA/FD/YtNyKUeZ39iUNA=;
 b=gD7VGYBKm0BXZS8s0mDKds9CBBHX5LNm7H5HkIJqqkJV8g7E5IapZCXMM0gvRXbbGf
 krnG1PF15flQcWrsoJMMTKcI1VeV6ryg46m9rIgxCn2mqr/q3gyytHoeZAmt7UtZlZvb
 s71nHRxm9ChzWFSzMsVO7FL8caKle4la5zyDxj6fbG71WLklTsve56L2YCLx7B8dv4yi
 ezu2jTwRo1Z9KROhId3G6tCaaGD4PcolYGpB1GylGmYj17JPWkJXtllwNss4hPbp+1Z5
 4nSqzeZ/uYUjJCuOPNpAjT/peE0lhXsnqVpynpogJXxNd4FPnJTOWGV7c3XilC29iKcR
 ByCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1lmt2VgIcJCBCg8oBWWlCYBA/FD/YtNyKUeZ39iUNA=;
 b=uemu08NTqZquCLRb45gYsSfPg5NikC9Gf/J77PJdKCiCA8CrAQThZfmjUm1TTCi4NO
 5jfykGRJsxle6RczB0yYldtixbWoMKz/XsU3rLwZzvTsq1zxxgpzS47DAss6bhTuwe9n
 o15d1Fsym2/SZsdNEsruinNW9PzXBpDm6k/qXRHxJMKNOPPPmOIKh1fV9Pha6YwVNm9o
 2DOaYbVybyRUQ9lhN07XuyVwrHlQzvtmUiGqJTdUHZMFApZv6uPHvQEvOmAP+Qb6cCaG
 fEjpY1eo+VXLziORE4/eJyeb91WqbdkEaDn5MW/ffzlVPSa6ANXFWjFirFAnP1jV4p15
 rFhQ==
X-Gm-Message-State: AOAM531HCs63e3eXhoqe8/QjwUbb3/DqLn4lccWHOwq6CDyfjVG+6K45
 ueYkyVs6a/8nVviGOIB07uRrOMolTiMSlLj96FvX+w==
X-Google-Smtp-Source: ABdhPJzwBMemJ3IpX1dq7iqJo0p2zXL7/1VyMAxCmJGIfGznH1JKqAy2Al18MOQ5VXN6Mj3Bo5LCjYcxFyLZ3A7D7JQ=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr30009948ejc.250.1615897881125; 
 Tue, 16 Mar 2021 05:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 12:30:58 +0000
Message-ID: <CAFEAcA_1fzt7xVfJRjJBuWJAe6ji7eLgQtb9xD5mq5cOttxe8A@mail.gmail.com>
Subject: Re: [PULL V2 00/20] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Mon, 15 Mar 2021 at 09:14, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to f2e8319d456724c3d8514d943dc4607e2f08e88a:
>
>   net: Do not fill legacy info_str for backends (2021-03-15 16:41:22 +0800)
>
> ----------------------------------------------------------------
>
> Changes since V1:
> - drop the workaound of "-nic" id and fix the merge
> - add the series of query-netdev


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

