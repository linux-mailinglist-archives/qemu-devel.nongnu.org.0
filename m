Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531374E50BD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:56:19 +0100 (CET)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyf3-0003dv-Q9
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:56:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyd5-0002DO-Le
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:54:15 -0400
Received: from [2a00:1450:4864:20::436] (port=46674
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyd2-0001gW-Kt
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:54:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id h4so1490936wrc.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 03:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IAzkeNY7jUEo/Y2L7S1wlNMSFHvN1JWMv2nLni1VMis=;
 b=DaaEkr7InfErj/sbXwmVfmeNHuthCPw6Rk13qvdwkH3Uw5pFucmQLFjiJyaZXs9cY7
 SuMpjYQtYEbhmfAvRfEjH8xK/EqNDi79/JZR4ODKHFlRawuUDY8bs/na2Cx3wb3q90Dp
 DsfKz6+HneLF3MKBCK0k/XxRn66/wpENLtej4WMJMlipIvH+Lk5D9TAMs7fh77pVBqV9
 Llm8yRkAS/r3vISODYUXMz90r26Nc6qAOBvCh6xRirvPGjl/N6vrhxHIsKAS2oaECoD7
 A3EOla+gsj2byo/OkvKtyThpqXxixqwtI48USwCpSVZ81ZI40QiSXGl2oeiDjDEjGQ9z
 cyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IAzkeNY7jUEo/Y2L7S1wlNMSFHvN1JWMv2nLni1VMis=;
 b=ZHnw61uptTs+4XVcAuAFx11XQhln6AfyKKsVkTijfxZZ+8xkmHkVSI/ccNQIov2uh6
 4vIQwjLSwblOwJDXcfKLQOigOZxOQWc4nN9dl90M17dvgCAk9nErgccM2A6L4PzJYY1E
 qRd2aBRLy4j51NjgNGIsxTuRdHEtiYcsPLhMFjITrpchJdN7cGyTd9/du4djeuMiTWHH
 LJXOJcaLMgIbyY42r5qVo2pZaTsep2JwKZnJ7OvqhgcYfgEMegD7JLt9SP0kaSBkACyU
 F+GBOU+G+R5sCET2ggd0saNEsOi1TGPsb3jNOjYvg5BL5faS32MwKrM2/vHy7BFjB5QL
 kRyA==
X-Gm-Message-State: AOAM533JqgB1qn4Ew+U37/VlDOZeDUPG9Lo0+DDALfS5y95wk2XhOFbO
 zbvI23nLTxiMQW7WXWVnKIw=
X-Google-Smtp-Source: ABdhPJyGppXP5Ukgdf+bldGhQxRNNXjNoiNgPDRnXY7siI5sogZ4zz+FSBv+MtiNwjYerVIUES67cA==
X-Received: by 2002:adf:fb90:0:b0:203:b456:c71e with SMTP id
 a16-20020adffb90000000b00203b456c71emr26748519wrr.244.1648032851440; 
 Wed, 23 Mar 2022 03:54:11 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 z13-20020a5d440d000000b00203f2b010b1sm13204024wrq.44.2022.03.23.03.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 03:54:10 -0700 (PDT)
Message-ID: <7f4e9d3a-78fd-4b48-56c6-418d8516a0df@gmail.com>
Date: Wed, 23 Mar 2022 11:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] build: disable fcf-protection on -march=486 -m16
Content-Language: en-US
To: christian.ehrhardt@canonical.com, qemu-devel <qemu-devel@nongnu.org>
References: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/3/22 10:07, christian.ehrhardt@canonical.com wrote:
> From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> 
> Some of the roms build with -march=i486 -m16 which is incompatible
> with -fcf-protection. That in turn is can be set by default, for
> example in Ubuntu [1].
> That causes:
>   cc1: error: ‘-fcf-protection’ is not compatible with this target
> 
> This won't work on -march=i486 -m16 and no matter if set or not we can
> override it to "none" if the option is known to the compiler to be
> able to build reliably.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889
> 
> [1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection
> 
> Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> ---
>   pc-bios/optionrom/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

