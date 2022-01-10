Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E228E489746
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:21:51 +0100 (CET)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6skJ-000397-26
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6sfz-0007ke-W8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:17:24 -0500
Received: from [2a00:1450:4864:20::52c] (port=43868
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6sfy-0004Om-9m
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:17:23 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m4so10608014edb.10
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0qmpJnXJfCeDaYEbMIzQcSF1rO55EAFJIuLsDuZtJaA=;
 b=E7ZUaS3f9t0PD8IN6nyDk+/Y3AvD1aYw0iCYvPAySNaQPGiPsOQApMVMRUTXZ3EvzQ
 H5jPHjYtcUju+dtIs1sSMx0AgBOK6wvsPTZR1Y6vZnIGkqRPB9J94LGzubtN/SHrhjLY
 tYRKB94AUYdJmEgcwnBTLSyASITk7R0/iz9SwV7Ze9QDt4vyLDDyO8KIalA9wxH5a9p4
 n590v4XmFEgdByfDnByseaPS6MNuze4LkpdnVnElWwk1NvBVZ86DzCztRIbS2x0GwnR+
 TCWHqPMeV0rrLx4aTaEB54J08+i1I7E7IlbBuQ84wdiZAYQ6BvEMwJiNUWNzEm8skkMk
 52Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0qmpJnXJfCeDaYEbMIzQcSF1rO55EAFJIuLsDuZtJaA=;
 b=WP1/fos2drkCIsQjx7UwGm2NSPXYEnmSqfNZHJNJhhQGbFW/NmETRFWp7U4rnZznvM
 2dzdq7Qgxxbgzpq0L+qgc1tAdsxirw+0McjnO9Huzb2jVrK7jP4qcaWiIeicxsi2t0rU
 tGiy9/MRp6xLmJCwsOjJU+E2W8huHD8TGJeWK5Df4hfdERnsXtzxbWWO//iqtcFr4J8Z
 NBzrWpru4ePVp1hMQ1TltMUoWDeAQqxTyaMTODda9nLJ2jsPoCO9WcVWBb8Vn9f8BMM7
 QmKkOBSzAocU5GyqixNi1HYJlpDjd782nr8g6hRytNuSNINeW+T2AwsEJ5yaaH/4g7JP
 6MIg==
X-Gm-Message-State: AOAM532lDC4kER9PlDYb0tqDHvY8NhovubhtEejoilHWxsSNBFKwQzxt
 zi6hTvbMSQDQ0GK69wg7zRKL5g==
X-Google-Smtp-Source: ABdhPJyqzVL9EXedTLGrF3wQsDFhIZI5iSAfcncgkfPRdSXmjaJuxWJpDlpLM2+SOCgC7lpkS/Sacw==
X-Received: by 2002:a17:907:86aa:: with SMTP id
 qa42mr58232340ejc.142.1641813440467; 
 Mon, 10 Jan 2022 03:17:20 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id z10sm3444472edb.45.2022.01.10.03.17.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 03:17:20 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: ui/cocoa.m compile error
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA-ypPZRjYojBMrqRkZx6az-+NMXJSq5G=Ff+tHH6Qt_XQ@mail.gmail.com>
Date: Mon, 10 Jan 2022 13:17:18 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB0A40C4-9B7C-450D-A171-0E425D70D834@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <CAFEAcA-ypPZRjYojBMrqRkZx6az-+NMXJSq5G=Ff+tHH6Qt_XQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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



> On 10 Jan 2022, at 12:44, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... On Linux this tends to take the form
> of dropping support for older versions of various dependencies
> and compilers.

My build environment uses modern tools (like GCC 11, etc), but compiled =
from sources on an older Linux release.

The xPack QEMU specific build scripts also compile all QEMU dependencies =
from sources.

Unless you change the system APIs your code depends on (like it happened =
to Cocoa), I should be able to build future QEMU versions in my =
environment.


The problem is not that I enjoy using very old releases, but my tools =
are also used in some very conservative enterprise environments, where =
RedHat 7 is still in wide use (given that support for it ends in 2024). =
Starting with 2022 I just dropped support for RH7, and moved to RedHat =
8, which is roughly equivalent to Ubuntu 18, and I have to support it =
for a few more years.

Thus, where possible, I would appreciate changes in APIs to be additive, =
and support for older versions to be kept for a while as unmaintained, =
not removed completely.


Thank you,

Liviu


