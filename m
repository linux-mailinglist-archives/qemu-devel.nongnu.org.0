Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA904B038E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 03:52:29 +0100 (CET)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHzZM-0005CC-HB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 21:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHzWS-0004Ot-3W
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:49:28 -0500
Received: from [2607:f8b0:4864:20::102d] (port=52160
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHzWO-0000ae-A6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:49:27 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y9so3932151pjf.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 18:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y7M48qwBZjwUHOp87U8zKnX3mys1H1TPBaeobzC85U4=;
 b=Br/9MJNX8rdJXG0bHJKs5XhDr2dsgStEiz3mceVFMnDGrG+0AY1XIyjjaeLBb0ApCk
 KZiZvwSk3tuDHrm/KBiHXxiKff3wRl3du5EVhCQhbuZ3EptzfkW4No8kd56j+keoYuow
 QBdfiGNnaI0zRiyiXKT2WV1q3g1b5jidI7MKHKbPD0x/a17oLSRJsxXpCUmNCOJuTOrQ
 7/xP2ebHNuXESKUErC68RUSMnoLBbKlcS3qsQLjxT5bDTS9KDoN8oXdfRQkuxbKtG152
 0GW/j/AEdX/FrKRjJe9FK1dg+JtKf8FBHgWIzGNjcHqRnMoBP5zXpSneO2WLTETd8PWT
 cuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y7M48qwBZjwUHOp87U8zKnX3mys1H1TPBaeobzC85U4=;
 b=aIuRN3W9er8N5aCDmf6TgGSGpXv51zAdOuwk7b+PK72O/i6ky+XbsEsucw14+zm0dJ
 yErZJIClPI2E6MPGx9+mteXcJ3yStl5eKiJxyBufrLrk9WALM/QVjtUrcVZvoKoataRZ
 AksRtESozOpwqa9CNLa2XYADmFxhCbH9JivLqKNySxiW6v5WXCZ7Z2VmqTmXY/IiSo6E
 w/gtRwOQ12O0UtzT6KtkeaSR4L3S8O1TXwh2FXsRzaE8RnX3XNfctsznLBj5Zrdd7efr
 K7B9Xb2nS0XW70Z3iLzF/xu4PPeJHCprW7CeLouLcbEj0HIGA9uPA4NZaTxhCO/DBczm
 inZA==
X-Gm-Message-State: AOAM531Op5XKvxuOWDpCrFD7jkLvKVeoAcpuVs0f0HsT8xpAehlokamr
 LNpeYgF/9gV58Fks5i1kjTvLMg==
X-Google-Smtp-Source: ABdhPJzSwrQDj3b/nq4uCMRzdxwOc8IwtFvCsgAaGw/KZwzgOVTFxgYjlwXcA/av8PN/FSeV+Cw07w==
X-Received: by 2002:a17:902:6b8c:: with SMTP id
 p12mr5515623plk.51.1644461345889; 
 Wed, 09 Feb 2022 18:49:05 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id p6sm8402453pfo.73.2022.02.09.18.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 18:49:05 -0800 (PST)
Message-ID: <2ffb2ef6-7d54-227f-43e9-bfe6b75134d0@linaro.org>
Date: Thu, 10 Feb 2022 13:48:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/6] target/arm: Implement FEAT_LPA2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-7-richard.henderson@linaro.org>
 <CAFEAcA9+2Mt2uui06J1ONxFGS_hb3tEJt8nxNHBjjAyaHrvr3g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9+2Mt2uui06J1ONxFGS_hb3tEJt8nxNHBjjAyaHrvr3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/22 01:39, Peter Maydell wrote:
> (1) The handling of the BaseADDR field for TLB range
> invalidates needs updating (there's a TODO to this effect in
> tlbi_aa64_range_get_base()).
> 
> Side note: in that function, we shift the field by TARGET_PAGE_BITS,
> but the docs say that the shift should depend on the configured
> translation granule. Is that a bug?

Yes.

> (2) There are some new long-form fault status codes with FEAT_LPA2,
> corresponding to various fault types that can now occur at level -1.
> arm_fi_to_lfsc() needs updating to handle fi->level being -1.
> (You could do this bit as a preceding patch; it doesn't need to
> be squashed into this one.)

Yep, thanks.


r~

