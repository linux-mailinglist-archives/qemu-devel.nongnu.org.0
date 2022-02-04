Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D344A9719
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:46:23 +0100 (CET)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvAc-0007Z2-GP
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:46:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFv6p-0004wH-F4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:42:27 -0500
Received: from [2a00:1450:4864:20::32f] (port=46816
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFv6n-00046e-FP
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:42:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so2885062wml.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jUZbZuTpM9tSZcxKB5Ny81cj9O/YNi38VWB2rnBTkSg=;
 b=Ex3kIydHlN5qU+6mhJVfGBGTzY0mHnO5bcy/DtqDd8zVf2WgjpIgVDl5Rks5i2kn7G
 gMYGjjccJ2uOGIjj0z5rlRRXVR88fubQI1LKKjX3eYvmSeS/Lkz4+LCHhJfbXwIK6YSI
 07n5uWPNZGDAR7zWTnet8/v86dynIXsX3L7A+Vcquj9sS5blA98RF5sxGORz8N6aq9D8
 3fCrv5JpkbJOxCqHPwNKvvqyDHNttT7vJPWwgPTrw4edBAfBRcJpzi3NvXz1lwoWkgel
 hVBMTXoOfi9Y+LynIpQaqIBxbecONIjPobJqgME5fTyzFOyElJEiL0pzG7ErOs2YRikn
 GzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jUZbZuTpM9tSZcxKB5Ny81cj9O/YNi38VWB2rnBTkSg=;
 b=FDR8Fk/UHC0sHauc50ZWzE+GxAOpxNzzgUIgxgKdAs2+VIwEirjJ6cyyWftAIB/oDw
 X5URfSDQvug4mQZGcddsLnU5zjhviNtT0wuFtAWztnND0QuyohzX0pMrPq8BFBs7LPmC
 qhAYFqCHqCl/R1Qp1CLxFPWhc4LB57yLPRpBaTaPkcSjZbMzTGDqaacEbDeKfo2bMX0J
 LaXwGC+FK8PtKDDA5G1AC7A1OBnKdjTxmDWFUW2gzU93II9wUqOFVN7gdQR+w1mTMHK/
 T9Z9ORTwnOdJXV9T0vuRzKowceObAQ1Z0/2+EVyku+rvSUXKXbZb3CajrVwm8kM+XsHR
 3Rng==
X-Gm-Message-State: AOAM5315KE8nAvUSha3qG9eZ1u0+2q3ubuDLD0mDHkIuLFtO8PaSaDbp
 92NnCRGQ8P9tPSIxsORZ611/XhZAxOwnneg6+aBT8w==
X-Google-Smtp-Source: ABdhPJy5D5Y4Gh2DsWYuHOBnAhiOq/wdIlcGKj8K/MHL1FuRaVyacGajJ9KNFm5g2JirVh0G5ipVP4rKwS7IBSp4+T0=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr1535488wmq.21.1643967742852; 
 Fri, 04 Feb 2022 01:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org>
 <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
 <87czk3rnfl.fsf@linaro.org>
In-Reply-To: <87czk3rnfl.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 09:42:11 +0000
Message-ID: <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Valentin Ghita <valentinghita@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 09:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Assuming you are happy for the device to act as though a external
> debugger is attached regardless of the gdbstub state you could use a CPU
> property on the command line to enable this behaviour. We have some
> examples for SVE for the 64 bit CPUs (see object_property_add for
> sve-max-vq). So something like:
>
>   -cpu cortex-m3,dhscr=3Dtrue
>
> You would probably want to model the behaviour of DHSCR.C_HALT as well
> because that is something the core might do to itself if it detects it
> is running under debug.

This is sounding pretty hacky to me. I think we should either have
a proper implementation of all of halting debug (probably opt-in,
with the default being that the gdbstub is transparent to the guest),
or we should just say that no, this isn't something we support,
and if you want gdb to get control when a particular bit of code
is executed then you should set a breakpoint there.

We don't even implement the guest-visible debug parts of the
architecture (eg architected single-step) yet, incidentally.

-- PMM

