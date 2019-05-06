Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B03314A82
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 15:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNdF2-0006i1-M6
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 09:01:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hNdDj-0006Ht-Eb
	for qemu-devel@nongnu.org; Mon, 06 May 2019 08:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hNdDi-0001KW-7c
	for qemu-devel@nongnu.org; Mon, 06 May 2019 08:59:51 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hNdDi-0001Ix-3d
	for qemu-devel@nongnu.org; Mon, 06 May 2019 08:59:50 -0400
Received: by mail-qt1-f194.google.com with SMTP id a17so369317qth.3
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 05:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=k1nluuhk4/9VT0+QejuuyRxw3wMugb6QWirZCEX6Xuc=;
	b=UJeCaK60LlDlfLcSdElG1XwhGkf03jeQdQ/Q/Xr7YvJa+RnGz+LcFzP9Tth9xJ3cFc
	Mar0CktNwE+cJXgrcHuPIGuNblAwD1PhhxVr+Fig0laqu9KhMIevS6XqsuaLgDyIXu9B
	l6HyLw5IUUIuVajX6oLcYTRjvsv9oSn6LdXB5k0MUVumQ2wzHT2sQrU7imIgjxOYfcbi
	vuXDBhU4Y4qSogGpd3ntzaJEmIF76N6vbhWg8fGE37gM+KXW1Q96fvCgONrukWmbGG6h
	wLDDeGeCELK3veZcctbBRXNSfu9B1JLaAQggOJXB928MuDXENQbvgOsOardLGJRtbXp4
	5dGQ==
X-Gm-Message-State: APjAAAV6I1UBmMmxrvcBD73i1P4Uep3zX9gxklnCyKxg+TbGLTm75IVu
	ElhmbXrFiID58RGVvOVUfQroRA==
X-Google-Smtp-Source: APXvYqyjPAOPyH5pbsJaXpTfN9XIt1ykpKipgdcjm2/NgsRD0TcnnA5uxbNevTwTR0aSSwFQjuLJYg==
X-Received: by 2002:a0c:d2b2:: with SMTP id q47mr16784255qvh.167.1557147588124;
	Mon, 06 May 2019 05:59:48 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71])
	by smtp.gmail.com with ESMTPSA id t2sm6639944qkd.57.2019.05.06.05.59.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 06 May 2019 05:59:47 -0700 (PDT)
Date: Mon, 6 May 2019 08:59:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190506085934-mutt-send-email-mst@kernel.org>
References: <20190505224737.1028-1-philmd@redhat.com>
	<20190505224737.1028-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190505224737.1028-2-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.194
Subject: Re: [Qemu-devel] [PATCH 1/1] MAINTAINERS: Add an entry for the
 Parallel NOR Flash devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	Paul Burton <paul.burton@imgtec.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Jordan Justen <jordan.l.justen@intel.com>, qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>, Roy Franz <roy.franz@linaro.org>,
	Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnoij@jcrosoft.com>,
	David Engraf <david.engraf@sysgo.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 06, 2019 at 12:47:37AM +0200, Philippe Mathieu-Daudé wrote:
> Step in to maintain it, since I have some familiarity with
> the technology.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66ddbda9c95..633f6315536 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1391,6 +1391,13 @@ F: include/hw/net/
>  F: tests/virtio-net-test.c
>  T: git https://github.com/jasowang/qemu.git net
>  
> +Parallel NOR Flash devices
> +M: Philippe Mathieu-Daudé <philmd@redhat.com>
> +T: git https://gitlab.com/philmd/qemu.git pflash-next
> +S: Maintained
> +F: hw/block/pflash_cfi*.c
> +F: include/hw/block/flash.h
> +
>  SCSI
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  R: Fam Zheng <fam@euphon.net>
> -- 
> 2.20.1

