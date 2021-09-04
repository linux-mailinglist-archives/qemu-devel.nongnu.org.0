Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25843400C82
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 20:22:19 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMaIz-0004OE-NI
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 14:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMaHy-0003Dy-4m
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 14:21:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMaHw-0003Vw-G6
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 14:21:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q14so3434113wrp.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=59PS+9AJl0m+ismL9V+60CgDo0dZC1G3fF5A1sMCVps=;
 b=G3qjlMGUHeK1TNpB100Qj6onOc42J1bC23ZYUFM1wOEJS8mJCfbfvVVKoj9R42X7jl
 mIDX1epAkDvTWsUd79Fr4vn6QbUeXihReVUD6KTBemZXPeGZE1mQyPWdbxKPQTUSezAD
 GBqZTJnRqUqs9orKVnDFY1Sc0QsfPQvPNiWWTXObR/8Of5N3DoYXSFpyzWpyjdP6KGW4
 tLDv/Mb9QU2HOvHWc5N479jlGRhHeM4JQCmAZUcqMajwXEErSLB6Y7KrnBfaO+itVYtA
 wr3s/45+H1l4ImsMrDtRuGYkRn5LJjZ9txBX548+fKg2jIRCggm6d57BaM7nwYJORTmm
 yRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=59PS+9AJl0m+ismL9V+60CgDo0dZC1G3fF5A1sMCVps=;
 b=FtaUV1Epcjsx/JA+JMpc1AVQK5+miZeMPEamZy1rxjI4KLcOEsqlMCkkPcvgzpwIr/
 QTC+sVauVHf8Q1ly8sWrzrBoh0egKozqk5YpFKIfFYp4EX/n2ncg8xNizfMXb4V/GX1J
 9SF/EERlvKqBFZl8g9AOL/XT6OvqAgtUe4HVn0xP7r6Xfn3KTwh3QduCaEGWU3XamzgI
 uvzOynBzTfKspLNl3FlhNSYzid2JZE4z/g6kDxOzrSRIJBrI6k/9NaPAAThgko0297/i
 TbE3wLKIY99lR42DWpsCHJgj18ZohBL0D1CJXYswMXkPlS6qEbpQ2C+YLNx35rMCAK/c
 x+JA==
X-Gm-Message-State: AOAM531Oozjo65mc1xXPVqn7P9iFUR+tnpbmtgGEBEOuoecyTmk4ICE5
 NpT7xGtOQyBdaqgRCb+RROqf3FmudUrtE5vSomiN9w==
X-Google-Smtp-Source: ABdhPJw+xtKjvCrZ9sviMk7dnCYC9bVviZSIDp/S5qJgI+ZDF7Bclg28JmFNhmimnKtMzNaygZZrBzNBp57OJnh1sOw=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr4805411wrr.376.1630779669064; 
 Sat, 04 Sep 2021 11:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Sep 2021 19:20:20 +0100
Message-ID: <CAFEAcA8kTOq4AdCQjUenaNy2sr98QW+NYm0Y4O4oNHYmnBOJZw@mail.gmail.com>
Subject: Re: [PULL 00/22] testing and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

On Fri, 3 Sept 2021 at 10:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 079b1252e9de384385c9da910262312ec2e574=
c8:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
10901' into staging (2021-09-01 17:45:38 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-for-6.2-020921-1
>
> for you to fetch changes up to a35af836d103f781d2fea437129732c16ba64b25:
>
>   docs/devel: be consistent about example plugin names (2021-09-02 11:29:=
34 +0100)
>
> ----------------------------------------------------------------
> Testing and plugin updates:
>
>   - fix typo in execlog plugin
>   - clean-up and document gitlab FOO_RUNNER_AVAILABLE vars
>   - fix plugin build issue on OSX and modules
>   - add multi-core support to cache modelling plugin
>   - clean-ups for plugin arg=3DFOO handling


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

