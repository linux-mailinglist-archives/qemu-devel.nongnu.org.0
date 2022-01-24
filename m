Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06F1497BBB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:18:50 +0100 (CET)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBvUu-0005Ud-Rq
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nBvSR-000409-Jo
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:16:15 -0500
Received: from [2a00:1450:4864:20::52c] (port=38910
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nBvSO-0005Fj-Pe
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:16:14 -0500
Received: by mail-ed1-x52c.google.com with SMTP id j23so50240575edp.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 01:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3dUzVj6R9PqaQJshR4pcFEQU0O0akeThaXHaUegk+QI=;
 b=puwVaAWc3b+f51/vj3ZAA4xqhcklexeC7jCbLzc4BGJGHtCTdVhLr+ihgsCPIMp5Kr
 9Ms82nhZg+FUuhzXFkMH+y5qswRojuWsYm8tCJ91/A7y/xaYjrkShUs/6IGitvlmu7Ok
 iH4jKIyCXrg8/ilr+2UnCoCCct+RRwHc/wrihHzlu1ZQXT8GqCCILAG/v2vAkzOFqGDy
 BgFb0UX9D6hnLSlmSK1Eh0p3ZcBf1qClW0tKCxhzBMTrhmijiVAxtSHprgcLWcHhaM4Q
 VU4Lil5toDnCUdTiTM65k/YBJNHCDrgGbTlaMaFN0s5Umb2z6vcFl6N6JlEPhdOp193r
 vsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3dUzVj6R9PqaQJshR4pcFEQU0O0akeThaXHaUegk+QI=;
 b=0hOj7Kiw2KfTCOe1SoVpifnCyiPop5RXx+Xa7KOyTKG4riGh8kfVC24IPxpkRdQvWo
 vhugTVHoIIgWFbt1RaNFrQUvF3HbEtGpZbciNXqyZvkUz6B48o64D4BFWhThcKntv3xE
 qf53mInpohlniTbqo61FR5ZMiC77qb+78nO04CnlXnXf5osB6cPfDD1h1pGJITwh1WJX
 tJPxy8X+PcolQl5jI2H/A4r1J+ywWLIfzmw2sae64H1t/CLiD62fzsuX3qEA3zVFFPPq
 OB1OFMJ8pw1HPXbS5fhiPgW5ZFrrU6sdyXiWJlJWHAJ2GrSDBWg2enMxMPQC52AjGj1M
 /4DQ==
X-Gm-Message-State: AOAM532525l0CVr6EgbX6tzkqwvsGsGn+nX32uWQ9VIXZ6aVq7EGkNk4
 YPGqcCbWAIKaPz+eWN81Cf/3EA==
X-Google-Smtp-Source: ABdhPJzvCZkNHy4JQDOHgFzbJKQQy9tsgDOh0iw6cxWCG8nietyGGeRjK8+91QryJaD6kBDAuBGUKA==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr15218375edr.207.1643015767920; 
 Mon, 24 Jan 2022 01:16:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c2sm6252197edj.24.2022.01.24.01.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 01:16:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F26FE1FFB7;
 Mon, 24 Jan 2022 09:16:05 +0000 (GMT)
References: <20220121154134.315047-1-f4bug@amsat.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Date: Mon, 24 Jan 2022 09:16:00 +0000
In-reply-to: <20220121154134.315047-1-f4bug@amsat.org>
Message-ID: <87r18xeboq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 =?utf-8?Q?Daniel_P?= =?utf-8?Q?_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This is my last respin on this series which is fully reviewed.
>
> Refresh lcitool to latest and remove libxml2 (mjt).

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

