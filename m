Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F539340
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 19:31:43 +0200 (CEST)
Received: from localhost ([::1]:49804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZIiM-0005Bv-Sg
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 13:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGzy-0003Tv-EF
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGwr-0001bb-65
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:38:35 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33567)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGwq-0001GE-NK
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:38:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id p4so2271715oti.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PLB/dPHN5zz40CHabrTCGE0l+3lkDgIK5X+oQGMfMNo=;
 b=ylUNuBCpR32XnuknDHtqHse1lu84dwzHBi3B0njY2QLFulXcox9GoLX/+T19RGG58X
 5MTp1Zq97cK204Wj3qmAlEzZouHYBcuXdH8fPMvNkLHDoNG111L3u9DYlvTeCxksa/8P
 wCa66uAa4yV8QNOrzU6BCnx3SwSURC2kQ4adm6iowpLZltJPPr6p54Y6ooqFMd8RVzQX
 DU1L6M6E61rPF2gYaX88P/SqIzlhOQ4u+aRnKmQwEW8Nyl9nTHp1VYkzpyqG+0a4aiBR
 f4Qn1gTeYEfmsJXtYfNVGwLLaJRQouCgcXEsKhBInlYWCms7XaXxYjM/OXTyAYEVpWYv
 Ib6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLB/dPHN5zz40CHabrTCGE0l+3lkDgIK5X+oQGMfMNo=;
 b=oCVnXm971qDSGycx+vwImPVNjWWK9KTwsp7jcyeCvSbhZucEzOfJp8YnsiBKk7oEiJ
 47hEHxKfkA9jAZ9QdmNwz9lnHx4KPlD4a9OyoC3Tp+RBoYhqnP9SVrv61rGY46rkG7vx
 6yZBwWHS9xJjZTn1PIUTR0e5EBhvCPpHDn+SxiYrvLNmuejRnTXB3Ba4RDM7nKXC+e65
 awzkg/yHugqK6TWl4WgubKDqAXlU/n1zxjNbHEhvx6o8CueFl23pURjn+m/wlLRdALFq
 VtqDhTntXkuzZAS5/mJD5fJz5dVmA5NkfXAaRI61G3iSEejeJ5TUzpyAyXq9CUMwHYrN
 rCeg==
X-Gm-Message-State: APjAAAVqBgBTh2KZq+qudxgRoJWVTafEuPy7wR44zBLoXFq5J6itcJWw
 10pzJHku2/q/hWtomggY8aLDMTK5rUQhyg==
X-Google-Smtp-Source: APXvYqzpg246KtFzeJ8T40sMwXtqzxdJ6nX01n9Q1Hfb4/1pi0PAqM8WHaSmmsUADQbJkQtqr0GsoQ==
X-Received: by 2002:a9d:151:: with SMTP id 75mr12836192otu.202.1559921898446; 
 Fri, 07 Jun 2019 08:38:18 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id 93sm853709ota.77.2019.06.07.08.38.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 08:38:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9cf15c60-3cdc-7cac-f9d5-a3fe49b415b6@linaro.org>
Date: Fri, 7 Jun 2019 10:38:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 09/42] target/arm: Convert
 VCVTA/VCVTN/VCVTP/VCVTM to decodetree
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:45 PM, Peter Maydell wrote:
> @@ -3452,6 +3446,15 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
>          }
>      }
>  
> +    if (extract32(insn, 28, 4) == 0xf) {
> +        /*
> +         * Encodings with T=1 (Thumb) or unconditional (ARM): these
> +         * were all handled by the decodetree decoder, so any insn
> +         * patterns which get here must be UNDEF.
> +         */
> +        return 1;
> +    }

This could be merged into the previous IF.  Unless I'm jumping the gun and this
too goes away at the end after everything is converted?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

