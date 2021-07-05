Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B93BC019
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:34:01 +0200 (CEST)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Qbg-0001zb-Ou
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QYu-00089z-56
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QYq-0001jE-Tm
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625499064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbx0TmXX3VTcdGMXnMcxeSJTLKAAmon+IBboGPb5+ZM=;
 b=WFkP81f0Trf1foaVRfozo8FYykhCIPfuG/x3L4XqEcJ0CYAMfbncXqUYySotDsRcJO/qbt
 VkSKUquaSvTYWsDBWysucT9mgwvvPX6cP8Il/ONiJKe2dp7V2/Xtds7eJJ1tZQ0TFexQ1A
 mTAahUO2Cz0RiaFsIqtCK+fh6FC5+q4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-1AlzinRPNjmic8WBLxLIMA-1; Mon, 05 Jul 2021 11:31:03 -0400
X-MC-Unique: 1AlzinRPNjmic8WBLxLIMA-1
Received: by mail-vs1-f69.google.com with SMTP id
 v15-20020a67c00f0000b029023607a23f3dso4193690vsi.10
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tbx0TmXX3VTcdGMXnMcxeSJTLKAAmon+IBboGPb5+ZM=;
 b=rcOBxqJ/qPYTHk6cghg6SgeGD2XlfyVf5QFxJGw8lhRaQr0F6dy7sDZNvyJjKXGgvt
 OAQFU3aQKJ8GP+IUIMAP5mub6iWJlfCx+yR3CTYX262LGGeLiLrd+PdLJHmxxQqZHxZY
 XBZ682hkgg9ZmyS+BURRWBjAOOTHzvFgQ77YAAUue7c4B2kDnX6s/2tKtrkcu1AQgYT9
 b2/OFn56r8X6CPO9ycOPtnFQa7RpsBFg0VSBv8C2petDl4W1QOJ4qgzAMmsLXW1pmKBU
 h0bJ4PKxVurGjasFJGhRFEGwdttJ7snke+G6/I3Vig7PAkVis0uVJ70Gk4HjcG4JWDFU
 103Q==
X-Gm-Message-State: AOAM533wQbg38RgHX1GxXux+HdZH+AXYrqff29ZdzyCvwM2KTUOlwnvK
 K97Aml/xbkhp88ucRI7glSE1yoSd/oH1+DAny3t8+r/Wzoz/R4ANSdIxi6a9zPZG/Phm0Ey/zSf
 J/ay3mt+Iy116A1RYVH28CcUMVzfdw0I=
X-Received: by 2002:a67:4385:: with SMTP id q127mr4723206vsa.39.1625499062781; 
 Mon, 05 Jul 2021 08:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAN2RnxJTrCylLrQVjJ605AchSwbHv4N8wFthufSHhfvxU0rpJ5p+6BDvWzJyGD4lY1mwZwxnKg9159oBBldU=
X-Received: by 2002:a67:4385:: with SMTP id q127mr4723188vsa.39.1625499062666; 
 Mon, 05 Jul 2021 08:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-7-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-7-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 12:30:36 -0300
Message-ID: <CAKJDGDZ2VVqHHht2TVGYAOVKjJ4s1s5M=xOWMfg9Bk+AH+7O8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_bionic_20_08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel <qemu-devel@nongnu.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 3:09 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> U-Boot expects the SD card size to be at least 2GiB, so
> expand the SD card image to this size before using it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> TODO: U-Boot reference?
> ---
>  tests/acceptance/boot_linux_console.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


