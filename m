Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947B48FEFD
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:12:08 +0100 (CET)
Received: from localhost ([::1]:36378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Cop-0007NH-Fn
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ClQ-0005dQ-Um; Sun, 16 Jan 2022 16:08:36 -0500
Received: from [2a00:1450:4864:20::52a] (port=39568
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Ckw-0008VQ-3B; Sun, 16 Jan 2022 16:08:36 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c71so57281506edf.6;
 Sun, 16 Jan 2022 13:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uXKa5IQf2ankP6OGR1CBy5BD9P5argFvH3z+K3xkLhc=;
 b=OesrA0K211n6WJxcgb22M4omrtnXe6of6TYKAWW3ABUusgS7f+5m2blIXIH9O2gnhu
 y7ymP5op5TBURz0wvHo+PbXRZUYWAwsW4aTMMG/vOyDMMDqqcTgzZzvaL4zqld4Nov0N
 uk2An0M4jOnMTmOLqK/CplOXZoe3FUYm+gFTcwgv8+ibYPW6uazo/2HVUuxGKTNjvYnW
 Swv/K8yOBL01SuH9RS2kNJ1CVdWDz4O/lLpy3xSRInk+/xi1FgZy6pw8uKG6/58BuBS9
 eYZclePbUVmKNVBhmruzUB1D/GgsTWjfzqR4kw8a5oWFREFcrQ7g3f0abshFcAhrCmdl
 sriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uXKa5IQf2ankP6OGR1CBy5BD9P5argFvH3z+K3xkLhc=;
 b=UH8lLyaLrmfOjdOi0mTQ0Ngllb8oFvwJbXnWPcRKKXpjLDedmWaavFh23XTnOYog0I
 3Xvo0LlFwVfXgRPbPdgMReFc80Rh6BdL8fZVpPMQuvJvGEYbchDOxyo4KKQ/+TK99bkQ
 /SKt/FCJKsjQOPxXGsUudKrRTDDCc3F2O+6+gN4DgCG7OAzWZiihGepBLMeaJHYf6V93
 gfQO8vIzVZSC0cjr9ZsNgzjt+erTni1xPVR5RGSqvCEpmK/VI9B3Nx3eQdRn3YTMm/Vb
 Scg26XyeV2A67VFJlu2OsCyr5CdWLIib7bQv+XNMkr5IHasRqHDcuIUiv1vRVyf7J9bG
 AchA==
X-Gm-Message-State: AOAM533XHqw5rVEGJ2rsY7W2RLA/+HAN55CUjaM53j859RO5jNSheXFb
 KVpK+ydYDtfBAIGEG5iIgQg=
X-Google-Smtp-Source: ABdhPJyGt+1A/bhLxn4/INBqvNca0ib5cB0QKUGjhs9zzqjP3SmuYzEdrLfS+IGeNJQWgjslFa3Wow==
X-Received: by 2002:a17:907:da1:: with SMTP id
 go33mr15100452ejc.662.1642367264257; 
 Sun, 16 Jan 2022 13:07:44 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id 4sm3719525ejc.168.2022.01.16.13.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 13:07:43 -0800 (PST)
Message-ID: <710d0fe1-f1cc-1864-d8e3-404c0c3f47a2@amsat.org>
Date: Sun, 16 Jan 2022 22:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] softmmu: Provide a clue as to why device tree loading
 failed
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220116114649.40859-1-shentey@gmail.com>
In-Reply-To: <20220116114649.40859-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 16/1/22 12:46, Bernhard Beschow wrote:
> fdt_open_into() obligingly returns an error code in case the operation
> failed. So be obliging as well and use it in the error message.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   softmmu/device_tree.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

