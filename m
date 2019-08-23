Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A343C9B57E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:30:39 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DOX-0004pU-TK
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DLo-0003CG-RX
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DLn-0004JP-E9
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:27:48 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DLn-0004J1-8P
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:27:47 -0400
Received: by mail-ot1-x343.google.com with SMTP id k18so9479420otr.3
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dfMnY5H/E4kd9IZGpBeIvZ/0GZqXikgjlWRAbBSdwA=;
 b=FGikniVlnkp8Ows/k98bDWZmspG26OwuwTaUO22GwlUujQuKUFN7sLLRz5KmYRb/cw
 lWGIcMAnDlG9d/u9j8aXQrgNXKSIH7sSYkdbJz1y5sZGr8QU4oYSXx50zSuqXpZCNA9A
 gCipyNM5j+ZRUb376M0mxrQtoHgil1PCSd2rGWWWlXs3uSxqAoBdX5zO8/jqlCXv7spn
 IOZr8pYjZ/tYNO01z8CI8+keODNGWXpDw+mM/cYl46hPurLZM7sRb+N3JjKtQqwP82g/
 JmB7Hmo+JjUtzIFfMrf2nIFHNm5WCXzfpIDvmMuFNKPi9vNpoVLEe1yOweWeuBcDyeKZ
 +xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dfMnY5H/E4kd9IZGpBeIvZ/0GZqXikgjlWRAbBSdwA=;
 b=LptbxXhASfDE17n0NtCJJ8gNgtC01frJfHcS3VxXJfmscZNKSn0sHAv1qtrKNPlBst
 lnDnW29Wd5+GdCKfD3P2OkoCIvcau6cjbH/l58qL5Mh5BqqK9iyIkwdFVm6dtQ9EN0+y
 scfi8yEtx6/DfGtrMBujioNB9/7hZ5kAWeu9XVvJfI6o4lL3euePjCOguZPjXuMGkOkY
 BDoSEFTYq045sCFqrLxZJpn+ZyEkkspXuBn17j81Fz+pxytUoWoqX5kxKnWd3cekKudl
 G1RWY9GjnXU51fY/iZpx2wjYV6sFgvukOkvosyvHIow7ORzbAlnI1ylpTfy4UUCCWdVl
 IMJQ==
X-Gm-Message-State: APjAAAWMdSwT1SRhfgejrkhiVmbBGd+dgt7noj0bkQJtxS10eg9qbltJ
 +Q6mR1IxZ4uVEYcBmFNhjlP2WV3ySSW7ULFeWLDQoQ==
X-Google-Smtp-Source: APXvYqy9U8T1lnVM+FA4TqiL5nSDTjij++u7pwoJbUYDDXf39zzPYp8JLtqRoTsn7mm7NP95fhu8V9OH6uQZlPhRlsc=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr2187627otf.97.1566581265390; 
 Fri, 23 Aug 2019 10:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-28-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:27:34 +0100
Message-ID: <CAFEAcA9ngP_C_BWKdsovom+Ary2Cq507_DZB+2GCZwdp3QvA6g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2 27/68] target/arm: Convert LDM, STM
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
> This includes a minor bug fix to LDM (user), which requires
> bit 21 to be 0, which means no writeback.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

