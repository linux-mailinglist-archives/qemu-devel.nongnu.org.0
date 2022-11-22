Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B67634024
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:26:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxV9j-0003RR-5l; Tue, 22 Nov 2022 10:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV9h-0003Qs-0r
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:25:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV9f-0006KC-Ka
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:25:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 h189-20020a1c21c6000000b003d0283bf132so1110638wmh.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EIbDMVC+FFxLa5C7f4v5tfjmUn8khmfWQxLujWtMRDI=;
 b=gK4P8UrO9H6fuM+raQ3XYxjugNEbRcxz6H+o0+Y9pZ9PvLujNBEFYBIw1jHq8QPZiy
 mD0aryTvwNS+QINKYpmI2UaZSFaNTPF63EmZ1XNQ+1Ye1ibj3uSTP/Q/JX/ACXJEMp1J
 hXMAVi2BBj9ZQ24DiFIaFG/G3a3gxsNJ4fxe2RorcepxnGzuInOvWk5H6eWhwSXU7Vs9
 r78//xFKq13ZCRWV59BdcZLReou0a8KHq4e9VhF8BcEMFsQ2JzKMWa8pH4Zt65xHJryr
 B27IDT0tvkNy1nw4n6wuU3vR+a9bvxNd2UzDF43GeMSFfXH2OHF7iKfi9rBWtzo7frCf
 PEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIbDMVC+FFxLa5C7f4v5tfjmUn8khmfWQxLujWtMRDI=;
 b=NuvpcSMJnysMxosSi2bb4/QY3wlexR6iA/46TCpiVz+EyRqQXS+ozTrUxbjR4flUd3
 R62e9voDGKPD1YHqoiscx8SkTytynB68Fh8moiTG48JOZogid+Z6zML+wtuQgk4H6hHn
 U2sU5hnqhsbGh3C6WzQKJkgn1Pt6igaBcpRpKGhSCks/hNs7AeZWAJQ+HBNgHeCAU/fr
 t4O892hIkdIxE2OFAlECS4KqwIHiKgpYkS2Wp2Gi29C42JSLCZsKWJglp/nAS87yfkqf
 T8PYw5IDKuBQEriwH42/r+83ZLxjdOuks83UqZTRmnjnkRWyDUN9iIIWPBFCla/hG6RU
 aKiw==
X-Gm-Message-State: ANoB5pkmNnxMlcuqZCL+C8Y3D1QI+D6lPra6Vslrhi37Mnu7Rqw2Oy0p
 ExtsVg/Fb0kWl335eGeHqRSdhA==
X-Google-Smtp-Source: AA0mqf624kJToeNmld4nOAQ2w7OER5WQrm2geX6KQ8kwIxmNSvVjsdnlW+6lAuSnH62tY1oVqNBpRg==
X-Received: by 2002:a05:600c:3ba8:b0:3cf:59c9:4a4e with SMTP id
 n40-20020a05600c3ba800b003cf59c94a4emr6220855wms.17.1669130744190; 
 Tue, 22 Nov 2022 07:25:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003c6d21a19a0sm19513264wms.29.2022.11.22.07.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:25:43 -0800 (PST)
Message-ID: <cc3eeb00-4962-3fc5-6d51-a05fc14ce751@linaro.org>
Date: Tue, 22 Nov 2022 16:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 22/45] tci: MAX_OPC_PARAM_IARGS is no longer
 used
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/11/22 08:40, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci.c                | 1 -
>   tcg/tci/tcg-target.c.inc | 4 ----
>   2 files changed, 5 deletions(-)

Since commit 7b7d8b2d9a ("tcg/tci: Use ffi for calls")?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


