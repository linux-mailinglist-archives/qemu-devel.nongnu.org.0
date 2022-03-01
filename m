Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31944C8F7C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:56:31 +0100 (CET)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4rW-0003vx-8U
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:56:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP4qb-0003CC-SX
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:55:33 -0500
Received: from [2607:f8b0:4864:20::1134] (port=38884
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP4qZ-0005jw-Qt
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:55:33 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2dbc48104beso47142507b3.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sK8z3p5NLyUEcuP5zD6vAWKLpnRyv4z/75RUuT3pFWg=;
 b=h8pTU3OZ0KW9tPiDOph9FtdxBt75xmKoSvva8lhGpCOGAamZt777+UA3ewLA+ndI7T
 1aFvfv4hgBQouOp3EcGpD/h4I6by7o+gUYX433N0Jh4xveJfKuxWZUb4wRhjB8F+5pyk
 emhu5qTm3yZjBUe4K7PCG9OtkrNT+zECJ+/D3GuQp7Lcipk3YFSSndBRF3aw9rM8tlRC
 T4ZcVuup56RraeXoiLAqjlSQf1H64piUeQxkLPdefgleM6Zt+xDiagTIqU63Ko8n2O7k
 /hVjF30MCRo69VAmn4zxu7OhQK6snXPoCy9/JhaMONe0dJc486nodllPOZg2N5+Ss/d4
 0VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sK8z3p5NLyUEcuP5zD6vAWKLpnRyv4z/75RUuT3pFWg=;
 b=q/AXW1VaiydH16GnWq2/KhFIb1aLfafve08053ixu9bcdfvmpFwTOEgSSIjy27PzPn
 Yux1ifWvGtNtN41OAsjoIDzCN5io7clOuB4KGAqiQXP3qeJw+XqL0FCKTfOHuT9v3GWx
 qytYO6eLjkMBy3XwK6j5QFBqpkaCYxfvi1dcg9QNH8Oj5adWiE7hfeR8jB5RKFFYiV9E
 EHsQCXefwyWHomRvtha1yW8tJvfb8rYVVMbmE8h+FA2g1v6N7R3sy6mYJlUsSiRq7ZYO
 oMEpphti2XLDy53biqTu57wK8a5q3sO/EUkP52/U45Wzt9dVd87TRt7FN60Bz1S8oGNC
 XRcA==
X-Gm-Message-State: AOAM5303PHJsRULLEBTGqaDd7EJB/ys5CCt9hinaA5fKLTmDmNcrqkGA
 7KZSN4xSxcmBBtkmtEkspZSDpzcG40kIqVGyqUFEIg==
X-Google-Smtp-Source: ABdhPJxMCWS7Y9DJbSqZlmVNGOo5DcnrA7+PIkdZvIulIpUaX4kQq6smMfbkjC1wbZmqyr9zqDUXZHQLud3z8ROHd8c=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr25482310ywd.10.1646150128732; Tue, 01
 Mar 2022 07:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20220228132936.1411176-1-thuth@redhat.com>
In-Reply-To: <20220228132936.1411176-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 15:55:17 +0000
Message-ID: <CAFEAcA-6D22k6_sJFOO-Cvx5aPiK_fwEMq=Pch89cQeKN2zPLw@mail.gmail.com>
Subject: Re: [PULL 0/6] s390x patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 13:29, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-02-28
>
> for you to fetch changes up to e2c3fb069994858fea9aca9a4e64fa5afd34021a:
>
>   tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions Facility 3 (2022-02-28 11:29:15 +0100)
>
> ----------------------------------------------------------------
> * Fix emulation of the SET CLOCK instruction
> * Fix the s390x avocado test with Fedora
> * Update the s390x Travis jobs to Focal (instead of Bionic)
> * Implement the z15 Misc Instruction Extension 3 Facility
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

