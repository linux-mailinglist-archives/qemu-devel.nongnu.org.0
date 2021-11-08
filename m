Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D687447B61
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 08:51:27 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzR8-00006z-QW
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 02:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzOR-0006yw-Kg
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:48:41 -0500
Received: from [2a00:1450:4864:20::32b] (port=46641
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzOP-0002AQ-EE
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:48:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so10916155wmb.5
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xOuWduFXmn6mQ8S8uVtWiq0yDp85EgllsaC85lL4ZO4=;
 b=hgxXO/nwVpm+8+x8MW/kZX5sPBFuZEPlNgJfLOWbtAdiLepX+7yfOEaOCxbjvvaxKt
 g96bCtFuos3frM5SU4gaBSq7bJnnokBKmUJhgB1IwzJg/IcT6eYVFJFj9TvdPpXaKObL
 Dch9n3eyCqdTw8JhgYgUr7AIttkUspi1pBq02NwpZlGdrBlJVvtZK5NtSg3keSQYSJxY
 2Uw1FbQEpWMvcm0i3ILUCFaVvKq1DzeGmm6iZFAqJRONvoBl0kNPTLi0dWFtn/U+panc
 X7dUMGaFm0wVLb9S+u4qXyrsDuzDlxf2GEcwYaJFUjvnFS9+4dS/MRS+j87/QFp32zzm
 705A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xOuWduFXmn6mQ8S8uVtWiq0yDp85EgllsaC85lL4ZO4=;
 b=JD7eYfgMxTMZIWFPcpkRt+Qv5VhhHXBddJ+L6yInlAv1D8NxgojxKuaQfTn+vbaZOO
 GqscTAgrVaXHsjIIGTQboE99gmKZiX3hhGDKvgna4d6eq5GQydLmNK8KoeYSDItELNqw
 MhO+9uAUfYTaCP+ziL+VL7wWxxcTFrmC2AYaLNpa78+h4XtbaykRjl7zst/3GGj3GPc9
 aPf94EjX+kXBLHKSk7h2I2A3nXqUbOhUD/boOZQ1ZBgxitxoIZxisyO0H1TE6mmxM6rw
 dbH6kpHKCUacP3aYL0utnEW57oTc7N5afdOSQeaVX/L52XDd2aRvKFhaMhaQ2t5KwYyq
 Y0BA==
X-Gm-Message-State: AOAM5306wAlMTdW/3hsi4vXbBEspds2fAsJdtpxEv9sK6OelF0XiVowY
 bQ3el8fuaLyHX0gA6T6OYZtWS0ld4NU=
X-Google-Smtp-Source: ABdhPJy9KF/DxcS9rU6Hkc5VjGphsbdIrn1shyYAr885Jtw6+2rkcb5Xf4FfUmYxE++GL6jOq7yqkg==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr15644130wmj.166.1636357235149; 
 Sun, 07 Nov 2021 23:40:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j11sm1806903wrt.3.2021.11.07.23.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:40:34 -0800 (PST)
Message-ID: <a5be987c-9c57-26a6-a973-cf0b14a5ccbe@amsat.org>
Date: Mon, 8 Nov 2021 08:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/4] linux-user: Always use flexible arrays for dirent
 d_name
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <20211107124845.1174791-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211107124845.1174791-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/7/21 13:48, Richard Henderson wrote:
> We currently use a flexible array member for target_dirent,
> but use incorrectly fixed length arrays for target_dirent64,
> linux_dirent and linux_dirent64.
> 
> This requires that we adjust the definition of the VFAT READDIR
> ioctls which hard-code the 256 namelen size into the ioctl constant.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h | 6 +++---
>  linux-user/syscall.c      | 6 ++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

