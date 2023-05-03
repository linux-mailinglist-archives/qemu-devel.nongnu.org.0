Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136F6F5A21
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:33:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDWI-0006L4-7b; Wed, 03 May 2023 10:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puDWF-0006KI-Rx; Wed, 03 May 2023 10:31:47 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puDWE-0003S7-5v; Wed, 03 May 2023 10:31:47 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so4502381fac.1; 
 Wed, 03 May 2023 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683124304; x=1685716304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zyfnQ9QB+k3g7XtX1wg3nNYO1Qan4d9JWM8HoP9gFX0=;
 b=e8TbfTVT4o4ym6vm/kwrAcoxYLZfu7Fg/SzUUZXYfcR2hKKzN5zG88qwusep6+Wx2s
 Gf/GRqSF+Wo5Vk/S21J1xSc1PTzx17Z05fE2XAsCrIIh3Ubwa/iuFxvEDG4oOLtJIhcI
 pmPyGHJe935H8ylD6i9RHvbHdXHuXXkKlLAcDN2k3L55b3CqPmUnAN50QUvV6aGOAs4W
 4XqFROA+xAFka73qDszCedKysMWjZ0CrPTNBw9NMYUf91aDqWIkdADYe27eLfscrFhGh
 Bb37gDii8VN6Yp3oX2Z0R1QY6i4GEHaUWi58oCDb73WuuOsYKBaIQ9b730PL7dcIEWxn
 6luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683124304; x=1685716304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zyfnQ9QB+k3g7XtX1wg3nNYO1Qan4d9JWM8HoP9gFX0=;
 b=Nlw6Ro119ndd4My7A+EOnIQnlqCgANhSQuurX26hcQyyBftUCaI8GEAFr2kkc1BiYc
 85LU5Ak8YvlFBG+Z6A62r1kkz+x0AaulWGIjzIKEw7kx51ZYrxOaZdJlIk7lNtuBzal2
 iFJkfLOqKqKYknD+IianENnz9lsNcwWhSWrpsVPSV3g5uuCAJPIS0ALRj1X5WF7FSKeA
 KEDjXLOZ8iUFpsdn95c+P72poLZ5T19C9iXJmj13ddFn0XDvCJ3V3YXEiqy34oxV/bsO
 d1LMpPhRW3ml7gMwkaXEksue4dFeRQ4S29i5QK/wEBFtWOPqqO922xzq8qeK0Hv/JGlp
 1GQA==
X-Gm-Message-State: AC+VfDxIrRv8APvOSoK0jdpJHzx83Fa/mC+O4/djaMWtgMXmV+knEfd/
 lqPl5293fl4Xtlo8dAEFmBo=
X-Google-Smtp-Source: ACHHUZ5dvxQgH1Pzkh1PQbf3yLVOn4x1cuETQLS3Gv1VQRjgwH8yozuLX+hfA4/nyNBzu3rOoFNuFg==
X-Received: by 2002:a05:6830:3353:b0:6a4:1938:7d92 with SMTP id
 l19-20020a056830335300b006a419387d92mr954174ott.13.1683124304510; 
 Wed, 03 May 2023 07:31:44 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a0568301d9400b0069f0a85fa36sm623750oti.57.2023.05.03.07.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 07:31:43 -0700 (PDT)
Message-ID: <3087e8d4-308f-28ef-c90e-0b1dd20f2979@gmail.com>
Date: Wed, 3 May 2023 11:31:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/2] Cleanup ppc cr get/set with helper routines
Content-Language: en-US
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com
References: <20230503093619.2530487-1-harshpb@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230503093619.2530487-1-harshpb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/3/23 06:36, Harsh Prateek Bora wrote:
> This patchset introduces helper routines to get/set cr reg for better code
> readability / maintenance. No functional changes intended with this patchset.
> 
> Changelog:
> 
> changes from v2:
>   - addressed Nick's review comments
>   - holding changes from 2/4, 3/4 for future
> changes from v1:
>   - addressed Fabiano's review comments
>   - folding Reviewed-by tags in patch 1/4, 4/4
> 
> 
> *** BLURB HERE ***
> 
> Harsh Prateek Bora (2):
>    ppc: spapr: cleanup cr get/set with helpers.
>    MAINTAINERS: Adding myself in the list for ppc/spapr
> 
>   MAINTAINERS               |  1 +
>   hw/ppc/spapr_hcall.c      | 18 ++----------------
>   linux-user/elfload.c      |  4 +---
>   linux-user/ppc/signal.c   |  9 ++-------
>   target/ppc/cpu.c          | 17 +++++++++++++++++
>   target/ppc/cpu.h          |  2 ++
>   target/ppc/gdbstub.c      | 22 ++++------------------
>   target/ppc/kvm.c          | 13 ++-----------
>   target/ppc/ppc-qmp-cmds.c |  6 +-----
>   9 files changed, 32 insertions(+), 60 deletions(-)
> 

