Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594D437905
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:26:11 +0200 (CEST)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvUo-00009I-Im
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvHP-0005rI-8i
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:12:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvHL-0004pG-Eb
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:12:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso3577435wmc.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHcWjlouYroWMw/T5JWYu1x8Kb0Ji6Dw0us9lxLJaf4=;
 b=XB6LYwdY6HqvYuxqY3JgIFM4CveWnn8btUT1pWpLdz0ZTbec4hDVhwy1AX2siz87XI
 0XVWPIfq8afUSktU6Z3spfr74zl60eJ4qSWo8Kt/uy2k5JVVrMEgOM65I6nTvfHHJPRf
 0KM8aJoACmKZ8mSElmWHCNEHMLiIkTqSjAJRxl2+qHqN5UDCT0z6YvMg8YvxdVEt1G1+
 e1dqdsEfAqhvxHdyiiIxEC5P6ptvc2Vt5L367E//DXO/UXqclDLEmJZpjo/5HsLspK/4
 6hb3WNib1WRcj9fFR2UHOq9I3fyGHyceI4dkaIhwmyMh9oowmW/S8PRFAqvejNT+ugns
 KXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHcWjlouYroWMw/T5JWYu1x8Kb0Ji6Dw0us9lxLJaf4=;
 b=JuMb1DZjbeBAT1vGuM7zsFat9gsKBufU6qSCLUDSRi6NeYng5wkvL2ovfVE7x2genk
 KMi2z52ZC41uXRIZ532LNzk9+n/uptuOGHg5q7HOGyr8xqLYNVL0xJxmRJKlAddtCAxD
 L9Dhxp3aL1mQ+CwtstoXXmGnmqzdaNecgIohoGI7BhDenqaEdFbl8EMmSX8g1AuUbz1Q
 I0GHxUErf1tciKGS0Vl3hh85gZ4pFyG6xXPIu4U36/5rspQOU5AiFq7UPBKMNf9PHVlI
 NSkvEGncN443LH+pyd20Qxo2KImQVYFL3tdeRL5sPTK315HdgqEWcY0brxIfevrlx8sA
 b/kg==
X-Gm-Message-State: AOAM533me/+eUf+1jmaomBsYw4Xz1e8lzwJNU0O8qMjTOIB0wixInQhn
 5d4JbYAOkwo3A7M12lqYDBs=
X-Google-Smtp-Source: ABdhPJy9yRvwlQrAwbsHlSYySf6qPGBp6CQFGsUvAMQbMh120EpKtMhUq0lwX9/BdBE6L0YofWo/yQ==
X-Received: by 2002:a1c:8b:: with SMTP id 133mr123887wma.156.1634911934068;
 Fri, 22 Oct 2021 07:12:14 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id h14sm3814134wmq.34.2021.10.22.07.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:12:13 -0700 (PDT)
Message-ID: <43f062a7-1615-c5a4-c2d4-931c5e95506d@amsat.org>
Date: Fri, 22 Oct 2021 16:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 28/48] tcg/optimize: Split out fold_dup, fold_dup2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

