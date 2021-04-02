Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C62352E40
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:28:18 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNaj-00009D-Gr
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNZ7-0007zg-QZ
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:26:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNZ6-0002Zy-EF
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:26:37 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h8so2786850plt.7
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x5uuOie9f9Difs6kZ6XrDcrOrEcpRMbTvzN3SU7PbKM=;
 b=ZayEUBnBzPoDyMcx2Xr1pkkMmY6GKOwTZE3nB1vR/tEAmG5lZM1qe3w70fToL7csc7
 BXvEiSqpY2fes6VXlstZpPzEHhHosxnNLQJ3uffvlqQK7Gvp1j9Pj1o9GADtYe6UNEKD
 q0QHTV3DG9CTO88fHHGphqMO8xb4bArdQSi7TunPJbSDXnDcNTfJNmFHhwruKDDZ6cvA
 NLgmpEOX37XLURc/L3RnApbjoWdUZ+Emr+62RpJwC4xklrPBwf8x9nYc5XaodgAW+O3H
 6esa008gr0jS24yefTrJuPes04BcqJSJwz7aWrKpn1nODpgauL18DN8LbHllLnnELs3j
 NoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5uuOie9f9Difs6kZ6XrDcrOrEcpRMbTvzN3SU7PbKM=;
 b=qeeq96l9P/iQ6g3dxRNbQh3BhjSMGp471bI3PIJJgm6JUcfte+6R+yjDFyqBkcR+13
 SgxG3JNO9XuiiJ0FnE5co7X3dtyAmje9olIbGScDUgytJ1zSlX5a0e0CX+MDjhW6BywF
 moX9kvJizWofaKzLVhlN5moViHYWUhdFz5XfqEutl3iPg0hHbHB3uxKa2rc/SMZIlww+
 GLti3rLrZa7QEaIAPiyc48IOCwL+QPOWrinOVXScY77kSqTklsmOIxKK3zJtJky5QXby
 AVcqV9T4Pndppv022oxOgaZFbycx9D57Gb1WhZxNAozY3fFWG5Mm3+NVnTp1TnUaKFzr
 D6hg==
X-Gm-Message-State: AOAM533yynYujMiLDWlIk+R7ITMWcMLDMxV4804WlXK7X+A/uLwtalIX
 Vk0mEGYPWzZzrDJldtxHwfw/8g==
X-Google-Smtp-Source: ABdhPJx+hiOMH45Oc5nIlzzBSQjzxayUVe1XxrA/fvFaiFwhSlWxD0TtC+c0xsTWk5/smRLJ5mSM/Q==
X-Received: by 2002:a17:902:c60b:b029:e7:3b60:34ad with SMTP id
 r11-20020a170902c60bb02900e73b6034admr13767283plr.7.1617384395000; 
 Fri, 02 Apr 2021 10:26:35 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id 15sm8552117pfx.167.2021.04.02.10.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:26:34 -0700 (PDT)
Subject: Re: [PATCH v2 02/21] Hexagon (target/hexagon) remove unnecessary
 inline directives
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d56400ae-d043-b2e2-e595-ab4bb7ca87cc@linaro.org>
Date: Fri, 2 Apr 2021 10:26:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.c       |  9 ++++-----
>   target/hexagon/decode.c    |  6 +++---
>   target/hexagon/fma_emu.c   | 39 ++++++++++++++++++++-------------------
>   target/hexagon/op_helper.c | 37 ++++++++++++++++++-------------------
>   target/hexagon/translate.c |  2 +-
>   5 files changed, 46 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

