Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B92252DA59
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:36:51 +0200 (CEST)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrj8r-0006I1-OW
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrj5r-00032e-TJ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 12:33:43 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrj5q-00005O-5l
 for qemu-devel@nongnu.org; Thu, 19 May 2022 12:33:43 -0400
Received: by mail-pg1-x530.google.com with SMTP id z3so4048252pgn.4
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IMljC8Xt9Lp3w6Mi2pLPvYPv4WBF6EpCQhvunQlqR4E=;
 b=lP1jWQKYMge+w6+IiqHBCu/LAQC8z9M0Fs7+EqmbCChHhNZ2scNo4mw8Iuy7UD/YFZ
 yGVr7ZAbJMXi4TTdmlyhrWDmZS45465kwUsd6KsTUYcFCyy/troU59n6s8i1CMDCJOs0
 oMvjkRIKcnMFFs0bTfodPdmMr3UD7X6CDCtz4e0bwm8c2HyPKkVI4augXjnL42F++KEE
 l0aXgHzRoMoqvlfkUPu91OxzP9E1lMJIQYOFzGfqRiPv77/AHc6BRKW+8fbPgyohblaD
 ueQ2ocKyV2VU6BSF6vzlI92/K7tqRutUM5mWHRXKioI6kLIc2qTj6wL4BAU67A1m78ma
 WPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IMljC8Xt9Lp3w6Mi2pLPvYPv4WBF6EpCQhvunQlqR4E=;
 b=24/TpO6cLJ5c4K0Bzm78iZuNOgZRTcoQHUi1NRgptDCx7mslnhdb3VuFr9gwaQdbdi
 IFQxZomiDYROMXYuRRoAmxt3IpqI0oeG4sac1+Fr0mMXgV34idB10f0WBwDyATgwpzMQ
 qQHDWnJvtozCzLpdTyt6c5Ao5t/dLsgZCuJUjeHxECc9HBYoXE89p6fDjSqi6JN/vmlN
 UzfloxNtRMuwtHcPOhh+4OYYZynM3W4apTU1VJnLoYS6YgAgdMzZR4buEcFUuvfQGp+B
 bjxpkQxZP3C+LRCvVOIDVWH5EBjjcvNE4E4TNevVZV+PwIsjMncBpfiM1elEHDsJ46/X
 5Nhg==
X-Gm-Message-State: AOAM5335ZDySqJRdy2Dar4lhSDvgrfn4TMuiRQ+kksRwVI+GRAJ3lgeu
 Sk2cNwKYHlnGWZfxLujIp4Uy6w==
X-Google-Smtp-Source: ABdhPJyhzsgw79w3MmFDHVS6o4U9AzP698L8lbCXOKos2xyIP3Tpzs0TJzdpylyl5p+XuFIm9GpYiQ==
X-Received: by 2002:a62:f901:0:b0:518:307a:b392 with SMTP id
 o1-20020a62f901000000b00518307ab392mr5456776pfh.44.1652978020564; 
 Thu, 19 May 2022 09:33:40 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 7-20020a17090a098700b001d25dfb9d39sm28236pjo.14.2022.05.19.09.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 09:33:39 -0700 (PDT)
Message-ID: <764b9678-f67b-3f9c-7f00-a30a35796eb0@linaro.org>
Date: Thu, 19 May 2022 09:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/7] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-4-richard.henderson@linaro.org>
 <CAFEAcA9SU0vXtzw76HkN4wrSgsMyBNwA_bHGa7x0u0rtNe4LQw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9SU0vXtzw76HkN4wrSgsMyBNwA_bHGa7x0u0rtNe4LQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 5/19/22 03:40, Peter Maydell wrote:
> Not all the code that looks at the sve vector length
> goes through sve_zcr_len_for_el(), though. In particular,
> this is setting up ZCR_EL1 for usermode, and all
> the code under linux-user/ that wants to know the vector
> length does it with "env->vfp.zcr_el[1] & 0xf".

Oops, yes.  Linux-user should be checking ZCR_LEN from env->hflags.

> Incidentally, do_prctl_set_vl() also sets zcr_el[1] and
> it doesn't call aarch64_sve_zcr_get_valid_len(). Should it,
> or is it doing an equivalent check anyway?

I think this got missed when we introduced the set of valid lengths -- it's still assuming 
all lengths less than maximum are valid.

I'll add a couple of cleanup patches for this.

r~


