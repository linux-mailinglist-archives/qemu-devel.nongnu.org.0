Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF548D6C4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:39:03 +0100 (CET)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yRa-0001nI-LI
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:39:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yQB-00016p-QC
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:37:35 -0500
Received: from [2a00:1450:4864:20::436] (port=40584
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yQA-0002Yt-5u
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:37:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id x4so9536668wru.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wC7eTCzKFEA8RPVfrflNT3a8QbfPEYg+SOrDjqD5MWg=;
 b=Yswn7EMm/WHvUvU6yrY0uF3Qgvc9JYEcx7tnwj33xdXudvwfwq6OXQuzt6RCMvC4x9
 STBpejeHdJ5r1hkFt2fgdGOPaLASznZ4EG3h2u0D5s27SB0lns0jeighKmaWhzH53kdj
 7TFGJTBPVLTeRscWtgupIlX14yb8wbU7Sc3jHTGuF7jdLc6OfIaWgHPHoCU9LHfkiqco
 SFrHLd/qirrGgYt3Nfxs4+MRAS4ZCJqoVqvsOB9joLYBs/gT5ObERsjOSeXFVzKAr7rr
 /S4psGgmUlgdLU0Tu920BCZ85TR9Hq1wRvMPrDr3LkpKFDEloNLSkIkG6/DrjJTywX17
 zjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wC7eTCzKFEA8RPVfrflNT3a8QbfPEYg+SOrDjqD5MWg=;
 b=nUoYq+dtdTnMDcUvcpNSQj/aKTwsYWheNSsQ34UWhdGizBrQCNB7U1KS1CAbGgIHi+
 tQfrOKZzWxGBG1XKQArQi3vkNX5/WpTCdDL7z/SFizJ7oYWQla6Ayq/4v9+3dw7Wxp8p
 BeWXffam6zp0nSTrpvO+9V9Z8XdY6INO98uqANVpIKDV/viKsG6SMYgKuNwxQun0payc
 0pIxSFIg1EViH2A3+xS3162If/9/ULfAm0gtO2WYK/S/+HzhVXgckErwaGk4SOp/iuBs
 p7LLoo1/Ym0PKJEeIIJa4sicW7RW/B7T4n/S7ceLusEQJq6xv0dq1WJr41qsjdWJw9tY
 oZ6A==
X-Gm-Message-State: AOAM530CAfuKfHdD+7iG2eUFJBZ+JDbKNgPaqNF28+I1Q0jdyFiuTR7d
 yIOK1njPrsI7xrr3RFFFqAM7usmSGaup+2KxEwbEUw==
X-Google-Smtp-Source: ABdhPJxvtQXrT7DCIFFMt2HRSw9CjyBuUtv5jSkXMKF4ewjSvNeQr04VjojtSYJbWQR9LQ6WbO/cp0az1iT94yJYBkA=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr3724628wrv.521.1642073852010; 
 Thu, 13 Jan 2022 03:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220105205628.5491-1-oxr463@gmx.us>
In-Reply-To: <20220105205628.5491-1-oxr463@gmx.us>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:37:20 +0000
Message-ID: <CAFEAcA8cY0R-jU8zH_QY4PehRnFCpJSo07VBQeXtxHKhMxjpZA@mail.gmail.com>
Subject: Re: [PATCH] docs/can: convert to restructuredText
To: oxr463@gmx.us
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: thuth@redhat.com, Lucas Ramage <lucas.ramage@infinite-omicron.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Jan 2022 at 20:56, <oxr463@gmx.us> wrote:
>
> From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
>
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
> Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
> ---
>  docs/{can.txt => system/can.rst} | 92 ++++++++++++++------------------
>  docs/system/index.rst            |  1 +
>  2 files changed, 42 insertions(+), 51 deletions(-)
>  rename docs/{can.txt => system/can.rst} (68%)

Hi Lucas; thanks for this docs-conversion patch. It looks
good to me, except that I think that rather than putting
the new document in the top-level index of the system manual
it would fit better in the "Device Emulation / Emulated Devices"
subsection, where we already document things like USB devices.

Rather than ask you to respin the patch again for what is
basically just a "git mv", I'm going to take this patch via
my target-arm tree and make that change there.

Thanks
-- PMM

