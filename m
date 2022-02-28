Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C14C7077
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:18:21 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhn2-00057V-I9
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOhmC-0004FG-CF
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:17:28 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=40762
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOhmA-0002Qj-LW
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:17:28 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id u12so21154610ybd.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZ6ibge3nQij0TZ3fJ9eg2Ef1dKq56sQMHovVHgpLDE=;
 b=CJ/P3MT5sjqDkZZm3lNYUC+1Vf2dGPlTDRaT/05bd++zjt3CQAjMmCGKwLyMjV6rim
 ImTkKNbuj65as7Q+DuvMO/sFRQ5V2tK3GBYXEqj9PDKqQlHV4hzc+War0nhcEkrMAY1y
 ZbkM4IEeZz7otx7DrImKKIfl6f912TPXvDuBA1oWJmfplcbFLQra9T9n81OxhY8eluyj
 PvkABMrLFw1iEw/WdWEvwglfzAWbQDAo6Jf4E4rrAlmt6FzeEA2mMUaQ4MQGLb3KPFAY
 +KypdqBbt7rJQ9L6Z6sKsmDzDCJk6G/PUo87DVYHUH6Kp8YPxsB1SLBc0mVsLVNFZos8
 IfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZ6ibge3nQij0TZ3fJ9eg2Ef1dKq56sQMHovVHgpLDE=;
 b=Vw4Lg+Q9tPE7W1m3afMko/jHViqnJvQv2W2NazMolQhxPzUeZUpjPiaOF2XyqH0LOz
 lnK5iMUzZ/aL3Rhme+IGYGhg4OHePtgk84eNwcrLDXWADcHPdxDZspTg3UdOMNfWh/uM
 kDqzOUZ5qnU8/a5CrcP61AcqIY4ltcPitSPpFFQEo7FnFsl1zRMegnn9mEw6W9ppaMMF
 qLOQyghtHYBFSFQ8a8osNweInN8ZP3Oksg5kFfk05XME+p0huAL6vjvANT4MLS4DF2Qb
 2IqrY1x9FgQQYYD1uD4LIiGa4GS4A6q5Mmsnz8cAusoKoOsdR/K1fvtfVvSd9mr5y/au
 QvLw==
X-Gm-Message-State: AOAM531qF1OFngTGU4M+dl959pECEUntUhw3RhjmFup2CSu3qmd7Fj7d
 B+NxnUfDHbEYEC+beVNh8hS1gU+e/eaZSscF2Qvcsg==
X-Google-Smtp-Source: ABdhPJwlS2SwuRRQtPb43v0q6nkkuVFhpVOskptFKAHkcZ1B8nUnXeLtTIM0lI9xWVYxmiU2XV4Z36e1fTq+qpqhgcg=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr18459371ybs.140.1646061445539; Mon, 28
 Feb 2022 07:17:25 -0800 (PST)
MIME-Version: 1.0
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
 <YhzeYQ7akrGqAIW7@redhat.com> <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
In-Reply-To: <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 15:17:14 +0000
Message-ID: <CAFEAcA99UBCvE-YTn++BSMTh5S11JqLJB4XsjdiV9D90aBGXjw@mail.gmail.com>
Subject: Re: [PATCH] explicitly link libqemuutil against rt
To: Simeon Schaub <schaub@mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 15:13, Simeon Schaub <schaub@mit.edu> wrote:
>
> We generally target glibc 2.12 in the Julia ecosystem, since CentOS 6 is
> still quite common in the HPC community.

Unfortunately you're on your own there then -- CentOS 6 is
well out of QEMU upstream's supported-build-platforms list,
and we will not carry portability fixes required only for it.

thanks
-- PMM

