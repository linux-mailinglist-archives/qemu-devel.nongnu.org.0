Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE952BBAF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:06:13 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKJY-0006BZ-Ow
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrKGY-0003J3-JL; Wed, 18 May 2022 10:03:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrKGT-0008Kl-7U; Wed, 18 May 2022 10:03:06 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kq17so4056002ejb.4;
 Wed, 18 May 2022 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sevoZjSwcsu7xRPZK8PHqYy9y01D6W93HkSYEflxZKY=;
 b=knoIVyw3qoP2G4FwI/uMG7Os5uHiSriZyETKHLdy3/l7EEHaXKZYiLEANKabP42N5m
 wAh4FnBGVwnrMtCC0aIJQnEgIxXBFiyPbvZ609HTC8jJN7nKCHV0DnqSNl/HCX1xhs7q
 PRYY9H2FrTSLA03lB02kDuyfGAnny4JEd++HzFjVNnSZdzyLFkwCsX6q9dIt2sLHlOvc
 YWOa4gzPRW5bv9kUW/eEScV5dsQytvTNsCSK/sJDbVE3NZeM8UWRAWN4XhYY3UrwDdBd
 1TiUl4WoE9qHOOw8U1Aby+OfOGGoLj2sZ9oyVzMhUWs71P3s8HLHarhgVku948R8mdAA
 jX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sevoZjSwcsu7xRPZK8PHqYy9y01D6W93HkSYEflxZKY=;
 b=GbU/YGNAHvvIBC+Ha/tajfgHcc/mSj0XJiDdMfzrmNae6LR7RuWgVSXlD9IP2HTNVE
 ZpMFmhhuFqn8rlzufykkTQqgiYXTSq8Z8W5t8R+LZKqdDs3h3ZD3GcZSrvDmW1j8Ar1X
 Hoh/svwdeHFZFA4a/VVjpzQZBhmpfg2hAymMOpCPrtlMLSwm9nrskfyBjKl2Gyvqeepl
 Z2lIxL9VfsaEw0rCUgQe8feUk8hgUErVKiz8xbezxiAl9uuEljJVp/ItnVLdvVeZG5TF
 f/+0DKISYkfGPgzZST7/Q4zgCQme/43ROBNl4ugL7i3dd1+yqTOuG0g7OOlvgjopmDwS
 Hhgw==
X-Gm-Message-State: AOAM5313WwiFUP6thX2rEBfJnxFnz2xintOigdNmokK67fLFN9AB+suj
 g/i3gzC5un76k4j6Ex2P4bE=
X-Google-Smtp-Source: ABdhPJwqSowKqAuDyX68l7CVXmV+F4E853t5UvtFaFQH9u2ifvhI9ONP9SNGwbhqDou6gd3L3oW9pw==
X-Received: by 2002:a17:907:7f8a:b0:6f4:d25a:7fb6 with SMTP id
 qk10-20020a1709077f8a00b006f4d25a7fb6mr24943984ejc.586.1652882578204; 
 Wed, 18 May 2022 07:02:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020a170906530800b006fa8c685af1sm985481ejo.163.2022.05.18.07.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:02:57 -0700 (PDT)
Message-ID: <50934e19-f66e-96fe-29e6-cbe34a256334@redhat.com>
Date: Wed, 18 May 2022 16:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/18] block: Implement blk_{pread, pwrite}() using
 generated_co_wrapper
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-2-afaria@redhat.com>
 <0a27845b-0b9a-992a-3360-a7cf16892a08@redhat.com>
 <265a7c93-ed2a-6464-eeb4-c396970c418a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <265a7c93-ed2a-6464-eeb4-c396970c418a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

On 5/18/22 15:34, Emanuele Giuseppe Esposito wrote:
> +/* For blk_bs() in generated block/block-gen.c */
> +#include "sysemu/block-backend.h"
> +#include "block/block_int.h"
>   #include "block/coroutines.h"
>   #include "block/block-gen.h"
>   #include "block/block_int.h"\

This second include of block_int.h is unnecessary.

Paolo

