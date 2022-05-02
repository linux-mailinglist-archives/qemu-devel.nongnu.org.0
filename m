Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBA517962
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 23:46:18 +0200 (CEST)
Received: from localhost ([::1]:46812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlds1-0006OQ-80
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 17:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldqO-0005Ee-01
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:44:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldqM-0003T2-D3
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:44:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j8so13470550pll.11
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c0KlL2ZbcKcPjDtOnumZDjxMMJAsNOWOFm8qWdgZ4/k=;
 b=LZN8iK6p4hv8dpZK4xpmqCYKpyEcgDyS9BkBb1WPpFhROAhPHR0mZlCNqoE+wXa+sI
 nPxJVCDlfxaoM6OuqWkXatGar4uMH+AlcR/7jivJLSOvBvZ6A2l2t/Gni6+6g4YU2ZZN
 dEMhXn+4vSprqjBcaL95m+97FN070zJkm2DhtClEpf/XyLKpIjxuomxdXSOUwyVJV2ry
 zWeseZ28jxMQZcH55SYpLwS+EENdi5G1b3C/fnbfqvlmCj3N1E1WmbnefqUSZc7KvLCX
 qqssTVv34rLx1d3MIQGdouwan5sxhrOr+mT5uRiRxOFD8ZEGo2QqDXldeNVHFk2rOtCF
 YzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c0KlL2ZbcKcPjDtOnumZDjxMMJAsNOWOFm8qWdgZ4/k=;
 b=ptEsdT0kQo3nV4linbg/0+Y9bYTmCpZU53vwoc1WzxzKoo8KH7B9CwFnnbIU6qwUsE
 ua+5kyZa2ghKbzSApEB/uB16DjwaG6850rDHUT+TUi+HZTcI8OAsTYTXaoCJhcZf4PkZ
 LTJB2tbWxlyMQGvr/wkMeAiicUTDHs5SnF1lBorlMDneN42Iol/T84MtQrNtckeM4kcq
 9JC/os6pV4kKmW3tk3tI9orEIinSFyAwHWBrbhZUe1ltc3RAt0P3jx3tXIQK2GXiSgOE
 YbpNINtDBsZmyVZOiEXrFeh9dydgt64fHyf0DkYsrM+L/Cpz42e4PhPsNRC7NZ+jH7Fp
 uhkA==
X-Gm-Message-State: AOAM533foWGITssbwpiBzGNHS1yYvSZFWlGdALtmzTRpcvm/z/sbEKVc
 47vKnpZwxIxtTKXCVdEE7sYA8A==
X-Google-Smtp-Source: ABdhPJwZsW6YjEZSIHSV7zkmQEDPEkutzX/Ko/NX57WUiUTCZREeR7f3xjedSXOSneFxYi5uKo81Ng==
X-Received: by 2002:a17:90b:1b52:b0:1dc:54ea:ac00 with SMTP id
 nv18-20020a17090b1b5200b001dc54eaac00mr1257613pjb.99.1651527872763; 
 Mon, 02 May 2022 14:44:32 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0050dc76281efsm5151856pfh.201.2022.05.02.14.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:44:32 -0700 (PDT)
Message-ID: <fead9ccb-1bf6-f2b6-111e-c26eab9c8fae@linaro.org>
Date: Mon, 2 May 2022 14:44:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 11/21] target/ppc: Remove msr_gs macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-12-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-12-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 07:39, Víctor Colombo wrote:
> -        ((value >> MSR_GS) & 1) != msr_gs) {
> +        !(value & env->msr & R_MSR_GS_MASK)) {

This isn't right.  I think you wanted

   (value ^ env->msr) & R_MSR_GS_MASK


r~

