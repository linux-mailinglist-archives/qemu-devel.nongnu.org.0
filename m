Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2257AB34
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 02:53:51 +0200 (CEST)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDxyG-0001M8-Vd
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 20:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDxwd-0008Ln-6b
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 20:52:07 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDxwb-0000H6-9g
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 20:52:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id y9so15135808pff.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 17:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ej0U8p1ONmLbS9LtgmzF4ix8l/h0h8hd1IFfP9941+g=;
 b=x8TvsQ4S6pNSl6fJO2Xkx4u86uk/s9pMDWOXyPgXpzPS+XkK4WTxY5eIutRohpKYSu
 5irgMNHO8fAYRZEEwHy4DkegH5vhblo2znYlXI6oqN90JWbEi3540QFfeNTkYQSqhWTN
 XCuFdAqFeJUkmWIjjmHA95+/yIb/+0C45B8uwulG7jrhB/mKrkbf45IvMGQ+alMLUcST
 nnrg6up5j9dKX8zZHjSpwByfL7rrW4A51gVS48OT8CdOV2KrlFGk5vtOx2DvLB6e6Ooh
 CF8NY+Gk118EmlSd/7+mYnvmCk7uZ+kujqswIHkwkG3I1ABxs5uCtYUnKQXktCaj9yKh
 BkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ej0U8p1ONmLbS9LtgmzF4ix8l/h0h8hd1IFfP9941+g=;
 b=MbTwLmeo//DCBNMqy7jtKZfMZyGtBZKpwF1KZRbcS7O1lah2mhqoE8xUsI5r+z1RgA
 Ot2hc5W2MBetDri+37ClyRepxlqU/+GtcZzaPByj7LygCusgZf0OoegCBPxl4yZyIqRi
 tFN/Ga4S/fkcFp4YzWL79tvmtygDeDLfJ7d4KfIkc7xL7qtwWUj5NbOhJqHM7O/w+NYj
 uetx9UglIOvN1pIMusIIDjq0kC1JW/FY0IvenHidqlJRC9HP+uCy6SJLk0lg3gExNrJ9
 DGHVtRgEEtFrXPkiIgMi+P1Mup41kDtWw28AY1EaP1K7Gjs+ZLpzCpMZ6/Ai1S3y4fRe
 mSGw==
X-Gm-Message-State: AJIora9hsTOOGDFHMGKSt6C1hwSJUbCOVQX18/u/4J7fYfs932L/w/0n
 Oej7FTUvfNJeYe439uYEhbSEgw==
X-Google-Smtp-Source: AGRyM1voG7PWiCB+gM3Ot8PkVgnp/tIWCZfSp5m+RT8PP8ycutQioJVMK6pQ88OoLQ2+9JBiuIkjnA==
X-Received: by 2002:a63:6ac8:0:b0:419:d861:3f2f with SMTP id
 f191-20020a636ac8000000b00419d8613f2fmr23436067pgc.294.1658278323314; 
 Tue, 19 Jul 2022 17:52:03 -0700 (PDT)
Received: from [192.168.168.227] ([123.231.102.160])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902a40d00b0016c3affe60esm12318163plq.46.2022.07.19.17.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 17:52:02 -0700 (PDT)
Message-ID: <550b7d51-f46f-b951-47e2-9cc11f1b7196@linaro.org>
Date: Wed, 20 Jul 2022 06:21:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 07/16] configure, meson: move ARCH to meson.build
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20211219141711.248066-1-pbonzini@redhat.com>
 <20211219141711.248066-8-pbonzini@redhat.com>
 <CAFEAcA-uAYrZPzGZfSVOQ16cxfYiR8k_J5D0XWNYn49V_hdmCA@mail.gmail.com>
 <7a2ed522-c6d2-48b8-5692-4a27b24ef312@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7a2ed522-c6d2-48b8-5692-4a27b24ef312@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 7/19/22 23:40, Paolo Bonzini wrote:
> On 7/19/22 15:00, Peter Maydell wrote:
>> shellcheck points out that this (old) commit removed the code
>> setting ARCH from configure, but left behind a use of it:
>>
>> case "$ARCH" in
>> alpha)
>>    # Ensure there's only a single GP
>>    QEMU_CFLAGS="-msmall-data $QEMU_CFLAGS"
>> ;;
>> esac
>>
>> Presumably meson.build needs to do some equivalent of this ?
> 
> Yeah, I'll send a patch before 7.1 gets out (Richard, as the resident Alpha guy do you why 
> it is needed?).

It was to allow simplifying assumptions in the jit for tcg/alpha, the patches for which 
were on list but never committed.

This can be dropped.


r~

