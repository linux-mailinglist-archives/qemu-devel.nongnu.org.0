Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419833A1F5
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:46:54 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLDy9-0006L4-1l
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLDwa-0005mF-PY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:45:16 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLDwZ-00058k-0z
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:45:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so18002161wmy.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 15:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fW3DIQmssbJQy8hcF2Ny+ujB2Ib/i6QbbNk8F+O8J8s=;
 b=hIxedI3pZ7kYqxGs2RgMjPQwep4BikRYPW5w6RXSs2Nf46qv445eRhBst7PQVfLpcZ
 b98tKnDwev2lGAxlpGMwr5sic/bzZ2Ix6VPjLE51CwLb0elB3LoZkwpQ0hsnz5oXo6V1
 Y2IKzk/+nAT6QWsz4LAJKG1ZEzDsALorZnt6Egbe1z/7Vz4TJn1l/J29Pxd49PBguwlR
 Z5FTPgGz0DYWA4+cUE93xSRwW3s58qO14a8j05Ttf6nralbOCYTm1QYWh+R6EjeWTN3g
 zRhxIhYLL0Kd2gDy3Y0Pd8tCqQONDfij/4O7w/6FZaVI1hNZbYiB+fT1Hritx83UGUfV
 H/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fW3DIQmssbJQy8hcF2Ny+ujB2Ib/i6QbbNk8F+O8J8s=;
 b=lRE6QuLT2gpi2QiTYLvUagotdP/czLve6gBA1BOPsx+VntytFNVZ2WXY5DWVqW/vpZ
 sfj2anYrdGjS++wGuURi9oHYOZo+W1g29iY/DxkEO1tqx+nm5n1aP/EiFZODGD+f7TO7
 R0RBsocp/JvFfsP5z7tmFO9oTpIv5esgbVfQS6Xas61ksy1Bd5LGhujNhdCyXLHI4g0v
 wmY4QXeW+WXajKnZL0VEPMntxxb7x5AancnBLW1IZf7ceeUENBsoCkHhkDPHBo4CHQ75
 VZa+InjbnTcoleUqYAA0espJS0opGcuXVFfeNWvZUCJ/hItEXSc8GhtYKwhLW+dff7Pv
 98WQ==
X-Gm-Message-State: AOAM530gUo+DbBKYdb0ud9Gp94X3PQGPBkQG0UF8NyEE1p7xgKQqmKv0
 u6ng1PtnCfibN6Texfh0ftQ=
X-Google-Smtp-Source: ABdhPJyVIVJ4zPAa0WDENawmFMwewJHfWm+sjpsNBxpuM6TsTi6ZPEMO3kJh4tvZMkYFIyycQUg57w==
X-Received: by 2002:a7b:c1c9:: with SMTP id a9mr18977592wmj.145.1615679111788; 
 Sat, 13 Mar 2021 15:45:11 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x25sm9207576wmj.14.2021.03.13.15.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 15:45:11 -0800 (PST)
Subject: Re: [PATCH v5 00/13] target/mips: Extract MXU code to new
 mxu_translate.c file
To: qemu-devel@nongnu.org
References: <20210226093111.3865906-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53b631c7-ac7f-1e91-9131-0154c5f91a57@amsat.org>
Date: Sun, 14 Mar 2021 00:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 10:30 AM, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

> Philippe Mathieu-Daud=C3=A9 (13):
>   target/mips/meson: Introduce mips_tcg source set
>   target/mips/meson: Restrict mips-semi.c to TCG
>   target/mips: Rewrite complex ifdef'ry
>   target/mips: Remove XBurst Media eXtension Unit dead code
>   target/mips: Remove unused CPUMIPSState* from MXU functions
>   target/mips: Pass instruction opcode to decode_opc_mxu()
>   target/mips: Use OPC_MUL instead of OPC__MXU_MUL
>   target/mips: Move MUL opcode check from decode_mxu() to
>     decode_legacy()
>   target/mips: Rename decode_opc_mxu() as decode_ase_mxu()
>   target/mips: Convert decode_ase_mxu() to decodetree prototype
>   target/mips: Simplify decode_opc_mxu() ifdef'ry
>   target/mips: Introduce mxu_translate_init() helper
>   target/mips: Extract MXU code to new mxu_translate.c file
> 
>  target/mips/translate.h     |    4 +
>  target/mips/mxu_translate.c | 1609 +++++++++++++++++++
>  target/mips/translate.c     | 2920 +----------------------------------
>  target/mips/meson.build     |   13 +-
>  4 files changed, 1636 insertions(+), 2910 deletions(-)
>  create mode 100644 target/mips/mxu_translate.c
Thanks, applied to mips-next.

