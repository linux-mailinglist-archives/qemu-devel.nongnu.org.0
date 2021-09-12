Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77990407DEC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:26:04 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRMp-0001IO-FK
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRKt-0007g9-AV
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:24:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRKr-0000wA-HK
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:24:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d6so10575465wrc.11
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xa4QC9NSxCsiclFqttn6l9qLDQSGmE0z0sPmCZO4gr8=;
 b=GjKt8nxGrpLWYkiX6uhPgiEKTewFiaY2Jqby5SMotQsuezlHy16Nx/kABN69CVd9Be
 2UuM1rJJJA/zXSvpJZypLKQXvWKusuCwQrAICVxHW1IOeaSjP20IzF35Nsw0q2LnXrQH
 7ckdtS50JDqaOcTs6Nvqo3Ul8TguPUS+ZQXNjjKza8ZfM9vmTErHMPV7l9ldjbggk+/k
 JlbN8ssNad5vJhbyAx99AHPtmQvSJlndIY8gaTziYzoWceFb+dS7hOr3PB5JCKp6W+D6
 7D0bdbdgj3gxJzIvhBv+XggV42snsOLO6EdE9CAb42MwMLIq/ue4q3LGp2jZIKB0DlHL
 5PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xa4QC9NSxCsiclFqttn6l9qLDQSGmE0z0sPmCZO4gr8=;
 b=u79hAHKUFYW0BIxkAGD6wyGOQsDwi397UsLU6ZvmkASnAOgPpNOQSqYBku4MijbHSH
 xuU/M4gubrwYaeh4upLybDOHWspsfZmRD1FgCSDsgtO22CBPp/8USo3b/BZwX01vg9R6
 aSlJ6MS0rGRxUCBgSNHSHOM19Rkb3lk36DLKoz9ZxGYQlM7yGWNmLbm+IJ9Ui3CANQ1+
 TKkWs3NhZ58lieNGuBqN61hsG4W4cmwuv4GILeahrXlesSNK7fn0LYODJqLjzTsNl3yH
 HOIPje6eP1v/7TTsoZ7nljJztbGBFvC1qOGoASaHLPZ88cRN2YxM6JIx6gHtSYSRa7RG
 TlQw==
X-Gm-Message-State: AOAM533RC7ceTrPdYVRTQCVsaQLk+teK0SB7Mk7y826mYbiYksVM8Smk
 7VR8lywnVbCVl+axiH6AEZ9n5EvhgeE=
X-Google-Smtp-Source: ABdhPJwCTq+Kbqx3GZHHv4mZ/nk2MULsFTtsoL5Fr74gqMShfmXveVPJj9hcTAeexD+ilBuLMv1OWQ==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr8083799wrb.329.1631460240318;
 Sun, 12 Sep 2021 08:24:00 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u2sm4485396wmj.29.2021.09.12.08.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:23:59 -0700 (PDT)
Subject: Re: [PATCH 14/20] mac-nubus-bridge: rename MacNubusState to
 MacNubusBridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-15-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <76bc5a9a-d927-a715-9d1f-03fa0f0d13a9@amsat.org>
Date: Sun, 12 Sep 2021 17:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-15-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> This better reflects that the mac-nubus-bridge device is derived from the
> nubus-bridge device, and that the structure represents the state of the bridge
> device and not the Nubus itself. Also update the comment in the file header to
> reflect that mac-nubus-bridge is specific to the Macintosh.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/mac-nubus-bridge.c         | 8 +++++---
>  include/hw/nubus/mac-nubus-bridge.h | 4 ++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

