Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A44D5388BE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 23:59:04 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvnPj-0008E0-24
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 17:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvnNX-0006nV-CI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 17:56:47 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvnNT-0002sl-L9
 for qemu-devel@nongnu.org; Mon, 30 May 2022 17:56:46 -0400
Received: by mail-pf1-x434.google.com with SMTP id bo5so11533420pfb.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 14:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NzNDSmeL8nvNkBFuSyUq0ydqiv5Ih7dY6o1qG4UyCK8=;
 b=jCEIRcXIGIyQ0pzutRGhWExmCHypwv+/8BP0GjcALJaiEp0j7jSITcgYvDb2ywEvm2
 wEQ3UuSAJYKYrdYVDrR4lTHqEnCGiSlUX8h4RmOE1gOOGJjokWQa+8sU2iAZ79OPCs4l
 JRdYoclTQ3b74ZWDrvky4mdexPVfXLECvlrOQmV/jZNFOclWRc5WejrHzee7y7h8Le9f
 pzOBPL4AcYZ/V9fsS2Iix5eX8LDXK5KphFJ/IyK8E9XAgfGxWpYTYNFJIk7pt95ZZ0ez
 sSDBX3Z9ZUH01WHIW7z3G9VzRt/1p2C7krSSNKrkBqmmM7Vw/SoVpL9WurSPOF2GvTFc
 SaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NzNDSmeL8nvNkBFuSyUq0ydqiv5Ih7dY6o1qG4UyCK8=;
 b=gZ3gEQs9YTvL9ewyXZKLjZPDH/B8laAzKhueFsMa7CH9qgFHVwCaDDEvoLOVwGBgwJ
 GP3L1ifBH4HmHrd/eTMGnFfVyD4so4W7xmOP5MTdA6f+uuX6upb+m6E/gt1k9y6oU9q2
 qtgPo476vg7qVF++60crFgp9iDKyCKdcnfyjSTbpPvSkhqQFsK1lu/w8MNtfTR1NxBe5
 tCgivZ6gHMnauGuzYmsl94uTNx3SdGBFXzyLKf3rPKOrf5FK56Mk1cwJ66A7T1y8Z4zr
 PtcEOGUm5/Thh7XR68smWNL23kI+JBpx20PHlGp4xcSBXg3pMHEtf0406P7s24/cNcJ6
 4zxw==
X-Gm-Message-State: AOAM532mtv0On9iyGbtpxyyNuHCU6zECkfLULrZi1U+LDkrszrDym3+k
 sg2gXxy707oY7M0N/f74ubA=
X-Google-Smtp-Source: ABdhPJwibZNtry33fYtZ3Fgd/huvxOsKKWaS7UBkFYUhOicq3shfQIFUXXQAKeYSOBP2pjLS0ydRqA==
X-Received: by 2002:a05:6a00:849:b0:518:bcbb:a6e1 with SMTP id
 q9-20020a056a00084900b00518bcbba6e1mr35907633pfk.86.1653947802335; 
 Mon, 30 May 2022 14:56:42 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a17090aab9200b001d92e2e5694sm193414pjq.1.2022.05.30.14.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 14:56:41 -0700 (PDT)
Message-ID: <ee61f925-8323-9d16-86a0-14ab9e4f3236@amsat.org>
Date: Mon, 30 May 2022 23:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v5 04/10] cutils: fix case for "kilo" and "kibi"
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com, dgilbert@redhat.com
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-5-pbonzini@redhat.com>
In-Reply-To: <20220530150714.756954-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
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

On 30/5/22 17:07, Paolo Bonzini wrote:
> The correct abbreviations use a lowercase k, so adjust freq_to_str
> and size_to_str accordingly and add tests.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/unit/test-cutils.c | 20 ++++++++++++++++++++
>   util/cutils.c            |  6 +++---
>   2 files changed, 23 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

