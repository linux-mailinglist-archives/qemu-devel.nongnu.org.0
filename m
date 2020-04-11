Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F61A53A1
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 22:13:04 +0200 (CEST)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNMUx-0003Tm-8Q
	for lists+qemu-devel@lfdr.de; Sat, 11 Apr 2020 16:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jNMTe-0002aZ-Qd
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 16:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jNMTd-0006mS-MY
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 16:11:42 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jNMTd-0006m5-C1
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 16:11:41 -0400
Received: by mail-pl1-x643.google.com with SMTP id x2so1879439plv.13
 for <qemu-devel@nongnu.org>; Sat, 11 Apr 2020 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7DJMM6R1Of4dftDdE7ObH/bLxmS9hA57UU3lfW+iJes=;
 b=qaij97QmEPlqFqz9JjMt6NYDDYZnIwH4pFi+GYTplsxeUk1kEJ6cnEmmsz4A+AL+PP
 8TBXuMkuXJ34ZWyUF0SfLSZDn4Jg7gQfjSj7H62YYqviu8KD3ptJun6JF+OeTxkPCGBS
 ZfuhINs7AfZrW81w0KVIurC6S3fWi1BTpcWqvj2zvsDksSgUgDyf1GktZddI4Q/Tm2KW
 H2T3zToalc8dFxuno+BEQNna/43hEEqrXnsiy7T6JAgqTo8ZdLax5SnjvURXtvze8ssv
 oi2kcKGAXMpfpe7K3Syg2vbz7LS7FlPjhjGozJMAY8lnPtO8PgFE5olUGeLp0+QYYm/d
 SxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7DJMM6R1Of4dftDdE7ObH/bLxmS9hA57UU3lfW+iJes=;
 b=lUzwj8oWuN7sAAg7IbpLYYlBcEl35wyHGe5cyJvV0xOM1yyuiRIKUg6023MwnBZ9DQ
 ghAxo42/p5ma8hlxlLf+A/O6QKa009Uk9udfi0K5ALbZIhO4POBBx643mcBfJpeJHauY
 jCCjsE9genacobul6nKB/RTPEIdPSKESN1j5akCv3snRYYBbQOuKlGFLXBy5hiOyX5yg
 yFnzhYLHE7P7IdigfXuxb76vqC3Ow3H9Le6ibGHOCtsJZCE29Z8RwijzVPlILQzGjH9D
 EhtxPKbK5hpay8EB7rMvOsg6PGuQ9LZGws5t4xh4wsesMRdXJUk3KKd7ZcJdq2sVg2gD
 XcqA==
X-Gm-Message-State: AGi0PuZCRx0BOVekgEVfqkEP9WWnXIUFdTRZpQYU1Rjbo+3PGE5GD+dc
 V3Ils60aJN2HROs9glYNJxpIyQ==
X-Google-Smtp-Source: APiQypI0j/sUsIRg9BNUuAah2JCrmkgioMeFGx1EdV9NrD2HFX0CV9Js1p3/0ehgbeTRNI5/u+Pk7g==
X-Received: by 2002:a17:902:8d86:: with SMTP id
 v6mr10692046plo.57.1586635900033; 
 Sat, 11 Apr 2020 13:11:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u44sm4490116pgn.81.2020.04.11.13.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Apr 2020 13:11:39 -0700 (PDT)
Subject: Re: [PATCH for-5.0? 1/3] configure: Honour --disable-werror for Sphinx
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200411182934.28678-1-peter.maydell@linaro.org>
 <20200411182934.28678-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <921a8aaf-89d4-c7fb-7b9c-41c887c76434@linaro.org>
Date: Sat, 11 Apr 2020 13:11:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200411182934.28678-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/20 11:29 AM, Peter Maydell wrote:
> If we are not making warnings fatal for compilation, make them
> non-fatal when building the Sphinx documentation also.  (For instance
> Sphinx 3.0 warns about some constructs that older versions were happy
> with, which is a build failure if we use the warnings-as-errors
> flag.)
> 
> This provides a workaround at least for LP:1872113.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure | 9 ++++++++-
>  Makefile  | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

