Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C749E999
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:04:45 +0100 (CET)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD98T-0003DH-Pu
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:04:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD8Js-0006Jy-PU
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:12:26 -0500
Received: from [2a00:1450:4864:20::32b] (port=46705
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD8Jq-0004JQ-TN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:12:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso2306738wme.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hVSC5SW5aShs3OmX18LlZGZyYTe/BxcoXVrTwDP2Y0w=;
 b=M/kn2+9/wVdkBn8oD7e9hduypFatFUZen+O+Zo6uAJgiuAbkRyaqLG5LcNx3CARC5E
 TWPjtZjXA7K2swEmnByJSNx+6T/6VwYpsf69NU3o1l7XkOCuIZHPY2cT2M+g1NqKMzFZ
 HEtz9UgqJujKpxhExvwtzxye+RMVR0lg1FEPYJoL8xmfPrJlphAftDHA73YE7A3ZUKX/
 QgE+2SnOc/vB6PYhzMs69+D/tQQrCT5mgD6WiZqhAlXlU57KmDamE6PpfuCPwz5Zw81M
 +XK65SUF7l9FyVtg2OAl/rEV1zk3uFOAdIg8jOdzjnQ4/oGxzLyZdCEv0y14NUBhlfpC
 P8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVSC5SW5aShs3OmX18LlZGZyYTe/BxcoXVrTwDP2Y0w=;
 b=jX4JvTMD8/Q90aF2zW4UCIEVIb2rsrZmuUUWoh55QOfjyBjD2A1BmkTvMFEv4Be3Nb
 X4Y/P7Ve2ekz1q7N07kv5XoRTsTwZEhqPieJmW09rtsW5MDbpy+nbCtknKzwFfTFkwnv
 Tf1aeLNmuW3drkr32RV5RJraa4L3I77DrN3Z1ffj1vcTLKhH9O+7XJGA0yT/1qjKUmU2
 AdTw00ysx1tZoRAZzzSNpvdEpnYdGw7AqlTtNLh0YwTQv3W9N1z/0MTBpi1qiw5MB+tU
 RpCmH3n99U7ams+l24HMNxMg+4eBGDRFgCtX/Aa3UQRnS4bHx1ZOweQNAQIzLd/BzCL/
 43XQ==
X-Gm-Message-State: AOAM530RuAfmlgkdBAToXMYq6jiuC86fUhkUMrI/WpYxZXs3p+f6oRZC
 a5Ox2UJ+xOnnfQgX92kftsZNHq2jmPrpTj3n/SHuxw==
X-Google-Smtp-Source: ABdhPJxo57UCMlx5jk/cTqQjj5Wuv03exGhVq6oGQfH5vsZNochkv/P4DevKHB45MdC/GUiBAsb3YfWxbD0hi1KH3TU=
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr12990277wmq.126.1643303541261; 
 Thu, 27 Jan 2022 09:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20220127142202.236638-1-armbru@redhat.com>
In-Reply-To: <20220127142202.236638-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 17:12:10 +0000
Message-ID: <CAFEAcA-JP+-jMn=CGGeAHYgr+2nsmt8aUDQNAW5cFTap0WFX4w@mail.gmail.com>
Subject: Re: [PULL v2 0/8] QAPI patches patches for 2022-01-27
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 14:22, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-01-27-v2
>
> for you to fetch changes up to 761a1a488e67a77858f3645a43fbdfe6208b51ce:
>
>   qapi: generate trace events by default (2022-01-27 15:17:35 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-01-27
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

