Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25682158DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 07:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNsYK-00033u-AV
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 01:22:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsWc-0001kK-Qm
	for qemu-devel@nongnu.org; Tue, 07 May 2019 01:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsWc-0003pb-1C
	for qemu-devel@nongnu.org; Tue, 07 May 2019 01:20:22 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:45554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hNsWW-0003j8-OR; Tue, 07 May 2019 01:20:16 -0400
Received: by mail-qk1-x744.google.com with SMTP id j1so3530702qkk.12;
	Mon, 06 May 2019 22:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gNF1guSC/XzjZL9VnCwYhAjrF52A9evcZ6a+F9k6uRU=;
	b=heIivDNnha9tVWo2TEugB5kgIpD1c4Jet3pGDaHtQx3qlccijUhxXXIYJhr3/mOwc0
	506Hc5uuaFJo4kMZ90ZSQEEdINIKEWA0TGZb29tHzr3jYPO5QzFBC97EOXNqwBl40UOp
	GO2IcZI35aediJdzCMCprGa3rCoXkivzRAoek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gNF1guSC/XzjZL9VnCwYhAjrF52A9evcZ6a+F9k6uRU=;
	b=CKmXdqSGCuT+n/YRVxrWcW+9zGVa5/IDeME8RQzWSiHiyO7RUe1VYqM8Y0WpkqR4Hs
	L3KmC+prnGv3y99hfHWU8Wo/IZ7y7kK9AsRbMP4kVqJDC/qmQ+VtIZ/mHC84+eLVdGj7
	YnKvLMIXZOzD8hZyXsvY/Weuugu+oT17pNMvQlxAVTsUEEjgJeObSzWva2bkIwXoFUOH
	jz48dD2fmh+nu3QfVS12zjYLyhK/X6Q0EReYOB8b8wvhWdyY93PWaRRhS179ZbRlFYdZ
	t+bvvpYqwPi1jtl0ZV2scezJ5k3at07L4vpjw5XLHCU0HTlqSb0itRJqB81VlvtTpBAA
	zfEw==
X-Gm-Message-State: APjAAAVyqYF3VvvqPQ1L7Nfnsu+F+Thj2Epu819iq98h+M9ccaUsLpda
	p7VbDJIrDKUpO9y4pAA7GZ0WwyljwuOK/oe9yJKJhCmf
X-Google-Smtp-Source: APXvYqzU5TfROxvnW8Um/UbxLvi12a0ECJ3lg6knoe5gMIvv3vWqYdG1yMU1+S1aTiUVqr3OEZWgyji63vqeoR5sLbE=
X-Received: by 2002:ae9:f00e:: with SMTP id l14mr18396247qkg.127.1557206416237;
	Mon, 06 May 2019 22:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-4-clg@kaod.org>
In-Reply-To: <20190506142042.28096-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 05:20:04 +0000
Message-ID: <CACPK8Xe8XXx9af7LExd+NSQK8Jt+9Ca=ReP3xv94DV7vwTY3EA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-devel] [PATCH v2 3/3] aspeed: use sysbus_init_child_obj()
 to initialize children
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 May 2019 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

