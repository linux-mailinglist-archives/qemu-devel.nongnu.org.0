Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BE1308261
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:32:29 +0100 (CET)
Received: from localhost ([::1]:53994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hi8-0000gv-FR
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Hh5-0000DE-Hs
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 19:31:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Hh3-0002Oz-PU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 19:31:23 -0500
Received: by mail-pj1-x102e.google.com with SMTP id lw17so5581708pjb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 16:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M6yffU7b5KrhO0yZ4T4VZaIBBx88M8ubpPUf+JOpSYY=;
 b=ljvKWrDIW5EuMAdFDW/jH0trBUvtC9hb50Umtmgt5hNEKqCihBJ8zEnXPTIygP/5O2
 4K1OrKmojMVcqR7uD1HBvK/PqS3G5LY9BHXcJ56Md12qNpvDnW/RRWAMOCsRfpGrLfXj
 N0wk4D0i6MXgPP3KsX/zgd+fj78pp8LwklCb08ZGq8OqPU15tnzRaj1b8gTWtZHnw8QY
 b/ww+dCOyQsmMM55unm84T45uDHi6e8wpQ64BTqNPD0lxNQKYt3zYExeA/7Eb2n9+6B/
 YXU4TcGqN5huQmU5+LDL26b9bpTg4UvIechlVcmoW7P1DPS0c5wusWuY3LlxSakwqOR8
 1gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M6yffU7b5KrhO0yZ4T4VZaIBBx88M8ubpPUf+JOpSYY=;
 b=mxbcZw+Cb/pXYubea1sgAqqPitScov8EDN9LeBwgLnbryQW5v3sKpUyNKuP1yzyqGF
 vZq8a6GJjn3JPDfEIUuX1qYnXujDphmuITeOAcVkyaLkdOn/7lQDZiLka/ApHXqdY8vm
 jZapzXEPDXrE8si9ObfGDIAaj/AR3UFbBNE4QJ0o54c/2N0v8VXqn3Kep2I2aI03Z+4d
 rn7H3Fk++W+nxUfcBtCBtS78rY8p2zE7jgvkCT0VNpSDNejBPkpbcRohXxCxWd0QerIL
 v4CQCfzuwwR2QRRWlMjh9Xk0CLiSKAljvfTBYKI/7SLG1m8JjsnXHhTpWfi5YcGNtVdP
 bNjw==
X-Gm-Message-State: AOAM531V/uf8fyQiArsZqyI6FkCW3eETkEKHyL5df910Ua+QDEwuXfYe
 4UaFIV6YaypgmAhxyWyCLJ6u6Jwo3+xLOe0C
X-Google-Smtp-Source: ABdhPJyw3hzFWSYa7QMPB4d+nB9hafRJIAZv26yl+bg5xL+WuuYgvGE9qsD8gMLEYoFF/5TaBzN5Cg==
X-Received: by 2002:a17:902:edcd:b029:df:d2b1:ecf0 with SMTP id
 q13-20020a170902edcdb02900dfd2b1ecf0mr1736946plk.15.1611880279914; 
 Thu, 28 Jan 2021 16:31:19 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c5sm6676277pfi.5.2021.01.28.16.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 16:31:19 -0800 (PST)
Subject: Re: [PATCH v14 15/22] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-16-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
Date: Thu, 28 Jan 2021 14:31:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128092814.8676-16-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 11:28 PM, Claudio Fontana wrote:
> +    /*
> +     * NB: this should be covered by CONFIG_TCG, but it is unsafe to do it here,
> +     * as this header is included by both ss_specific and ss_common code,
> +     * leading to potential differences in the data structure between modules.
> +     * We could always keep it last, but it seems safer to just leave this
> +     * pointer NULL for non-TCG.
> +     */
> +    struct TCGCPUOps *tcg_ops;

Sorry, I'm going to unqueue the patch set.

I first thought this was fixing up something done already, fixing an existing bug.

But it's something done in patch 1, and therefore the patch set needs to be
re-worked to use this pointer to begin, for the exact reasons detailed above.
Otherwise it would appear this breaks bisection.


r~

