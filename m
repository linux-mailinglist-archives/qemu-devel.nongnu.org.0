Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1716BF46
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 12:07:00 +0100 (CET)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Y3H-0001SO-VV
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 06:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y2L-0000tN-2e
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y2K-00017w-84
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:06:01 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Y2K-000145-2f
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:06:00 -0500
Received: by mail-oi1-x243.google.com with SMTP id a142so12142081oii.7
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sPMT5lLww8sn6KQXdmK5RG0zQHooqw/FzKY9qovBDZU=;
 b=oNMk5GPHwq8J27CefX297ad2c2zlknEFrS9FuhE3zX4OL6isFjJi8piRQPeR4vYO07
 rHvtvhm9M5MZwW6nEG60vNM9NBwOOpqjQj4ELwp7wPSNKO82I6MS63qqHjO4ltb0w43c
 85+qFdsUmHtY0NakWcPZZkg1TMQuSo5g0LPtmkA5tYeVSs1zg/7JzbMfsTjisUpCbpL4
 jvHccrQxF+eSNmu4J8hLB3HThV4HiQr8nFXlGQ+zKVDcYE39/nvPuQEOHEomJCIwZ6Rq
 7u43KibmujBr50m2CUQI3UZz7ndUWEyfbMEilXAk5fn9MoEyOe1KFHlM6i9/TK9OYJ/l
 OfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sPMT5lLww8sn6KQXdmK5RG0zQHooqw/FzKY9qovBDZU=;
 b=aiaWuTRl0WWfkqAzDAl7QMKn65eU2+p7+pUEHACLXngMk/YyUKM/Qr8vLSG6FLNe+C
 Y7e7zpGIurcgOqbOeobrxOLj8FcO6ZMBsdNL1tJPjF942/WA3hh7fMy72AklHCgFWc7q
 BAg2atxq4Uec2nhoEngCBiMhqY34SJ9dPE8I/3HVA2Dfi52QRE1hb64CqaUJQ6WLv9Pp
 r3E2AwL35p/boNg4h0ojqCsQtAeHcl7DpzyzBZLDBBztpwZG9Erq8ZZ28GQNB/Z2L7kJ
 mUScq6BQvvp8TjwyzjkX/xsj3NQDPeifbesV4178t6sxpv1P6qJ8dewvkVlTtxmqLelJ
 fpiQ==
X-Gm-Message-State: APjAAAW2WiUWZ5Bd4OquVed/HOlUBvCPbxXjUcHxcHA+80+vWe18Q1Oe
 kbZhlKXGLtVjaTVs6zlRQfBR+5limAm6h44gwzGXEw==
X-Google-Smtp-Source: APXvYqxfd7evh02L4ra/46nXO0SSFCKCbC+uvBAX5pH3RX8XJXhBV6xEmOViUAGnSfZjklnYLZK5/pOEjcX6R4QgWLY=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr3013715oid.98.1582628758956;
 Tue, 25 Feb 2020 03:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20200224222223.4128-1-gshan@redhat.com>
In-Reply-To: <20200224222223.4128-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:05:47 +0000
Message-ID: <CAFEAcA9+xfBZRqaO1KTaP6JAYBMighs=RnuGug_brROtXr4s+A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Use TYPE_PL011 to create serial port
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, leif@nuviainc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Feb 2020 at 22:22, Gavin Shan <gshan@redhat.com> wrote:
>
> This uses TYPE_PL011 when creating the serial port so that the code
> looks cleaner.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2: Improved changelog suggested by Phil



Applied to target-arm.next, thanks.

-- PMM

