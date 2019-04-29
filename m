Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF7E96D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLAKt-0000FM-9R
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:45:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLA5D-0003o5-LR
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLA5C-0005vN-Tc
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:28:51 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37767)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLA5C-0005ur-PA
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:28:50 -0400
Received: by mail-oi1-x242.google.com with SMTP id k6so8976124oic.4
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uh0i/K1LBBUnKeZ/z077/5WjqemqYl8IWo3x38e8p5I=;
	b=v+mXZvlsmnhwonNOR/GjEaoFlrTaGQ/cTJBx1UURECiFuPYESx+hny7cNbg4UfklEc
	18CmGDkN646Nmo0G5COFZ9Ts9/HJNHVEuTAMt29Ju0wWqoKcVecaT7hSLs34NDyvaw9+
	Es3ufhNt2iTFz7ltg0AogftdhG7vxcsYoH/XKpBjTvgX3vBrGgVdXtqRSLbvQzJHNCxX
	ciqaQgKczVKxHcceIfUCIv8NcZZK93gA/eq4etjUP3F9DUJQfYLr4c9SrKS8yOfk/J6k
	Esa0D4fOMyJXFGmNptAgfVk2r7sKAwnZOI/5w58CFdakqOG/SfP0UO4m6zdNMzh+7QUK
	w4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uh0i/K1LBBUnKeZ/z077/5WjqemqYl8IWo3x38e8p5I=;
	b=itp9Ouo0IYTrtgsNTGUktdFTnG4I6/oscmdQh72ujeZfCvikRSpFMs/GCzLHCzO+Im
	l+53VFuI1cT20h7cTvht5EXSSwlhhYdKS6pqQMMhnfAf1V8atvZYMfBxl9sFMQ27dxV1
	iXUMV8Elvo96P1H/M0tp1Jrjt6I5vFkwkpNteJTkOyqvskXtVoTigOVBVGEXzjKlPAR3
	KB61OmhwSsJgcDyETcf7sSXL0/oo+mJoSc9dw9ID7j6+mh9zcr7eAnXi3gSRdhDpluxw
	hTtujV8AYTwXtBEl/C075wO8lfNfJD0l5bt/LtHq7TLiTOQCMRmEB+CgRA55jYk2SvaI
	BlXw==
X-Gm-Message-State: APjAAAWIZmdG63i0AbrkjkUNTqHKVRRGvRyVx0LkDWzIe6Zkf3XweHlH
	l0sgd9eAEkfYWN+1QOGeH5gKmwclY4ylXsN2bL8z6g==
X-Google-Smtp-Source: APXvYqxVRBHUjDFzhAcDh9cEXwNFuuvd/tfpNEOP6SDPonpwv4SFxjDcvU/Z5I3G4sdQO4IzgJouZwYuz2CVHtXWkQY=
X-Received: by 2002:aca:ab12:: with SMTP id u18mr140231oie.48.1556558930023;
	Mon, 29 Apr 2019 10:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-25-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 18:28:38 +0100
Message-ID: <CAFEAcA8qcQoBdYJFhZ9ka=MekSM8U=PfVr1+ZdogHk_K0PuxRQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 24/26] tcg: Use CPUClass::tlb_fill in
 cputlb.c
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

On Wed, 3 Apr 2019 at 05:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can now use the CPUClass hook instead of a named function.
>
> Create a static tlb_fill function to avoid other changes within
> cputlb.c.  This also which also isolates the asserts implied.

I'm not sure what this sentence is trying to say ?

> Remove the named tlb_fill function from all of the targets.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

