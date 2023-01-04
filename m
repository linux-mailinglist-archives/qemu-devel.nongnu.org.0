Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9165DB5B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 18:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD7hy-00068T-Uc; Wed, 04 Jan 2023 12:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD7hx-00068H-On
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:37:45 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD7hw-000545-3Q
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:37:45 -0500
Received: by mail-pl1-x635.google.com with SMTP id n4so36588241plp.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 09:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oRX3aoxWpIAjStq8N+rCgXZMPSoMWkdKtul/JI8OsFg=;
 b=ii4dKczoiWgy4orpKuqs3aILNhZ1h8fDMulg41nqJ/EGW94L56H0m9vRouQLR1q2Nx
 CRsE0QgHRufX6kbPE2efuLHDA+seSBZENh/ha0FfQaIF310ipPi15zVCfUpNfPQnT/Pz
 PZePiKZvl6w1xhSS28yhk9Kk9cda8meEhd5PL+FKzyC5e5g7zE8cE7OXFOkN9QB1cW0w
 5fv4q9rUFyQS07IbPubypUmMTGmW47MTOZo7JuZVVE12nuwRpFkZDau5w9h7LBZieRWY
 OT38BijMEkB2zqXebe2iiSGx0kp+62ZSivb53Xb4j1T4LaCrDjDoH9hDvVaDd+9mLrCl
 NNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oRX3aoxWpIAjStq8N+rCgXZMPSoMWkdKtul/JI8OsFg=;
 b=5KmqVpAHuh/EfJ4/JiMMdRraufj72TiaCIAqJpi4T4UCB1V+aO17vaQ871VFsAdtBg
 x4Fh0gyKbhibU5j1gjoaDy3buhWCGRWGbMapElrYZ7th16h/PngJIBD4ZODUhvN2n1rS
 WSEp2N/u8dXkW0/NuerixgDzCDZ0RDF0QD4nma2HShm/xoGvqcqLmsusZsVpse+JpiZy
 HntVUJWShLgWcTLIWgtxX2DpDJULxgSOjDi2KzPfEGpnToGsrbBPbWYJCMRhQb3NCt1y
 kdZiyOYOJ6TW7lzzVkI6JfytQXVfQobW0UxAJ4EAhPzfdMsv2EdOMjQqE9Z6U3vMNMkj
 gwJQ==
X-Gm-Message-State: AFqh2kqOGbe4i6hqchE2QOIPO2L6chugOmsN9sEzMK20SlLP4BK196ar
 hzNmskn5OnikerzaDqwb7rmWBw==
X-Google-Smtp-Source: AMrXdXsBMwayX3xwavzwdZxe0pOJoET51ql2DJb9IbxoxlP3yAiDvgfcpuLLSl+2cdAuu3YaG5BJ2w==
X-Received: by 2002:a17:90b:1203:b0:219:823e:6726 with SMTP id
 gl3-20020a17090b120300b00219823e6726mr52069361pjb.19.1672853862352; 
 Wed, 04 Jan 2023 09:37:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 ge10-20020a17090b0e0a00b00213202d77d9sm20538252pjb.43.2023.01.04.09.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 09:37:41 -0800 (PST)
Message-ID: <e54984fe-c17a-c39b-80e9-f7d22010106c@linaro.org>
Date: Wed, 4 Jan 2023 09:37:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/4] target/m68k: pass quotient directly into
 make_quotient()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-2-mark.cave-ayland@ilande.co.uk>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104134554.138012-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 05:45, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   target/m68k/fpu_helper.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

