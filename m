Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D57B3B47F7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:06:07 +0200 (CEST)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpHK-00008a-JG
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpGG-0007vZ-1o
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:05:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpGE-0007II-MJ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:04:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id a13so11306352wrf.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j3/PmphRLJ8ssXWGZdpoWpx2Q6yXK7xz0syrqWmsyWU=;
 b=NRbkcOPDRGPENnYD1K2vGLfPX+UylOkX65BR5/nYG1VCtLQ5wtqCB1y4QUaTO/FLJ4
 /SHGR1X3C58zZkcptWRpEfoSOIjUAtbiZR6tjF9F4PfflooH6l1in61agwdDVx0DoYsD
 TNc1Q2qZNdDIgBNrTQWojHvxTFGsASq5LrHq8SEYnOuQYxg8l2t5ogQRYkRWedBljLsT
 fLgKDcIO35ORXAWoDFX0eOFO9KMvG6xFH+LprxI85CPZxhCEapFAgp1ZFQYrhFq3TMLH
 Cgq3yOeOTc+5kyTvuQ1Y5/cHQ41V+93pkYmPSQBB8TyUQwtNii9ucR5z840t+TEJ21hO
 3x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j3/PmphRLJ8ssXWGZdpoWpx2Q6yXK7xz0syrqWmsyWU=;
 b=QbUq1epQsE6AF/vY0SusFsYE2SWS8jPkNIeyjRjs79kNka32qmbn+0WtaSZSxTYR0K
 04Igeyx9HkUuSHKjVx60RkwKCKUe99A+QSJwMrV82y1njhAUsIjWLCfr/VhQUrb95vTA
 SMdXQ1IgdzS8/zqp7xcowud1zf/0nUjECNcljH/jedN5+r3of3zZXPlj4vN27jsBYngE
 JsXFZRLb/P/vtowERQzJj1RPszLHXapU0ap1cAAstPNJvic5y9a52H8ra9YkhhFgJFI/
 RsEsU8H+1xYzZgFgaiPrRejqUMyEQy9f+lFDCLklpAL44GarrFZPrqjJlYmO/pN4XjYW
 adig==
X-Gm-Message-State: AOAM531fXrEHQVimypi/qw8odxgXCAAoSGjGhJmNnm3i18zF/Q63770b
 h+eiFKHnw6fnm5R/LaQEH3ly8nRIdxsxfQ==
X-Google-Smtp-Source: ABdhPJzPUcea1KqTTKOIxuPgUdsvc8feU4oViX/C/LIg7zHNGOw8Jwl5qkHF8otzhZagrLmU22WUwg==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr12403692wrx.171.1624640697207; 
 Fri, 25 Jun 2021 10:04:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t16sm12677910wmi.2.2021.06.25.10.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 10:04:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] g364fb: add VMStateDescription for G364SysBusState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, fthain@telegraphics.com.au
References: <20210625163554.14879-1-mark.cave-ayland@ilande.co.uk>
 <20210625163554.14879-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d408296-f343-221a-0eb7-15b0d82154e5@amsat.org>
Date: Fri, 25 Jun 2021 19:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625163554.14879-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

On 6/25/21 6:35 PM, Mark Cave-Ayland wrote:
> Currently when QEMU attempts to migrate the MIPS magnum machine it crashes due
> to a mistake in the g364fb VMStateDescription configuration which expects a
> G364SysBusState and not a G364State.
> 
> Resolve the issue by adding a new VMStateDescription for G364SysBusState and
> embedding the existing vmstate_g364fb VMStateDescription inside it using
> VMSTATE_STRUCT.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 97a3f6ffbba ("g364fb: convert to qdev")
> ---
>  hw/display/g364fb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

