Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9104302382
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:13:35 +0100 (CET)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ysI-0000BC-Dl
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l3yr3-0008Au-AL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:12:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l3yr1-0006FW-C3
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:12:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u14so3429725wml.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=a4fpywiWuWN37CzGxu4igyYiwcrOHFuZXIrERTvUIsE=;
 b=f0y10zPW6A3G/+/5hWpIkFEujyEx1eKf2VacEb5aebTJ8eFYGZMC7aFz6isC1AzqXO
 uuobjHZrjzaWoeliemGCq0kKskl4FJKmVSMZL2sWzCH1A2oYEeMSznl/nlFYGFHie8PO
 v5V3RNDX6SuGwzNu/zO5sdGqFiCiV/6/rJVEN3EWQ3pi7X+34mCmcHXVh/3d8jcIh0zQ
 Czf2kyhE+AK+y9ZUiT1uf+8FDdVKJLIOy1lQZxJtRpLtfGJmEwE1gYcU7qjPfoytEgta
 yG88XORH2zlgf7OIQ+KhTUCN5EPQ62i57LcIkptfZ+qmG5JFfJjBOtDH98nvcxQXnk88
 jIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=a4fpywiWuWN37CzGxu4igyYiwcrOHFuZXIrERTvUIsE=;
 b=C+XtZcMXhSDy24vXgExnBn7HIKBmWswsQiQN3zbuQ2PPRCm0qVzQaeevx24B+s7GJw
 WnasXANIfV+9zzzp5GrOAyw7agNZB4NJo/zYMjwHEIVbdINzleHcOIMUFwxy18S1sQCf
 WaMh1GvojDxmisivB90zQj6y955RFeh4hHhbt4Cth4HLdrr4sLROIMPzPB2Q5QQoxFu4
 J4EhMD2jFeomPYJWfUAPMmL2pTZbyXFdymSnP20TWeEE9mhBJA/tNGTUR2bDffbTXeIC
 tZ4I1pF/Rn6OarEP6vR6n2UND2kxpHD6THTcqBHCVmG/56kdUZDxsEqCR3fZESvvacrp
 EAYg==
X-Gm-Message-State: AOAM532eZYmW/kb119htiE2XDM0EzyI0lXfYAG+UQxRG4gZO0bNrjKV0
 y7qWUldx8YQMoa0Fct6QA/zE8w==
X-Google-Smtp-Source: ABdhPJyUmGhCvsHJXEKWcC2Vuazq6hO14uD48f0UMlRGP/9YIJ6Z/R9iMmD6GaELqpsxN6mUNvl+6g==
X-Received: by 2002:a1c:bc8b:: with SMTP id m133mr1592215wmf.58.1611569532901; 
 Mon, 25 Jan 2021 02:12:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm19593254wml.19.2021.01.25.02.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 02:12:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEDFA1FF7E;
 Mon, 25 Jan 2021 10:12:10 +0000 (GMT)
References: <20210124032422.2113565-1-richard.henderson@linaro.org>
 <20210124044634.GA8202@yekko.fritz.box>
 <fed7279c-528c-c4d3-f305-c88ffcdf7bff@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/ppc: Fix truncation of env->hflags
Date: Mon, 25 Jan 2021 10:03:19 +0000
In-reply-to: <fed7279c-528c-c4d3-f305-c88ffcdf7bff@linaro.org>
Message-ID: <871re9nx51.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/23/21 6:46 PM, David Gibson wrote:
>> On Sat, Jan 23, 2021 at 05:24:22PM -1000, Richard Henderson wrote:
>>> Use the cs_base field, because it happens to be the same
>>> size as hflags (and MSR, from which hflags is derived).
>>>
>>> In translate, extract most bits from a local hflags variable.
>>> Mark several cases where code generation is *not* derived from
>>> data stored within the hashed elements of the TranslationBlock.
>>=20
>> My knowledge of TCG isn't great, so I'm pretty much prepared to accept
>> this is correct on your say so.
>>=20
>> But that commit message feels like it's following on from a
>> conversation that's not here, nor linked.  It'd be great if it
>> explained how said hflags truncation is happening, because it's
>> certainly not obvious to someone with only a fair to middling
>> understanding of TCG.
>
> Mm, fair.
>
> How about:
>
> The assignment from env->hflags to tb->flags truncates
> target_ulong to uint32_t.  This loses important bits from
> the top of hflags, which results in incorrect tb selection.

We are just putting off the day we declare tb->flags to be 64 bit or end
up renaming cs_base to
tb->cs_base_or_extra_flag_bits_we_could_not_fit_in_flags. The fact that
cs_base is expressed in terms of target_ulong worries me if there is
ever any hflag state above bit 32 for the ppc32 targets.

>
> Use the cs_base field instead, because it happens to be the
> same size as hflags (and MSR fom which hflags is derived).
>
> In translate, extract most bits from a local hflags variable.
> All of the checks vs env->flags are redundant with env->msr_mask
> in that msr bits cannot be set when the feature is not available.
> Mark several cases where code generation is *not* derived from
> data stored within hashed elements of the tb.
>
>
> r~


--=20
Alex Benn=C3=A9e

