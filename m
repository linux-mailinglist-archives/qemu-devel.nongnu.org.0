Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A133816B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:26:25 +0100 (CET)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUhE-0003qu-7P
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKUfe-0003L7-11
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:24:46 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKUfc-0002Dw-JZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:24:45 -0500
Received: by mail-wr1-x42f.google.com with SMTP id j18so739327wra.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ATLH51+3xVz9uz86HNa+kigDd5t8PnlgY1yq8DZcciU=;
 b=ruI72Fp1SiwXjRsT438YLbmLxFSUjUDucAdilM6FTXJmcqkl6bqq2OCAtCEtQJALBw
 tPrbybXYCQRxNEAWaG5OA5uBJwA4KoK/iMb/9bCkinWY+rHMSBUquuf8n2rgw7HBh8Uo
 12phU3Wtf4evNO7SRvYYGQYdBW0e8o4fDJWotvtkujjOWdtW9cZ8c4h3fwsNhdubNnhK
 ko3aUWwv2r8woteGNd+FrGXU/KHfLkg4+hhR8wqgolxLyjYZxNeWBb7Df0oOEhfkkZRb
 ljQsFv5cct0q+7dfTvwkErD8ARLisySTTCosoaonmbdabhZvinc31p5ydzdULB0GWCXd
 WKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ATLH51+3xVz9uz86HNa+kigDd5t8PnlgY1yq8DZcciU=;
 b=MpRMvbHZjj2mp6K2mcqKaRVAospf5+bjrHRBurKzbJbXjQW0h2kFH+r5ulbak8VjjD
 Na6whwRfyciZiBP1bOVxDQV96N2ExYPvbkKbYU7D/ujdm151HjF/LmFJakipJUybBl1x
 cI/wX8YTHW/s6m44PYkf4CkrtPL1nf0ffCBau64akzozSu9nRMvXSTLeSuqTOTue0u8v
 TN9zNxahkNTItUGswts36QEU9B6wV/Pgp8GhogQEvTOq4G8zu3x1rVBvB1yC/MMIqs9f
 vdPAAIwrEqE+9ggHmm8VbNHH1RkA9cYl4p6G5+dbvmlPVWVc/oo0bvjd+B/Vg5S8Nmx7
 w86g==
X-Gm-Message-State: AOAM530jbYoB3gY0xg5aasocvN7H2sUPSY4lXkZCgl9pCiWH60UZgZ3F
 0sXv9SRQla92TbXCYMnDTf8=
X-Google-Smtp-Source: ABdhPJz1DvNK5cE4dQPBuaMizXahXyTMf+zeiG8GmMyEXjHZQtVKh7ecS1ugF25PGw9lTWdRFiOQRg==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr11307527wrv.340.1615505083117; 
 Thu, 11 Mar 2021 15:24:43 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm7460740wrd.9.2021.03.11.15.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 15:24:42 -0800 (PST)
Subject: Re: [PATCH RESEND 0/6] hw/mips/gt64120: Minor fixes
To: qemu-devel@nongnu.org
References: <20210309142630.728014-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3a979d93-11be-177f-6a78-0111f662a5e4@amsat.org>
Date: Fri, 12 Mar 2021 00:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 3:26 PM, Philippe Mathieu-Daudé wrote:
> Trivial fixes extracted from another series which became too big,
> so I prefer to send them in a previous step.
> 
> (This is a resend for Zoltan).
> 
> Philippe Mathieu-Daudé (6):
>   hw/mips/gt64xxx: Initialize ISD I/O memory region in DeviceRealize()
>   hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write handlers
>   hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats
>   hw/mips/gt64xxx: Rename trace events related to interrupt registers
>   hw/mips/gt64xxx: Trace accesses to ISD registers
>   hw/mips/gt64xxx: Let the GT64120 manage the lower 512MiB hole
Thanks, patches 1-5 applied to mips-next.

