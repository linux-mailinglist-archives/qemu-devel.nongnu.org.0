Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D49D51EB48
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:22:13 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXUq-0005QY-8n
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXSB-0000i0-M1
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:19:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXS9-00005o-Mo
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:19:27 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g8so9496193pfh.5
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=dvJdQKEBOkPpOZkeC6/c5CcatO6bOS25c3rvYgGtZXo=;
 b=wdZwSEVtDJUID6dXFGCn1siM6/4qWtPDVazZe4EqcHj7F5azJl9IN9hZbxk9qzW7qc
 Ku7iQ5sxc+MeHhKkZTlTe87K3t4psOC5SBNMqMzlxC8rEjwcbjowiqnM2ot0/Cpq/UTO
 7lNvWW0kNIO/GzgG79quOSScPcoJLORFTS4wa4xUGQP9DQiuqlEPpE3nio3D5qFFqJ4+
 mybJz/raepjYaiLsC+jOqM8oCBiyoD6fsSx1Uf2QinHszYQk70zZCVkSkbUTGG+7JdgJ
 +fd0lYuNehKjGj/n5ys8uGVqmbCl6IJTdk+9/AyGHR3hDtk/AV+SD6Dr7+Pmf3mfqevH
 8NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dvJdQKEBOkPpOZkeC6/c5CcatO6bOS25c3rvYgGtZXo=;
 b=erVzwjEUPVYXeChWGe3eOLzrzUTGURN3rxond+IquRjhoyUdZrOtM2d001FTT3x0kC
 fzPMwBproGkOXgFj8Fu4u93MawNPQg9IZ3ocmQ4GtD01EF7iJicvZZaza8qMLxUMVlcg
 4j9jKho7jW+oIFM5pMEcrJLF+oMLDVsopayHYTmtahSlT+E2JxXN+H7gEsrOjUXyjMZM
 yHtQKDrsqPNfJVwIFmM8E9nmos3eZ62+C12mhcIh1vz53PLlqjLg4fU+G5pGbhAvt7Oq
 03AEk8toZE0y5ZW/+XS4ce99L/IgRJVbZ9s3sFGep/SjCxdVK9E7Gy2ZlT9xSbpkIxva
 Gvdw==
X-Gm-Message-State: AOAM530w6bKsBD5E0pfa25scmFK1vKYJJD/oUx5VxWi8++WMg0pkNtqu
 8xkP+UHIwSarHVo4cBq53yEMQg==
X-Google-Smtp-Source: ABdhPJzkN3DKA+KAYgtHGbbzUQSVka7f6TFb9zUXTdnC+jgc0Stse32f0JbPMULvWhLN78b/5q4kTw==
X-Received: by 2002:a63:2b05:0:b0:3c2:3ed1:5fa9 with SMTP id
 r5-20020a632b05000000b003c23ed15fa9mr8415088pgr.220.1651979964131; 
 Sat, 07 May 2022 20:19:24 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 d133-20020a621d8b000000b0050dc7628196sm5870366pfd.112.2022.05.07.20.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:19:23 -0700 (PDT)
Message-ID: <8c7cfe3c-8cb4-bff7-e6ea-485bf75aa0cc@linaro.org>
Date: Sat, 7 May 2022 22:19:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 49/50] hppa: fold machine_hppa_machine_init() into
 machine_hppa_machine_init_class_init()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-50-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-50-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> There is no need for a separate function to set the machine class properties
> separately from the others.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/machine.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

