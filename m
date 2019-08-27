Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA09E3BB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 11:12:53 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2XX2-00070n-D0
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 05:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XW8-0006SW-DV
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:11:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XW7-0006GG-D3
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:11:56 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2XW7-0006G4-5m
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:11:55 -0400
Received: by mail-oi1-x244.google.com with SMTP id 16so14365137oiq.6
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWadVCtGkitd3Dv/zW+HCQhKM7Ny22eEEI812wgABgo=;
 b=NLrBtMj7ScFsKXVMibluCXulc8tviURpoE3ltGyFXB/nc5I51BTLMYyvQ7BCTqBONU
 ZLqn5NdQUye44pJoE0+1eTtcfQo9bsBywXmxDQnMlDMmbKHYNjWWOErjWbM1dA3rw+Gf
 w5ejrFLrWy/ahDx6CGkzbv8AFKfnf68zb9+KQ6fPSfSfMeb09Gmt6TIUc0o1F2pifQxU
 AgTlYirfNeL44Ugh75WRPm9udIgFf5p/mKA9Au+XazgxIDNtuJJAegbwWbFHMv+137Wi
 +ebcf3UvaGWW3ZyRJVuKL6sI1L8acq4pP4bdRspf5GSX3sXOTrdjzYagX5zJZPyRidhO
 lrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWadVCtGkitd3Dv/zW+HCQhKM7Ny22eEEI812wgABgo=;
 b=YWAkF0MmePBx9YCchWciLIoqCp5lWUJifzEsWwUasizU+4GBoAKG2W0B4ND3n9vi73
 xxvwsxVI7x/B87BkOmk0JbOK9Wc6WTvj+P73Xqd+jCJ1RJaMP1i0nm63mIPb4htiaepp
 YgPQi8SNsk9FOQqg/jr8WoXoJgE3CTqvxGMQmCLsiwjTqnAPzqFkZE0IYlKB+BWGS+D1
 5XSn108UVvTShObsy09SIIPpI9OKA3FvyFutP2oaI3vV0uZe21Nh7kPwLhZUG48SF+IT
 LDjQrq38AIG3o53VDfKCttrkbHE/mPRgapteHRbW9Oo/FYjkvteNiAVcmxesygQKOXVI
 Yo2g==
X-Gm-Message-State: APjAAAUD62KfPtdJTfGi1M7fqO/bprZQARaAq3LarXBLNZExWjpVxeLY
 6/1be4MvMQu7JkBPCn8E7Rf0covZwFgD/ax43F2A9Q==
X-Google-Smtp-Source: APXvYqyIF98IBU8tNJ/tSL4A/EISKxUilzF8TEriPmCf5KmQuhpnFdZwIenKw5NZSv/PZzoaEvmY/FKqqknwhgcTN4c=
X-Received: by 2002:aca:4814:: with SMTP id v20mr15524723oia.98.1566897114266; 
 Tue, 27 Aug 2019 02:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-65-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:11:43 +0100
Message-ID: <CAFEAcA_NZzeberjKjdqgbpiqcJhjWXJiC2KWjNAHnWoV07pFnw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 64/68] target/arm: Convert T16,
 load (literal)
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

