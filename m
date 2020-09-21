Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12DD2718CE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 02:22:31 +0200 (CEST)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK9bC-0006r1-Tq
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 20:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9Zm-0006PD-Ji
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 20:21:03 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9Zj-0004X7-PE
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 20:21:02 -0400
Received: by mail-pf1-x443.google.com with SMTP id x123so7726838pfc.7
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 17:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HbURRck6sTXMAOvY4XGlXBRsMOftUvOU5iP1LkgaHLo=;
 b=kqarDyJ16IfRtsGUxGvdbBpoaAJlrpK8syPm02A23MiuYJGPklSYUhJvyFr0XLNL3/
 6E5/mmTX5E2F2+Ck6cnc+szG0INnmz4jdW5RxkhvCPxudSbi2R53No7zTqv4Xahb9kUR
 HMJpgTlbKDs6HEBlfmPu3jEhN2AQ3DnUm7ZJ2yEcW/M++6tXp17THdvV84DvcUIVTIeS
 MoPEjMCSGupQ0Cx+afoDH0iBHW4rPAYp8aZOQbOZNX1tvXuE4hOKEM7QGiq1pkJF5xGG
 LbzWeDCTxeL6VMrMutzUMFQgvFa3Zi1884ScX5DUHH7hB6c/1nBSf2f/uGmekKv06UEH
 PUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HbURRck6sTXMAOvY4XGlXBRsMOftUvOU5iP1LkgaHLo=;
 b=Xk1n5ctkkGdCORe6KhAoFXmpekeQaPsS0hheYE0MRNokt96gwTCH6ImovMTF4VaNBn
 QszwztGL1fkt0pWsrocuekFUqUU6LQUrd74ZoNr0v+IVftGmRmp7ROsaeME20q6eljAX
 hNou6YLJKEsutodN/PkIkWwH8/aNezGxsAl8wr4eixYA7IYzk6LYu7hZiLXc1/CMNY4R
 7A3HAaRPAbQL0KhvEMvoKdBZi0EgENMjYWclvpmkFrks/ZWyWP1ASjxRzrvcXZPY8H++
 wmHBXmGe/Z+5yNw0IZwBP6hoXEKJUY+rEdHo74KIfQUqdfdM9OmJKnwLta9OSRXEG8Yk
 /PbQ==
X-Gm-Message-State: AOAM533MxwxuBCgm1ZxcUJZ03u8AG/fqq2ymqqKm3bV0yfgkpISANin9
 Ykfgc0eI/QnuQu+IY9aekoS5Z8P48BWOiw==
X-Google-Smtp-Source: ABdhPJxsrTyqn9MGg/8CqH2g2FjDWeIb3Kh07hKa49sVqXRPs30h6xxuSMb7J8U7DhjXccmp3uBKxw==
X-Received: by 2002:a63:5d07:: with SMTP id r7mr22538927pgb.440.1600647657244; 
 Sun, 20 Sep 2020 17:20:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z1sm6154272pgu.80.2020.09.20.17.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 17:20:56 -0700 (PDT)
Subject: Re: [PATCH 6/9] configure: move CONFIG_* symbols to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200920130708.1156310-1-pbonzini@redhat.com>
 <20200920130708.1156310-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7d55dc8-1476-e278-0e72-9d4769bcbd6f@linaro.org>
Date: Sun, 20 Sep 2020 17:20:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200920130708.1156310-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/20 6:07 AM, Paolo Bonzini wrote:
> These symbols are easily computed from just the target name,
> so remove them from config-target.mak.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 11 +----------
>  meson.build | 27 ++++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


