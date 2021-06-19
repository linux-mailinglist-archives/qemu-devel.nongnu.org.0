Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270133ADBD3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 23:51:15 +0200 (CEST)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luirx-0004Qe-O7
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 17:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luiqt-0003eo-S2
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 17:50:07 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luiqs-0005tz-7y
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 17:50:07 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e33so10862295pgm.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iNwYkfKnNueeRdZLGLmf6LzFNO1L9uHpHzYBGfs9Igs=;
 b=C3+CGUAOhEKaEf+Sw5AxxSmNZbEKL9p3GkhrWVtW4+sh4/0UH3s1cLEyNVzs1rHhUT
 171FLjPoJBHdHqqqjGhTYT1vaIQgAcsn2whVqqBhkVtrziwB8ZQm6LUa5GdSx/zPyp4g
 /XbJhH0G8UzuiZKS3kTmBXlTjhe+pg1AjhYhUU/7VZf+sZ9vkIsA2p/lTBT8rvVNr8oj
 pS9lpK2eVSuS71vh4yQTf8DDN6/v/L/z2zrJZIpjcvFe8izklGKTtC/m3C3rXpDUkBDV
 AWEb7XdKxGyMJvqver7m6dxOMMlkUo8TbYZPsfmDelSSMr/AS9T3PkL77dOy42pLsAhb
 fnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNwYkfKnNueeRdZLGLmf6LzFNO1L9uHpHzYBGfs9Igs=;
 b=cI+SILPIl/XTo07aLNn7gkALV5U/ddGD87MIqIUfCb1nyB9Nif+wzMSgCvgO/ToSfy
 QYMDTJ7uL6euGz1vq7KZcWAFZ6onZ/cfy4AaEuTLc7YWnzed1Mt9W2DrQMTBfizkCf9M
 1oOdluzA0a9AbNOaQcTDY+9Kgu5Z7il/1AQcsNyVs1b8w2DaCClc4y9CeXkner/dr3Yz
 MdjV75ZPiTYmWLqbqsIhljktsbl9T69OMS8TdbxJb2NzEx8pWC2nF7h38yOp1IaUM9ne
 WyCKojHiSUOjUVQBkdmqnb1IbnygLFwHKrU5N+++E+wr3TE0WxgEvcxx1blx3+rE7FUR
 Av3g==
X-Gm-Message-State: AOAM532nziEBkIfrPWC3uzU2XD0Mr60eT9c5tpfrRRTYOvCHQv1CCKdM
 OPbBxqiLFI9We9J6BoIq9Iqmmw==
X-Google-Smtp-Source: ABdhPJwLZYUXmEs33owF7i8vPl3t/22l92QV3WAPAYYQ8OY2JZTI04zunBsRZRdE+qsxa6mNLOxiTg==
X-Received: by 2002:a63:e0e:: with SMTP id d14mr16387553pgl.426.1624139404327; 
 Sat, 19 Jun 2021 14:50:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 125sm2179923pfx.175.2021.06.19.14.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 14:50:04 -0700 (PDT)
Subject: Re: [PULL 00/33] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210619181452.877683-1-richard.henderson@linaro.org>
Message-ID: <46f9690d-178f-a0a5-2cbd-5646401cf77a@linaro.org>
Date: Sat, 19 Jun 2021 14:50:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bah.  Somehow I overwrote a minor fix for

>        tcg: Allocate sufficient storage in temp_allocate_frame
Will update and repost.


r~

