Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78920181063
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 07:06:55 +0100 (CET)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBuW6-0006rE-Gk
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 02:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuVK-0006RX-EF
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:06:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuVJ-0006TO-E1
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:06:06 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBuVJ-0006R7-70
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:06:05 -0400
Received: by mail-pf1-x444.google.com with SMTP id c19so671652pfo.13
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 23:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ASDSgniHgz0xMZ46uhNAX8WgvFXu8avGhMBYQntMN/E=;
 b=NzOVUeIF8Xz3JJXVpLNywvjgH/+dPF1EeMeTJa1Ee35RHl9yIuX09wfo+ca77wbybQ
 fxhnallbwRhhzOpO6ctmysM86EcR2CSekVYSFtA0djlxnpz/ed9EEzuRBp8afTqQnX9n
 29iEXn2VUekzR6jkySOJ9+QXBJIM+pqG9NGX86V8W/QvOv53TyB8TPgR9EpFOipeT5EU
 MIoHSmWPVU1J8yWqRE8jeIXWjvXdcFZqGz63CkoIct3+uDPzFP0h5cbA5Zs3mLyJrDYM
 vc8MI2VQ6CnQSEQkfe3A2Riig6tANzlr1pTdLkjEmoCTH+mkIz9ZslKWzj5qz3usmad0
 +4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ASDSgniHgz0xMZ46uhNAX8WgvFXu8avGhMBYQntMN/E=;
 b=P47H92YuLWxJUKNfjYk4pLb2U/VQJw6fqDMcFNlfSH7IL0Js389QhlyVfwanqDqMN5
 2utZcDECQZLviop6LH6A0KbPxWCQ/nbe3iQ9iLimRCk8zsN92iqOumS3EbnSqw/Mv0Hh
 hyJC1Dr4QQYPP3HZqoXgbvkMVVBNMmAAyiP+kCFXVXUvPyTWbp6/grVmI8M4tt5bn28I
 Iqx4DWaT6vqqdeSy4jjSgs3FcwhC//uRVfSz1Jmy5ribTNrzwEuzIBihG/KD0zY8Y4XN
 S0xUPONmyZGVYJXQMLbUBttyY8ncQpE7Q1oPZRrE0EZ8tBuyI9BGCmRCzPynDCagufSK
 VXuQ==
X-Gm-Message-State: ANhLgQ1RgM+aqZ6NGwUV3YCTTmr8CNF+P48E6OfWGkbNLEz9nl9eJOLn
 nqwbh+P1tKHzlgUff8Dt4/PtLA==
X-Google-Smtp-Source: ADFU+vvAv0uXxtG8r+frqCgaIw0kDvfUKPlQC1lw7Y2BhkS2bTTS3hcZgDj+lPVXOvuDdrDnA70bZQ==
X-Received: by 2002:a63:3103:: with SMTP id x3mr1300483pgx.209.1583906763982; 
 Tue, 10 Mar 2020 23:06:03 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 n14sm4308708pjt.36.2020.03.10.23.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 23:06:03 -0700 (PDT)
Subject: Re: [PATCH v4 01/18] qapi/migration.json: Fix indentation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200309154405.13548-1-peter.maydell@linaro.org>
 <20200309154405.13548-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32d385b7-b40f-371e-672b-bcc1214f2844@linaro.org>
Date: Tue, 10 Mar 2020 23:06:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309154405.13548-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/20 8:43 AM, Peter Maydell wrote:
> Commits 6a9ad1542065ca0bd54c6 and 9004db48c080632aef23 added some
> new text to qapi/migration.json which doesn't fit the stricter
> indentation requirements imposed by the rST documentation generator.
> Reindent those lines to the new standard.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qapi/migration.json | 60 ++++++++++++++++++++++-----------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

