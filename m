Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0648572848
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:13:13 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNBx-0004hm-1J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNA1-0000hw-Eq
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:11:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNA0-00018C-0J
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:11:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id h17so12927744wrx.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FVgS+gR45bQkQq99hKLpumXOE+Q3DKUdV+SmWdpsYJo=;
 b=fhyCBV738gt9aljpkfNQqEG6y7VmW04ITRbhnNX0qKnDiyCZHEtOCY3z5BXfBcW6Jq
 bayYtSKS7xQQmILFWsRpEYvD4AXP6MgeyMjdRDCcdIBmNx4gITl55joLJJmmUUhEoPTQ
 S6ZnKoxsPqlXhAmrTp7Eq4LnMltNQ/FpuCC2G2CaTeB5WqbGO3vtO4hj6CkDpsLPkOyn
 slcvCf4l1BCscif1D2fevdRiTkqyr0dtbSxn7OFz0DGKbD+DCed5wmng0m80PGIEOLkV
 l+32SyOv+SIr6ux/dasgMa0T8tPS/vCAcQNnTFiINf2LI5gVdst+JzyOXnlpQ1SI64SG
 HEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FVgS+gR45bQkQq99hKLpumXOE+Q3DKUdV+SmWdpsYJo=;
 b=rhjzpIRIosqA623ks9L+zIQkPjGsl/ZPlMKmPvWGmXL7RgoiQJLpncDA1IGccJYGST
 oz0lrgCXc3jLhX/SYrsTGd6UXTkBGlcpKTvHZ9IdZZUXt7DSxwXJ0hDoMZep0/mBeUtg
 T2BcUQhC9JzUQBuyA62GcQyU4sVH10YtsBEtqQq/21LN4+XcrxMmWMfgW05zDEgv4HkE
 K15IVKBJw/yfeMArt5Uo0rbDXGrvmchum5zTGMPO34izeNxUhiB91TuiHLEuZ5qoi2OR
 7ScaCeYTvaC6v3JTFwL1TUWi3lF+OTm/SZ5XoHtAtlF4Dv1IUnK3/rfFE28KJ+fflew/
 MPfg==
X-Gm-Message-State: AJIora8UURFLThA165WzjzbvzRlmZzA1b5DN7wsjlIYS6O04sX5DYROV
 4bJ/odI4xTYoVfqFJA+ocKE=
X-Google-Smtp-Source: AGRyM1tPaujLEtYJMFMW7xG2JUjxVg3w87MbsmRO6xVxjgKK+gK9RYs/wvRzn9WrkTirPb5d3FvXXw==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr24488695wrb.116.1657660269569; 
 Tue, 12 Jul 2022 14:11:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bd20-20020a05600c1f1400b0039747cf8354sm43310wmb.39.2022.07.12.14.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:11:09 -0700 (PDT)
Message-ID: <683bd67f-9566-def4-dfdf-45d31f131a2b@amsat.org>
Date: Tue, 12 Jul 2022 22:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PULL 09/18] tests/tcg: compile system emulation tests as
 freestanding
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220712124956.150451-1-pbonzini@redhat.com>
 <20220712124956.150451-10-pbonzini@redhat.com>
In-Reply-To: <20220712124956.150451-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/7/22 14:49, Paolo Bonzini wrote:
> System emulation tests do not run in a hosted environment, since they
> do not link with libc.  They should only use freestanding headers
> (float.h, limits.h, stdarg.h, stddef.h, stdbool.h, stdint.h,
> stdalign.h, stdnoreturn.h) and should be compiled with -ffreestanding
> in order to use the compiler implementation of those headers
> rather than the one in libc.
> 
> Some tests are using inttypes.h instead of stdint.h, so fix that.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/tcg/Makefile.target              | 1 +
>   tests/tcg/aarch64/system/pauth-3.c     | 2 +-
>   tests/tcg/aarch64/system/semiconsole.c | 2 +-
>   tests/tcg/aarch64/system/semiheap.c    | 2 +-
>   tests/tcg/multiarch/system/memory.c    | 2 +-
>   5 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

