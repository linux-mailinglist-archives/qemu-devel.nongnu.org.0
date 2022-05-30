Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33C537CBE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:39:45 +0200 (CEST)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfcV-0007hu-Tk
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfPu-0001mR-KZ; Mon, 30 May 2022 09:26:42 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfPs-0003oQ-Hv; Mon, 30 May 2022 09:26:42 -0400
Received: by mail-pl1-x632.google.com with SMTP id u18so4161970plb.3;
 Mon, 30 May 2022 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4IMWzaAccAZaQboaarG0+IEaKH1TLVyjoEuJ0FQ3gKQ=;
 b=A7t4OATQ4wGy2u3cb2Xw1ada8Kme/DWk+ab4DO/YL2HzMfnNsxAntK/dbm5LyYjYWe
 hT5oNoNhkqEhd9eUW0uQeWZ0EETa4+V/O/GJ03Uq59blZsF9lqb4Wey62r2aLnKlWjRS
 5VonUCPT9ZtChu1XgBba5xpHVmo0un3lPgVBmIfiTAfxomO/icdggptYbhCBuTgJfaMM
 COJt9j7pXGuVRZvno3q515cQ0exWzIPxFRpOUkrOMS+UvF5xN0GTn24YXgtVWWySV84c
 8r4wv3nMXC0mYzIoZjk78tc5ZXmhYN2dAW3y4WSc4K3+g6wGeGLcUBbJof+cdnL79syA
 pW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4IMWzaAccAZaQboaarG0+IEaKH1TLVyjoEuJ0FQ3gKQ=;
 b=miOzpdebT0ZCH8fOgt+i5t9+ev6xwE30dccpheCIo4Hcw0IX7JZLSkGlSD3ZBEJELQ
 yMdnkTSR8i9dRCuHYRtNQ6lz529ZKIoG3m+Z1QxYmaCrIEvkVJBfn9Ze3hSlyoSDW/KS
 Fh9NJLSbeNDLHD0G5syt/z/Ju2OtPfpx7K2NEM/jc8DCxH4vebASiVM/m2rRBCRmd2Er
 CBI+InYeU9ytlpgykwEZ+dTk2BWNFpICsRzNJeHZpvFzgiSXkUPSnTKg6FEw9oIyJ190
 Pwyq/JXinbUGuHmHmd65PfHddWnOn89nlzHSJL4a9k5w5mBPP2prBjBO2fAn/t8ex+6i
 7FMg==
X-Gm-Message-State: AOAM531zqRA03XKuwgCj0Kpq6M7DqsC1d4C0plIRDgLVQUa01QltnzqU
 rKNcwfRPYRDMHm4UkUxEbcY=
X-Google-Smtp-Source: ABdhPJxkysSx3UF6ue/eLqMBOIZnB0KJNF+U+ONyUj5bXYlvC/tqhvgOzFzUHTOneu1bcMHlRcVjLA==
X-Received: by 2002:a17:902:7d8e:b0:162:22ff:495b with SMTP id
 a14-20020a1709027d8e00b0016222ff495bmr39563348plm.1.1653917198176; 
 Mon, 30 May 2022 06:26:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a1709028d9400b0016378bfeb90sm9110249plo.227.2022.05.30.06.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:26:37 -0700 (PDT)
Message-ID: <6f1b1177-67ec-981e-100c-feb98d990f41@amsat.org>
Date: Mon, 30 May 2022 15:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/4] hw/ide/atapi.c: Correct typos (CD-CDROM -> CD-ROM)
Content-Language: en-US
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trival@nongnu.org
Cc: John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220528204702.167912-1-lkujaw@member.fsf.org>
In-Reply-To: <20220528204702.167912-1-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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

On 28/5/22 22:46, Lev Kujawski wrote:
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/atapi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


