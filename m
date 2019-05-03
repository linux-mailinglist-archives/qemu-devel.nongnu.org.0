Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF01311D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 17:26:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMa4g-0007Tf-81
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 11:26:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMa37-0006nY-E3
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMa36-0003km-8W
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:24:33 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMa36-0003jp-22
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:24:32 -0400
Received: by mail-oi1-x243.google.com with SMTP id j9so3955276oie.10
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R5EUZbX0veMkQ/tTDrUkgxg/WxlZ4V6jrgweu1aHHFw=;
	b=Fq1HxMDl3UVPQyCHs5kCf6vjjb1ebXAjXa1FKW8v+hYo7c1U5Unp5Zeouy99OC6QpT
	jNU4xWyQC3pwVzjhYGd895HmygtCN87GV/9uoddyCYUbP2Qjz/NXaxIkIDrzJbas5tCa
	DMAg7Yn360+LT0DAmGO+5UkMbAPIIY+DtNMselXoBkgXQ73SuJ+friUM2v29jdBqCQ5q
	iZ0yrZEugXdriHNXQz6jFTQltygfccVUoVMDY31DdTYDxwzjF+RFrEwygM3tR7YpJCN3
	5Ht3t75tTU0LmzKiMPISd2JtMiNrhyvjhpJFcezIBhNfDwSjyN1DJpNxX2TReKjjcvUu
	COBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R5EUZbX0veMkQ/tTDrUkgxg/WxlZ4V6jrgweu1aHHFw=;
	b=fqBZY3pTqByPBdWERNiXVBagJG3wDqMMQaYqO/1NDayu8CwwlsoYX0IX0DMPPRKH/M
	89A8x9yLbppIh3uZJ2ZQ4h5lQVwfWE3TrqXNzc5t1sO4cii1UcvyqJnqyWC3ry1tWdOS
	08qDxwPAbWA/TZj1ZSm3RYRd/W9WJfa8Unuwrni+auHdgxZ18fbEgb1uodgAJYqEPYy/
	11ZxqRLrx4CAlNnqMgTP9L8IOMWWQEsdntP0NT0AnSjgxbGnx2OngzrdXvmz4ZHOJmiw
	CivfMWKnWWoOaCLGeAPoXDEFMNszGTIO9C6RlVXjvFN5ihFf1LggXK5TlPW+ciZYBp15
	xhjg==
X-Gm-Message-State: APjAAAXS5lsmDTpYcUR+3KtiYHNmqxwMJ6s3y/COXja1qm0DT7T/Qjdu
	OJlDHUhs+ydiA8fZ4CEF9r0AWkATIRbque5yKFJKHw==
X-Google-Smtp-Source: APXvYqwDAehgVhxV1JoU12q+bgVNn5tAsTrGhCO7Zltg1kAlL0Jyz0biXGiVZcU83q2q8paRWbkz32RS2uztHnl5TdA=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr6601892oif.98.1556897071133; 
	Fri, 03 May 2019 08:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190430071405.16714-1-thuth@redhat.com>
	<3619e259-7256-9199-2cdb-53f980f64c34@redhat.com>
In-Reply-To: <3619e259-7256-9199-2cdb-53f980f64c34@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 16:24:20 +0100
Message-ID: <CAFEAcA_70xU7_Z7vEs+NHuG6L9jZTp7_r2yORn91caqV4LknPQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v6 00/30] Kconfig dependencies
 for ARM machines
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
Cc: Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 May 2019 at 16:15, Thomas Huth <thuth@redhat.com> wrote:
>
> On 30/04/2019 09.13, Thomas Huth wrote:
> > This series reworks the default-configs/arm-softmmu.mak and
> > default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
> > dependencies instead.
> >
> > Some of the patches are slightly based on the work by =C3=81kos Kov=C3=
=A1cs:
> >
> >  https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html
> >
> > The other patches have been created by looking at the sources and findi=
ng
> > out the dependencies the hard way via trial-and-error (i.e. by enabling
> > only one machine at a time and checking whether it can be compiled and
> > started).
>
>  Hi Peter,
>
> the two usb-ohci patches have now been merged to master via Gerd's tree
> already, the pci patch has an Ack from Michael and the AHCI patch one
> from John. All patches have been reviewed and/or tested ... so I think
> this series should now be good to go. Could you take it through your Arm
> tree? Or shall I send a separate PULL request for this?

I think it will be easier for me if you just send a pullreq for it.

thanks
-- PMM

