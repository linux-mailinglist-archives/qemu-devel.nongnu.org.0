Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907D4AB8D1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:38:58 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1Q9-0004cj-MI
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:38:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH1Kt-0007tF-ML
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:33:31 -0500
Received: from [2a00:1450:4864:20::32c] (port=52124
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH1Kr-0000Tr-83
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:33:31 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r131so3949053wma.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 02:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ucQCzCA9Z/O5rPjgHoXBPhnsHAxMTDiJiBqlW4leuo8=;
 b=Da6JlwIk17UHlyup0u48lBYcRF1PGPvmUBv9jstWVShkBSP7+8SCO697Tfh2idmFXP
 71TRpvd/BYEay20oywaq8X1nx2Qt8eTySxz45L1qeLWD+f4JiPr7ytpEU0ubmcclbFLK
 9lwdjTnB1756rIxsMz+TpDriWpxWbCorJQa0P1U9yxxf+hF0czUCJQ+3yV21/hn9Ja3I
 ErNSVuzfVgkGf6EQG6SeZ/tMjUDc9+WBMOcMetsIIgRYZfRJLkOgZKSGvpLq076lA2j4
 qmhnNGGNQLOb3+DQ7Lh7AEcxBQ6E1V1pBKkdfy6/Lz+oXJGn0krCASFMvlg3i76+3kY3
 iKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ucQCzCA9Z/O5rPjgHoXBPhnsHAxMTDiJiBqlW4leuo8=;
 b=Ag6wmLWSjSrm7s4Jkqfrvq0CiPiZyI0AXqCP7m39EqsTBJcDMPHyhi1SuyIcRutzuc
 ZH6EfRayqfiTv1u5oz9i3b6MAgriikhi9H2loG018UdqvZxuZGqqb20ZdrgKxaZ6F8/M
 1RnAEXwJs9hmzpwnaq/Wq1gz86hy+OpMY6NOVlcgGSiJopQYF/heBAPoD7wByXZj5u14
 4h64EpNvQ6hoPqM9LkM8MdFAh6uvLWcq+vim1BmaU48NRc98pJJlhX66YxJ5exyTbNlZ
 X24baAgaU4k1nPW9s673ciidvEmGI9UUgVpRdif0JFIkNhTNM2cEYq+6sWfkdttmEjbl
 9wkA==
X-Gm-Message-State: AOAM532diSFCVWnjrgeXyNgUqSCf7NsgcZscN23sONzhudgwFPhyNMmy
 0Er6XR2CjIJxwE59/PzTTIoxXbSZAFI=
X-Google-Smtp-Source: ABdhPJxTMz2SkRz9mwf4LhDJBiP0O5D/PVEm/mZ5FTEDP2Vc4YBl3oGyI7DjVuS7YWM33BItqaHdeA==
X-Received: by 2002:a05:600c:6028:: with SMTP id
 az40mr13785557wmb.33.1644230006628; 
 Mon, 07 Feb 2022 02:33:26 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i8sm4537981wrc.84.2022.02.07.02.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 02:33:26 -0800 (PST)
Message-ID: <1ffffeca-a929-989d-f781-e5a19d6c4b97@amsat.org>
Date: Mon, 7 Feb 2022 11:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH qemu] Add TCG support for UMIP
Content-Language: en-US
To: ~hildardorf <gareth.webb@umbralsoftware.co.uk>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
References: <164418358722.9930.1215378989733447065-0@git.sr.ht>
In-Reply-To: <164418358722.9930.1215378989733447065-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/2/22 20:16, ~hildardorf wrote:
> From: Gareth Webb <gareth.webb@umbralsoftware.co.uk>
> 
> ---
>   target/i386/cpu.c           |  2 +-
>   target/i386/cpu.h           |  4 +++-
>   target/i386/helper.c        |  8 +++++++-
>   target/i386/tcg/translate.c | 12 ++++++++++++
>   4 files changed, 23 insertions(+), 3 deletions(-)
Thanks for posting in patch format via sourcehut :)

Beside Paolo's comment, you forgot to include your Signed-of-by tag:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

Regards,

Phil.

