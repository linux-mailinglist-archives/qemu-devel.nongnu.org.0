Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26E946A9E9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 22:18:56 +0100 (CET)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muLNv-0000CU-92
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 16:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1muLLY-0005wQ-JT
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:16:28 -0500
Received: from [2607:f8b0:4864:20::532] (port=40484
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1muLLW-00054c-4O
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 16:16:28 -0500
Received: by mail-pg1-x532.google.com with SMTP id m24so70322pgn.7
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 13:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zzAn5pd6XC+S/0blvAJB8ohzAh9OC2AWEvsJbeLuPZc=;
 b=U+slGxshyiUcOo/IsSx6Ls9Oily/ExB+o1/2fHHWLmoqTQFtk1TGCoD+nKvi9qxlZ0
 Ll5HoqnR4IE8abPY7MRk3WOgm4wYJN1tfWwNhoJRkpExZBown5eoVm5SOwQT1UQkyJXM
 4O/Lj9fxwy0BtRqPn7gV1D7vAfsdH237FFnVddFanGBdibIOjNSxqDNJqpMQVV9yjZHC
 bU05VwJw8aKKGMlkc92q/pq9IryIqKC4/tomFdNW3hyiu9/GDp5oscxCATNBaa1hBon7
 myzUhf6To1lDzhQ0DanO48F5svQWRMB4ArCmpjURKNArQV0i89+SGEFAZntq5QEKfhKU
 AbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzAn5pd6XC+S/0blvAJB8ohzAh9OC2AWEvsJbeLuPZc=;
 b=IdAOkOxySx7QL7BMM0D34X5uWwl+yVjvwq+CbCqi3Q1Vl+rDWi+G7X5f4Ek7sAUNGo
 5jcwUSMicvo/8u/ZEchS51S2v/tz5LTXPQ/VXlF1PzJnX1Uh996L5LvqoUK+NM1hsD7R
 miUHrjSMSgkEJ9QmLHQEEirpFzCnpcQO3+M+x9CDLauiyqkiagW/7n23tuCL4urkQQ8v
 RSEqt/x+1DIB/7PybLt/hLiVrvNdGrPED9uhJnJW92GWKAp593U0eHmW0+f7jOOM+Qhz
 UNgOJLs/usawdUGmhPgucOIPgfUIzADj02kpwij7zF6wmkdtqujDFHcbEWf3cCy9WikI
 e/kg==
X-Gm-Message-State: AOAM531LTg08tOzzC1uxqpAJrIG4GBrj3mw7b9R2QXGk510P/hZyqBEu
 6nUPimV/kyt4paRc4VF7LlfTng==
X-Google-Smtp-Source: ABdhPJyAY5CFrlQ9QRQQRLt04+h9GTuAMAazD/WZxxlY3ha9X8Yy9Dl51FOwzpHMen/C9NlJOmCrWg==
X-Received: by 2002:a63:a18:: with SMTP id 24mr2401792pgk.100.1638825382238;
 Mon, 06 Dec 2021 13:16:22 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ls14sm262746pjb.49.2021.12.06.13.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:16:21 -0800 (PST)
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211206152724.121030-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36ec69bb-340c-7b3f-b85b-5c7860030bc6@linaro.org>
Date: Mon, 6 Dec 2021 13:16:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206152724.121030-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 7:27 AM, Stefan Hajnoczi wrote:
> The following changes since commit 99fc08366b06282614daeda989d2fde6ab8a707f:
> 
>    Merge tag 'seabios-20211203-pull-request' of git://git.kraxel.org/qemu into staging (2021-12-03 05:26:40 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 5b807181c27a940a3a7ad1f221a2e76a132cbdc0:
> 
>    virtio-blk: Fix clean up of host notifiers for single MR transaction. (2021-12-06 14:21:14 +0000)
> 
> ----------------------------------------------------------------
> Pull request
> 
> ----------------------------------------------------------------
> 
> Mark Mielke (1):
>    virtio-blk: Fix clean up of host notifiers for single MR transaction.
> 
>   hw/block/dataplane/virtio-blk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

r~


