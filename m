Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A7F8AFF1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 08:30:57 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxQKe-0005n0-DS
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 02:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hxQJx-00059W-D6
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 02:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hxQJw-0007JK-Fa
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 02:30:13 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hxQJv-0007IV-EC
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 02:30:11 -0400
Received: by mail-wm1-x342.google.com with SMTP id i63so394221wmg.4
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ur7nk9rA4m/5Ft7HuFSK0taFXGeexv2FYCfZkOI3uV8=;
 b=nZOLbu5fqorV+HW4tPQP2Unm+9nDao6OawcGRCXt4KMSc588PY3se0O8IiQQ4sE4+l
 9pELB3ioZQifR6hBLnzXuXP69NZMFJuSvvWqc45vo7DgeClGvm7IBzq5Yu+0Q8WZp1rD
 HFZh68LD1Wr7nkfJnViiQGOOO7y+KeUDugDoQVrMrD311rKdxx8NI+WPiLt8mvXYOsq4
 RwgKTHMm6OCV4mgG1xQqKJALr0CH//CgHKwhWNPn3fzC/HSEHcnhToru76RFDUwYpEzD
 jQlIun7ZLcXbGFEenJc1KL87rpzTWdh1/EqrlhXfJfuT/cUFGk8BtdtoQGCXjKPNv9J1
 RSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ur7nk9rA4m/5Ft7HuFSK0taFXGeexv2FYCfZkOI3uV8=;
 b=CZkxorulS1aqVmzHuUWjQ4U/37aLEirQ7Zp82UFcQKZ023DNbdttmxI702wOJA7WmQ
 pQRMkMSx0ZLqoe+Y/8OQOLQXjQ/ijayljAM+uYi/hdDAyB0gR3Du8fJnARC00NA7mXSl
 3hJ5RKrsBc6ukQ4luqXboVQLvMuS3C1oF/4ZtqHWYroYP906nsVoiAm4lQen5uhPMXH4
 NRk/uki7tieRuZ1hZEI65pFuJNcwIMTuaVoq8ZSvGgK9QeJL0Zvi9Zd5gocZ43cPN/IF
 G2TRf6Jr83CEpvsvEC2stpAplnpACRAp9d70nvu9s8pffE9vh/JnFrSYXmZXvjAC8Jwf
 Xz5A==
X-Gm-Message-State: APjAAAUorjiCSkyDeWG5C0eqzu/WQ8M+9dFTo35UmejSXGnr960yoUT8
 y7iEHgOUuID1bYS2MZrb/tz6YA==
X-Google-Smtp-Source: APXvYqyIz66SK0EiXKPEISnQKIpN3FoGPM/mrUAha28gZlFVR+HVq51ydXxcec10mPSipBspI8FD/g==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr1212120wma.34.1565677809874; 
 Mon, 12 Aug 2019 23:30:09 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id m6sm16580245wrq.95.2019.08.12.23.30.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 23:30:09 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190810041255.6820-1-jan.bobek@gmail.com>
 <20190810041255.6820-24-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3b2287fd-df92-ecc2-4eaf-e4f01be57be0@linaro.org>
Date: Tue, 13 Aug 2019 07:30:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810041255.6820-24-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [RFC PATCH v2 23/39] target/i386: introduce
 instruction translator macros
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/19 5:12 AM, Jan Bobek wrote:
> +#define CASES_LEG_NP_0F_W0(opcode)              \
> +    case opcode | M_0F | W_0:
> +#define CASES_LEG_NP_0F_W1(opcode)              \
> +    case opcode | M_0F | W_1:
> +#define CASES_LEG_F3_0F_W0(opcode)              \
> +    case opcode | M_0F | P_F3 | W_0:
> +#define CASES_LEG_F3_0F_W1(opcode)              \
> +    case opcode | M_0F | P_F3 | W_1:
> +
> +#define LEG(p, m, w)                            \
> +    CASES_LEG_ ## p ## _ ## m ## _W ## w
> +#define INSN(mnem, cases, opcode, feat)         \
> +    cases(opcode)                               \

It appears as if you don't need the CASES_* macros here.

#define LEG(p, m, w, op) \
   case P_##p | M_##m | W_##2 | op

#define INSN(mnem, leg, feat) \
   leg: translate_insn(env, s, CK_CPUID_##feat, gen_insn(mnem));

so long as P_NP is in the enumeration above with value 0.

Unless there's some other reason that opcode needs to stay separate?


r~

