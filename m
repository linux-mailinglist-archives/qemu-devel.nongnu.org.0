Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2E3FCE42
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 22:18:00 +0200 (CEST)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLACl-0003iE-Db
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 16:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAB2-0002kM-Uf
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:16:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAB1-0008L9-Bh
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:16:12 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n27so1544001eja.5
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SCqLjISKkEFa7cIEsXq7jv793D3CNJs9UaW3XAPtYJs=;
 b=JGn6Uq1Fh6ABcW6cKoAkWysvlFIaz5bL0Z77d55HwpFYyj02gPq0Yy6WdOdSen8doK
 Y8mk56xMxlc9Ju/bWNZK8DgHcbqj7pOaCbS6B82mW1fIKNA/bHu9flnyWD12c3iOy/98
 Bu01i3d0Zq/f/pwsszuzzfYmtmDGT/qt23sVNL9Cb33IDH90er5ZzwWjY1vtdDRjlRAD
 QjzEn8WzBNJSLlYloQyl8GO+2qWzMpizh6zxNaVhl6eoPQtx+WmQtSABXKkjZcVvKUlf
 o4+OadKlMuVB5bmT8HfQfh23XBo6xn7CiQ4d7yPkD7iNx1BnIHoSE4Fy7S8V0vq/ewux
 cIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SCqLjISKkEFa7cIEsXq7jv793D3CNJs9UaW3XAPtYJs=;
 b=OXB8m3HYJchA/p3KSRSPauLgtE85TF0Xy8ZYwEFFxyRy5uY4YLK8Ltw5j1EGebBqSK
 5oPrX1chABW8hiuXHrW73xczb+VgHy2b+pl+uY/8+QjRY3Dl3GAk+npmBrtiOzO5jE7P
 cnCVrTP1UF79F+if7EO7p57MPk6OhrBRdOFtgxXyKO87PW8i3gRyky//m2SQAwgiDGje
 o83jXRr60ZxvDD+j/xV6w7ysx6Hq738l57UvE4lDIOUy0Tz4g90/6E/kSEW8ezkapjhN
 C0S8vhHje3Dd8UeXvPrhu8JmAXiluOklCU4JXFbvYbknYyCGNw/COh5JfxbaRLmfRx+x
 4NrQ==
X-Gm-Message-State: AOAM530W5UHNAz3aCAYhf3Tyup3hhIY54n4LAQ8VIXgcAfS0s5s/ePwX
 OZg6qXcpJmTgZrMRq3xLdPjv5t3/l6dHRDu4Z6VB9w==
X-Google-Smtp-Source: ABdhPJzU6P3aqRObvek4TQjtj1l4V6BhTaBDCPKH5Gx70+lWeqYYHDop2BHFqdVBxnYNhclINDWAUNmr9qjTtAuIDPc=
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr30634629ejc.482.1630440969490; 
 Tue, 31 Aug 2021 13:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210827060815.2384760-1-f4bug@amsat.org>
In-Reply-To: <20210827060815.2384760-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 21:15:21 +0100
Message-ID: <CAFEAcA_KLQGvxZa9Y4=jVUr3ofM3DASErT+JqVJt+o7-77ewDQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 at 07:08, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Since v2:
> - updated "Since 6.1" -> "Since 6.2"
>
> Peter reported CI failure [*] but I can't reproduce:
> https://gitlab.com/philmd/qemu/-/pipelines/360227279

'make check' seems to work for me too this time...

Applied to target-arm.next, thanks.

-- PMM

