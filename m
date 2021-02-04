Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C830FEAA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:43:16 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lT8-0008WM-QI
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7lSL-0007yN-NM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:42:25 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7lSJ-0008LK-Br
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:42:25 -0500
Received: by mail-pg1-x534.google.com with SMTP id b21so2949025pgk.7
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 12:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9fOtF1R+WgqH2F5Q6oV1ryx9z3mlIkkqIPktKkJ7PlU=;
 b=FZaYhm1UDpvJZ0Bu6JVbvXJmQQmU5iVS1XL6eTh32hhb9Td2fzHx3Upuwe8J77x+6f
 QD+Pv4sKkU+QVi0FbafdwbZKuhnIXwVJmEBNoyE1qG8P4Zw0SRtZjm/kCOGDRVRK1Eef
 74fXk9oGP0zvc16W20XlQQaAQv6q2QAcaW6WSPARxUA+Oc6r9nE4Ci6ONVZNDZWhxrWd
 K2D89X/XZIRBRojjcOXKgW3n0epB/T+L8awkcn3VWc3/0jkEtwBmxPchGEpuhAd3oVhy
 XodtNUJ7FwqqIEScvx3ojC2UAG8TSI0Oy14k6lKZODYMAQVH5S7y7lk6ie0ocvQybzAc
 Ltuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9fOtF1R+WgqH2F5Q6oV1ryx9z3mlIkkqIPktKkJ7PlU=;
 b=K/HWXI/o55MLjl0hjEuvT3GdluckafIo98DWUmTcHN/p3mStOlEY3jVfAvvRQnTqKj
 Tkq0atxL4vyrZVyxvDueNUTF8EzZRNfPrq6CT7vac4r/V2n4+Oq3uR/yaxvmmQhd1Pws
 TcxxGPIlZ/i67U221MPFpzB1LBToA1RboNx+vKysnbzfUUooXhNQRbh+TR3twFN1K1x/
 lsVXuXfHIFQ/m80pR7OIAD9Vkwc+c1q62xITtTa4nM5R+3eTbPpnh0bCncJkMLIKRa5O
 LpjoXXveVDzoUntAk4psFtuZioslpjp6Hbx+5XCNr9YJ3rvFGHfm3K/KQWbU2j9Kdfp0
 6//g==
X-Gm-Message-State: AOAM532qgksbfm4e6e6s675PYZrceLysFcwL9p/2Qq1LcZtR9Itff9eg
 ag2+vxNqNxi33kjjFkiCivATuRxg9UaIATP/
X-Google-Smtp-Source: ABdhPJywvfmVR+MFyVoTVH9GbWOrk3w+ILKM20ktSMH0OBVT34eWgqgQU0H8xpl5+LGdcDM8l7ADmw==
X-Received: by 2002:a63:dd17:: with SMTP id t23mr807231pgg.320.1612471341581; 
 Thu, 04 Feb 2021 12:42:21 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l14sm6117069pjy.15.2021.02.04.12.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 12:42:20 -0800 (PST)
Subject: Re: [PATCH v2 00/93] TCI fixes and cleanups
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <CAFEAcA8yiVXSLwP4kzsE4MSfhVKTn9H3VtnXgXRmnHZmxUrfhw@mail.gmail.com>
 <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26a9b175-5b67-21d1-1007-1b1a2f801853@linaro.org>
Date: Thu, 4 Feb 2021 10:42:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:02 AM, Stefan Weil wrote:
> Is there a Git repository which makes pulling all changes easier?

https://gitlab.com/rth7680/qemu/-/tree/tci-next

> Regarding misaligned bytecode access, there exist two solutions. We could
> either use code which handles that correctly (I had sent a patch using memcpy
> two years ago and recently sent a V2 which uses the QEMU standard functions for
> that). Or we can align the data like it is done in Richard's patches. For me it
> is not obvious which one is better.

I think it is obvious.  If a host requires aligned access, a single aligned
load requires only one instruction, and an unaligned access requires lots.
E.g., for sparc,

int foo(void *p)
{
    int x;
    __builtin_memcpy(&x, p, 4);
    return x;
}

	ldub	[%i0], %g3
	ldub	[%i0+1], %g2
	stb	%g3, [%fp+2043]
	stb	%g2, [%fp+2044]
	ldub	[%i0+2], %g3
	ldub	[%i0+3], %g2
	stb	%g3, [%fp+2045]
	stb	%g2, [%fp+2046]
	ldsw	[%fp+2043], %i0

Such unaligned accesses are *really* slow.

> While a single access is faster for aligned
> data, this might be different for sequential access on misaligned data which
> might profit from better caching of smaller bytecode.

I believe you'll find that the rewrite encoding is smaller already.


r~

