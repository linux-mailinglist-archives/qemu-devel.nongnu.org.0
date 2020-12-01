Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA42CAD3B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:24:47 +0100 (CET)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCCc-0006TD-84
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkCAx-0005BX-Je
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:03 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkCAs-0000NY-Sv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:03 -0500
Received: by mail-oi1-x244.google.com with SMTP id t143so3174856oif.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 12:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZnOR1qpIQFJ8LMTqPc892N5j/RToq6UueO7kaxqvTo=;
 b=ZK0PUUSgQW0AW2X+OF9MEVUN80UBbH6ycQoma5gUj+QHTEfOpPj9BgIXCROQGP6Xu3
 yJmtEqXvJQ7yySJxfM6vE5NvmoWg9mCSZ9N/R/Bgnif/6ZPObAyfoqM/jEgudsrW4uIE
 uzjDc9K8eVcGegV8aLTDAK2+2VnXRVdBCt7+2PJOafntcL6tw7yjDlXLOG686vKWqFOC
 qEc3bUpFyJ4qDpRLwJjF07xbHSQt7Q73VOvtTdyeEXY9E2wS/d0eWlTj4N9PIOUxp/cg
 9nFQvkanYR5sdzkuM44YNDVqAua49R367DhubWz1tLPtcPkaxnjlRC0EkwKtazopVR90
 rj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZnOR1qpIQFJ8LMTqPc892N5j/RToq6UueO7kaxqvTo=;
 b=jm7oWNswcRDYB+80SLccpZqWs8dT7UcUrggwmdP7NsBeXq6T8XNRaS4aJK3Hg+4lte
 pEltiRLwjB3g+NtSItE1Grhg8RKr+iiDmxMTT0ZN8omAZAMYwthe8htyLznKHsotvXCv
 1pW0/WKzJjcKIoYKL/x9N6TkqOmX7/YWiPERMJ1AlGYgDgNen+RmKHRYgQ3LeSBaPiv0
 AuPrhpz9VkkCxruIixLlnG/VjgZS+31bqBx/onAdSfUwPdkR25PGTbuG0hma05/le40Z
 PTjSDd9o/eR/2I6UTEkX+phTpzzIkH2wO5GwzYKI+tIYrMAdsHGtBfqdYW4D/CKBt++g
 SOgA==
X-Gm-Message-State: AOAM533Ne0syqZkXHS4z2K2hNuvZ+GkfWKGxiO2cXuutiehbrmiwqcMa
 Yph7htzPEoqSAbFbNAqOjjeGMg==
X-Google-Smtp-Source: ABdhPJwUMmIkc0WB+LVWi8BVHyQc6PiHX6SV96UFHNoEEQINhrpKT8mqz3ljnXnWxevNgoh+kxgQNA==
X-Received: by 2002:aca:f1c3:: with SMTP id p186mr3026445oih.154.1606854177499; 
 Tue, 01 Dec 2020 12:22:57 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j46sm194173oof.36.2020.12.01.12.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 12:22:56 -0800 (PST)
Subject: Re: [PATCH 03/15] arc: Opcode definitions table
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-4-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7336e0b3-13e8-a3d7-46fb-a4ea942c5c16@linaro.org>
Date: Tue, 1 Dec 2020 14:22:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111161758.9636-4-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
> From: Claudiu Zissulescu <claziss@synopsys.com>
> 
> Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> ---
>  target/arc/opcodes.def | 19976 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 19976 insertions(+)
>  create mode 100644 target/arc/opcodes.def

OMG.  20k lines.

I assume this is gnu binutils opcodes/arc-tbl.h?

You are the contributor there, so a re-license is fine.  It would be good to
document the upstream location and revision, against some future re-sync.

That said, this format is less than ideal:

> +/* abs<.f> b,c 00100bbb00101111FBBBCCCCCC001001.  */
> +{ "abs", 0x202F0009, 0xF8FF003F, ARC_OPCODE_ARC600 | ARC_OPCODE_ARC700 | ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS, ARITH, NONE, { OPERAND_RB, OPERAND_RC }, { C_F }},

You've got the same information in two places
(00100bbb00101111FBBBCCCCCC001001) vs (0x202F0009, 0xF8FF003F, OPERAND_*).
Moreover, "abs" as a string is not especially useful, and means that you have
to deal with strings in the translator instead of C symbols or enumerators.

It would be relatively easy to generate a decodetree file from this input,
which would simplify the translator.

At a bare minimum strip the quotes and wrap in a macro so that you can (1)
define an enumerator and (2) put the entries into an array indexed by the
enumerator.


r~

