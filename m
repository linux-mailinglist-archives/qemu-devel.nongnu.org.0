Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCEDF4F1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 20:19:03 +0200 (CEST)
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMcGk-00060R-7s
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 14:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMcFG-0005VL-Fk
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 14:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMcFF-0008QA-7E
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 14:17:30 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42653)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMcFF-0008Pw-0a
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 14:17:29 -0400
Received: by mail-pf1-x442.google.com with SMTP id q12so8914174pff.9
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N8GXcnbrTO550iqXgVCp5xts4pySE2ndmfXR/peMaF4=;
 b=ffXmneA1XdCHvN0mjxpNXEddr1QqdisOrtUT94HCpeHfneUeBXyUVYBjcoHH6mgOUk
 4NsRTq5VS/QmJWrnG40JfH7PX/5GAjHKedJDIthi3qWynd4ZSqjRkMaTr0YiaLnSCPxR
 69zCIMS4ePXwGksr2n1K5YHYDWNZznkPIhNV5Bpk+9BSO1e1ZGcXbge11LJyS8UeqKYc
 517VUiPVpCNl4QpQY2/ei/646SFTd3MlSexyqwaLwRI0RWeyZFWn3hNRi97Gt/giZm1i
 U/y9/zCVd6WWuiF/9TgggsjmjLftjOs7B3LU+tFxXm/mhdCi3oSVi6InxmS64EfnbMB8
 OmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N8GXcnbrTO550iqXgVCp5xts4pySE2ndmfXR/peMaF4=;
 b=kVoZ5gJ3hE15AhGiE2vdOoRl45mUkImEO2QaHdbBLD19EcvfPb1USN3rYTDybSiKSA
 6xNGqc1pcOVnjTs7MN+UZwUZnmZOSW5M5oWFjVGRjybwvfRVpm9MiRVcwvGIAXE7PChE
 3HwArQgUvBeb76iohHpx4uga+2c9aZPTcZDOg3S4zvnAz/u/hmYrRJxXnlPR0pzjv6wj
 TVLa/YvzbWCByMUEt1p74oj/OgofayiOtgjr9BsFGfGALt4eV0za7l8YEQlY5StDjL6B
 Ys8+9U7ZxLzPiOaq2cLqWd06p/sCcUQHqanBOyUgLvMw7TKBBYq98a/0V9EWklV4i4ih
 +xbA==
X-Gm-Message-State: APjAAAUjf1eYZq+5XVl3ZI16H98EuEguXZqxVUT4PR8M+NwYFlpTpTFV
 5xm3sDrlZen0y8tC57hqmaBLPZOFIpE=
X-Google-Smtp-Source: APXvYqzq6uLSUX4EREOSu0ZMZdEbfJS1TwU+OhdfpLB8q3aSJ2MjnHV+vqmqatVqfSwpMFQ4ytrDvQ==
X-Received: by 2002:a17:90a:9406:: with SMTP id
 r6mr31861857pjo.0.1571681847007; 
 Mon, 21 Oct 2019 11:17:27 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id l11sm29824653pgf.73.2019.10.21.11.17.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 11:17:26 -0700 (PDT)
Subject: Re: [PATCH 3/7] hppa: remove ISA region
To: Sven Schnelle <svens@stackframe.org>, Richard Henderson <rth@twiddle.net>
References: <20191020204724.31537-1-svens@stackframe.org>
 <20191020204724.31537-4-svens@stackframe.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <284a4bcc-a076-2b94-86e0-0bffbe3e61a0@linaro.org>
Date: Mon, 21 Oct 2019 11:17:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020204724.31537-4-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/19 1:47 PM, Sven Schnelle wrote:
> B160L doesn't have an ISA bus, and we no longer need it to
> workaround missing hardware, so remove it.
> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  hw/hppa/hppa_hardware.h |  1 -
>  hw/hppa/machine.c       | 32 --------------------------------
>  2 files changed, 33 deletions(-)

This should remove ISA_BUS from hw/hppa/Kconfig as well.


r~

