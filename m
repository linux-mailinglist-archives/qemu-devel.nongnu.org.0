Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7D33F5C4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:42:01 +0100 (CET)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZF9-0007Ho-Gf
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMYhP-0007xv-OK; Wed, 17 Mar 2021 12:07:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMYhO-0008T4-1X; Wed, 17 Mar 2021 12:07:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id o16so2409664wrn.0;
 Wed, 17 Mar 2021 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HUoaNr2jpx/Hqqgt1k4ocTq0Wd6cXBAgWL1v0SgJTr8=;
 b=UMNfq+nCdUNkibfUBQMI//2Tq9vgLZMgyISMfOx1m4406Qe7o0WOJiTF1h9tzP4q6n
 w7NF2UV2ipJklFTZQTbgW2T7QYINz5NdNWYmCzuSMg1oBtfS9bZtBVRhnI8WX2eyGICe
 bOKwKyoFzIEZwxb4x6uFJwKjmiR61cXVUPjrIEqQSpNcw8c8N2jQ6OfXG4aE6ilb+Prw
 jI0OLgwpBzrlEOpyR/SmEomPV0e6pxjMuSHq0AxU6oUBUzEYeKl313aUwacDxvRzhnWl
 IdLoNt0dg8i9/T3cIWuec5zXF6ndHj0AEFoNkpFJHOLWKmXzUiH3I4BVoPg/l2DL5bO1
 Eepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HUoaNr2jpx/Hqqgt1k4ocTq0Wd6cXBAgWL1v0SgJTr8=;
 b=j/1zoIOTp2FDpPGmWBzZLlnv0/f9HUnVtORL2u8kIH2PalOKOd0Lk8zXv/KrTfCCR9
 3LBiPiAS9JDtumDqe6H4OKxkVXqCgwa21EwpPuRCA2xV2yz3gfOBlYdKfX2kdyQ0UJmX
 I92ilHJru1vCgGWJ3hPY28u+KiywK4TJjCTjN2KIVl0zReSkuu3a0oKvxGzND7b1awpR
 stQH53OkXJJDrvF5bEY7+nx/zyvlyziKReOE4gQ66NNW3Nzbrk2AqqJ30Wo1TrcKaJI6
 woKOLMDkzmlcQPTFT6jOuaEsYmsFCj9dVMGm71uj67FlOJmfWHJpUAFKFPbqj5Gk0CFH
 Oddg==
X-Gm-Message-State: AOAM5327eM+CR13gqP9QkO0kC668WC8qV0SLCp5H+eT+ZlaOvdN76LJc
 65o/qVpoXKmT/esCeGrA7m81g77m0xV8iQ==
X-Google-Smtp-Source: ABdhPJzgAOUzMoZU8qhyHRzLYW9ZgA7iNRF72/MoSfI+fL1P+sdT5E1p00B618bOE/0CxNn+6A1C3Q==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr5337559wrr.118.1615997223593; 
 Wed, 17 Mar 2021 09:07:03 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i26sm3022569wmb.18.2021.03.17.09.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:07:02 -0700 (PDT)
Subject: Re: MIPS32 release 2 Instructions
To: prashant chaturvedi <iamprashant13@gmail.com>, qemu-discuss@nongnu.org
References: <CACiU002Jb7d5Zg1r8gRSACjS6hNuYogTSGMxGPzGVTqJ+4E3dw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <883d6f46-497c-85bd-2055-927c4c879c8e@amsat.org>
Date: Wed, 17 Mar 2021 17:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACiU002Jb7d5Zg1r8gRSACjS6hNuYogTSGMxGPzGVTqJ+4E3dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 12:20 PM, prashant chaturvedi wrote:
> Hello all,
> I'm trying execute a mips32r2 , little endian binary on qemu and the
> instructions like enable interrupt(EI) and Pair upper Lower(PUL.PS
> <http://PUL.PS>) are not supported by qemu as it gives "Illegal
> Instruction" error.

PUL.PS is microMIPS32, not MIPS32r2.

QEMU emulates microMIPS32 with the M14K/M14Kc CPUs.

This instruction is available since 2010:

commit 3c824109da076d2a1df4b798f9df81b385131f92
Author: Nathan Froyd <froydnj@codesourcery.com>
Date:   Tue Jun 8 13:29:59 2010 -0700

    target-mips: microMIPS ASE support

> I'm really confused with this, Those instructions are part of the ISA,
> then why am I getting this error? Is there something that I'm missing?
> someway that i can enable execution of those instructions? Any help
> would be appreciated.
> 
> Thank you all in advance!


