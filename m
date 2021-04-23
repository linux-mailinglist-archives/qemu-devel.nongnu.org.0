Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB1369D2A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:10:21 +0200 (CEST)
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4wG-0000Aw-5s
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4qS-0000rH-9f
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:04:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4qQ-0004hi-N6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:04:20 -0400
Received: by mail-pj1-x102e.google.com with SMTP id lt13so15002705pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f8NMIUxpYRA3QjnWVeOBAQWXQGr6ELie6a3Y/KFUUFQ=;
 b=pm8slhAX+rbIDDh+0lhpUWzDrdztT6u8+wIEiKLHOHduFn3CBi7YsLurWpIZ89wiqg
 3Q+vRoOs0XURkAqMv2nqc5genMJhDtgJEWiW/0e8RT+9Pi8X33DWj870hb3xX+emWww+
 t7izUiGrb3a5qvfVNxLVxyjMZC1wHcq4pkbYhcMXDDmnAZPZTuLPGem5cR9/4IJaC+h6
 x6MpU3cYx2mTtkG15bsNs39KDMyAOhTvQtRUvx03zVWdcfGHieKrGBDPe674+w7kMzJl
 MFXGxTdFJZTIkufRtRuqXFnYex2osz7gQz0n3i9uWUWmwrwZbk/sqw+e0Ia0LJ+l/Nl6
 73Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8NMIUxpYRA3QjnWVeOBAQWXQGr6ELie6a3Y/KFUUFQ=;
 b=uIYpFq0mRwxegGdLl+J0kGNTvR21CTGY5PiYzIKPSd+2GHmODnFa2EozIO7tLuV+BQ
 3iC3IKD36HoaQbaw8PdLOucoIerTYC3qH3USuPRfpfj1GUnP32Z6R/xP2+5lncvg4fxo
 eZ23IXlpGlQNAOSJaciVxvlLkMKUWlI5mOaUerKhr0lEtL+LYKBYSrww7si5RmpfS7Q3
 4cL9k4xb8q6cCrqdukemATAZ1GZgfXepPBCJNmjQmp81H+ApC+5+HTgD6kLqpmVwU6sr
 N/cp5MlHRzq8oHs4HzMDUXgHCLttdY21Mu6f1UGxliiT0f3OpiTLuM16uf8Q2IhBuhUx
 YhWw==
X-Gm-Message-State: AOAM532kDVndaAR/NBQv48GZa5RS9nJ/ZAnxNu6QATYPrPt3Z3FKmqt0
 rkv6mXJycngK4r3ZqNC/vNH/BA==
X-Google-Smtp-Source: ABdhPJyr8/+jyfiFHeAtHOMmvOqF7X+32+31mMROZpVkNISlZVBWKoA2KXoPoNmvpbcc8u+L55IHwA==
X-Received: by 2002:a17:90b:351:: with SMTP id
 fh17mr7960109pjb.63.1619219057322; 
 Fri, 23 Apr 2021 16:04:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm5238983pfu.5.2021.04.23.16.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:04:17 -0700 (PDT)
Subject: Re: [PULL 08/24] bsd-user: style tweak: use C not C++ comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48e09249-e927-d78c-2d90-d35146de67a6@linaro.org>
Date: Fri, 23 Apr 2021 16:04:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


