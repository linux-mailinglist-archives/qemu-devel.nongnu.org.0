Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8E432C70
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 05:48:30 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcg73-0002y6-5U
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 23:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcg5i-0001ra-F9
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:47:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcg5g-00051q-Sn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:47:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id v17so45012689wrv.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 20:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ixCIxEQX1tBzBXl89LUyyiPBfEc4Yy387cP9wfwX7g=;
 b=JHdgHn2cZigT8QpDdrHY77VzGRkwy9cvjXB67zWBGMIOGDhqJg0ulsRKD0q3RP6V0W
 XZHu53BePVqGzhzKDxp3E5QgrMex48fyUy4Szb4s8vRkECc9iWzn/GZJH5yPThjJW4LF
 B3Mvc81zQRK2A3mYM0RtMoQ20rrFMxkTPdMDF5uonkDZG2wYO4IBWu0FmzSpH/sWR0ab
 myPapGwMREazZwUgqD4AXS6yDOzog7TKka9gwSdmitSRIYUD7s+uKIrVTYWn3D+p07sB
 OvZI0Be3Qe+vLzIiyzLbRyQYMH2bl9nJpMbvNr4ULEoZe8HHYkDd/IHYcuzRZRluyU3N
 ncBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ixCIxEQX1tBzBXl89LUyyiPBfEc4Yy387cP9wfwX7g=;
 b=K+S41tHGGNQIwtJLRGq4fBX+Z85O5YfrC4+pWXIjWMPwkE7RTEQyfefIWHLoWCF8ha
 A35J4mwzujhW4Kz3Mk7ekdbEz9grCo6bu9PJyFPcFkNl553/eKZ1DlX/THKC8qD4vgd1
 WZYnqjU6h7Z/BmPEyTmfcLmy7kWtLLze3bdrowZ5Wrk8qRpCLtNAsFC1xkiNtag4Uj9H
 B7XY7jrxDTGlb0uIKlXkVwXRxadreUFI1VSqsOEI8ZTXc1cOY+zBj6LnaovbeQqBfurQ
 hq13ZbSonnDB6ciYKQVOoOuIurL+At/mHbaYDANAyErlkwosEdBz63xGuI/sGzexzR71
 PfLA==
X-Gm-Message-State: AOAM531dCfcYOnhLpLkTVzXC5ZAxrkToSqXq2M99yA8c6Q6Dih14Czsv
 +Dy9JXEnMwlzmzx6AVrx4Eg=
X-Google-Smtp-Source: ABdhPJxZzjaM5cFTuD94jbPj98BFGWOJXQ7/7XkhQhABAXG9A+6/une6jouuUXP+px41A6b3GMaMKw==
X-Received: by 2002:adf:a549:: with SMTP id j9mr40894919wrb.123.1634615221673; 
 Mon, 18 Oct 2021 20:47:01 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id a2sm14198509wru.82.2021.10.18.20.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 20:47:01 -0700 (PDT)
Message-ID: <fc2ee0a9-1c12-ce04-4e01-b5d30cf78f51@amsat.org>
Date: Tue, 19 Oct 2021 05:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] Hexagon (target/hexagon) put writes to USR into temp
 until commit
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
 <1634031081-25450-3-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1634031081-25450-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 11:31, Taylor Simpson wrote:
> Change SET_USR_FIELD to write to hex_new_value[HEX_REG_USR] instead
> of hex_gpr[HEX_REG_USR].
> 
> Then, we need code to mark the instructions that can set implicitly
> set USR
> - Macros added to hex_common.py
> - A_FPOP added in translate.c
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/macros.h          | 2 +-
>  target/hexagon/attribs_def.h.inc | 1 +
>  target/hexagon/translate.c       | 9 ++++++++-
>  target/hexagon/hex_common.py     | 2 ++
>  4 files changed, 12 insertions(+), 2 deletions(-)

This is stale v1. git-publish helps to avoid this workflow
mistakes ;) https://github.com/stefanha/git-publish

