Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798039C4E5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 18:37:36 +0200 (CEST)
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1vWJ-0006Y6-Hj
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 12:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vUG-0005ep-3v
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:35:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vUF-0002hG-8b
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:35:28 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vUF-0002h4-3T
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:35:27 -0400
Received: by mail-oi1-x243.google.com with SMTP id q8so10151142oij.5
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 09:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Inqz98WDCGQqQ9HeFDrdNH+ildqMiy0bHC1qqslO2WY=;
 b=eVS+UuOSE3TypT8DWPlV2QimSXj1fnenT6nOju/x0ZDCf9xIHQEC+9UpsnMp7cW0NO
 S5JCaIzOOzmJXqjvSL9rHOq3cSjnRnAY67dC1YOjjijnLwqYLGvOiLAbeTCmRavJ4ipI
 3MYcXV3KttFR7JqNJjCSuGnL3VErivxiNYIuSGArI5g8zdgH7803MVLSEClHuWLX7yUc
 2ZcnerGaSGT1ZO+JjxaNK1KuIiszZqk1h1NFbWluY0dQLSfJtvh6WyjrwXMwWj3KF+7p
 PdT8++xg4m49jTB1KgX9plVqWpbC0iwSvwP0oxcboebVs7BZTheYWJlHqx1huiSW2HQt
 A43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Inqz98WDCGQqQ9HeFDrdNH+ildqMiy0bHC1qqslO2WY=;
 b=irOf1V7m93ng1Rnm5boJepitcFr34pLcYpUVMYrbRqbIrpEilu6wyz8oyr2ro4crkJ
 xyP1/dcio36dWX4VoEqqE6eumX+roFrO9Xaiz+3iPATdrZBmcJElytqK3XB0PTLV7Nji
 MzgzFGMjPo1gF5dio9Az8a7yInNQBqTPD49636tLOxPXdO8+VgIW5GGsy/WyW5kFg5U4
 bDYi38d2TCEzn+cX55pEn8lWAhFTupGVgzeEKgppIvflxbfKVbLUGTUAfDqGNboUaVaf
 zvAZvGKNs2XUjmEke5mixtd2RFSPV7NutHkeNV77B+N+K0+xO16a5rtSizB+5Vziv+F4
 DOvA==
X-Gm-Message-State: APjAAAW/hWfdhNFZXmPIYT6wUDHcD759edFyv47HAbYbO0975eP3Dr7N
 1m0jE+psLWQbXO5TuFxJXlwjkgXrgrAw5OaOtmoDY3balkI=
X-Google-Smtp-Source: APXvYqyiyJg2q83TsU2xloe/pdYlAjys0FeznYa/d1ZVSx5XBce61U7VPkjzaA0eq209vJlgluf+0G5tRgjBUpRS2iQ=
X-Received: by 2002:aca:4b86:: with SMTP id y128mr9720370oia.163.1566750926468; 
 Sun, 25 Aug 2019 09:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-43-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:35:15 +0100
Message-ID: <CAFEAcA8EXDyTmr+0s_y6iBjobQf5+jSM+3SpzrFOzH3+V+Bsxg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 42/68] target/arm: Simplify
 disas_thumb2_insn
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fold away all of the cases that now just goto illegal_op,
> because all of their internal bits are now in decodetree.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

