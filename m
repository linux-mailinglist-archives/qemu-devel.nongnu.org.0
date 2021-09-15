Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11DD40C3C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:45:37 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSQ4-0000Gr-V1
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQSMm-0005le-Hd
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:42:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQSMk-0003S9-1c
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:42:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so3095496wrc.7
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2YN8b+vCrXt1tzTuCeu6GSCcdBOjI3R0gIkb9nxMzuE=;
 b=EZAguhxVo9zdQUHxGO2Ykw0OH3ZAHcYFYaG2uF5uMpj+Z3xEvFBOnTvG3k/GRrqL8H
 19Kl26yJ0GwZaa3R87Y7GLjZROU3ipSnPGLgCjhmmSpwBZI+3IZ+lpK2MD02ASnwuQ4j
 ixwX++Of3daH+V14TWZSNRnUMZomr1ENQdiYMn9JoP4c4R7wzKEDlgiN1vtm9j38Zsy/
 rpGeSa2kamnGcjm6ZPCUnobLXkftpaGKmyxUIpkQ+nkGFGLSXhoeajX7IH1MYDa6LgFe
 AAaEbDl0SlUMv17VO76vPwYp8eck/i31EALweEQ80vljpYV8Ga/Zuu5OrvtnRADlxEO7
 szqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2YN8b+vCrXt1tzTuCeu6GSCcdBOjI3R0gIkb9nxMzuE=;
 b=L60xcE67555lGP3Fqr6CKxqCigr6LYhZ6fjhqzkoYc4ICqVDKPFEcOCIZUS0b0Z7un
 bo0+RAlEcoXbiS2oWKkL2+TJUU5NMzqt/jkogIGjX3eEOiBF6DlQy8bHFkChVq5V7ugO
 ogdLfwGuEbVYEqQwIKUhZ4kzzXeZGUtBub70znMUAukE0rekX/6B4pU5jLjLaZauecwe
 nR9KTRtrfIm/vwMG5Zv1yGlNhf43V84bUlYWQQsV53EiWwDq3OK5RcEZpHAjuGaKliOD
 EcnCpRRRB6aqWTp3o8KTJsqTMhLar7JmFwdPmINSs74dSFROigZ8lb6Fdw5Jw00toHIz
 Yt8w==
X-Gm-Message-State: AOAM5303Z5aOL963Ie5WLne2lxFPw+u9OChKxeoSsPtqJX/rQru7niYr
 0ZWIYwRmyrJnLUSuq/LDXEY=
X-Google-Smtp-Source: ABdhPJy9WCPpd8erSv9Nq199JLy9dN8KLchM5hTFkkWlh3seSXNskqGJJo2AbF2mv7Druq7xLClWhQ==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr4282258wrq.260.1631702527718; 
 Wed, 15 Sep 2021 03:42:07 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id 20sm4002084wme.46.2021.09.15.03.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 03:42:07 -0700 (PDT)
Subject: Re: [PATCH v2 07/20] nubus: add trace-events for empty slot accesses
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
 <20210915101026.25174-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ebbf8216-9b21-e8b8-10b1-0b8a22f90435@amsat.org>
Date: Wed, 15 Sep 2021 12:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915101026.25174-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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

On 9/15/21 12:10 PM, Mark Cave-Ayland wrote:
> Increase the max_access_size to 4 bytes for empty Nubus slot and super slot
> accesses to allow tracing of the Nubus enumeration process by the guest OS.

I forgot to reply to v1, this is OK but I'd rather have 2 different
patches here, tracing first then 32-bit access (your call anyway).

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c  | 10 +++++++---
>  hw/nubus/trace-events |  7 +++++++
>  hw/nubus/trace.h      |  1 +
>  meson.build           |  1 +
>  4 files changed, 16 insertions(+), 3 deletions(-)
>  create mode 100644 hw/nubus/trace-events
>  create mode 100644 hw/nubus/trace.h

