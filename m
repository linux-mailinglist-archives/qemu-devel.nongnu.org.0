Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6AE950
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLADt-0002O5-1U
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:37:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLA6R-000588-6f
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLA6Q-0006Rk-Cs
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:07 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLA6Q-0006RO-8L
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:06 -0400
Received: by mail-ot1-x343.google.com with SMTP id w6so9374706otl.7
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rVNgDqFtIwPC4jl9v/zGxM1VA6C5kpz++/BT4KoJZa0=;
	b=SfmDq0rTa+JK6NmWXNmiYs7l1eMyx/C3GvnX9Bay2pag2cBlqIh03Ke6XlTyvcYPRh
	gTEBTaKNYrt6ddeYUzrgP1OE3HMVweKGfrz0X9vaunTuCwo9qhhMJtkUvnQy4ZzNjVnR
	sO40ONZL1D+waaXs1cksrOzlrJMvzVpblHaIi7raWHa7iLWg679lLpl4xN5Utl5OSvcN
	BadoTxEepCIjMFQW09nJ35PSiYn3GahUWyzRxpIUPAM+QRiN+dR/qcF+UzMyH838+k7K
	VMF9ZtrxGF02X5Rdbd/qJkQxWMD1bMNFd5XhW/ePBKe5U9k3+MnsH+cAbWz2IDvjKCMq
	xfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rVNgDqFtIwPC4jl9v/zGxM1VA6C5kpz++/BT4KoJZa0=;
	b=MPhQXRbQPWctOyoypsTOa/AsdlBhBVLmKUbp0pe+g4055yVR3VR1gHHt7nIR8GCCi9
	kVOZ/jvmxBMLfS8mFY1sZvqzImaJoEqFD4cITatnDnXYJNuk+iEtZDhMyYDv+2+fKT+n
	LCvu+qv3Fzu4SfgpAL7BwCKROfGaHKdCp5PW82fQeaECoUTAi3axxQvLwTmv7dXGrAYn
	8u1v3AcQagjLEhNhNejigOLCsigX9zmVRvbbPnVXylVtmx/xtBqDFHx2Lf1XO1LQeIdw
	Peiz/lKyEdlQZ1INAf8Dc4YRj/or1rYH7/oPbxCeMqWL3D7sgviRcLgeJJtmlv180vYw
	+kng==
X-Gm-Message-State: APjAAAXvbyaTJzUrfi/krNxKImz2PQWJLdlUHLOpR2cIL6rJ5p+8QfiF
	ReQkgqueGy6X1oZGuzVoITr1a5EgzESyqiX727CycQ==
X-Google-Smtp-Source: APXvYqxMqcf260wZKAqOL7YWJCuj/JQLUSX9jcx9LO2IaSq3COuUoITESfMo/XGRXl+3Rmz7/lxqspkPjcO2kJ8QzzA=
X-Received: by 2002:a9d:360b:: with SMTP id w11mr12926445otb.238.1556559005160;
	Mon, 29 Apr 2019 10:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-26-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 18:29:53 +0100
Message-ID: <CAFEAcA-FYom0R+LgxHKGUJUpKyb4xFJdWzjsgh8s+aO20P3Pag@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 25/26] tcg: Remove
 CPUClass::handle_mmu_fault
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

On Wed, 3 Apr 2019 at 05:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This hook is now completely replaced by tlb_fill.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

