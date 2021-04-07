Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE53573A3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:53:35 +0200 (CEST)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCMw-00087M-KT
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC3m-00045Y-VI; Wed, 07 Apr 2021 13:33:48 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC3l-0004yY-Ew; Wed, 07 Apr 2021 13:33:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a7so522003eju.1;
 Wed, 07 Apr 2021 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3gGeJKAQn4t0QM3kXeIrtliFEujc5NX2EP6gqLo4/7w=;
 b=cD93UHGb7N0CKSQtFJKjIXK2sGq8lKxl/3cLiAvz/lLffXrFZeU2fAeDffIp1uI1/y
 AVAurLA5sUiakgZIMKGmRKlhjOeC82DgX6nJLSAhqTDUchBmMH+GT3PGr5+y7HJOwVZJ
 SYeBwmiIVSvS9WZ9LdzGhb9Vp52ydXG/x3axQLi7kIKaeuBBywS9d2DvXZEGT1oiebx4
 j61MYXUwwQlbHiPTDVmmfTFI+dRG7GzS1MtfKStu2K7xIjKZodm2tB6Ustbt+ha+HvDb
 FBBUatdF1lYGtJkQU5tNxRnfnRgE6vJh+n+SQnLT/8XRk8rLsag5J1EdNG6R506TU7S8
 UTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3gGeJKAQn4t0QM3kXeIrtliFEujc5NX2EP6gqLo4/7w=;
 b=THk/GbBGt6i/8fSiaRCe5vQdK2ahhoGbZFOkd73XffRUnxTpD+LGzQBIhxp5q5LZ/F
 KHm3vXSnx8LCZAcCj2yotJGVaP21momhp/AHzWIG2yB1Qm6gPFLrJ9xq+JLWvpb7PqRL
 xNXFUIT82fW/SriFD6JM42RKoKSGiw0xObGtJNlbbu6+APgvje0nWYq68LL/nL8OWLuV
 GKRhbQPUzuyB2/42iA3PomKvz4Y4RkQngdIjzGH/Lt0XHMj/YO8UqnRvj9MGa7S7Mdyd
 FiiTh6vaSeYC1YjsV4HoADoZ1qjSR4tShwZ4Dk7QXM4ZiuG7D0EoOfx6d/fB2AL4PrnN
 XACQ==
X-Gm-Message-State: AOAM533oYRkOqGhN6/XDTWj8V4ULmjpaHdsEIkZ9eT1eZzga6aeqQWZA
 QNJZsYShsV8BA9o6tpfQTA7tHjAaSwbnNQ==
X-Google-Smtp-Source: ABdhPJyUwm24IxgPZ/1vYtuLI9mbRAou5wWsDS8IdqlgZELfLuQ12fmw3J5R+mZTOdghnzMPXjjnlQ==
X-Received: by 2002:a17:906:4ad5:: with SMTP id
 u21mr5036938ejt.22.1617816823354; 
 Wed, 07 Apr 2021 10:33:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w25sm10936101edq.66.2021.04.07.10.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 10:33:42 -0700 (PDT)
Subject: Re: [PATCH 04/24] aspeed/i2c: Rename DMA address space
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fba7f421-347a-1298-f58e-6f31aa2744a6@amsat.org>
Date: Wed, 7 Apr 2021 19:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 7:16 PM, Cédric Le Goater wrote:
> It improves 'info mtree' output.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/i2c/aspeed_i2c.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


