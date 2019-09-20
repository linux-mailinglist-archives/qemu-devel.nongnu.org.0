Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF4B8A58
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 07:09:20 +0200 (CEST)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBBAV-0007Es-0K
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 01:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwZ-0006mn-3T
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAq5-0008A0-NQ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:48:14 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:41762)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAq4-000894-Na; Fri, 20 Sep 2019 00:48:12 -0400
Received: by mail-qt1-x842.google.com with SMTP id x4so7194188qtq.8;
 Thu, 19 Sep 2019 21:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/giK7s/qcGhdKTojWdVT7kLrXHw/1PpReGqg19nsVYo=;
 b=cBS0kAN4NzKv/lCmsd6dmK3DbcH+y3Mc7vyn/LCVnPfah4pIzZBOlGnHp54BWBXVaW
 9oEs1x+9zlEYA1P3HaEVyC7EzxHTjADzFTzwkg5ffcFizu461r+okN3kMsODIgBXh+f0
 b5HHvnnLo8LQelKqmI6ve8KFnr7PwKnAk25PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/giK7s/qcGhdKTojWdVT7kLrXHw/1PpReGqg19nsVYo=;
 b=Bst5mF9oRZkd/WMWuB+n+zYwdjfjYHv8IS6QAR7KsSAzWpUaP+X2IK+jLVVzyT5x8F
 nEZIX2y7IJoQuRthV411bSM/9ggZ9hEKjJ9oa7C0lR19LHIXjxmRKyVmWb3CADOIrNku
 cVDxiE8nq0ADiBoklz3kmFJHh6bFs9WYcDzTGU9myYjxbL2AD56mDfdgA80ERuoDb+Wy
 6/HXzX2WjyoEqh/Q1HZJdLWc6BHXhG/h+CN45/QvCQysoJ2L2HrYfW4RWRaMZBWu7FSx
 N/PMdQEc66NSB92LnogptUcDw7n/e1FtvxroYQIDGt2CT+pXhHryhSm0HrSzGd6Z9ER9
 C6vQ==
X-Gm-Message-State: APjAAAVx1mx7z5Tnz47dTuXNe0vhxm4n4LA8fGRyfv3K59QPoYyx7FQ3
 tAsNmRJ8MJ8uUuN7RcxxW6xYb/FoESqPN6dVi+E=
X-Google-Smtp-Source: APXvYqwkrbzlYplosOCf8v2KgVTM1b4/IZ3SkH+JCZo1IWHhBnj8oQFrYGUkQkDlDqfTfMyANdIt78z6MqBWLnILil8=
X-Received: by 2002:ad4:55b2:: with SMTP id f18mr11583990qvx.16.1568954892112; 
 Thu, 19 Sep 2019 21:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-16-clg@kaod.org>
In-Reply-To: <20190919055002.6729-16-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:48:00 +0000
Message-ID: <CACPK8XeJpE9YoA=d-j4kHxA6Ffn6Me782OJBqtSHrx=YfHbioA@mail.gmail.com>
Subject: Re: [PATCH 15/21] aspeed/i2c: Add AST2600 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The I2C controller of the AST2400 and AST2500 SoCs have one IRQ shared
> by all I2C busses. The AST2600 SoC I2C controller has one IRQ per bus
> and 16 busses.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

