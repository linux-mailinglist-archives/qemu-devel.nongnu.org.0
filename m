Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD92532F0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 17:08:34 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAx2P-0003bI-EF
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 11:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAx0a-0001EO-O8
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:06:40 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAx0W-0002kR-Hg
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:06:40 -0400
Received: by mail-pl1-x642.google.com with SMTP id p15so1025034pli.6
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pa2SCXfEqCbe/dunPZYUvrb17DcNWYusX7386ccbO08=;
 b=pEzw+Gmf5tPuBFdtifntA+S9wf7cm1w5QLrq0HvK4ZY1O4e2wCoMRsbW3OdMNu1+tF
 uVqN+enC2HlgQuPL+e9rwpQIlu/jbdO5KTOZ565GV5pbS0d0mW+cdwjUmIOxhB42dVQA
 7bqnhaoSkZdu423UbHRe3DvG6FO3EbY8OaFQOF3nRpkWVK7H9/8YP+9XZxFC3CVPRHZt
 /EDW0Wj4+yQ+UbtMqI6Sjxm41zo2miUCVcP3uINSFhz8G78NBuYhmBBLbUJjF8ZjqU1w
 TTMe61c5MiapyTVw/F4N+BIFZxvK0yUXQRK/cjUspnVe8UtLCUa7bTAab7W2pc9HmNuI
 L6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pa2SCXfEqCbe/dunPZYUvrb17DcNWYusX7386ccbO08=;
 b=aLrJjby3PLKq7eWDQ9HJr+cN8VAoNvtz6DGYEPEZc4eYD95Wx1Wf/PqAWYKcGFiuip
 H9IVnGoz7qmjPU0QqPzmbeybigi4WRLUSUoHmaLdBeGQiDyiz9CMZUnaQpmIY6BryY60
 FDkLdvt5wn422AtBiBH9gqzQpU9E8fHdWMqYvveegKu2y7rg2duqXw8CCZa5YL0KriL3
 JVqvxk3XATQRRUQ+1wmotUraFNa5S49IbBy1BFPO7XN7uz2pcBagyT5zwYsH66cOLwa7
 sVxLvyhbJ/C7kJWvJzjJL8cW6q+c2rP3J1LIyAxuqQtXPrLx/71qrFSgaFocXbhkZ+RE
 +j+g==
X-Gm-Message-State: AOAM533Gjc2NvBWEx5qCrlGjoG5us3NVR06y+QHyJGZZhG09FHXIG73P
 Thxkj19T5RCnT3F8gwxTKXAvPw==
X-Google-Smtp-Source: ABdhPJyqsp80k10gwJ8GAxTLSTwdqrp3WQEZ9AyuY2VmSR8plx5XQX0x/a//5UiS8XinsNI6h2uolg==
X-Received: by 2002:a17:90b:1984:: with SMTP id
 mv4mr6512907pjb.32.1598454394599; 
 Wed, 26 Aug 2020 08:06:34 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id e12sm2518333pjl.9.2020.08.26.08.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 08:06:33 -0700 (PDT)
Subject: Re: [RFC PATCH v3 14/34] Hexagon (target/hexagon) instruction/packet
 decode
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-15-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1334480-b2cd-0c85-e55c-a76244b295ed@linaro.org>
Date: Wed, 26 Aug 2020 08:06:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597765847-16637-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
> +#define DECODE_NEW_TABLE(TAG, SIZE, WHATNOT) \
> +    static struct _dectree_table_struct dectree_table_##TAG;

All of these little structures should be const.


> +typedef struct {
> +    struct _dectree_table_struct *table_link;
> +    struct _dectree_table_struct *table_link_b;
> +    opcode_t opcode;
> +    enum {
> +        DECTREE_ENTRY_INVALID,
> +        DECTREE_TABLE_LINK,
> +        DECTREE_SUBINSNS,
> +        DECTREE_EXTSPACE,
> +        DECTREE_TERMINAL
> +    } type;
> +} dectree_entry_t;

Which probably requires these links to be const, and a few uses within the
functions that use them.

That should move 78K worth of tables into .data.rel.ro, where they can't be
modified after relocation.

> +            /* previous insn is the producer */
> +            def_opcode = packet->insn[def_idx].opcode;
> +            dststr = strstr(opcode_wregs[def_opcode], "Rd");
> +            if (dststr) {
> +                dststr = strchr(opcode_reginfo[def_opcode], 'd');
> +            } else {
> +                dststr = strstr(opcode_wregs[def_opcode], "Rx");
> +                if (dststr) {
> +                    dststr = strchr(opcode_reginfo[def_opcode], 'x');
> +                } else {
> +                    dststr = strstr(opcode_wregs[def_opcode], "Re");
> +                    if (dststr) {
> +                        dststr = strchr(opcode_reginfo[def_opcode], 'e');
> +                    } else {
> +                        dststr = strstr(opcode_wregs[def_opcode], "Ry");
> +                        if (dststr) {
> +                            dststr = strchr(opcode_reginfo[def_opcode], 'y');
> +                        } else {
> +                            g_assert_not_reached();
> +                            return 1;
> +                        }
> +                    }
> +                }
> +            }

I can't help but thinking that all of this string manipulation is not the most
ideal way to implement a decoder.  Surely all this can be pre-processed into
code, or flags, or an enumeration or something.

Oh, and g_assert_not_reached() will never return.  You don't have to keep
putting return statements after it.  Please remove all of those, everywhere.

I'm going to ignore the rest of the decoder, as it's somewhat bewildering.
Even in the final patches-applied form.  It could really use some more commentary.


r~

