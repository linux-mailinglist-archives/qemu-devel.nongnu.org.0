Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75110577F56
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:06:59 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNeU-0006dm-1V
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNct-0004Pr-SN
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:05:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNcp-0005dJ-6C
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:05:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r2so15262194wrs.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=68VJoLMRPo3xk7JEV7Sc52MYOD1eudgxRw7myeOMVb4=;
 b=nuta5DXo2fcLPrpSFSI0lcI7ULn0CauJJQVrxR/zNpHLUe7wDhv1IB9IVRlg/pnMj4
 bB8mv59hK3+KM2IGBhYZKZNs9GvVdAXPFAAQhO62LqwkRFgqWzsazhTJRGRkaGAO8+v7
 mBRVbv39b09jMIlzFR/0S9rpBqgSvU144DDHev5C4thDBSjurohXlgtCCSNq9lMNdMzl
 jCQ7mGX7NncUT/ZXqVYtqh1oqkxtMia/bFq2/OUq/nxU3jrHOSW+6SC0oALcYl3hmesp
 VD241vPdSS1911Lapzc7M+ibSUUo93I+zrl+iqFpyyibXOnGLgWPhxc80rNGuEYvY9IO
 0afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=68VJoLMRPo3xk7JEV7Sc52MYOD1eudgxRw7myeOMVb4=;
 b=tEyZF1iN6DZRsSZMvhn+dnB1wPgdOwOjWTlz2gzsXzAmHH4XPW3S+krwSt7LbiyXQQ
 l5jqcvmWP44hpYldFB+ple0Q75ts9EbY26bZkpWpP1huWta00yYoR+QDdWfDtkQn+P+S
 P/WmXXc8cnLlXxeyy0aRBrI+8sUIOncMRjm//+zF5C7twF0Fjg+BWsEer0J2/uMeGKkW
 Y5aImo6caoEsTZWmMcRdUUbRwNsMN8x6obsxcPpSK9QOJNvjlW0i34RaTXZdQCc78yWq
 aumSiX/tWDnri+pRBuStrQyuqhjgs5R2ISNPjKISI8i4kFqR3GQEV4i0rfoCSVzPIoY0
 CBnw==
X-Gm-Message-State: AJIora/X0Hmh0T+92arftxxZUcJs1Ra5NVSbNzvbivi6I0oJaJq8qHrY
 pFaTM6stQ+IwsX2CSHFFYG7xNE9qv3ubH923
X-Google-Smtp-Source: AGRyM1uVV7POlckGG8dB5cb+x1oZmThG/S5uzEBpNqWT0IKXAuu+EQm0a1+XtdBiGPQfHkstl3RzBw==
X-Received: by 2002:a05:6000:1446:b0:21d:c3f1:395f with SMTP id
 v6-20020a056000144600b0021dc3f1395fmr17307214wrx.333.1658138712280; 
 Mon, 18 Jul 2022 03:05:12 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a033177655sm20850844wmp.29.2022.07.18.03.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:05:12 -0700 (PDT)
Message-ID: <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
Date: Mon, 18 Jul 2022 11:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gpio: designware gpio driver
Content-Language: en-GB
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713172010.39163-1-ben.dooks@sifive.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20220713172010.39163-1-ben.dooks@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ben.dooks@sifive.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 13/07/2022 18:20, Ben Dooks wrote:
> A model for the DesignWare GPIO (v1) block.

Is there anyone else who should be reviewing these that
was missed off the original list? I'd like to get an idea
if there is any work to do. I've got a couple more drivers
to submit and was waiting on feedback from this before
getting these submitted.

-- 
Ben


