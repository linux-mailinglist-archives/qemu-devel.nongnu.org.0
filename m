Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078164045A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p137V-000757-MZ; Fri, 02 Dec 2022 05:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p136u-00073u-Pc
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:17:36 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p136t-00005a-8Y
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:17:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h11so7040851wrw.13
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EqzYGsa1irO4Mzs0G8QFykzjj+hUoS/jxiVGMhBxq90=;
 b=vHndKJrESUc46CiA+YNZ6bliqkNxKmRK06NUC5ch6zlSxs28t3kRo7qlP9+7z6trIE
 gKbxpel5mZHcYq0L2hL1CIfY85V4HP2HeUGAy9sZCkbSXasdDF+N1IaMcMLhhvNpIHa/
 Rfe+GCobOzErM1cSh18vuubS3tPLrOKYFY7G3RKzkwcwo7y3ArHkz3HwXKoWdu1w9b0M
 wddvIPJiY4yGNjzKX3EQjmi4afRm9+b2Gn/c/GO1fXyMKRf6e6cRD04PxwwYtokJYkr3
 7158I75K8+CGdUiW2xmSiIsRCkAxfry7nUsSNhcmiOcu17vZnNsGW5QYZez0hRihBXh/
 UuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EqzYGsa1irO4Mzs0G8QFykzjj+hUoS/jxiVGMhBxq90=;
 b=gZ42cwFeDlFitX6GWFqKgTqLbaW/l93kNOxJrLC7Tj6Dww94iTVBSNqiebyqyfTWDd
 7wEdTNQuc9qPXPbCpCnGCGz1mu0ykG1FzPhnzGGfpa4nC7Fr7ltBi4kIPD0iv9VfPgaF
 DpRyiQMPaWwX+FIZchMABvCk0Rx16OTQp6gCf85p+UcZLgbo1ZysFBDiWKE9qcxS7FmU
 qGSq6MKK5ZfbFKLrcKnm65ZqMpE8OY+cufLNbWAEWLHfnA8YIFVjNFzin5cl8d8aldsH
 dzRLGE/8vcbClLuBxAE2WkZPDYfrlpQHMloak53UXO6OhUTyXyu+LqyEcT68x7CZQ29t
 gNdw==
X-Gm-Message-State: ANoB5pnKZvlT7l4+9mNhwe4hLLiyZl12pcGhjhxR5ls/PpUX7hj4D44W
 1/lsZBWkYeGY9jRb2t0ujWGgKg==
X-Google-Smtp-Source: AA0mqf6527fnk4UYvg6LsNnxEgJpnjbTdczhNfH9PA8MIXrQUkuin/1Oip6BFSM57+pzm2qBW13ViQ==
X-Received: by 2002:adf:fb45:0:b0:241:ea14:f22b with SMTP id
 c5-20020adffb45000000b00241ea14f22bmr27440105wrs.460.1669976253878; 
 Fri, 02 Dec 2022 02:17:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a13-20020adfed0d000000b0024219b1cb1bsm6700710wro.60.2022.12.02.02.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:17:33 -0800 (PST)
Message-ID: <6b0d328f-843b-e700-f11a-cf78db91edf0@linaro.org>
Date: Fri, 2 Dec 2022 11:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 06/14] ui/spice: QXLInterface method set_mm_time() is
 now dead, drop
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-7-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202100512.4161901-7-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/12/22 11:05, Markus Armbruster wrote:
> SPICE_NEEDS_SET_MM_TIME is now always off.  Bury the dead code.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/ui/qemu-spice.h |  2 --
>   hw/display/qxl.c        | 19 -------------------
>   ui/spice-display.c      | 10 ----------
>   hw/display/trace-events |  1 -
>   4 files changed, 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


