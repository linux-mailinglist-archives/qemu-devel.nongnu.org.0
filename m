Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8204AFFB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 04:25:37 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdQHu-0007Bj-S9
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 22:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36393)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQH7-0006gL-Gz
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 22:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQH6-0005PY-Ig
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 22:24:37 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQH4-0005MN-KM; Tue, 18 Jun 2019 22:24:34 -0400
Received: by mail-qk1-x742.google.com with SMTP id l128so9974218qke.2;
 Tue, 18 Jun 2019 19:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wvn4Vif61o3VRHggbcT5JUZbaHwuzqncIVST4G/0Wlg=;
 b=cvBxi4Oix9OON5yD/2BNsAbiaawGwAdRDbqN/Hz4Yay+zVCspGWpyTgsUwSO4C34/m
 D7x+N75+QisQ9rVmqaQFRoMwDOQsCNsTH2LemrRXTb2EGb6IvO+51cTJ6xXPwiFMEoqw
 X7e//nGCfAu65SAb/3JGDnQmUuL6zJNxc4xsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wvn4Vif61o3VRHggbcT5JUZbaHwuzqncIVST4G/0Wlg=;
 b=oO1RwiYw4iSIFOx50dkRwHSDYm7lRU1DL6TsFYOn3Lu3RqsW7a0F6WCbbrI+1WmdoM
 6B0RJ60M3qeGG/Bf391zHoknntMz/lsZ4MR+2zKKippowCTa/ohHhdFD1sHhbdUkEuHu
 u/bFnHcyraDTB2sp/qvD1PnPq+/6vZF83wRSt5iWD0x1lM0Ek6vMqNuziqXxS5d3yPXr
 QacCUuPf51q6n+ouneTwSc5kWCtyt0wz28V8Zt8F8yrArJNkDXuhm7kow/IwePkq1ufw
 FVCbEHjM91DovQX/K1k3f6FPjL+geNtQJM6NUP874fqS3XzpO34AclXw52/Wc+ef6cEh
 FvQw==
X-Gm-Message-State: APjAAAWL4GNZSXUtDu/sOuHSsZkQGUT6KTajca+YlHVapADNcBfEmqBR
 mlhPhCDAtmdXf2fMu0craMv/wiIBvnzhh2GaNtQ=
X-Google-Smtp-Source: APXvYqzDfYYDVKzNyxgvlmXytLn9SV18UV1OyiIao0MGLdFMUcEBaT2DK56p8kN7ZxB7q6deO+HJCOKWsy+C6HOD7kI=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr99980159qke.76.1560911073212; 
 Tue, 18 Jun 2019 19:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-20-clg@kaod.org>
In-Reply-To: <20190618165311.27066-20-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:24:21 +0000
Message-ID: <CACPK8XdwsBZktQBjBszMMCo3Gkfwz_h=8xyZehhY7bqE0U9GSA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: Re: [Qemu-devel] [PATCH v2 19/21] aspeed: Add support for the
 swift-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jun 2019 at 16:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The Swift board is an OpenPOWER system hosting POWER processors.
> Add support for their BMC including the I2C devices as found on HW.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

