Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B175633A232
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 02:41:44 +0100 (CET)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLFlH-0001FK-AY
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 20:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLFjb-0000ht-JY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 20:39:59 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLFjZ-0006qc-TJ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 20:39:59 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 125-20020a4a1a830000b02901b6a144a417so2515667oof.13
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 17:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JYC76gk25ZJqeH0pomEyolkS6zmlhFkBUOLPE465UnQ=;
 b=hjkjS20/VTrb1T31fAaaa0C8eEIZ8yMZ0iG9D299p4G9S0BBMUTGftWUIqPfnaYVxf
 X5el6ChqZuibFJKqJ84N7ZHg7Z5gcssTeDzfyxd3uct5f8FKg+v2d/WWS9DvK0o/pAY/
 IdzJ621rf8+qmQPyrrUPgeNiZBx2OTcawLqxL2r2P9FZ2EE+Ty94S7QWGQM/ZTN65LUb
 /chXlBdgkPtvOgXqbM6WwbOSkMnTdp3CkQeREYxHcFyquDoIED4gE9+QgnCi0xB8SLHW
 gQZ/B+mPDPjWvWGY+gWj3+jVvUJErhZOhr0qFwpqMFP7HYuafolzXneh5jdbKwlmZvrf
 itxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JYC76gk25ZJqeH0pomEyolkS6zmlhFkBUOLPE465UnQ=;
 b=odAsCb+MC3P/zOmC+39f4qlFM+05o31osdJ3tcVA+5fwpffeu2xxAUu40CZc6S+LRF
 NTbnHxQqpPWQj9/lmRwF6JzF0Ny3XEwTye3eC+jRXTvFRmRpRBHdKnqHT6jRSqL92O76
 axBx3xG7EoxgclPbw23EYf9BM3cdUUftioQjExaEp4w23wY+PV4SuKZWvRAypP4ZwSJH
 Lb5t8Rr58t1bsCLtUKYyV3HUNBVtllotPtjvZ+iX/Q7rlbwnzzSFRNxaZfVoGdD3a2Uq
 6Mc1tl5bigygoOQSI/vATyd9pnOj24v2sIbW4tsgH/dfXJYm4WRs6+pG3CkN1lJVJuzG
 YDcw==
X-Gm-Message-State: AOAM53151uEIHuE4fn9qlnNDtanig7qJNaVsPq4QUoaPeyuymlMxHSW4
 TTcATIzb6AgrdJEZpZP1kvHfGg==
X-Google-Smtp-Source: ABdhPJyfFK5Zs/gtUAf1mfOLKbAbqXfg4NYbfV0rwdxGOwvvHTiINwMTrqOzwG76EhB5WX51YfhYlA==
X-Received: by 2002:a4a:e382:: with SMTP id l2mr8587547oov.17.1615685995785;
 Sat, 13 Mar 2021 17:39:55 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k12sm4609854otr.33.2021.03.13.17.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 17:39:55 -0800 (PST)
Subject: Re: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
 <ebb86dcd-d89b-3901-3c59-08c6bfb3ed23@linaro.org>
 <BYAPR02MB488669BE2DBB06AAACD416B3DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aeb28623-e7ac-3b35-0a0f-0a9b175e8cfb@linaro.org>
Date: Sat, 13 Mar 2021 19:39:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB488669BE2DBB06AAACD416B3DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 6:39 PM, Taylor Simpson wrote:
> BTW, how can I generate an assert via TCG?

You can't, as such.  You can call a helper function, which can do whatever.


>> Except for HEX_DEBUG, why would we not know whether or not a predicate
>> has been
>> written twice?  It seems like we shouldn't need hex_pred_written for the
>> non-debug case.
> 
> It's legal to write to a predicate more than once in the same packet.

I repeat -- why would you not know that?  You should be able to examine the 
packet and see whether it does or does not write to a predicate register more 
than once.

Simply always generating code that assumes it has is lazy.


r~

