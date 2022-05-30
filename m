Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71481537C9D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:35:54 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfYn-0002OG-HX
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfNg-0007rD-14; Mon, 30 May 2022 09:24:25 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfNe-00038n-0e; Mon, 30 May 2022 09:24:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id cx11so2652568pjb.1;
 Mon, 30 May 2022 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mLLaYbI2AnJlD4mXpW9HlXKBKhNAEolRX+JFXE4pEcI=;
 b=KOh/YRk04yizaOTe5gIYiz3SOXnOUq+iGuxliHQCoNDgHfPUikLeNULgGiWs/nL83g
 Yp6zaEGYrIPa+PAs2K27+UUGZD9J9Ul7/xwz3iHB5f0kgsEu/cNMS2wKPelr7YQcPw/8
 +kKYW0LvGCH7Lrx1jqM1TJ2ptylYyliiAMaYChr+pEQqOP7atghz6H2V24evYYG2I491
 jKMBi1+ntH+2zED1CTtT7NP736gI84NcEvYXFh9ZjB0Tf/XSZLXqEHAtLIstSe73SmP+
 mvyqKpcZD8n5jGdx2R5KXbq7k5E5s5RQKijXQQxQG5VUIPXG4Uk39cGhBd/Bllct2HsP
 pbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mLLaYbI2AnJlD4mXpW9HlXKBKhNAEolRX+JFXE4pEcI=;
 b=kIjWdD0+E603F1usSDJ4hlY7alya6ge9Ze8b07zrn56EE8TyK8TVnuhcj5rD6rtTvj
 2yjzflfHs3x47boH7jV/dHDbBAYj/4RDmJYArmWLHisrObyWZmEybEqUqkPvo6gF9wnF
 0ZBdaBzJJdyjtvUwWiQuLBufeFkatk28mIMsDSYD0G2nlD4ttMaoHkclnLAeTZzBX6hf
 ainXpP4ltAFOqYWb38H9NU8rzAfITnem0mabEYhXIhXhIcQo6cajgMPTgam0Qr4y4lWz
 8rKbfW/Fii/NE/isQUBXtjXB0OKYKgCCZWLWprcYEQtYi8rUF5tdvX/KReukC3BTqfTy
 Wh2Q==
X-Gm-Message-State: AOAM532IykfGwaq6M6JEO4uDW8GuhkKvc861qToxwvX6oYo+col/48XC
 oVTFczPLIO4cXaewXAX0yL0=
X-Google-Smtp-Source: ABdhPJwYiiZ7nWQtijQhTZ40rSzipS9pRQacTs5AnbSuSFuBik/LeuUvimxvx8pM7iLHz9TYQrRiIA==
X-Received: by 2002:a17:90b:17c5:b0:1dc:e0a6:340b with SMTP id
 me5-20020a17090b17c500b001dce0a6340bmr23359680pjb.34.1653917059726; 
 Mon, 30 May 2022 06:24:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902690200b0015f4b7a012bsm9120450plk.251.2022.05.30.06.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:24:18 -0700 (PDT)
Message-ID: <58173fa7-2df9-b369-d348-aee51fcf7982@amsat.org>
Date: Mon, 30 May 2022 15:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] piix_ide_reset: Use pci_set_* functions instead of
 direct access
Content-Language: en-US
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trival@nongnu.org
Cc: John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220528204702.167912-1-lkujaw@member.fsf.org>
 <20220528204702.167912-3-lkujaw@member.fsf.org>
In-Reply-To: <20220528204702.167912-3-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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

On 28/5/22 22:47, Lev Kujawski wrote:
> Eliminates the remaining TODOs in hw/ide/piix.c by:
> - Using pci_set_{size} functions to write the PIIX PCI configuration
>    space instead of manipulating it directly as an array; and
> - Documenting default register values by reference to the controlling
>    specification.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/piix.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


