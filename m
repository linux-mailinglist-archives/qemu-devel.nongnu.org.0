Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0154B4FFB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:24:40 +0100 (CET)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaPH-0005qM-4R
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:24:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nJaJ8-00008A-5F
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:18:18 -0500
Received: from [2a00:1450:4864:20::536] (port=34744
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nJaJ6-0001TM-5y
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:18:17 -0500
Received: by mail-ed1-x536.google.com with SMTP id z22so1289229edd.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YIa1Mb6tqlQ6LMSjf7mXLocV0n1MxlXqCzbLuG0tX6Y=;
 b=yMOCQNx0JgZ9FbJ8jJiKLrAnEDmxy3hIq7Q1DcL2H5fQjNfRZ7S0NTeCFg+hK1Mza3
 mn6mwhm7pzxr5gvwc719XB1GPk32hLaYXDCTUMalX+lCaiF4RYd6I7SRdP+IBLUs10na
 KkEBiocDuTw+kkp+qpHcp/Xh81Kz4TUDUopPhq0Nc1PjwJ2hUw6Tpht1bLIqCLdFEwUW
 nUI3gH+kHmd1feLaTKnnikyYJNYQ98tqsWiJC5+jOxHiBoIBW6/P9pU3Yn1ACPIxDunF
 ys3IZRi0qJINII8B3pOm7vpH+Lq8b2USAq26WhwymUCH9E62xJvmIruD9YZ4dAlvsemZ
 3cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YIa1Mb6tqlQ6LMSjf7mXLocV0n1MxlXqCzbLuG0tX6Y=;
 b=ibPY5FG6Kr1ZWQxX1XHiS8Iio+WXsfTyUjjmHrD7LgtelE5wZ2x/9tI2XMsfbNUz0X
 C7MMTt6iB4UJcl9bCDLdG45Tj9VuE/5TfYCdXaVkX65Cme3kmqpjEp5PMlUsq+hBDWtI
 EU5w1N+sY2NNYCkHjijvTGBAns2p+ADINirJmsBetvMflx4OiAzAw2YzpS8sH9QMtZzB
 7iAOlvZ5X8BXB2xbI/95kO0q+nkbRWTMyj0+V/kBDzAMeZu8lPX/OJNZQLuarQqhd9xn
 qR+clwf/6zaitiG6yCFfmv0b/U7Nkb8h8kAGegqowdINuzm/vA8ZkILLKopWcgagvTzK
 psnA==
X-Gm-Message-State: AOAM532WZowyh/H6PKAGVSgY3ueSsrqNVMxLQ72pEaBlyVxlHbN3R90p
 lloRwiyb+WY/TXjvOjkGnvKD/w==
X-Google-Smtp-Source: ABdhPJx9EBdsmWkVc+KLnaOcvZ18VmdW9MvXKhjEOhruT9E3JZuYziCjRkuPF34TB4Q+kqtv1uGQxA==
X-Received: by 2002:a05:6402:43c5:: with SMTP id
 p5mr7291740edc.426.1644841094879; 
 Mon, 14 Feb 2022 04:18:14 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id g8sm5758066ejt.26.2022.02.14.04.18.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:18:14 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA9YxQFug5vuHwi5koHUDZiBfMVHUr8yfby9r5D0b6hM=Q@mail.gmail.com>
Date: Mon, 14 Feb 2022 14:18:13 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <08631A61-4E68-4A3A-99DC-56C3FDD5A780@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
 <CAFEAcA9YxQFug5vuHwi5koHUDZiBfMVHUr8yfby9r5D0b6hM=Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ilg@livius.net; helo=mail-ed1-x536.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 14 Feb 2022, at 14:06, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... but the "v6.2.0-1-xpack-arm" pkgversion suffix works for this
> purpose too.

Currently I do not use any --pkgversion in my builds, so I guess that =
this is automatically generated by the meson script, and reflects the =
name of a custom branch in my fork; if I switch to using the upstream =
repo, this will probably be replace by some tag or commit id, which =
identifies the exact version, isn't it?


Liviu


