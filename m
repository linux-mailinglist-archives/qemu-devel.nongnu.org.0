Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282D3503BA
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:43:09 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRczs-0004vQ-DO
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRcvk-00023y-1p
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:38:52 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRcvi-0005yg-1m
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:38:51 -0400
Received: by mail-ed1-x532.google.com with SMTP id h13so22828745eds.5
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oofW3ByavagXnmJbXuhrnfE2QifeiUHniw/jTcmVz7E=;
 b=nRdQ6I+dw3/5ZK5T14datXWCYYEGWKCuxYQHY6WJ8+UQps93qOikNSrOrZGml2TGSH
 2eJjOLpCZ4TO+hBVMfui/l+dSkR2XT4o3aS7zbeFYEuicpmfmPP7/DCRJa+qo9ZChWZ3
 hhMMkrA/U+VGzQvRiifDmyagmZ60MS6XSlZq+cMIoHjXdpO8giDubRxNBKCfZbTzlDgt
 +cMatFeTYbd8Caq+cffy7HMdQMpiLGU/Rxz7KwkPEnoOWvp9zZuIH66BY5TZ2+Q0k/qT
 sNstTv6qcUK+TI1L83GtqiPShxXLTcV+GSO0cY2W+260nUoaps4u5obad8JqqNl/Q36e
 bdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oofW3ByavagXnmJbXuhrnfE2QifeiUHniw/jTcmVz7E=;
 b=UoAasDjNkib+gSFGycQv1/eqR3sgSeYY7Ao85GQDJxqDR/rjlkIARQVPe6aAulCQ1V
 /A5HpAy6C7x6Yrjshd+Xr2y3e7dvkdlJFeikqcQv0BLJ5V2atLbUv7PPD8XO8KF1nEv+
 v4iOCA92dj46mrjREUswe3+X5lIZx7LK7hWCjopGsKJ5xdjgYbtslNnvoRrshIWxl3hI
 Msg/c5aUxarCbDkHB5Fw505YbiV5583ke+50uRrcKI6yeaEUSEhBgdKXmGGZ2udrlRJ6
 q8vbDF9PhrzmwQVVXuFsC14uUG691sfALUvFs7smCRrJjD9y6XMiDjY/TL71u7nopsIp
 zvyA==
X-Gm-Message-State: AOAM531gq25+x8Mcp6KvR9B88vO+pBeu0HgJm5M+l8bx9s/aGOBzUlPM
 Gr0xRueD8TDaFC7+1a1W4d3QNwPr34/3vG+yqo3p1g==
X-Google-Smtp-Source: ABdhPJxvA8LCSVCbIKqm58MX0ZxgM5UlV8TIq/e5s1fVMEetxu8aQIbyLVCfDy7QVEl9UR+TWwWZR2S0n5VTfE5NMlg=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr4499225edb.204.1617205128442; 
 Wed, 31 Mar 2021 08:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210331062524.335749-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210331062524.335749-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Mar 2021 15:38:15 +0000
Message-ID: <CAFEAcA8kyaMM3KC59DwqUbXkVsisrmvRiEg8YCKHQn9C7QFnSA@mail.gmail.com>
Subject: Re: [PULL 0/5] ppc-for-6.0 queue 20210331
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 31 Mar 2021 at 07:25, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 6d40ce00c1166c317e298ad82ecf10e650c4f87d:
>
>   Update version for v6.0.0-rc1 release (2021-03-30 18:19:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210331
>
> for you to fetch changes up to 611ac0a60fdcc7422bf42ef9b467abf4fdbea1a2:
>
>   hw/net: fsl_etsec: Tx padding length should exclude CRC (2021-03-31 11:10:50 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue for 2021-03-31
>
> Here's another set of patches for the ppc target and associated
> machine types.  I'd hoped to send this closer to the hard freeze, but
> got caught up for some time chasing what looked like a strange
> regression, before finally concluding it was due to unrelated failures
> on the CI.
>
> This is just a handful of fairly straightforward fixes, plus one
> performance improvement that's simple and beneficial enough that I'm
> considering it a "performance bug fix".


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

