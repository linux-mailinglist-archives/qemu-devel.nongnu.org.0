Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1C4D481E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:35:51 +0100 (CET)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIxK-00021P-53
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSIee-0000El-7K
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:16:36 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=39536
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSIec-0002GD-At
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:16:31 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id x200so10780165ybe.6
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eBpCDTIwHG6ZjhwNzJ1iOPE7WWJASHMWwsM/g0I7XIE=;
 b=Tx3AaYYMDt4aLLbgzhL4bUgxFxQJOY6FyUcWwsdo2TEW1hDuCNSSs/E7tHq0/aziL8
 Bz34bRDcOoYzXTEXdCGekmo+5je//UKZ9roCx3kyc+ZowR377Is5WysMnoiaTrmZq6Oo
 ZRfh1iB1xcJ0OHlVFmlripLloWcX95zP8V+ZPaIse6QwnSmR0F2q8Ebm4S4LzPajI1Pv
 Jx1T8FFVQSgVJ7wIZVZfYzkkVbzgsJ9LvG5U+SW/92+hWICWjtt//pPDi0ymda4GqsCt
 12MvCRpWrhshZ41OkffiUZXG4gNciAbbOC/MUfMvmd/0uH0U75RByoqRQtSGoHkd47K7
 WqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eBpCDTIwHG6ZjhwNzJ1iOPE7WWJASHMWwsM/g0I7XIE=;
 b=DpIEj555H5DhxqZWu6ukcLsMz+L0uXSjHE9tcpldKlbwTeoTpz9ehDt9tU5rfRFrM0
 Sr1IkDuY/KVhZT7SJxrdj2eZ1Ec5AR5CwZa7nJiE0Y7ZsIx/a2n9xRz+XT6mFXDemrOq
 s+TfP+f65Vx9jM8nEW0tJliZKvXS6dZsEfLxQFgiYCO2B9zz5drbdHKsVs+K0HsWnvdk
 ZV+qSRAUPaSN/XcXKekE7yb/m8tBYdk5o+P9EM8UwcMlrWDoy4XlnpGHDGWTEOyJhPX1
 D0KxuNnoF3WijTNRLSafns33FakCpyK8v/qLFUGHnuV+oYPvWo2/2levFQjbB5KC4vPY
 XPUA==
X-Gm-Message-State: AOAM531jaiC3EtSknXyC56PrBwa4CoAiShIP9nZcD/lhemUELZiN9SeA
 PXZiZqyJQ/E1ufk7lIVtfM3sOtMN5y/N70FnOYp82g==
X-Google-Smtp-Source: ABdhPJxXnGIU1+p1FAGdejV+a4qeiXmzqRAxufWmMq/ITNaFxDCa3EDPAsvUy8YB/cm0q/lt6F+t0PYpMjIGIWULt3Y=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr3617349ybs.140.1646918188904; Thu, 10
 Mar 2022 05:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20220308215435.21806-1-tsimpson@quicinc.com>
In-Reply-To: <20220308215435.21806-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 13:16:17 +0000
Message-ID: <CAFEAcA99YqE01snCWLt8h+FK--4j4QiJ-NczcmpL+1AgVyghNw@mail.gmail.com>
Subject: Re: [PULL 00/12] Hexagon (target/hexagon) queue
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: zongyuan.li@smartx.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 21:55, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 33d102e92e41a65c817d85ff8bfd5ffa2c16b1d3:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/seabios-20220307-pull-request' into staging (2022-03-08 12:40:58 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20220308
>
> for you to fetch changes up to ebbf0ee1335548fe9b42fcd1ff031aea2d27cc1a:
>
>   target/hexagon: remove unused variable (2022-03-08 13:27:00 -0800)
>
> ----------------------------------------------------------------
> Hexagon bug fixes and additional tests
>
> Also includes a patch from Zongyuan Li <zongyuan.li@smartx.com>
> to remove an unused variable
>

This fails the build-user-hexagon CI job:
https://gitlab.com/qemu-project/qemu/-/jobs/2187325916

BUILD hexagon-linux-user guest-tests with hexagon-unknown-linux-musl-clang
/builds/qemu-project/qemu/tests/tcg/hexagon/preg_alias.c:68:9: error:
unknown register name 'c4' in asm
: "c4", "p0", "p1", "p2", "p3");
^
/builds/qemu-project/qemu/tests/tcg/hexagon/preg_alias.c:95:10: error:
unknown register name 'c4' in asm
: "c4", "c5", "p0", "p1", "p2", "p3");
^
/builds/qemu-project/qemu/tests/tcg/hexagon/preg_alias.c:120:12:
error: unknown register name 'c4' in asm
: "c4", "p0", "p1", "p2", "p3");
^
/builds/qemu-project/qemu/tests/tcg/hexagon/preg_alias.c:132:12:
error: unknown register name 'c4' in asm
: "c4", "p0", "p1", "p2", "p3", "memory");
^
4 errors generated.
make[2]: *** [../Makefile.target:108: preg_alias] Error 1

-- PMM

