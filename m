Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F0253128
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 16:22:54 +0200 (CEST)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAwKD-0006gz-S7
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAwJS-0006BD-GL
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:22:06 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAwJQ-0004EM-9i
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:22:05 -0400
Received: by mail-pg1-x541.google.com with SMTP id o13so1115315pgf.0
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RLAqJRnY5i7j/F/xs3iBksPzOSFcsXzPDlzZZ0zuwmY=;
 b=vQqoTB2eO81Dy1LEmyuhKwb5hHe23yDw/JjanVpsGXGwDPUE+OiJmPt1idXgg7sx2f
 3vT+mjp+gdOiyF6Zf6JvJemRk0TQUq79NyLo6YaTXNfSFqJCvYxee4KnAoIpwz51MBC7
 UObrlRCMIYAHulhOYoI4fF4ceINpKMNKKY1a/Npm4ia9JBgTwBmvCdRe9iHwEMR0IGbB
 k9wKxAy2oskljIF+xaYjMn1Y0NqpV2v01aJXuhti7zCRmdapCmdbYEQWaShHpkN3psDO
 242kbz4D+EFSGy6QcyqweyVGZW6v34g1OZB4cTgVCqe5Z4hf8O7n2hVbXpLIpZl9DTMK
 HmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RLAqJRnY5i7j/F/xs3iBksPzOSFcsXzPDlzZZ0zuwmY=;
 b=oHs9Qrlgac+lR0v49hmaXqdsyyxnj7JXid/SVd0tzjWEyCjFrMV6g2qHUffBpFYZKO
 gVwcTVJePkaW6HHItLFSUMwUXwg5KxWbTchi2ZN2iB228qcbKalWT2a8HB3RJWyVKvOx
 lvEqNFVg2TRWxCMjeqznZ8rBaUlK45a/rT6M3nj+ICO+3yHpUwaM2mRzrc2E1TxnlEBz
 lMn9u7KxBeO2cfaa4axZfYDcXLku54/krtghU4OhHz2RakedJ8RX7i9IiaKgwtYPSsDd
 6dpQsgQQtJAqaC+oc8mewSZJXckh3vPkqlqrfXRtI0rJmxWo9FWmS7XaXu8yUJw5WthA
 mbUg==
X-Gm-Message-State: AOAM5336QEKOn1Sl1C0H4vq8D+/oqGYEJAIEjMZzzPTfataIhjsNwWu3
 Vu+uDs3NmxgGnP8orNzZx9b9GA==
X-Google-Smtp-Source: ABdhPJwxqJnyOIcHvE4jau5v/BG3mVzLdJRes/u5ZEsukc+2pWp5ccJa7YpenkAJlULUsXYkR61jzQ==
X-Received: by 2002:aa7:9427:: with SMTP id y7mr12533977pfo.12.1598451722629; 
 Wed, 26 Aug 2020 07:22:02 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id mp1sm2594454pjb.27.2020.08.26.07.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 07:22:02 -0700 (PDT)
Subject: Re: [RFC PATCH v3 10/34] Hexagon (target/hexagon) instruction and
 packet types
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-11-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <182cb39f-7a49-22e4-141c-a3df790b56ab@linaro.org>
Date: Wed, 26 Aug 2020 07:22:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597765847-16637-11-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.239,
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
Cc: ale@rev.ng, riku.voipio@iki.fi, philmd@redhat.com, laurent@vivier.eu,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:50 AM, Taylor Simpson wrote:
> +struct Instruction {
> +    semantic_insn_t generate;            /* pointer to genptr routine */
> +    size1u_t regno[REG_OPERANDS_MAX];    /* reg operands including predicates */
> +    size2u_t opcode;
> +
> +    size4u_t iclass:6;
> +    size4u_t slot:3;
> +    size4u_t part1:1;        /*
> +                              * cmp-jumps are split into two insns.
> +                              * set for the compare and clear for the jump
> +                              */
> +    size4u_t extension_valid:1;   /* Has a constant extender attached */
> +    size4u_t which_extended:1;    /* If has an extender, which immediate */
> +    size4u_t is_endloop:1;   /* This is an end of loop */
> +    size4u_t new_value_producer_slot:4;
> +    size4s_t immed[IMMEDS_MAX];    /* immediate field */
> +};

Is this an imported file or not?

If it is not imported, I'd very much prefer that we stick to the stdint.h type
names.


r~

