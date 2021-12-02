Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B509A4661F8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 12:03:58 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjsb-0006Dn-9f
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 06:03:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1msjpu-0005Su-Ro
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:01:11 -0500
Received: from [2a00:1450:4864:20::430] (port=43521
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1msjpp-00008B-Pw
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:01:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id v11so58784848wrw.10
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 03:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P8yT33YZRYZMHpMDZbfh6LZag35jFnEFREKlggNi2Jc=;
 b=WgtwWrrgqyzWTTMdDu81W8/qN6BdQugx2yUJ25b0ErMmsE6jW3/C7WUxz0CdeH14EV
 ZvqHGHACFyUTK2c4J1fnfy6IaFU/yhn/Anp/WOEf1+LyKIJvwKNhxE0sSxTjLcquOVpv
 GdkpZJsBkfaFZTemh3LapowRzB7VeFgRn8aHQ7T0VsDBj4luTLxEVJN6nkAqD2EvaLjJ
 K1BOUJINrHrqNp26kWr1J8cEydC9R7k2OVoWxnDmnLrxyx80enD/kEbd3K2w0R2o78uw
 wJ1WPo4Dvsx9uHTDRgchMvnNP30ensgjSPYBB7bdFQefgM0hRJVYT7tMJ6HstRSlwkj/
 tz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P8yT33YZRYZMHpMDZbfh6LZag35jFnEFREKlggNi2Jc=;
 b=YemgK9WTve7E6lxv2ZE8BIOpjTJ14Qmf7acz4cIPvxLmtmKOPE4D3fdIVyo3KJ0ANc
 ZMEN38XQS5Q24NgtCHStrMvymVGzK/ue2KNCb9N44fKK3Vh5bQyN4Xs+lNg1IqdyEWvn
 /k1McujVLaZWlywJy8eFuD0BN3pCD9CwUHxvvh/hjeW+y+fW31V6BmxjExntFq+cJ2Ew
 //W0ctJGS7Por4KzRykcb5QIkVQvgMXp0FPfJ0pEf98oHrZIfGy+L0aysdVdYuLhnggo
 2pslhnSN97XiNV9mjubJ1OWvE42xpT6bPGVKmfskeH4LHv/MCmCXyTTRRgU08Q1o0gsX
 YnXw==
X-Gm-Message-State: AOAM532CPBwANfmtihm2nCBBeYbRY5/Reud3IZzT4pemzwuuydqLEYS9
 AkOWpuVTVrFeeebz0N5Wm7uhxZkGlxht6b0G2Vi1TA==
X-Google-Smtp-Source: ABdhPJyH0gLltiVuhlE2z5GwQ/zErZOwRnr2qFscC55jm/MHiE1uktEGwjCL0livGcOO+TmL7erUQIfiJAPrHbGlFSM=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr13175386wrp.528.1638442864112; 
 Thu, 02 Dec 2021 03:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20211129140508.1745130-1-berrange@redhat.com>
In-Reply-To: <20211129140508.1745130-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Dec 2021 11:00:53 +0000
Message-ID: <CAFEAcA9VG8d3AnCSDEGjBaMwrk1yAbtCAUa9wTEURX22rNag9g@mail.gmail.com>
Subject: Re: [PATCH] edid: set default resolution to 1280x800 (WXGA)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Nov 2021 at 14:13, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> This patch thus suggests a modest change to 1280x800 (WXGA).

Does this change need to be versioned so as to not change
behaviour for older machine types ?

thanks
-- PMM

