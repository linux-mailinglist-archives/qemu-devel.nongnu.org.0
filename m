Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0694896AD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:47:36 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6sD8-0000Jy-Hg
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:47:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6sAa-0007oQ-3G
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:44:56 -0500
Received: from [2a00:1450:4864:20::42c] (port=36514
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6sAY-0007ie-1t
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:44:55 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r10so18231011wrc.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DdUdpdE2DI43+tsbZ5Fawg5q61uMwqlwHZswLz/XrWk=;
 b=pwPBwbqwg1BMXLHMCLFZFKwy60HkscOkD+RmPfdWbd3gZP/nnVsP1nXlD2mwuInMCd
 OKx25K1B9zhwNgCjbiHMA2FhlZL9szs2uvKYPKBX9zmoth6LuaEzVnGuxNwC1ECHsQHw
 YTzY29mtQzPak+G/6sS+cdwSIozWoApkPng+unyE1TvKD6vP1H6jsVE+twq+uRkoEoMp
 pj2qR7B/InY9ESdnHjUhSYEbVEYLwWdJNEkMHE/w4xw9/sJCe/9FMu+WvH1ZE/HCuEsp
 tG3MzRB30cBoxuDjBX9WNgCzpGqRrUPua+3+hvaHb3VF58OWxhCW/tWfSAa/MymOXYii
 bxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DdUdpdE2DI43+tsbZ5Fawg5q61uMwqlwHZswLz/XrWk=;
 b=vY84iQV+thNu0f56nV1BxvK3Adgu9IP8nXg1h8TPyXrx+uyiPlOrMF05gH5gp1sPaA
 5fSuB/92PlshY4J3BvdD/qm5xD5rVnFUAe/pvt6+n7nFWek70z6vd0ewHKceciBib9gP
 NjEEdMA7uSYykfrfZjhKHmTYomzbqpDv2cHp5T0dSem/KmkngThtyEf6T3jLgzPCmjOa
 PbrojS/nWWwsgG77/u4W8SIzTXHDYUJwHf2GNf2iF/6QX0DxtPGcVysIOj9Rckh69Vp0
 gsN+wz/yfd3GhJLH+a6ToVA1vZia+sv9HAvKbETWMtxZcFyXhqzRGU8aCZy0FA2h4vg3
 9CJg==
X-Gm-Message-State: AOAM530PFrYXSVveYRyCG1rHRoh5VD4C7asPPXPkShMcTkaY2rfq+fo/
 E6VwasWwmU/e+6PzP47GytxpdUnGyVJdgg1EBBIanw==
X-Google-Smtp-Source: ABdhPJzXJ2rQ6UfUEXD63x05laI8b5SuCM4pkR4YaUsLzx038Gwf9/zG08VpqyqSVPtllveOiKWsHn1rhDpaWUavg10=
X-Received: by 2002:a5d:5182:: with SMTP id k2mr4457061wrv.319.1641811490969; 
 Mon, 10 Jan 2022 02:44:50 -0800 (PST)
MIME-Version: 1.0
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
In-Reply-To: <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 10:44:39 +0000
Message-ID: <CAFEAcA-ypPZRjYojBMrqRkZx6az-+NMXJSq5G=Ff+tHH6Qt_XQ@mail.gmail.com>
Subject: Re: ui/cocoa.m compile error
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 23:47, Liviu Ionescu <ilg@livius.net> wrote:
>
>
>
> > On 8 Jan 2022, at 00:16, Peter Maydell <peter.maydell@linaro.org> wrote=
:
> >
> > ... In this
> > specific case, NSPasteboardTypeOwner seems to be part of
> > an API introduced in 10.14 (Mojave).
>
> Thank you for the details, this explains the error.
>
> > So the upstream answer, I'm afraid, is that you should
> > upgrade to a newer macOS version.
>
> Unfortunately this is not possible. :-(
>
> I'm producing cross-platform and cross-version binaries, which means uniq=
ue binaries based on a bit older release that are expected to run on all mo=
re recent releases. For macOS I just upgraded the base from 10.10 to 10.13.=
 For Linux I upgraded from Ubuntu 12 (kept for compatibility with RedHat 7)=
 to Ubuntu 18.

I think if your policy for minimum-supported-platforms is
different from and goes back further than upstream you're
likely to run into this kind of issue from time to time,
not just on macOS. On Linux this tends to take the form
of dropping support for older versions of various dependencies
and compilers. Ubuntu 18 is still in upstream's set of
supported distros, but when the new LTS releases later this
year then 18 will no longer be in the supported set.

thanks
-- PMM

