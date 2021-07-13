Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F03C7144
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:33:44 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IXf-0004Wf-Gf
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IWE-0003KN-Tv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:32:15 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IWB-0000xk-MS
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:32:14 -0400
Received: by mail-ej1-x635.google.com with SMTP id hd33so12803291ejc.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MAH2ro8KoYTnfJHYg4xa5xhDtazNIyaMfUkDvs35AxQ=;
 b=jCeC3iWoVpqstzEfS+rpFNtyVmzrWYj/xTGffo+rcco++tyfsvVJ4XLflIBxxmrRfJ
 peJbZyaoiP3DXA2f8wat9rjUI8dCiBsgrZzgeeV294zQuh5ThSEcRN2szFicAZvzCUbR
 hXghNXuB4SO0T0BRT4Wzb7F6Cp+9OfDSvpjIdEACHjkb7IU0ZU7i5gD4X0CVrS6c8igM
 1bcvqyUMUiD8L6ZCmaW2/Qh3XR6Cq6K19gD5VrAQRYDNbuQrYtdeGOpzJ2wVhR6Hn5N/
 4a+skP34+4JeDKQHWC/cPyRU0X0vvORj32cVxNtJ80YF1uvbvEKCxfU3iGDhzt2aYBSq
 KI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MAH2ro8KoYTnfJHYg4xa5xhDtazNIyaMfUkDvs35AxQ=;
 b=KJBDNi/j/pHkAeKz71zt3vISYCz3cIzrsZ1uEA/aTzBKPtN/l6buurzu4r2fsM/EGQ
 Gotvlh8p1m4OQqh3043YvJGTAjDAvLdzuo4r02eJepkWmzWkcRXaKwotO7I4N0X5++0t
 bHI+9wbrXgGST3LutZbGaWKRRnzD30+hgMitrjjKEz3TBkdtmtn3druB4bPyZlJv0JK1
 PvJmjOhySLPxDzReGROEnbRyw7O07aYDS2LmeKQlLtExOJ/25dTv8MUF/hM21WidTFfg
 fI1vpZI1qXXQlGVHer9Trd8wlLCMQ85WfjTOeMM4Xsv78fI71NuuFdS9dAMAPQuP6mS6
 C1zg==
X-Gm-Message-State: AOAM530rK556MgCArnAEC2i7LS9uvz/SpXxs12BiAHiaU73p5kSFptV+
 +8epolWp3FkGge36ChfM80u1cVEl3kibs0tqtEYYiw==
X-Google-Smtp-Source: ABdhPJzu7JlH5sXLet85Rie8jMmtTCJnc4mRwFY3JSYQj/FXhSS2gjNmEk7EsgOXJWbS3W53Y0GPP45J1eAY9xOZWec=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr5744425ejb.482.1626183129727; 
 Tue, 13 Jul 2021 06:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210712165001.429113-1-stefanha@redhat.com>
In-Reply-To: <20210712165001.429113-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 14:31:30 +0100
Message-ID: <CAFEAcA-4EFm3tG18ZQ_WWumbDbEg6eP3zdtaXsqkiLJE-oR+NQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 17:50, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to bbe47ed2928542e7db58146b6108e3f2836f278f:
>
>   trace, lttng: require .pc files (2021-07-12 17:37:12 +0100)
>
> ----------------------------------------------------------------
> Pull request


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

