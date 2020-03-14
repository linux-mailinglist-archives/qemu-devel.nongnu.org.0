Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CF1854F3
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 07:01:24 +0100 (CET)
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCzrP-0004wJ-Vr
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 02:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzqH-0004KT-8b
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 02:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzqF-0008C9-3u
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 02:00:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCzqE-00089b-US
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 02:00:11 -0400
Received: by mail-pf1-x443.google.com with SMTP id p14so6589170pfn.4
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 23:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r3Ky8a5dy263MnktgHrrvhCn1dI0ZhJvJKHpKpk7T7Y=;
 b=ac15Xi2bAsPeCYg7SIr0VJ661jeKfwZzAstS9hlhc25fe5M7EtblL/v6Ca54H9t7vs
 BkMFkH7WPf11aEuON76T9UzmV0qm/JazVQLMoNASxbH1R6o38fj1F+DG3ArCvNaxtQn7
 eBNg2pGurW3gkmBz7fdKGMOlDgmNf1iI8yy6eH0R93KjvCVNYNjvvdKHaicgw7qjIzkq
 Y+7r9veLd9ZkDlGkdwn9YvHtrmeaog+0Gzg+qNRtY/QhEBIXbqmcNRGjR880kZFlUoEf
 YXEzjLg759VFOmUdAJFsThadiNHsUgP9xdRtb1NRZB3HRJUWU19QOfCT9qcPr8xSFwyx
 zM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3Ky8a5dy263MnktgHrrvhCn1dI0ZhJvJKHpKpk7T7Y=;
 b=HygzxRE2+/YqDpxc0UDDH8M1BSHRAFhIKvxJJm9jszyBBrVpnhOCbxnTZ4G4/0FS8x
 S2N2oL2O6yxAKBFb1tosMBbjhLJhq1/uE6vQxVyfVynBTKibGAFKkHJ3SpoQ7ZLBz5xa
 QenqM2s/POCl1sVB/nclCVh8HKX8E0yRqusqSE1pX+a06IiB3gecaXotYbq+jEUAmHlz
 1NSs/QVjhvaLYpf709X1M5dEp9JEud7xmjA5uRJ9FOeS+ZM6Y+Dr+pWjku3lu9OaLyjA
 7oRneyuV8PrSqnVWvu7WLH28N0C0K28bY7g/v31tfWt1OO40ycShRG0R/eReEcHTzhct
 Kfgg==
X-Gm-Message-State: ANhLgQ3yuMQtK109r/mK772qyHOuCHnk5eR5GM9td4OlKVAjwvMBg+Na
 W1p4LCax2tFvJE7ul5MZ9dK9NA==
X-Google-Smtp-Source: ADFU+vsk88VgSwBIq6mZnUBq15ywDaHLnQ2F9k/Tc5VqdOvf17xY3VG4dSzlCaWY5xXA7t+oaK+Ukg==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr17986983pff.112.1584165610028; 
 Fri, 13 Mar 2020 23:00:10 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ck11sm289233pjb.32.2020.03.13.23.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:00:09 -0700 (PDT)
Subject: Re: [PATCH v5 12/60] target/riscv: vector bitwise logical instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75bab538-ec0a-ff81-fe9e-a0e2d808dcc1@linaro.org>
Date: Fri, 13 Mar 2020 23:00:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 25 ++++++++++++
>  target/riscv/insn32.decode              |  9 +++++
>  target/riscv/insn_trans/trans_rvv.inc.c | 11 ++++++
>  target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
>  4 files changed, 96 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


