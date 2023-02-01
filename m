Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5606861D2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 09:39:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN8ax-0005jW-0m; Wed, 01 Feb 2023 03:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8au-0005j7-W9; Wed, 01 Feb 2023 03:35:53 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8as-0001c4-MC; Wed, 01 Feb 2023 03:35:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id l8so12051082wms.3;
 Wed, 01 Feb 2023 00:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
 b=EHcHSKQDWrNLfrV+Zaa/V6XU/gSZoD0Nre3JE13SUBQh3px4OSMGL+aMGglogy5m4G
 T5/0+KUbLG5vUwYM0WZEJrMxk029b7oaDq96zZ9p+akCHZBRfL79n3bYkbwR1sDSzXsz
 daQko7c6Q07LbIjQADi4sTGv44JTGn9W8gRgt1tApbYSYuu2ddh3IGDOv4nvaPtV5vuD
 iF7KUbJIxQoU8Voq/qIFP7yvkLopvYsGlltoguRNw8y0RRWzW5jECBSxRd+y+1ehGaC/
 GnGELYZ/vMMGOaJPdbRakzxkSc8RfBdP570p5tYDV6PWqGr9cBuUNKlZrS8g6P7MbXYo
 EiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
 b=THWmgMM/GDLyW9xo8CD7XFaaXLRsNZ7V9wloEtBU+QtjX1n9ryl6gBtUIdtMOorZLJ
 cXYi1xGi9XWcN/XohltzaumSEL0n46Ejl19aW0ldkRT0guJCgv2wmb3MvOpl17AkTHhW
 MPJqYdg0bG/8q7hwIalEmnVd0MEpqQhOWR/q8+yyLWQ2nIBr+NgyNs4KlxojtEJaIJKq
 HRz6lDUVhiNKJyePS6CDekSoXJv/GtAaG1O+p86hzpmtUCKfJtItppw3LdTt7AlCmhFl
 cvc8WXnv0YkZ3G8D0Svwz1tmUd+1y8Zmuy8ccTKq4pW8eQig7MIX6uawXLsXvWxPwrYb
 6TQg==
X-Gm-Message-State: AO0yUKV5GvcqYgktUCP+J0XbnEWsXAOe56q4nk7GAUQbVO7Di4WSsV+g
 VtddNTKp9KHMBatFXQ8FmReGMPRe1wygWA==
X-Google-Smtp-Source: AK7set8U7h6JgTIUz/GSAXKxVEMdwMw6uPhYD8pbylUmygyycWG1uyrxwtyWU9ELgp5Jz13+EJJG8w==
X-Received: by 2002:a1c:7c0e:0:b0:3dc:561a:79d8 with SMTP id
 x14-20020a1c7c0e000000b003dc561a79d8mr1285631wmc.35.1675240214862; 
 Wed, 01 Feb 2023 00:30:14 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f31-20020a05600c491f00b003dc3d9fb09asm922456wmp.47.2023.02.01.00.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:30:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
Date: Wed, 1 Feb 2023 08:30:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/01/2023 22:51, Vikram Garhwal wrote:
> Add a new machine xenpvh which creates a IOREQ server to register/connect with
> Xen Hypervisor.
> 

Is this really the right way? Is it not possible to do the Xen 
initialization (including ioreq server registration) off the back of the 
accelerator init (i.e. AccelOpsClass ops_init function), which seems 
like the right place to do it now that it's no longer architecture specific.

   Paul


