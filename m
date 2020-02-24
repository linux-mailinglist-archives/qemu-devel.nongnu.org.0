Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790C416AEA2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 19:24:28 +0100 (CET)
Received: from localhost ([::1]:40678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6IP5-0002C7-2K
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 13:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6IOG-0001cv-3M
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 13:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6IOF-00037w-01
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 13:23:35 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41701)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6IOE-00036Y-PC
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 13:23:34 -0500
Received: by mail-pg1-x542.google.com with SMTP id 70so5558940pgf.8
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i7+QysxbUWWA8SBQ8EwFKE9/Z0g3DLxmXdbhS0hXLxk=;
 b=lW5AU5h3L6B+g9L8dlfBZXrDT067s4+Bz3TNRYdqUYBCCAQQ1E5h8NYMkA3Fq/UB/r
 7/gPsQWFxN0i5muFv9k6mfaaZP4HM+Zeg1Q9T6Mm5a1l7aXQ/3Rt99vwcwV3aX53an2+
 oRtT0HAW9WJpYJT4RJo0qFOJ8k+2Nu+RVfGIPZsW+232Kx1sqd7JloxqCbCFqA+hlueP
 Dd4iuhliBUIk+w/lrfgNOmGtgS65sICWcdFXBKeSGskhl/bGTq2fDKI0pYUgPGDp15q3
 HOor/bERd5b5rCSEUDWGc978m/xBGrXf5CNZZZvFa6r+ggZfc4F+5SL8OlWkVpUqrykR
 XoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i7+QysxbUWWA8SBQ8EwFKE9/Z0g3DLxmXdbhS0hXLxk=;
 b=jLpIh/bnAH/i7GYY+/7kCqBQdQkJ50o8lkH9kcDGWuVvbSdVfmMlSKdl4Szkqjf/YI
 0rDUAQ7H6Gs8fQ0sFO0xlxBOEvyrsBW2lf5H2zTq7iix21gURA7KZLTYm4RDzP9SJJ/a
 pJDwzIuM+G95HZI+mg1hQHOXYILZXc8dCSV4FPZTYT35Vyo4cOPcaE7v32nigXkZUCbc
 z1F3wxd0QzttmMpbpA90Rraz9MBEWUeH/p2EbWKA+2PdDQ1KdDoiil0RD7Ws1MDKCamo
 aBqvDF5A3JxMd36gxXtuUK5GqbY24TjQOPfVhZ4TT6pYxVaH9kPEbHGjrGo2V/ptFolu
 /1aw==
X-Gm-Message-State: APjAAAVSfsBBSYq29QGcJMXM5ZPn8k1IXhzRr98iBsC4aMZjjVF7coUL
 EXTGta7Hg13uFeqIUAGIOMkW1EOQiLg=
X-Google-Smtp-Source: APXvYqxzA5WogjaaMaH1EvMq6cF53+DlWvjS9sqvX7s19tGIZjIylGDE2RaHDLk+QQSY/5a/y4TuOg==
X-Received: by 2002:aa7:8695:: with SMTP id d21mr53740421pfo.199.1582568613405; 
 Mon, 24 Feb 2020 10:23:33 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r8sm133168pjo.22.2020.02.24.10.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 10:23:32 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Fix wrong use of FIELD_EX32 on ID_AA64DFR0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200224172846.13053-1-peter.maydell@linaro.org>
 <20200224172846.13053-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c7e4128-f0a4-3885-ee75-031b7b6517e6@linaro.org>
Date: Mon, 24 Feb 2020 10:23:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224172846.13053-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/20 9:28 AM, Peter Maydell wrote:
> We missed an instance of using FIELD_EX32 on a 64-bit ID
> register, in isar_feature_aa64_pmu_8_4(). Fix it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

