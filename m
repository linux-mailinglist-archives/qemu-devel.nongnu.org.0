Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062336FCFD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:04:39 +0200 (CEST)
Received: from localhost ([::1]:35808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUh4-0006g4-LF
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcUeg-0005EY-Hu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:02:11 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcUeY-00087P-2N
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:02:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id u21so105754557ejo.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpcsnLoqO7jgTcNLBmaOBZohlAlFQrlnWr8/XIQbmqw=;
 b=RIQQR60A3stpQfHSBAfO1lXWFhen3s6D84G/AFxhk54UaUl4Hueur12MwOANEA39Uz
 ms2C6C42JZaYewdJ4PrDZdQSl4z1EXPkDngj3AYitYVfwuQ1OX5B+oqYaIfQgREv1mHG
 0YVNqzr+rJcrDuyYMrmDKEOeKp6YMUMHy/25xslablk23Pg/oLgjyQge/CJLp3Dc1L85
 9NrUE0YhQRmBdMxqcPItrcz8efYIfAEwtWldr3E5TQsocSbr2V35Rdcv+FMt0WDxwXeN
 vSnvI29LfJcLRiJG/SvGk1ux72H9wTa6iLOQWOC5PDvTqG6yTs0E6rkYF+sa5MsKnQnJ
 kzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpcsnLoqO7jgTcNLBmaOBZohlAlFQrlnWr8/XIQbmqw=;
 b=c4/Lx5lN7NyoVebWVJ7lUpf81ZtVrljEXYGs2B2yELDOlpdpPmx3t6JDi0pE/Fr84E
 i2DMaO+fGZAPkqhskYC7aRA0T1hlRgbR+tUJQNDRkClYC4Y2xpLdzngtS05VHaf3/hqY
 tp0ae73LJvR+HWXQK8/rcbQ5pmXrv8+zKmN3mz7JcQIdipysBoNCwZ0d9mFnBQPnWhSY
 SXY5ZPKK2an/WPCRlymEorhsCWOQA/PAtThYrkLmYacD5PP3etpa/qLpMBlOR/nOuMGd
 Uwv6vga+KhI1GVVe+rGP4t03BwBXAlmmnSS+p/GmmwxS90tRR4ch/LpWATs5TUK7ARRa
 C4Kg==
X-Gm-Message-State: AOAM532K8mozRuzvd4N1a3ZVjvR4J5LFSiiLEnYsf4cc2lcPv2YOQWdq
 BWKnufN7mV9DcAKTx1zjizzJrTyd1ADKlQ3sVcMy3Q==
X-Google-Smtp-Source: ABdhPJxyiwntazVZoREIVBjoozb3QeaPbO2OPxTDGrjS3QW1puQVyw4vtBryKlGH/dw4LK/AfuCdLaqF77qg2Z3OFmQ=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr5021130ejb.250.1619794920452; 
 Fri, 30 Apr 2021 08:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210430105147.125840-1-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 16:00:58 +0100
Message-ID: <CAFEAcA9569geV2stm4crmXNjn1nM7EQrYGzv=fZLjmT--_CsJw@mail.gmail.com>
Subject: Re: [PULL 00/39] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 11:51, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit ccdf06c1db192152ac70a1dd974c624f566cb7d4:
>
>   Open 6.1 development tree (2021-04-30 11:15:40 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 68bf7336533faa6aa90fdd4558edddbf5d8ef814:
>
>   vhost-user-blk: Fail gracefully on too large queue size (2021-04-30 12:27:48 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Fix permission update order problems with block graph changes
> - qemu-img convert: Unshare write permission for source
> - vhost-user-blk: Fail gracefully on too large queue size


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

