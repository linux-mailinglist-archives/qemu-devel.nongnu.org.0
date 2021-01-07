Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4F2ED6F5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:49:50 +0100 (CET)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxaM1-0002aQ-9W
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxaKX-0001vD-3x
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:48:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxaKU-0004No-R1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:48:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so6623789wrr.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cl/Vsz7qeaP5wxt62X7lTmJLNpnQ65htB4iX7kP0PHg=;
 b=DmXDwE4Jc1ezVT5mik9QNFazA4IBFCgcInKnZEZwbeM8gvy051IyRqua6P8OPNz9yg
 k2JFqg7VsC7dhYIH0EiK4DVfUM0PX2DFT6tUoBznm14uPLEGmSxEvEtZseRSduKK9YEq
 ArchUBhmPwsdUTai67x41/wZrots/pNZwwYqKc4IV7RrNCRMdc5idrrWGPt/HC4TUHFM
 Ejzw+MYN8pHCK6QprQRZNOu8RqMyidC4qyPopEZSEKaS95v8NdUGeOOexjQE2QL+U+fv
 B1cXjEzNBTaMISNyJoUotfAP9Bmray1VXkLS9gGAR3l2ebEwjc2qKVUN3zFpAZt0L7G6
 5cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cl/Vsz7qeaP5wxt62X7lTmJLNpnQ65htB4iX7kP0PHg=;
 b=Y2Zp6L/aS33DH2mZ35WhAXzDMYSpU/6Ut5LwvgfbusZu6Ewg1fbXqnsCGbPdnTp44w
 D6HsXe60Oekxnn09Zge4XTrlwHXeh7zvPMRDx5rJ3a9gPxJ3kSbuO5IcG67ESSvP/OTT
 6zu6ajSB3lSzJEyUcBxdzzi/qi3W3v31TyJwAE8pez+0RbFQNLnMyfm4u40bwmkZUD8U
 JBq1j74cmGVCyNaHJUZtDuUdCBzuhC5cNUjRzk1QDwvXlxoF6/JFemVuqpeBEi6bM42X
 3vS7TTfqCcHKTwk0UKzyZ4Ax7mDecwctLnR8/Yipn6IUqaKJTfVaQ7Fuizb9jPRxywNx
 SqnQ==
X-Gm-Message-State: AOAM532GTX34m8Bhiyl8ZlVhmT2xwh5cp/zooCsK4ueKzVjOsOdNaUA0
 SRerLRlW+CUGeXrKGDHOHRg=
X-Google-Smtp-Source: ABdhPJxo1B5+Iv4iQqHdQgFs7k8sV7SxFwadV6gvb+LndaXzXniSnqTDmx5l9Dri4wtzqJrNwEJfFw==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr30530wrc.89.1610045293020;
 Thu, 07 Jan 2021 10:48:13 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c4sm9051737wmf.19.2021.01.07.10.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 10:48:12 -0800 (PST)
Subject: Re: [PATCH 00/13] target/mips: Convert LSA/DLSA and part of the Rel6
 removed opcodes
To: qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a5b916e7-7c9d-25e2-38a8-210b0d58a720@amsat.org>
Date: Thu, 7 Jan 2021 19:48:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.267,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 9:36 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (13):
...
>   target/mips: Remove now unreachable LSA/DLSA opcodes code
>   target/mips: Convert Rel6 Special2 opcode to decodetree
>   target/mips: Convert Rel6 COP1X opcode to decodetree
>   target/mips: Convert Rel6 CACHE/PREF opcodes to decodetree
>   target/mips: Convert Rel6 LWL/LWR/SWL/SWR opcodes to decodetree
>   target/mips: Convert Rel6 LWLE/LWRE/SWLE/SWRE opcodes to decodetree
>   target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes to decodetree
>   target/mips: Convert Rel6 LLD/SCD opcodes to decodetree
>   target/mips: Convert Rel6 LL/SC opcodes to decodetree

Thanks, patches 5 to 13 applied to mips-next.

