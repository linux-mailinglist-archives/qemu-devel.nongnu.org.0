Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691012CDADA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:09:48 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrAw-0006Ls-WE
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkr9N-0005mQ-97
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:08:09 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkr9L-0000Q5-98
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:08:08 -0500
Received: by mail-oi1-x241.google.com with SMTP id l200so2670512oig.9
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ST3vVZbTZBZTabxx9VqYJCrpfIwlt1a4iVUUdQqEy1U=;
 b=pLREjRpZ++zlPM/OjFFHnMidjrTU8bpHZvNf+QqvRcPyGCJReJ03XbJImrGF45GTNF
 D7c7ZWlRds1LJUpxS9Gj80eJvqeY6Zu9qfPZylPKLZLD3KIAvOdZpV/wRn4rd2tP9mcF
 oSQfH+ST2S2YMLHPfWVwkKNQ0U6GNKwh4xxBjP0frKZ5NdBa+hMde5CtU058VmB2w+Qq
 25vbpgQUx+lfPPTmyjc2Vi37iXDuWrVd8OdEAE3a/GaRmsfI+tuO+6dCnszBLClFrHoj
 BPSjqu0W7y9yWDUcUo4RQ1vOXdO2k7PFKf7+HnLMKVVEb+QbrmerQ185n/4lZQXTsPoM
 +dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ST3vVZbTZBZTabxx9VqYJCrpfIwlt1a4iVUUdQqEy1U=;
 b=HjEUe5snxlYb6v69FbBCK41wGmjbdJq4I6abudN2EkWF+fBbHrhkvFoD4/xRDKXQO1
 MHdfa52IMQ1Auo36xvx/8m8fdAFb5YdUMlROSeQ7e1DeMP9YYm0v9suWflXxWKvIh6gI
 AvunICITxcwVGWHhoPy07FahDkZ4fg64E3VHokUn0v+OlBeJZKu3Ry+zxzM6k585wg3o
 OVr364Hf0exgHMO0A22fvZ7hVPDQRtAz6fDpaFqupkTQPenZ1uKIhxPT3n5NPOByR2BX
 HAc3s54WzAzTXc+24U81EGi4ysa5crObhhKseFkh5H9PiEeDTGkc74Za7go1eKsMODpr
 T2Sg==
X-Gm-Message-State: AOAM531lKYH/KqxUUp2ixBO2hSu4pfQWsoFTmSLrZn/ucE1KuXEvNp68
 zUyOBR/cU6PSi2pzrCZi4tuOxg==
X-Google-Smtp-Source: ABdhPJwCWUUcMm3kUGi8IpedtsHQSSxeiKcmQARsv7SaGWkvFiIvJ0JvGmsvBUQOo+/DuhiN4Un/lw==
X-Received: by 2002:aca:3145:: with SMTP id x66mr2289207oix.29.1607011685574; 
 Thu, 03 Dec 2020 08:08:05 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r19sm317165ota.14.2020.12.03.08.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 08:08:04 -0800 (PST)
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Cupertino Miranda <cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
Date: Thu, 3 Dec 2020 10:07:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 6:55 AM, Cupertino Miranda wrote:
> I totally understand your concerns with generated code.
> 
> To explain our decision, we have an internal database that we are able
> to describe the architecture and map encoding with hw semantics, and
> for the sake of saving us debug time generating each and every
> instruction, we use it to generate both the TCG and instruction
> decoding tables that you have already reviewed.
> This tool is not only used in QEmu but through all our tools code,
> allowing us to cross validate the content of the database.
> 
> Considering our situation and current state of the port, what would
> you think is a reasonable compromise?

In some respects you're in the same situation as the hexagon target that's
currently in flight on the list -- both of you are wanting to generate tcg from
a company-specific canonical source.

In the case of hexagon, the target/hexagon/imported/ subdirectory contains a
bunch of stuff exported from Qualcomm's specification.  It's not fantastically
readable, but it's not bad.  These files are then massaged in various ways to
produce either (1) out-of-line helpers or (2) inline tcg stuff.

Without knowing what form the Synopsys database takes, how easy would it be to
export something mostly human-readable, which could then be processed by a tool
that is included in the qemu source?

Future qemu maintainence is thus on the tool, and not on the auto-generated
code.  There's also clear separation on what needs tcg review and what's simply
a spec update.


r~

