Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC5E4C1C6F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 20:43:55 +0100 (CET)
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMxYH-0003Ud-Oq
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 14:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMxVY-0001Ip-Mx
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:41:04 -0500
Received: from [2607:f8b0:4864:20::534] (port=38431
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMxVV-0007uI-2k
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:41:04 -0500
Received: by mail-pg1-x534.google.com with SMTP id 132so21107779pga.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 11:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5/Vf75MRtqlHOjIapay+ut/y0587ribcS+2oIHMMnhE=;
 b=qcP1gXxfSEYx6Nr6zBqDUsf0v3VWypC6WA6tnJ9ntL+/8RT3oIrn0TSAXvIyQcNSAD
 945VWXD8K+jAw6NT8eULYyldO2nC5ta8H5dox35884oStX7phuE2chaggtuIxsQcj19r
 YVU8BJmbOadOWUXAEawYPugT2ZZH3a9Mg2v/7dpiOJekDpSqAn18YIYciNNj2msfyW7O
 nnUpmCyyppa22TyHIwkQoW3qK63QysKuoAuGYmshubKakfPqmHkdSdhenStuWsPFblva
 csBpoMpADnX6lE/Jdnx0rBQNXklOXHaLvN/L43UPSvvaI8LK9DSb7ixFqZrBBwpEy/Mb
 Mo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5/Vf75MRtqlHOjIapay+ut/y0587ribcS+2oIHMMnhE=;
 b=0FDR+I1XBMJBkJebZt96vl0++XJvU97KX/krxVABQAWA4126VPN8wlbdM+Af0CwrIv
 RKAQpvE5PhnQNg2sSQ9by8UU7m3I3M+qu4nEVWFoppN3NmVvxL8b5L0slR8tHI/MsaDb
 I/YmjYR8dU2XlgPCYA1g76Ed3Woy6hkB7c4hPufxvetRcKMKarSTarobfBk2sdQNHYY7
 MNoWQvVUwZtYsTI0isbGxErBWLBvNPMmf2SfoOa/Kszbmr189hiofkSlwRNCrLejl3qs
 XrX13Hy6/Sh8FfZ3QWMTm5J8XRp1b5w7wPdzn3N8rXDT+BOJ8L3WLDjdwmCoUknvurba
 h/xg==
X-Gm-Message-State: AOAM5302VH30id0jREj2XYAsWx8hFbUsfWzIAWijMtD/U56Q/epyx4Ez
 qDz/bPQZgqKi0A83CjrDuI3ohQ==
X-Google-Smtp-Source: ABdhPJxEbLD+VzflHdITh2Zqe85ZNpH0sjiJxlqjuGDSQwCgW6+rfgNVfLk5DYcIp2O/G7h5pOsghQ==
X-Received: by 2002:a63:f551:0:b0:36c:54bd:da32 with SMTP id
 e17-20020a63f551000000b0036c54bdda32mr869908pgk.285.1645645259721; 
 Wed, 23 Feb 2022 11:40:59 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm3746065pju.44.2022.02.23.11.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 11:40:59 -0800 (PST)
Message-ID: <66f97111-6ac5-2061-f72c-9bf6d3a2b723@linaro.org>
Date: Wed, 23 Feb 2022 09:40:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-2-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220217231728.13932-2-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 13:17, David Miller wrote:
> +/* SELECT HIGH */
> +    C(0xb9c0, SELFHR,  RRF_a, MIE3, r3, r2, new, r1_32h, loc, 0)

This stores the low part of r[23] in the high part of r1.
You need to select the high part of r[23].

>   static DisasJumpType op_popcnt(DisasContext *s, DisasOps *o)
>   {
> -    gen_helper_popcnt(o->out, o->in2);
> +    const uint8_t m3 = get_field(s, m3);
> +
> +    if ((m3 & 1) && s390_has_feat(S390_FEAT_MISC_INSTRUCTION_EXT3)) {

Bit 0 controls this, and recall that IBM uses big-bit numbering, so "8".


r~

