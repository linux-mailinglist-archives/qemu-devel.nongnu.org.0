Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB2E4DE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:38:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7Qf-0006SU-2i
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:38:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7Or-0005fG-9s
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7Oq-00049H-Gx
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:36:57 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL7Oq-00048i-2U
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:36:56 -0400
Received: by mail-oi1-x243.google.com with SMTP id k6so8471983oic.4
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d34tFGG/tSM+NquVpJ6ChfVAxq5XsCav9xPYLDw6bcc=;
	b=aDWWtkl7XNXBNDGxm/826rG1oZb2uENKUgo6VI/m/VEjQjiRsAhY2E31qhRDCxNFZH
	dDRHpl5S23pSrblcliTttKpDs2o89bwNCYTz5FWaumu7u1uRfWvfkd1Ct4s1dcP5S+Up
	w4ZXCn5YvWrNaQyTK52123aL97DY7/Fo2YaZw4BqlJ5z/3P51DsIHCFbiNdOyV3VXoJq
	yB6Oy+SYmBckaBjFiF8Tuv6i2P4yqwU4cdaJDtIp4yf9cXdrRpmUE+gYo3xTRGFbYd17
	xIUnqxWxDXDFX3eh9fG8Zhu9Fyf/dshXu1B6b1uDagbKl8O/XC9uYI34ZIGv1+g4XIZu
	qE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d34tFGG/tSM+NquVpJ6ChfVAxq5XsCav9xPYLDw6bcc=;
	b=TYPWCxdFmK0nuU6QuVEAn/e0R4HADqGGM19kV+ZenqIIpKH0UDA9Gt/JSnQTtmRoB8
	w49ZQJUEeAVXeomb0WOPTXoyoGJSrdHtWKLx/hB9Z1UFqNQUOj/9jXYdialrA8s6Lpin
	ZR8RTaDBc3exHRn8RVN+6YPsrwEpNcBffLKuxvrNqpmOGbo8kDQZbGI6wQLIXL84NNJ/
	7iHwbhk8lVHbh3Tq/h47+wwjO7UtGhxdBshwfsaCdRkbbiFrz9A5Ft3aDiBU6z5/txh4
	94Q38qDdl+TwsPX6YvUjILB63pHGYW0ZdrK4RyXaVxXBc779bNsvUZS+5br3mtbBKFyP
	SRSA==
X-Gm-Message-State: APjAAAXf/0x/I3ZoqFznmTkjzWlp9neeyYO6UvwpoYPVTw+LLOOvl04O
	6bKt4BQeFGAvYno9Bc6mykjIv1WSeTvBBi7t4f0j1w==
X-Google-Smtp-Source: APXvYqxV6MsjVQPbcTJKbvCJ3taucxZ5TBRIyLfacbmoetp1CZVbmVplPSv9kD41lu/PCAdUng5PoZguGV84LtQ0Ddg=
X-Received: by 2002:aca:e054:: with SMTP id x81mr15837436oig.146.1556548614978;
	Mon, 29 Apr 2019 07:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-29-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:36:44 +0100
Message-ID: <CAFEAcA8=Tq4txdRkv2x04ZaaHBUnc1DCvvXOwdjOZj4JiQNVgw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 28/36] target/xtensa: Use
 env_cpu, env_archcpu
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

On Thu, 28 Mar 2019 at 23:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> @@ -712,10 +707,15 @@ static inline int cpu_mmu_index(CPUXtensaState *env, bool ifetch)
>  #define XTENSA_CSBASE_LBEG_OFF_MASK 0x00ff0000
>  #define XTENSA_CSBASE_LBEG_OFF_SHIFT 16
>
> +typedef CPUXtensaState CPUArchState;
> +typedef XtensaCPU ArchCPU;
> +
> +#include "exec/cpu-all.h"

Shouldn't this bit be in an earlier patch ?

thanks
-- PMM

