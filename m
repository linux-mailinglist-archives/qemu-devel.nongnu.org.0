Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007EC11C32C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 03:27:18 +0100 (CET)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifECC-0005nh-Qe
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 21:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifEBR-0005Lm-RN
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 21:26:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifEBQ-0004zH-Rm
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 21:26:29 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42659)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifEBQ-0004yp-Jv
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 21:26:28 -0500
Received: by mail-pg1-x541.google.com with SMTP id s64so317481pgb.9
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 18:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l01TCjoxhhiRwrhGymsnwdBCUwsXAo0f17ZzMIBSSa4=;
 b=QhXX1opqNF7tkFLSur9SQgoXLDrEYTI/iPypsUYk0zPBfEzb7vaslnO3pTSZ21ynoA
 uc6HzlaS7j3tQfJX8QR2epgH0wodu6t6VRVqEBGWTaFZOrL5Fn5ySKgpt2Z75jgPov1d
 aKX8ouffQFQqp3JKqLFTqTjZTGyU2UB3lGzzSNbxbvDg1kXMyarpqJ9r8UV1w/bWJRH7
 KDMIZ4fEOMHCweVf9chJRrw60j/6bDzBrMLQ7eG3OOYbFeU/AbDXMAvhxajbtVqt9KOg
 zaYGGZGUN0R+MpSYkb/GSUIhi6gRno8pD6U/yAwajnSo+fVfAZU4vA9uTK0R2bWJowoo
 MUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l01TCjoxhhiRwrhGymsnwdBCUwsXAo0f17ZzMIBSSa4=;
 b=O1spd0nmOYaEm43p8fb3k3SG7t4isUlMgGQIRLHuqxvTD1i0G9SSqq5fCVVMiuVOHW
 DXZdn68SbB3JoDGY1Q8PgSEpLhS7xrGkaL1KW1MGBlfX9b1UbNGDAY3pgnS+xnOd7ECq
 2KDRByiEw8pnzRSY8Ca0SJOSiO7bUKykcNjLtrPcAinVZf2NQSLPUm7Sw8Dn3msWhq6v
 vVf8scJKFeRAoAEJkfaAkFGMTyHgJ+lYcCfPgsclyled0ZJL6UtLmvhkknldxl/5VVyJ
 qUojRtEM/E7A7Yh4pQJm19cfVyRzOWckpBqItX6QTBvcmxn3U/8zEUec6URiGmdrKCql
 ZoiQ==
X-Gm-Message-State: APjAAAUz5fROnwo+LpfmIWpGyMN1KLtA5mIaZ4cbqNSY1mbscPykkRkG
 zoWnMf5h4aoh3bdgPTdDq9s2VA==
X-Google-Smtp-Source: APXvYqzOf8mu/kWOthQCugcummgnnhrMmMXn2oRAw4uQ6g3eTLFPs+ZT6dz+LmcGdTsqK8erHl3iKg==
X-Received: by 2002:a62:7b46:: with SMTP id w67mr7325952pfc.113.1576117587348; 
 Wed, 11 Dec 2019 18:26:27 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id u123sm4586602pfb.109.2019.12.11.18.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 18:26:26 -0800 (PST)
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org>
Date: Wed, 11 Dec 2019 18:26:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, luis.machado@linaro.org,
 alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/19 9:05 AM, Alex Bennée wrote:
> +static struct TypeSize vec_lanes[] = {

const.

> +    case 51:
> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) + 1);

You need to use sve_zcr_len_for_el to get the effective vq.
Also, I thought vg == 2 * vq.
 > +    case 51:
> +    {
> +        uint64_t val = *(uint64_t *) buf;
> +        cpu->env.vfp.zcr_el[1] = (val - 1) & 0xf;

You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the effective vq
decreases, you must call aarch64_sve_narrow_vq.  You must call arm_rebuild_hflags.


r~

