Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A7940AC0C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:53:58 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ64b-0001qr-B3
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ63N-0000lT-Ud
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:52:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ63L-0000Yo-LC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:52:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so19440995wrh.10
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=laagcRJAJo+1gquNVmYG6q6KvnEr9cDlR6J0BVYkuNY=;
 b=gUu6YvoEkCe1+39amstjHpgG/0UdcHs0loGuPJ7Id+UoFM1xNB+dfWDzclzWeM+Dqr
 9nqDOFzW73nCg/w1Bnev4X/IUv0wYDRaSKmhwt+SA3KRsW4Nw8cdq/oglsrdKDVdfyBN
 22fehNpwp1TYb655TAc6nQjSP75Ad8OCvA1yxuOfwBZ+w8TlmJIX8TEV/C/BXf1xnH+h
 RM437l0szEmjK14Cl5TeT9TAqeePArHyGSNJES7gWfT8bCMQm6wtuDEDFqKQ2WPPm90J
 u+tYLROARR4qFvQUmV5dxBjeg3nopDOFgNL+WDQ1V44bGFAxoSTG1lZcfiQ0GIgbQ5L+
 OCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=laagcRJAJo+1gquNVmYG6q6KvnEr9cDlR6J0BVYkuNY=;
 b=TPymBXPiAwk0TpRVF4ibntek8aUvW5Sfv9obZ9DudIJTlTW6PWUEjyfsVKRbO/YgmV
 HTr5zxAJHhz1c0HB5Dh8e6frbdYkU3a1FRdWh+v9jmXyEtgWY2cuX9LhbA8q32mh2thz
 gHMJolI77167rrMbyolgKkVQvS60UPF5wNe+MAxCwef6SYEDi45fuK6Vh027eEdCO6eu
 PbgIYA9TQybfqm3cl8TaDZFwM5/HN4Bv/sf5bBFLNryB/5JOtBlDwS8zLzSb9eBPN7Y8
 F14uHSfo9sTEIq4eBdUHROsROuFvDs5b0TMCHa+NvUiNF303J4unUj8Vwzzgd/M195+G
 FepQ==
X-Gm-Message-State: AOAM531rxW92ia7wW8ExY0BUB6Qj9MwDI4jR+q31D709jT+W8SksNnL0
 bTIt27RUeWbaUyRix3pG0Xg/+2OVIpR6ZNSqyEzBzA==
X-Google-Smtp-Source: ABdhPJy2QTOtapTTe6rmaEYZ54iVLpUriXoeNpyEFjYWMr7IvrjlPoovoFpCO847a+3KT2yjnxg+r5Hjfv4EhayUfLI=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr14091092wrr.275.1631616757831; 
 Tue, 14 Sep 2021 03:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210913161304.3805652-1-clg@kaod.org>
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 11:51:47 +0100
Message-ID: <CAFEAcA9CJekxghvjOpoweVNX6ebKz9yP27tP8OVsiR49T4XSHw@mail.gmail.com>
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 17:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80=
f5:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13'=
 into staging (2021-09-13 11:00:30 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210913
>
> for you to fetch changes up to d7add12e20fa8982f5932ff4dca317c5d2dfe7d9:
>
>   hw/arm/aspeed: Add Fuji machine type (2021-09-13 15:19:20 +0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * MAC enablement fixes (Guenter)
> * Watchdog  and pca9552 fixes (Andrew)
> * GPIO fixes (Joel)
> * AST2600A3 SoC and DPS310 models (Joel)
> * New Fuji BMC machine (Peter)

Hi; this fails 'make check' on 32-bit hosts:

qemu-system-aarch64: at most 2047 MB RAM can be simulated
Broken pipe
ERROR qtest-aarch64/qom-test - too few tests run (expected 83, got 31)

I suspect the new machine type has a default of more than 2GB
of RAM, which won't work on 32 bit systems.

-- PMM

