Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C157C53811A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:28:36 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgNn-0002bv-Rv
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgJU-0006ZI-HY; Mon, 30 May 2022 10:24:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgJR-0007Uf-Uq; Mon, 30 May 2022 10:24:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d22so10443446plr.9;
 Mon, 30 May 2022 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+WN2dPLjajdxoxlDEPAe48WHdI7YxWkHxPbjnUYOOO8=;
 b=cq9hxC6OFV+LV79KVkV0feOEYNeOVYwYRg0Q/v1QkI8js1LA6xHLV9WX0XL66XcG1C
 G6K8YHpGLKPSkMpqd3adXJKTy2X5OF4jr6tF+zcySDhz8UJi9kinc+6DB6SQFAygstXF
 5+cjhsB71ULopJ8yG/XDZ+o5ocxTrIsgAG2u6EtSbrynAtUJjdMVJh8qYDeekaG1dBYP
 yfJgqHgTG0sYFyFpniRxqFDJMPYw25wi8PPuV83Y+LKxmd/GemUpkxj82n6CrDT8LzVz
 otUSS6POKkmm7B21e5V+7mN7XjPXvL39QfJZxyAvwjYVe5R7T6/0+MHk9S1XjVJuRmrc
 9t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+WN2dPLjajdxoxlDEPAe48WHdI7YxWkHxPbjnUYOOO8=;
 b=pSK1sVwdNVmlCduDzZWW24vs2IqaiCsIKAZ+9b/sgXhIKI+tQDyQ2Z/H3PUfqOJRa3
 YjJhvINGA6se1x0Ji6DLNhH4Cwx70okrGvakFkna2A9XfbzhKenSzurdO8aD5hMVoSI7
 8Jps5hBd8oLf1PniSQfMdIv0pEuNqiA7RnDsf25FRI8Lz0qma4CRwbnB6eyICJjdaDIF
 cpBfGDDdltEvalEO53qOArqvDPxU+pOSwszPr/N5s6x9v3M25ihsblhKd/SJnWVfeuTl
 LHYUEafpYwJr8MxCa0t7DxO/V87pcSdNb98xH2aJYYYoguuit8wOH0CkzhVSPiqh7Aqs
 TT6w==
X-Gm-Message-State: AOAM531KxqNJcfbggTM+ilQPIMngBwrw3dcuqBZWpyYJtBTj28G1VJMr
 SKgbYX7Gln7GndwdEzb+WqY=
X-Google-Smtp-Source: ABdhPJwXzoiEobr3I+/srAGCySALidXaV9bC9pj4HUyR5CtlIE4+V+P5H5+venad+aeJ6RJeUHKASw==
X-Received: by 2002:a17:90b:c85:b0:1e2:e645:a8c9 with SMTP id
 o5-20020a17090b0c8500b001e2e645a8c9mr7931311pjz.185.1653920635767; 
 Mon, 30 May 2022 07:23:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a621c82000000b0050dc762815asm6759128pfc.52.2022.05.30.07.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:23:55 -0700 (PDT)
Message-ID: <ef17b7bd-421a-8999-21af-e98be80df9b3@amsat.org>
Date: Mon, 30 May 2022 16:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] scsi-disk: add FORMAT UNIT command
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 laurent@vivier.eu, fam@euphon.net, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
 <20220421065155.31276-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220421065155.31276-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/4/22 08:51, Mark Cave-Ayland wrote:
> When initialising a drive ready to install MacOS, Apple HD SC Setup first attempts
> to format the drive. Add a simple FORMAT UNIT command which simply returns success
> to allow the format to succeed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/scsi-disk.c  | 4 ++++
>   hw/scsi/trace-events | 1 +
>   2 files changed, 5 insertions(+)

> diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> index 20fb0dc162..e91b55a961 100644
> --- a/hw/scsi/trace-events
> +++ b/hw/scsi/trace-events
> @@ -334,6 +334,7 @@ scsi_disk_emulate_command_UNMAP(size_t xfer) "Unmap (len %zd)"
>   scsi_disk_emulate_command_VERIFY(int bytchk) "Verify (bytchk %d)"
>   scsi_disk_emulate_command_WRITE_SAME(int cmd, size_t xfer) "WRITE SAME %d (len %zd)"
>   scsi_disk_emulate_command_UNKNOWN(int cmd, const char *name) "Unknown SCSI command (0x%2.2x=%s)"
> +scsi_disk_emulate_command_FORMAT_UNIT(size_t xfer) "Format Unit (len %zd)"

%zu (%zd is for ssize_t), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

