Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84377489D28
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:08:38 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xDp-00031b-Dp
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:08:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6x8V-0000zi-Tz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:03:07 -0500
Received: from [2a00:1450:4864:20::433] (port=41759
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6x8U-0005RI-1N
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:03:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id v6so27597502wra.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 08:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6zgUfe0q8OpHHVJcLsPB9dy+FAQvA+DlGuTvlXCQrFs=;
 b=UAtzVgHD4k8YMKLZF6dhC2nBOZH53fE70Q8h+7uUYOlX4MrIuSPA0DYL3nz+YLkjJd
 1rLFUO0EGA2kEz2AR2ZGnkJhtaSLt5GGzL2XFqsyUzAa3fl4CtuX5rLlm5if5bf95js/
 42bHvUpwTuAg+39ZYPd5qAo2BCwWHzPKyh8dz1XGtIjKpch/rOd3NmeWk26Og8trcExB
 p3+mxfo1dwmz5o5FZHW6M9aq+uzI0+SNJVBNVr0hWBJtVbBP2G9k11WcASq4nmD7yy6M
 83oVy/FD5gFKW89JV3CIVbSUID74+QPrRbN0P17f7tJafQraQ6lxfbz6dJrX1UQ2CCIo
 bGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6zgUfe0q8OpHHVJcLsPB9dy+FAQvA+DlGuTvlXCQrFs=;
 b=RGncG19EqVIWTLgQMrDlk03L+NOnAl13GjIuVbwZq/nVRt+oiRFVACYWJ2hhTmXkE6
 d3+je1TSxaxGTNCw+wEgVhc3AzpkJ2yjPSTRkW/24EPQu7JDUwTjhyGb3PUM1Ul3/bGj
 AATWWQERUfckIQmN4BTpIC4FowzGTVOBO85yQvDLx0kZNVf0rWMnbXhczacip6eQUjEJ
 xTtSsNqbes6PhSE56qBl15NWxEijaB5LugH9hM9PT9eLJiDxNKFfN5VqWHKLRRqUy3JL
 JOKMk8rMspjmbZSRV0KyRykvonWqpp5ImthVCQJjYsChpwUs4KLc91NE6RqtIm/Ym4bb
 7Wtg==
X-Gm-Message-State: AOAM530NC4ZLfCQwT4EtnQfwOymDoTZKJVKBBw9gkLu05PH/AdRlJbb7
 1o32MPENofxyOyCxCyGpHMz3uFS1HdOMOD45GGRS6A==
X-Google-Smtp-Source: ABdhPJyUqkmFUIVADVwb4wuOfsLhWhfvPrZIqrPegxaJJJ2jx6+OYarfg9OL0wH9eVXXKPL6/sDsFxK5jkuyI4PLzqk=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr288774wrw.2.1641830584410;
 Mon, 10 Jan 2022 08:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20220108215815.551241-1-f4bug@amsat.org>
In-Reply-To: <20220108215815.551241-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 16:02:53 +0000
Message-ID: <CAFEAcA_K4eRewn7cpCrcM6FbvLMz8O1w1BqF0XN=XDQVTZM39A@mail.gmail.com>
Subject: Re: [PULL 0/2] SD/MMC patches for 2022-01-08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 21:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Richard,
>
> This is the SD/MMC PR that ought to be sent previously.
>
> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf997=
37:
>
>   Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into =
staging (2022-01-03 09:34:41 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/sdmmc-20220108
>
> for you to fetch changes up to b66f73a0cb312c81470433dfd5275d2824bb89de:
>
>   hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:28 +0100=
)
>
> ----------------------------------------------------------------
> SD/MMC patches queue
>
> - Add SDHC support for SD card SPI-mode (Frank Chang)
>
> ----------------------------------------------------------------

Hi; gpg says (my copy of) your key has expired:

gpg: Signature made Sat 08 Jan 2022 21:56:02 GMT
gpg:                using RSA key FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE
gpg: Good signature from "Philippe Mathieu-Daud=C3=A9 (F4BUG)
<f4bug@amsat.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: FAAB E75E 1291 7221 DCFD  6BB2 E3E3 2C2C DEAD C0DE

Can you point me at a keyserver I can get an updated version, please?

thanks
-- PMM

