Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD84A66C2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 12:50:05 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i56Nw-0003Eo-TK
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 06:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i56N3-0002h0-CN
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:49:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i56N2-000537-Cv
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:49:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34697)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i56N2-00052i-7p
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:49:08 -0400
Received: by mail-ot1-x344.google.com with SMTP id c7so16288106otp.1
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NCjEkAN1zVa36SssDRm1NeM5Tqfks6N/TgYK+vg/M4=;
 b=nyluzt6acPPR5x2bAMNRiZQJqDZlDoHE8amp/5wBsDAQIgAkNVIX+0AuPbGiqZpyVn
 4ISy8qAN3T7cVUUWZbMyjVBY/chbNsXmgImavhsL/qYRD2pHnudO//6BLwKG1QZcbszC
 esqtZRHHO+cGnDZVKPpPrI4YXgKf/MovFwx90wnKctRF678QUxqkE2duPPPnU2YRlhUB
 2NRCWIS+UteinFjgJnDwM4EPl/2zRRNF8bWG45FU0NEvh1z7CzgoinXMuRt6mRnKKWDy
 HF1JgT20EpJjcvWflXNv+FxUhBuPDQDatX5fldAy+l7hV1Huf/SJqUpOC0c0dCQzWOvQ
 YZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NCjEkAN1zVa36SssDRm1NeM5Tqfks6N/TgYK+vg/M4=;
 b=hP0053eTVrYCvgfg7bGKwv2wd9PMDcYzA1ZgZu7nc+6Oq4zWc+ZuFqEVMyn9YG6gHe
 WKpwpERTtXPi7WcgpMbka63iJzmWhrILM53XQolsKzptJ6BRck6FudanOd3zXIil0j1h
 YEWsjIOTl3/fWsOW9xO5nWfTOCKfiXRJK57LdRn65zL0wz+e69uHLI344Edq/AntL7KY
 UEtA3QGkO2ro3tou5UtNpoEs69gIHtujL56oS2mBln60HQmt/ylW9emi68ioP7+vXo3i
 yC/zttFYuxPpiNsCzProWe1A0fMeWS5pjSQ3IV9q8BMHqEmrL98q++bCTlRCDhRVyB0Z
 KF6w==
X-Gm-Message-State: APjAAAVl28ABjCtAi8xQdH1+DJjrTwX6GgL5bD3FVWFcHaD+lRiTTZWd
 8xhjMVZPWHwH+G6ZKPeFx4Lq7WBJcAkYJSv4No+wVw==
X-Google-Smtp-Source: APXvYqygIX7vwyoaIoSbs6yY80DMio3wQHgcAUVj/pcKj98/pzILB671Jqk3laYdPfSQQBnw4abtKI/JyFHeCIvkAQA=
X-Received: by 2002:a05:6830:1bc3:: with SMTP id
 v3mr8733078ota.97.1567507747415; 
 Tue, 03 Sep 2019 03:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-20-richard.henderson@linaro.org>
In-Reply-To: <20190828190456.30315-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 11:48:56 +0100
Message-ID: <CAFEAcA-wJM8VbMf5gEw41b9ma-+jVhoY0d9S_Ag52Pwrc1i7-Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v3 19/69] target/arm: Convert T32 ADDW/SUBW
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

On Wed, 28 Aug 2019 at 20:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

