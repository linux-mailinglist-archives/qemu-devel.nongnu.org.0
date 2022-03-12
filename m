Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176EB4D6F84
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 15:20:29 +0100 (CET)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT2bb-00025A-GU
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 09:20:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nT2aD-0001PE-Ra
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 09:19:01 -0500
Received: from [2607:f8b0:4864:20::1029] (port=41965
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nT2aC-00029z-EU
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 09:19:01 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso10681464pjb.0
 for <qemu-devel@nongnu.org>; Sat, 12 Mar 2022 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dj4WtRqcu9rPyMP8VT8h2SNv4TrHSlhUKD0i4ycQ/mA=;
 b=aZkzazCahdWrNltgzxpTytTDhF78vEyF5yVHGb6SELVQKc/wjJTMcbjtpmRv2u9tPl
 i2iTSrMTPhQ1Trm3takBVlKRZ9R6Mc2V0yteDQ/f96ZSVRY26sFneF6VD9Ek4mU3nkB5
 RY0OWRE4XPLvZCDrzBRFVG2BN2suygdHfdaNT69DbpEjVrtmDKa3oqyo5W4UMKonfdWv
 A7yN0SZkC4rzkyQ7DUep9kJYe5ICBmj8/vlvrWlmZ8nOXr1x46hcy5dZDsHHOazy0t5J
 RBDEqSdQR8+4xs4ZSUBoEC3zqwx503y1tRljay4mskpHMVawfBsau0fmSx5tWc1LxaN5
 8nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dj4WtRqcu9rPyMP8VT8h2SNv4TrHSlhUKD0i4ycQ/mA=;
 b=4bDiSOYnFyrla6Z5MJU4B4H+Se7qC6zFE/Jnivwr/HooAzu9rNiA2fHzt5zCIqsr+I
 RIwHwa0jIpkbNtKRem05evXVxWjcfHp1wjbxsC3ueHw0vhqk5PJe0E+NVy7C2LgJ6Xf7
 kh+7RQoaWAXNgg8oGxBGblOaRmEAYD+zfSmksIOhNUbiepFfpJB8gh3WB4gLm3+cx8oK
 qNVqrQw7v2mBC1/VvcchiHKpy/wPeldB2oRJKaFCkWSzXkmvyWTFlbGlmDqQQ5K7oQ1R
 Dxepno3sSpz19qGklz2x4cHNMzhkiB+zlP9ed2mcFbj1/ayHUUodgbv1FIZPPjb+D99/
 W2aQ==
X-Gm-Message-State: AOAM532u2xbwP0MS0X2Gj9S5GwvajrxbEMM41mRG9xp70KRN92zr0sXf
 hr1AOHDhqSdRDJlZfP0iyOnHqw==
X-Google-Smtp-Source: ABdhPJx5FNLGVKnExpeRGtDq7fKm/4x7LtLu0WCDj9P+TNg0eP5ie7CKd+4Ex67hF67T5iqtC9VTAQ==
X-Received: by 2002:a17:902:c40e:b0:151:a264:288c with SMTP id
 k14-20020a170902c40e00b00151a264288cmr15619308plk.42.1647094738112; 
 Sat, 12 Mar 2022 06:18:58 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm14310555pfu.150.2022.03.12.06.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 06:18:57 -0800 (PST)
Message-ID: <d9eab075-68fb-01f3-49d5-129a02c088ed@linaro.org>
Date: Sat, 12 Mar 2022 06:18:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] dump/dump: Add section string table support
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310111608.3362-1-frankja@linux.ibm.com>
 <20220310111608.3362-5-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310111608.3362-5-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:16, Janosch Frank wrote:
> Time to add a bit more descriptiveness to the dumps.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c           | 106 ++++++++++++++++++++++++++++++++++++------
>   include/sysemu/dump.h |   1 +
>   2 files changed, 94 insertions(+), 13 deletions(-)

Hmm.  I suppose.  Depending on the scope of your intended end result, this is either 
sufficient, or simplistic.

This is beginning to feel like a rewrite of <gelf.h> and <libdwelf.h>.

However,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

