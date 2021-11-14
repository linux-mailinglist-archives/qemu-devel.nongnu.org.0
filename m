Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622444F74D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 10:09:06 +0100 (CET)
Received: from localhost ([::1]:39876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmBVZ-0007r8-2u
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 04:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmBUI-0006Qr-35
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 04:07:46 -0500
Received: from [2a00:1450:4864:20::42c] (port=42672
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmBUG-0007s8-Ij
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 04:07:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c4so24014594wrd.9
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QtrI/7g3IGMNMX83vgspecOJBfkhEQrsyURjTtbncp4=;
 b=kPUMC3PtZc9w57y41jiREB1bCX15b8EwTWu23A5n6nLYabFOkTKM0V2URvQwhVyyLK
 Un5dDpmJsAqSrHDgjaqup4BFJlH0dFeMa8qA4+afwbA3aU9BsN7sV4WEIRoJC4IIXDCP
 JdVEOadhmdYh2wNpUoTd0hyfrw5l1pOTSP7K7KbfBgWxVmQkAZkukIFx6lxNBW71UvaZ
 yL1Osr+oI06FNBnuiTDVT3uvrMbWc7FrZJlhoI1X6ASa2hggLbwltFu+JDmKi035AAlM
 cSxCn1WYq7ABqPscJCCRSfGnFFQ60weedkS3ZXyvqesdgd3oLdGwbSxLsaDwjE1zc/IY
 6J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QtrI/7g3IGMNMX83vgspecOJBfkhEQrsyURjTtbncp4=;
 b=iDBuBUWd5K14zJRfd3CKSJ9JB8ZqVGWAWYCzBkBt8kgCR2bbmBCCRZbUWyaY2nck6u
 3xomjEPisou8U5v7qe+Fi1ImUw3scvNCjp0AuFxzPAWPDv2p+wv0O4uXzkhYR9cHnCrY
 NaUVEgszzJvugaHUzqQDoq389+AcVjKvhEOdz3CcDyc15/UBVCOr6dq2doxzUtktJX+0
 nXlOcgwWgyVjqKOmG8td7CwTKUqSJGqVzAlTtiAQ2D/MXRLoT/SrbselF/4I7E80GcAa
 VhqKtsh2Mmo5UM1n2OEJbQhCbvTaef6+SDuYLRZ+JP7c/NiC3VmaRmj5JZSmlef9JjKA
 m9jA==
X-Gm-Message-State: AOAM530GTBuDozjMJb2Rqx3JaSaCjOiI8PlT4JvpciGvp/lj5ZjGje3C
 eIazRpn/PIuA95J+lQ1gA7asm8F9hNfEaIi+vKs=
X-Google-Smtp-Source: ABdhPJz2ItLaRA61t/ibY8YbsOXZB3w/X/yN/FArcczHs21vQI+maGeWKzv9BhaXOb95H2S3JUJjBA==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr35256050wrz.401.1636880862416; 
 Sun, 14 Nov 2021 01:07:42 -0800 (PST)
Received: from [192.168.8.105] (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id h16sm11853201wrm.27.2021.11.14.01.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 01:07:42 -0800 (PST)
Subject: Re: ppc/fpu_helper.c
To: luoyonggang@gmail.com, qemu-ppc@nongnu.org,
 qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE_1ajznMKob+r3OEHKztPueiqWxSAOE+PKF_hNS6nktjg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77cac06d-f68f-ec30-5c7e-0d32a49a162d@linaro.org>
Date: Sun, 14 Nov 2021 10:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_1ajznMKob+r3OEHKztPueiqWxSAOE+PKF_hNS6nktjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/13/21 11:07 AM, 罗勇刚(Yonggang Luo) wrote:
> I've seen nothing in fpu_helper.c to update
> the fpscr to FP_FR,
> that is there is no code with `fpscr |= FP_FR`,
> is that valid for PowerPC? or it's just because this is hard
> to implement and then the FP_FR  are always not set  for  fpscr

It is unimplemented, yes.  I think that no one has spent the time; I don't think that it 
should be hard, necessarily.


r~

