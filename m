Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B2531F2F9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:21:59 +0100 (CET)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCscQ-0007RP-Cm
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsWr-0003xA-Ai
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:16:13 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsWp-0005je-12
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:16:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so4776346wry.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZEDJjsAYRxPtOqhpk71KEdhW0ZLCiiI1UGPX85vrIkk=;
 b=XOJN4Nc/Ki4JcTao398onajnTav/jIBe6VQ2hAk9clsP+XEfXyOWh0QJFQH7EfhTLZ
 0RsrSSJBLZYv4x68v+VqdCXjiUFnWj1NV6U8zQy8oghMb2f5O26CEb6QXMHK+QZqK72P
 Qm4onPX2xck3gzv2xWxwoQZ/dhxw682MSweuE1niNuzQk6Q849JRF7Iy5E6hUkQFP5Tp
 tZOTRe0kyyXPwhJsb12WKCUIX+p8LH/DjCOtkRWQjeJb9uqetTB7duHmVHHFQKisMdSh
 IPGBApju4OwhLCvnR7DUsQoV+P/lvlUCV3QDuaPsnR0ofV4pT8RNULbBPnXYPxOLC6P9
 38AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZEDJjsAYRxPtOqhpk71KEdhW0ZLCiiI1UGPX85vrIkk=;
 b=ojw+e7hlT5/K24aMQkzm/T+s1+PaWQz9hSWEk7N2JfeNvEIYBTcrOmAcH64dd7Ey3f
 qVrOefYdjkf1xIvQkbFxf76Wo03YkIa143xdNdL/IEwXjoyqHmUB0qb2eVVJWYctok9s
 LerO8lionMwcGqWQyglhSL6CU2HNItO4SrV5KEFv0DuFmSYYJpqfr3UovQT6KPyk/pu+
 GxNVyUBpGS1LpX4KE68dgCJL2wkQEVeqMDGUZxHY2k6CPCP4JHN3RxaYG85PtA/13R09
 P/hF7k9iZtHoOpgVmbOSiz9FN82Nq6G9eGOzDx75EcNPiFG7j6XU6aj1TDpUusxqQ6JX
 jjKw==
X-Gm-Message-State: AOAM532CTrfJIMRR8xcf0lcNeXw3gvUjejLmQPAySPHrxcfFKCHCor4s
 r7bnhg23qGZSDnzNOWYNO6c=
X-Google-Smtp-Source: ABdhPJzDlruTqElfNfRpJZUATKn0fbRrjLGE1JfbwWn5fZS+SOO+8EBCyfzPsZzB871KsdCAG9g4gQ==
X-Received: by 2002:a05:6000:229:: with SMTP id
 l9mr6324582wrz.337.1613690169345; 
 Thu, 18 Feb 2021 15:16:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q20sm9187203wmc.14.2021.02.18.15.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:16:08 -0800 (PST)
Subject: Re: [PATCH v4 10/71] tcg/tci: Remove tci_read_r32s
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6a201a5-0811-2db7-0074-0f07920a119e@amsat.org>
Date: Fri, 19 Feb 2021 00:16:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use explicit casts for ext32s opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


