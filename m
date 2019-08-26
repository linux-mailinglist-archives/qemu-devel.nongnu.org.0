Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AADA9D6EE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:43:34 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Ktp-00042a-KY
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43573)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KrG-00027R-I7
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KrF-0002K5-BD
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:40:54 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37439)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KrF-0002JN-5T
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:40:53 -0400
Received: by mail-oi1-x244.google.com with SMTP id b25so13085445oib.4
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZSSeZtnXvtNng9emjct5L5Tp8giMMagrPLdTUJ8td4=;
 b=lc/zL4s845VczecveRn+y5Zj3SaGBFVx8qr0J3+kTdCgBeS/1mJ6PqGCwzN/qJo6c8
 lQTdBR6ZhPSUehOHPiS8WfV14PckBg6UzrgqE5YEfUIBu+MdohTK3BrQeE4mlmVHjB+y
 jjkqxRRMiBJarm6GNuaBGAn1SIIsr06gUkUStCmM0LooPk/Pirp/ayCrtjLQke8DplO0
 b+u1tcQ7f9u9t/FcwfebN2Fi0ERqWDTsTp8rz/Oc9rdWfgXW0/qTuFJXJipKlyoeRHmW
 fj00arrUCCVfhT/6ceCLjYOby60j2kWcqL8QjctZFytyagAOvvzW2ZsZJvJZadUao458
 rPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZSSeZtnXvtNng9emjct5L5Tp8giMMagrPLdTUJ8td4=;
 b=GLwuIVRWPyMdrLMtDygY94ZS+R7Q+MHVeidnfavMWVg0TC2TQLcoahxflroqlCBLwP
 9jpugCMh9UaOfe8/iKprg1i0CyoUuu4GSb6JFw6IEq2DcwuVbk/8qAP6otN5ryGiX3jp
 ElwtkToe3TitaU0az3SnhTTTLQvkCFZm9bfMbSCo+qb4IB3nk6/hNTuBDpJ3l7hFFRTH
 lXnhxL8UoTeU86WzVMUgiYamlmWnVavqHs78MuubqF3SxbMSh8v0nOJF8f2mi77yYelY
 fuZu9HyeTfn4LTL5+PN1wQCyj5aTWDL0XsJ2TjF9v/6XiDf6Z636k+noHojnO/CzlGO4
 kQXQ==
X-Gm-Message-State: APjAAAU43cVkl5lfiX0/plP1ydPnhjrAben7PCwsVUC/ktkRBJtR1k6X
 +9naVEPwhbdPAnPc4sQ0lXqr50kVDbQtLKNk5I2ypw==
X-Google-Smtp-Source: APXvYqyRpxQ3FbKE4fzCJwGguUxAD8OtR5hclV58FJ1U1YPWygUC0dOzt9J2Bka4oWPxppiNV121eRZi0dJNCFe0Tu0=
X-Received: by 2002:aca:4a57:: with SMTP id x84mr13846359oia.170.1566848452125; 
 Mon, 26 Aug 2019 12:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-60-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:40:41 +0100
Message-ID: <CAFEAcA-uCorXduHVFiJVdxz=QazcCrzxQFbdJcWiVhqurqXkaw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 59/68] target/arm: Split gen_nop_hint
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that there all callers pass a constant value, split the switch
> statement into the individual trans_* functions.

s/there//. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

