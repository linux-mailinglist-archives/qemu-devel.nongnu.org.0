Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2A3F75ED
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:34:01 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt2W-0006lq-65
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsnR-00050T-Sq; Wed, 25 Aug 2021 09:18:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsnM-0007ro-U9; Wed, 25 Aug 2021 09:18:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4571533wml.3; 
 Wed, 25 Aug 2021 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mgba0qHm1su0PIoZy+PHDtpbdSqYz0mjoJfWCZRGVT4=;
 b=eCfRFYYFTHWeSzv0QWqPuMITGLHBszNR7lJKFoGYQVbZ+BbaDXaGqL/8HV8fwVlB/c
 Ft4aTV0KMFEZdPFhiv0ePDPkvAz3X9j+wz2mfKgJdwV1j7uL1oae2JNPh/XXvyl9T/+y
 CbZ/RRCft7M0xiv8Z8iSBcAO61epZhmQUOfLCiijObIYHtKh+bj6VwYolpEelCsu1wZI
 SVAAHgL1mewNacNyTfidqPZgUy4oAGrGi65GCeFjGUvxXRgxqIuFWJMohwqOvupSHPDv
 Blp+fy1UK4y9Mi2mS1dBKi5QTo53XEgscKNxap9kYknnSLxsb4loUqO9mqPOGcW7K3uB
 UE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mgba0qHm1su0PIoZy+PHDtpbdSqYz0mjoJfWCZRGVT4=;
 b=YztSrdv/HNK4n3nvqeXhFiYm/5EimlUkAv1h5a0Y8uEz9Ec/F7zkUuddMnduTVjMlw
 vA9k81lb4aLQebiamD2xq2hrbVe9/0uUO7e+JrEg2VFcWUFssUDXwjdB3eU9aZVpBLNl
 7toHDg/uio2P+LLiaNQpOOep7YUMgkljdFLm9AUhznWuMVFfRuVCQ/t8biiSwtjJkOqh
 eCn1i2ssYnXu0EAXgX/5O9Z319DpowfRew4JHOzh11qM3QyNHqYB8vEZyiMpZkddlvas
 Y6B8mTodLlR5xZ/AIDJ2nVLI4f1boFLqTN74Eth9PPI2a98zmRT/K5p0Z7pBkWBJeW1v
 1azg==
X-Gm-Message-State: AOAM532LCfMzsA5IFVJUxqyCKZJxY9lp0pfyWGpx24i+cXq8vbvfhyw7
 GgbzkpA0SMfzQuGMhNV6HB0=
X-Google-Smtp-Source: ABdhPJwvrdzqDwpeMQxfjzYOOPDGq5ZQgxTgYBwBI7syXWljjnSEER49lfOIRiIRGIWkKKxaH2xaLQ==
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr1138710wmh.145.1629897498808; 
 Wed, 25 Aug 2021 06:18:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z8sm20969600wrt.77.2021.08.25.06.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:18:18 -0700 (PDT)
Subject: Re: [PATCH 16/19] target/ppc: Move dquai[q], drint{x,n}[q] to
 decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-17-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <50da43b1-c06c-b1f7-5d5f-66d462124384@amsat.org>
Date: Wed, 25 Aug 2021 15:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824142730.102421-17-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
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
Cc: richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 4:27 PM, Luis Pires wrote:
> Move the following instructions to decodetree:
> dquai:   DFP Quantize Immediate
> dquaiq:  DFP Quantize Immediate Quad
> drintx:  DFP Round to FP Integer With Inexact
> drintxq: DFP Round to FP Integer With Inexact Quad
> drintn:  DFP Round to FP Integer Without Inexact
> drintnq: DFP Round to FP Integer Without Inexact Quad
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  target/ppc/dfp_helper.c             | 12 +++----
>  target/ppc/helper.h                 | 12 +++----
>  target/ppc/insn32.decode            | 23 +++++++++++++
>  target/ppc/translate/dfp-impl.c.inc | 52 +++++++++++++----------------
>  target/ppc/translate/dfp-ops.c.inc  | 18 ----------
>  5 files changed, 58 insertions(+), 59 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

