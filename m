Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053838C561
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:04:41 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2xM-0004ie-7D
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk2vI-0003n1-Dx
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:02:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk2vF-0000se-67
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:02:32 -0400
Received: by mail-ej1-x629.google.com with SMTP id gb17so11811350ejc.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h468dPk5sRzD+gLF+hpXqvxnQT1lvtfl6AJOtl1y1ss=;
 b=aeenYXbFFd+eJwMekjt09Ch26xOmwZ7ph/WUEaD+ZDKJ5zkqghg6p6u/WJhJmOk6xl
 ghxflNXkaDf9DCMER7huQAwQR71tS2n6wQFb/rfVmKMAsEQ596XgOTIrAq2VnfeCTkya
 1+2LL2kYDp0/z1IKuxLeziuBAVgMho6N2fns8JQ2ChG4uPn3Xe9A3/+lc/hv5rMGxCFv
 twdCDno8lyPqwFMlX/njM8SF+nX732C4ArGtwa6FMD7wFWczlZ2Qik83QSO0dgQugAOa
 e++o7pXUaBqo+1BnqtMJJWEC6D9KsGam8+WQ2IR3r8Re3sO9DJm0gxtRN5xRMBkVpL6d
 Jkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h468dPk5sRzD+gLF+hpXqvxnQT1lvtfl6AJOtl1y1ss=;
 b=l5Blh+VHBof906QveESLroWt37+P5DyAPnrvTTrsap5IUYOnHQ+xHb7nhGewNnHBuV
 cdjZoT3mn+cW4dF1pA6HL89mwC5/z6UIjroHJyC6K0P51uytMCyo5y/b9tqt+Xm76Jlz
 RiBxr2sGwFw6nvvezZ+PuYyAKyemUm11Z+ZbNOwtjdTCDB9US5aIHUt9L4JnT24k89C9
 mRQdWxzmVub/n6uDrMTbsJ0lzjZK7b2UQigzzz5/+kozt6mqJoePUoVdJ5xEu09k1Ptb
 Dtq8CGyC6sHc7rkic7ZcEiPsSUFA4TXIaefTEEIkBnnPvvXwjiOInil+whQ4oj1F/9Fz
 0GmA==
X-Gm-Message-State: AOAM531LaU7FYn9clucG7VCtKvDD7LLXIpz8grTVMcIpPQMoaAO95YTq
 r8+Jdz/WZM+whwTqaYBDZgd0PiBEnSm69Pi66zSjhg==
X-Google-Smtp-Source: ABdhPJzHxz4+XTW4HobTtmx3YIwQ4dYvDs/qhuFsTQNFDTMT/AcpPtmQetdVBBWnKeXc5LnWwq/xLl1MQ7Q3qyfAdCI=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr9736761ejb.482.1621594945929; 
 Fri, 21 May 2021 04:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210511192802.552706-1-eblake@redhat.com>
In-Reply-To: <20210511192802.552706-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 12:02:06 +0100
Message-ID: <CAFEAcA9hzj+vYgR-NU1YnW0CfKRsacEY5hpfSvDU0iQgFhtDnA@mail.gmail.com>
Subject: Re: [PULL 0/1] NBD patches for 2021-05-11
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 20:30, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit f9a576a818044133f8564e0d243ebd97df0b3280:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210506' into staging (2021-05-11 13:03:44 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-05-11
>
> for you to fetch changes up to 37179e9ea45d6428b29ae789209c119ac18c1d39:
>
>   sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog (2021-05-11 12:43:26 -0500)
>
> ----------------------------------------------------------------
> nbd patches for 2021-05-11
>
> - fix fd passing to qemu-storage-daemon --nbd-server
>
> ----------------------------------------------------------------
> Stefan Hajnoczi (1):
>       sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
>
>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

