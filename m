Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726B43C12D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:11:51 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaI2-0003W0-6w
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaGh-0002kc-Cr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:10:27 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaGc-0002KT-GJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:10:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e4so1751117wrc.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8kKFbV9pX2cUVBV7bDXdiQ1XKRpD4Y829JSgpp/j/N4=;
 b=q4myW0M+526NN816fiD7nNtj/P8x1ssrE3EsRfQXOOWedwYVzYY/fgWVtSqxphYtdF
 xx/JT2/42xC5CygZpv/jMs1rDOPldLwwfNSVSuzD5ePiV6n4RA+OUy1hgWrdxNketzLf
 GopcxY6OKgNEuqubxXmz7M9Qzn7ZIGZtK3eW1H+EYsl3ximTNsYJ46V2ZPfLUyEs1zMW
 GRhB0Sw1lbaCUZo6nx/9W5fRf+hbawXLqLIQdgBZrHh/GnQZifVNKAmMo7Gx9S/zom4d
 8grjIUj4Y0BdCmah/GhqyUL2S3MFrD42C+ce7J1fFR9zX/VWovMJHO+CWAZXNeVuN6Zs
 bfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8kKFbV9pX2cUVBV7bDXdiQ1XKRpD4Y829JSgpp/j/N4=;
 b=cUictd1V/SVVCDWm2XgLx1BbBxrCIZ3KgkQ2ItfFnqGz/06pm6Aldrtk6PmyzeIIE1
 +PRWeop17JqLgOBs6f5yycaB+wbRscQVvhRa59yYKqGWvBjNRRc13AQ2q60enhw3GmPz
 pWXkFuZhWW5n0nKJvHODg4daMwOz9pDOT/WvA8wjwWedzaH8JIwm/Hz5l1p0XtR2myhH
 ETAi5BngkZOReO2vd9VcZNpJC9wRXlWYp9lb8Wy+2GeZJ33MH4TDl0LMXVJjYmKbLEN9
 wKaNfmIqs6kmhvkh7nJS6LA0JNUqHWgsY178pkIGjEYvcqDtcm1kiHAzJSb+7fQKIFuG
 7ZtA==
X-Gm-Message-State: AOAM5308yRiUpezrKjJctbhNWyloTRFQg3abSRBaVHLs4Ox6Ach47jBd
 pdVNCfS4YWAaW4+ipJU4YvE=
X-Google-Smtp-Source: ABdhPJyplzLoP7TCieLv/knvtNeFpD9YtllqfVUS8Lnrd5ic+X27DUTRnqyPzCEDOQmF8e3B22g8oA==
X-Received: by 2002:adf:f004:: with SMTP id j4mr4770896wro.50.1635307820517;
 Tue, 26 Oct 2021 21:10:20 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a134sm2416726wmd.9.2021.10.26.21.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 21:10:20 -0700 (PDT)
Message-ID: <bdb44eda-c25e-32a3-77b1-4b23a4a910af@amsat.org>
Date: Wed, 27 Oct 2021 06:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/6] More SH4 clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635298341.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <cover.1635298341.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 03:32, BALATON Zoltan wrote:
> Based-on: <cover.1635036053.git.balaton@eik.bme.hu>
> ^ (hw/sh4: Codeing style fixes)
> 
> Continuing the clean up stared in previous series this now removes
> printfs and QOM-ify sh_serial.
> 
> Is there somebody who will merge these? I don't think there's anybody
> sending pull request for SH4 so maybe Peret/Richard might need to take
> it.

It would be nice if Yoshinori takes care of it,
otherwise I could to offload Richard.

