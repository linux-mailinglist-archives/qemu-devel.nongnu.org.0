Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E521FE3E8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 15:46:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL6ba-0000Kx-0D
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 09:46:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6YB-000728-9y
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:42:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6Y9-0002QI-E7
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:42:31 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL6Y3-0002BA-Q6
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:42:25 -0400
Received: by mail-oi1-x241.google.com with SMTP id n187so8289298oih.6
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RQgEkj5hf9/vEdtGnmFx6Q3e32wCaQXwwBp9uZolo+c=;
	b=HaR6Tp9lBjMwwxzmoBsYrggtiqQi9N/vqOQgF526aGS8RR4VHIB7vbBJ7ceMRDxKQp
	QNRTSN2SVGZe6L627QLBaA+kLtm0c9WVsI6mTdjhiM2AQdAxa44aessGDcWgQtRK92PC
	Hef3NYomFOhJZ8SKqBd34532Izj3zKTFzS2K00PhvxJtrRFqmjuuOhM20t6J9q7xVisE
	tiUWoFvdJsai+uThLKXmG5Z2L4Na3D6Q5VEnFwK4bxeYiwwXAp8jQ4okCrv/y3GCubis
	1/b9JTuMSR3ycAeY3kDxmU3ywr+O6QYT/2OMTStFeNHs2UvQ0u94VNaY85iZ6UMLv9Dv
	PYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RQgEkj5hf9/vEdtGnmFx6Q3e32wCaQXwwBp9uZolo+c=;
	b=C+5r6lQppDtSdYMSimElX6zV/w4ZuD83L/BczG+3pfJLD3WpxoQBDOA4JwQP6JA+1e
	/fRwKBSg/L5IDRj9fRW6zm5ZmW8ZeNkARInw1pI61cF05CvsDXtRNVQF9GUFFMfeHZq1
	3VTqZHbyqWDMcJzXl9y145II+GrEKEvtTa1Po6To5AwLOOGYZv/Z58Tk1DLp2TWtoDvP
	Gltlb6As8vo1644YFWWB8/zuwxtlzQ2ZS0WMJQ39gQIFyB/loV+YYM/qJu2IlS2EGP4b
	LjNCElLJUaMhdxtvQUi+xBQT3gBXezNQW+92UEW51q8Da5j6NdOTtPqDCcnKTJHY43Ea
	j6Mw==
X-Gm-Message-State: APjAAAVEQmCdeIIf69tjTFbzbPnXEiEx0+s7p32DY7FAHLO487aW0Uki
	Ujs4L6CmSgNvbyc9AF81KoalS1CtQU1zf4zi7O3baA==
X-Google-Smtp-Source: APXvYqycyh/LrxBQCq/8ixM662CSsbJc/tlOQfc90myXOUwsWWypha5ya2iTzsrjjvK4rwwp51hORSSiAug0dOEBI74=
X-Received: by 2002:aca:4c88:: with SMTP id
	z130mr16225850oia.170.1556545336778; 
	Mon, 29 Apr 2019 06:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-6-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 14:42:05 +0100
Message-ID: <CAFEAcA9Vgz4+1GP=k22GeHrcfg243VUgbjcRjzDQtx5iUEcL+g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 05/36] cpu: Define ArchCPU
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Mar 2019 at 23:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For all targets, do this just before including exec/cpu-all.h.
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

