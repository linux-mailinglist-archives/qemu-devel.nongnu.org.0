Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8B43D82A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:34:46 +0200 (CEST)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftNV-0007Vh-JC
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftKp-0005ZH-G5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:31:59 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftKm-0003IX-UK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:31:59 -0400
Received: by mail-pf1-x432.google.com with SMTP id x66so4270133pfx.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TTMqgzUqFxFokhucs8G0+cMUM5/pMJmluQzxHG9SpYs=;
 b=iuoIc4W3j0sgzjAVJBl1hOnECQSzpzgT0y5gyxI1gCES6/duuZUFOZo01Q6hq+TFwf
 NmiwOM35gVNJ537S99DW83QxKCrvlbBvOAuAxpfIa3WJcBZwjhDbgn9r/gICdifVcwGP
 bqPLuD9uRBBYq1qthksIKLUAfcT/F8zW77s0cOPzNgZVDPCV+Aigw3A4FYCdGokmdN/U
 wBPXSbwsFsYiO72znYpgO1rJQkQHWc4/3lW7wTbJ0XIxejvPYVEP9Pz+k/yGJyUlSRW7
 +7H8vpSxdt2huxCFqYqjX6Emu+BSegUeSIsyf+CAi0qFXxAip93qb9bwtfKxkCpCa+IV
 NfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TTMqgzUqFxFokhucs8G0+cMUM5/pMJmluQzxHG9SpYs=;
 b=RnzrOILbPJwdAq+Y4LXu2R2G2gK46NXQaqfujEPer+QMaEDigVARLA8NJ+4APVKCB5
 ADJX6Ic6uGp1cQFqxWmPikpphiK15+aXO4VmTfu630I2NrZ/vqQI5zo/Leb/CGDGMdEv
 Sg9G3XejN0WBJTlLtYHCd+vIDsxhx4KuJnMKFIbRboefVY6awPHEl5ZYXlX6GsWjhbPi
 9CmCEES7XMcWofFwBPLi0jACKkwzytfELzMEEzXw9bC2iUlha88jPUew+5xjsT7nYxHy
 dU3x9kDgI3Htcz9BwJvEjxkfoj/eGwnc3R54Sf5mi5KW3lY06TtarlAiosePImXrutCE
 R2vw==
X-Gm-Message-State: AOAM530l5yISuCieeYmoEfAcHDSDJ/kjZdx0m3AjUaiBjULlG45yvwiu
 VtntWiMGuegGTgkOLsLrYXDVtg==
X-Google-Smtp-Source: ABdhPJwzoROb/6ZGoHr0Jyp5zInq40Q3rntr5FgnDuptwTLlMUMNpb74nblMd4DBlENsNFeLSyH7yw==
X-Received: by 2002:aa7:9427:0:b0:47c:3b8e:5253 with SMTP id
 y7-20020aa79427000000b0047c3b8e5253mr1055910pfo.69.1635381115549; 
 Wed, 27 Oct 2021 17:31:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z3sm1078151pfj.116.2021.10.27.17.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:31:55 -0700 (PDT)
Subject: Re: [PATCH v3 05/18] hw/char/sh_serial: Rename type sh_serial_state
 to SHSerialState
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <a69dc6720a0f440dfed383139455854d7ddf4e3d.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <878bd67c-ad83-7438-f023-77c884b051f0@linaro.org>
Date: Wed, 27 Oct 2021 17:31:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a69dc6720a0f440dfed383139455854d7ddf4e3d.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Coding style says types should be camel case.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/char/sh_serial.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

