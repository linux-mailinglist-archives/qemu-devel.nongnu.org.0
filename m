Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8369A3F0E53
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:40:42 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGUEj-0005u7-IY
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGUDV-0004os-QM
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:39:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGUDU-0004pq-52
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:39:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x1so213612plg.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g/FKeRsQuGz+Q7Uii3y2RBNJJ80YySFbgKQ/E/csc14=;
 b=iycmcSdpCDQJ0ZjerNJ0+7Ow7ianvv45ZmNlrSsUZXUvzF9enuUtc7G6Dz7YhD5rWe
 KjSF+hwqvGWEE8p6l0/uPuJK5tJtWWxmyLm3zLfFr+DcTK9QzZOREBvlZ+VibaDupk68
 PHhR/8eYhVw1Gebgy/ifTR26mhgUfZv0kI8vP6omTcH0p+JQsiblmqmF+XkgMwaYi+2H
 fuQuNSu+C00w0QOsdrPVmcGMmN6RTCRxblhC6PMwafh/DuirBpwLWsKXEDXf1uK8pUqg
 NahatEtzP3atyumoW7BsQRoll7yEWa/3rj2dYgyBjHKzAtm5AhxGSqnSNuuUfFA/+r64
 ZDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g/FKeRsQuGz+Q7Uii3y2RBNJJ80YySFbgKQ/E/csc14=;
 b=quDj2KwaxpOH/zBhFp4hzEszIjSsxIVl9M5/c+hvZBvu5kIO/vhCf5pOOmhNLIu3TC
 Z/PCR/OsQ0oqpUfe/a97NYgAxF+7Y1cGv91QtrZh+aiAA5HTPnouyhd+lo2k2fQT0X+C
 Uh1T4oH2WAFObrfpXcQ4pUofq6T098K8hOTOvK6hgU6BrzwXFrWHsnQLGC4LOkGLJVy0
 sH58/WNYDASkd0BCKZvDZ4sxofAOhtK0jnhLOLrYjK/K/gqKN3XN8TZTAEw2AXrJHVns
 ROvUgftDbN3+Lrjt7MQDb+hfWMOdDN3S3t3j3CNl1g7DSt+ve/ZwTDf0hEQqVmm+4nxu
 4rIA==
X-Gm-Message-State: AOAM532GyeFJ8YuSDC8fHT0KViM90AFivkblDcRv43S6IU7eErsG+iKb
 t7IGIzrbSJ/TF1azVzfz8I1PmQ==
X-Google-Smtp-Source: ABdhPJy8tZ6hV2ZVvA/3d4NkU3YXSaQc/t40tFS9oL/tNZlBh3P9GKZF2R2aOipJ/RIQRTgC80xN/g==
X-Received: by 2002:a17:903:230d:b029:12d:79a4:58ee with SMTP id
 d13-20020a170903230db029012d79a458eemr9119326plh.23.1629326362692; 
 Wed, 18 Aug 2021 15:39:22 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm850042pfx.1.2021.08.18.15.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:39:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs
 properties
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
 <20210818203233.791599-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a03ce617-6bc6-0b23-e7d5-65ab03ea7e7e@linaro.org>
Date: Wed, 18 Aug 2021 12:39:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818203233.791599-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:32 AM, Philipp Tomsich wrote:
> +++ b/target/riscv/cpu.h
> @@ -67,7 +67,6 @@
>   #define RVS RV('S')
>   #define RVU RV('U')
>   #define RVH RV('H')
> -#define RVB RV('B')

This patch does not compile by itself, because RVB is still used in 
insn_trans/trans_rvb.c.inc.


r~

