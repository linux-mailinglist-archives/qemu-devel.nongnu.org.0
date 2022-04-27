Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D375117AF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:47:00 +0200 (CEST)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njh4N-0005vJ-7u
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njguD-0006hH-Sy; Wed, 27 Apr 2022 08:36:29 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njguB-0004pO-GU; Wed, 27 Apr 2022 08:36:29 -0400
Received: by mail-ej1-x633.google.com with SMTP id r13so3124181ejd.5;
 Wed, 27 Apr 2022 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8aYOi6zu3EMmdB08SrkdELTfa7LPjG3qiH8qrXAwHZE=;
 b=e2205Iaj3NYr0Xnc2JOuwaTlP6tpuHYldm0WcUO8G4OhmJwpFtFfXjLEvIeP1LHKK+
 +5dMBmo9vnes/N+trX1JfDhfug2rtxguXZ/kAgJxQAMVaUiFFoEUwz6nkJTGSXPfmiE6
 /OOytYJcgUe6qfnanDuj5UKfgSDIsqyjpXWTxbNYyvulRoK+eQxl6lBN0z+xSVk4CfaO
 S3ldGWW5ByM0V+w2wiMEomgjnH9h0Djm6jjXtL+avOP01mNdwpsIZXgRr8LJMox7acDh
 sJtDncOqM9TSjYeL+Z10pUFEeUSoIOY+seF0OvB7K93y/qh8wLB8DXIr6G0j+7CMuVeQ
 0SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8aYOi6zu3EMmdB08SrkdELTfa7LPjG3qiH8qrXAwHZE=;
 b=63+qVSu6GU8liSp5m9wlsTtYLwVV3v6lXq6x9K8p+P5fikOtoCgSpJQW+s3AF3OQQ3
 aH/p85u1cA8rbJPkWhx6IykzOT44D+seW3jfuVn3+yGLFP8treHVuvPULM0fVcx3788g
 8a51ScGNAe7qw3dbjWOjZf7oign9sZ3o0Y6Df1A6Z5RdguNx/Lp1YjWD+LiHcUV2/7eZ
 M0VCMageMx8vD4Xd7rkO1T97ZaqmzOxslr13aVhtoTwyGvYAA/bUI5EUr8fxDAA5PqLU
 RqxDQ6brRZXvfGJti4eXDdQFwG3QV3Rt2dCOkn4Hlq2RF+mb/9hNcKlSZt1089d3+ahQ
 BM0g==
X-Gm-Message-State: AOAM532Tgje8DRjWEZSO7AJ7mx9f8KMyR7qe2rAieHp3wxQ5UqRw8I2G
 iHuF8jAMwz8R/D4wtFkZSu4=
X-Google-Smtp-Source: ABdhPJywQBoRZHtjrb4p9Iedvp1/Iz5sDywspTfzlpijAlzfP+DTS08WboIcZqtAvDtlOnV63dDK8A==
X-Received: by 2002:a17:907:7e82:b0:6f3:ae0c:9127 with SMTP id
 qb2-20020a1709077e8200b006f3ae0c9127mr8499332ejc.575.1651062985338; 
 Wed, 27 Apr 2022 05:36:25 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 l2-20020a1709060cc200b006d3d91e88c7sm6669705ejh.214.2022.04.27.05.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 05:36:24 -0700 (PDT)
Message-ID: <5d3049fd-23c6-c287-fcdb-c673c4eede56@redhat.com>
Date: Wed, 27 Apr 2022 14:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/26] qcow2: remove incorrect coroutine_fn annotations
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-3-pbonzini@redhat.com>
 <20220419180643.hhzredj3qfazd4a3@redhat.com>
 <YmEwzOZ36npM1QZJ@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmEwzOZ36npM1QZJ@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 12:24, Stefan Hajnoczi wrote:
>>> -int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
>>> +int qcow2_flush_caches(BlockDriverState *bs)
>>>   {
>>>       int ret = qcow2_write_caches(bs);
>>
>> Both of these eventually hit qcow2_cache_write, which is not marked
>> coroutine, so these should not be either.
> 
> coroutine_fn may call non-coroutine_fn, so this alone is not a reason
> for removing it from qcow2_write_caches().
> 
> There must be a call chain where qcow2_write_caches() and
> qcow2_flush_caches() are is invoked from outside coroutine_fn.

The main problematic caller is qcow2_inactivate(), which calls these 
functions via qcow2_mark_clean().  Another one is 
update_ext_header_and_dir(), called by 
qcow2_store_persistent_dirty_bitmaps(), called by qcow2_inactivate().

Converting inactivate to run in coroutine context would help.

Paolo

