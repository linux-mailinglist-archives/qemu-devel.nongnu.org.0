Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D5158DB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 07:20:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNsWv-0001Rn-PO
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 01:20:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsVB-0000aH-3z
	for qemu-devel@nongnu.org; Tue, 07 May 2019 01:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsV9-0002pG-2q
	for qemu-devel@nongnu.org; Tue, 07 May 2019 01:18:52 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:37477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hNsV4-0002n0-Ot; Tue, 07 May 2019 01:18:47 -0400
Received: by mail-qk1-x743.google.com with SMTP id c1so139514qkk.4;
	Mon, 06 May 2019 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qhZig2axSZIgL7BGzsy1qVAtFItOkCIEnW62wof9wb4=;
	b=f5x4dqKrrJx05bARe5eOZkQRY9WYqh3aAUFeBU5jkRfIU3bfVFkvNcqx6I9XRpvIX2
	td+XcgxjLAvj045LsVzAv3b0sL94BlbJjJKwXjdko3vsW6tv/sPL/74Waugk889/gsGW
	RZ3io/JYGPOXoehYWgt1DGwuNXGFvz+but51c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qhZig2axSZIgL7BGzsy1qVAtFItOkCIEnW62wof9wb4=;
	b=ZjHgxRi4QTK3sstkqeQBTQ5ckvSa3aNc3I7HxzFh0Wjzmn/j3mrTyvkL3xlOxvdUm9
	JpbpFpSrsUTEKc97Vk9yHray8ciFwCf8iCLYPwzXH5PQv8DAohpXmskSS9RAFTaVOl7N
	B5Q4NGNbOZUi83VS+vDMS8d2OgWMh4pEWIgaJSexhj3VxVQn5zwo2GNK+gXFscqYBLbn
	bczsLlOWlh/ErhfRrYK1zwz8PPecy6fJT0DuStI62+ge7gAR+7CZSQfreeMp0sii5PKY
	LJhTKTWNV2QpDvBJLJV4POcIOCYxSkAhnaDvXfHpkd81eT0SQyS8f9MGySVMXVUqLPHd
	G5zA==
X-Gm-Message-State: APjAAAWMCEDm+zAhMgGiKB19Dn8JVLYfTpCxgC6p3zlqmmBIEH2rr3zv
	63uefHb5q+6YxAkWFlTaop2LBeMeZIb/pmLNg8E=
X-Google-Smtp-Source: APXvYqxQSWsUsZD5bsnH74PvooQLS8p7I6LMLhBc9ZeRF+hJy0lXkzRLZ5NjwqyspnGWDXst2Z1yWtqRluq9N5dKTns=
X-Received: by 2002:a37:a289:: with SMTP id l131mr8098306qke.231.1557206325376;
	Mon, 06 May 2019 22:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-2-clg@kaod.org>
In-Reply-To: <20190506142042.28096-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 05:18:33 +0000
Message-ID: <CACPK8XdJofG-bL2gArsFpRe5R_eq4ZRwP0iwt2XnAoxRNbaVnQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: Re: [Qemu-devel] [PATCH v2 1/3] aspeed: add a per SoC mapping for
 the interrupt space
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
> This will simplify the definition of new SoCs, like the AST2600 which
> should use a different CPU and a different IRQ number layout.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

