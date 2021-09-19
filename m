Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F44410D75
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 23:15:57 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS4AG-00087G-RI
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 17:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS48s-0006wb-LG
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 17:14:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS48q-0004Cm-89
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 17:14:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id 140so11612127wma.0
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WcclKzPtTz9ZWc0iO6AgNxivvKp/PpVPkltGdE8S2HM=;
 b=Up/fW9EgEl6ygRbc3kH8B8PgEo95K/qtARmhW+vxAR3bFj+zHmB8b99f5Hu1qGV1d+
 4dscxeNtx2yM5aNLUO4wVRPwnFIXrGYk8Hh01oqFbZWOD2OTFZFEQaYHKzj77s+cVqbY
 P9VEIelXQd38HZGJW9exzdzqNOYqTaTbzx56byeTw0+xzq9Gw4xp0aNWebkaiOXbT43/
 SysXJdP96ZQpK3MVgmlpa7GmQjjYIFC57j5VfD1Y2Y2dFeT+QWSTnurQtF8wBTAxnIet
 E6LCdHFVaUqZwGQYsPisQlhzPK7nh8A/DFYrTFuPB4WOfP1IEwSBPIa8VR7f2Xfdhq8L
 ZoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WcclKzPtTz9ZWc0iO6AgNxivvKp/PpVPkltGdE8S2HM=;
 b=irUnSGFQuUzHZl6zu8WmmOeSq3sJDTmNYFN8zMQ8SxCBRXWmUzMZDEePnqAx2Tvj35
 5h+HOSHmBOy6gEQYN9bBMrRDvuMZYg5ZIP93JPefuhAd2nMGuupBhk4ar3ukArDB7XNK
 G6mCcn3Tvvld48MkjRrVIgkEREut/SD+HYLWP3dEsyE1oyN6EIM+FHqTCqJVyvswSZMG
 +ur11lqSZW/IhGsez6A9tyniOKRliCTa+OKYNx2PofrEefFLBPL+v5Kje097neSjCihb
 4dUkYWZ5NudAX6fq4I3L6HQ0TOVg//aUUTmzY9RzidNl7m672SpRaSDamA+WGpr2nCDe
 uDrA==
X-Gm-Message-State: AOAM531kACQtjoHeKCqSqdSOWv1ISIFFvMLp1YI6fGt6IM224SDixsqi
 W5zRklree2fjaLVkTBZs2DQ=
X-Google-Smtp-Source: ABdhPJywROXVlE2ld/O4R3nwMcB/1oCv7FjXUOixbEw0CzepmmqNf+DXbr2WXY8A5dmdXYjNHw4aeQ==
X-Received: by 2002:a1c:448a:: with SMTP id
 r132mr21860542wma.105.1632086066408; 
 Sun, 19 Sep 2021 14:14:26 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id j14sm13822349wrp.21.2021.09.19.14.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 14:14:25 -0700 (PDT)
Message-ID: <e9f920f1-e525-a57d-3f37-bc17cecf3a4c@amsat.org>
Date: Sun, 19 Sep 2021 23:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 20/20] q800: configure nubus available slots for Quadra
 800
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-21-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210916100554.10963-21-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 12:05, Mark Cave-Ayland wrote:
> Slot 0x9 is reserved for use by the in-built framebuffer whilst only slots
> 0xc, 0xd and 0xe physically exist on the Quadra 800.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

