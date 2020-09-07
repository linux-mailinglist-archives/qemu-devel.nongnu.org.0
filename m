Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE602604A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:34:01 +0200 (CEST)
Received: from localhost ([::1]:60324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLxo-0003oP-9m
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFLqw-0000cc-Ek
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:26:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFLqu-0005PK-Hl
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:26:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l17so13533084edq.12
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJGTwQzg7xcEYrTKZxOyuk/9RXIjii1Wfyrmy6K0z1E=;
 b=tk/dP7FT17zav13ca27SOFW1z2D7q7RFYmtF0mgh2PUZoxG4yPnEoL99w9Hbp80Ntn
 fM77LH1vCPi/ZWii5ga6jlSvKsK17KLa+1TVdER3kGlFv+ORnT847jcz0JOEh6jdclLn
 YWL1cmLoK+jHCKhYBYCJM6x0/LEWzBhzfm9WFU/KSPUJNPpT9L/QcsxmCnqhMCQkei26
 N8f8LN440U/KP8RQyemgd81hTx44gGS66ARsh0P8l8WIHMcjHk5crjtz//NM7w6SEDc7
 jNB2TYGH16qDEdKMiaK5li+26t9JNcDOxKs4ryJSnGScau2IgQx1xnLUoVrZxbmDhhFN
 U6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJGTwQzg7xcEYrTKZxOyuk/9RXIjii1Wfyrmy6K0z1E=;
 b=tBlbNJG4vRqqC56Vt/tFan8ZR99DTLUf1shvjyr5f0eUNxT/AKVVYgUYOzM2hMveN8
 0cv6SNZyHiNveNvg6QlveTJxCJ9xpMkZSDNiECOyb3jDdPT/TBUT1q+BeGee1pG6XhFw
 ndUBEnaU3TPoDUSplkZbulYd+LjmKxkeRRGI0CxpAd5kn15hhYVPdSn6O/MEk6oSjZih
 5FHD5/Tt5BSetrvi+2XqPhvHmNj9h/osgXwCGhHiiOxXsv7uiElq4gzJ7qNazYyuTEVa
 6gxrjWFPUM9kEOAPnyEwpKN9N0mFwFgo2r0pCJuDICxS8mfO3G8YoOdkSSViDv4w3oPR
 IibA==
X-Gm-Message-State: AOAM532f5CGMP/KrpdGfNrbkkxASQ3bkurdupxAmpzw0mXSueX42PAFS
 pbYS2YavMkmcmIHUMkCoJwMBU30tzDkCeE64mbOjag==
X-Google-Smtp-Source: ABdhPJyfC71fy+3EDQZT3Y27W7IjZY2hfNZByWW1Iv3hPxphJdFCIx7KYbdixdrpK3mXhuVD1QacDvd1BpDKboNVABc=
X-Received: by 2002:a50:f28b:: with SMTP id f11mr22455748edm.44.1599503210474; 
 Mon, 07 Sep 2020 11:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200907121127.136243-1-thuth@redhat.com>
In-Reply-To: <20200907121127.136243-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2020 19:26:39 +0100
Message-ID: <CAFEAcA9qdsFdyzRwU0=D=SA+Vt-dd30PfEcNhbDhPRMYvDvukA@mail.gmail.com>
Subject: Re: [PULL 00/14] Gitlab-CI improvements and related fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Sep 2020 at 13:11, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 7c37270b3fbe3d034ba80e488761461676e21eb4:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20200904-pull-request' into staging (2020-09-06 16:23:55 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-09-07
>
> for you to fetch changes up to 88e74b6122bb40852b1c98befd47a572f0c06930:
>
>   target/microblaze: Collected fixes for env->iflags (2020-09-07 12:34:17 +0200)
>
> ----------------------------------------------------------------
> * Fixes for cross-compiling with MinGW / compiling with MSYS2
> * Enable cross-compiler builds in the Gitlab CI
> * Improvements / fixes for the crypto tests in the Gitlab CI
> * Fix for the "make check-acceptance" microblaze failure
>   (required to get the Gitlab CI green again)
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

