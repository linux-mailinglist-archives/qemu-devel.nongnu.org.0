Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716E26B3B4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 01:08:18 +0200 (CEST)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIK3d-0005ev-8R
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 19:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIJja-0007lz-Gx
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:47:34 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:50680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIJjY-0003Wj-0x
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:47:33 -0400
Received: by mail-pj1-x1042.google.com with SMTP id fa1so553320pjb.0
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:cc:references:to:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p2oaYfHvFcBEgisLiOckYW9y+ETGsCKVeTU07f+xoOk=;
 b=KwAIDT99CP8HSzydYRdNbxww5LdvbCedr6FLAplXi5y9HiCDjZgYNbwZgVBcAoW3RY
 OAKMZA2AtxqmGnb6zcnluQdXRg2L8EouY4h8W+WbKJr6noCBqLLOKHU7vDbV2WQnV9LU
 26WmgpFtBa2FbJb3Z3YjhoJFHKCMuGKLKFbYRsp6xPuuaPfeiNURSGEyhSryzd3keLuF
 KC+ovLwNptOcvEF7iqzZwB9d72QgZogA5Nndxw8lw+9KYXmf0NTGUZM7tZb4QUFcOVU+
 sovEZ50IAE1ziAaa3qLdxcmUw5sjgsV13Jr8D0iejVVcEzNhryr0xKTR78sk6Vgob9k2
 UJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:cc:references:to:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2oaYfHvFcBEgisLiOckYW9y+ETGsCKVeTU07f+xoOk=;
 b=MkaElregJTSx9gPaOQ8CmEG5LenSgR0u/1AH6W+w3yaK6yeF5hHn0WSr4KoaAyz/Ir
 fajzGzDPoJdi5tikQ3RzfVlSLLZxSxN8MR/klGYZNhnlzz+5uHsysUdjsmzlWQo6/q6y
 BUtWWny2MgNcGI+a5k73FFFiQ6xFa5UDiRFS1EZV+SnlzP0f00C2YacD7iMNEuC1zmLp
 waUVLuHvpV7HVrL8PCSHspotNU7j0xcMXd1/8D9RD8lWGwV5JZjv+UVUntchzOydmEax
 icI03UYwpqYYpc7VaTPhdlYmqj26gzzxuN6wcJwa6+oRXqSENp7JT96btCMXLPD7nLOC
 hHlw==
X-Gm-Message-State: AOAM530n7w5yTMq5vFrQGPhR0N6OXgcPq5KvsAenICQnkn939arz494i
 2ckndZzrFMKn/FbS7suWMT8PBw==
X-Google-Smtp-Source: ABdhPJyKcV9oTsFihUXu+ya+/Oog4dtJwaA1HIk+i+3S/iLU7MBDn4/4A8xAULyHC4VNiQmd01dC/g==
X-Received: by 2002:a17:90a:e517:: with SMTP id
 t23mr1294741pjy.25.1600210050311; 
 Tue, 15 Sep 2020 15:47:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e207sm15675260pfh.171.2020.09.15.15.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 15:47:29 -0700 (PDT)
Subject: Re: [PATCH 0/5] qom: Allow object to be aligned
From: Richard Henderson <richard.henderson@linaro.org>
References: <20200915174635.2333553-1-richard.henderson@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <3c8dead2-b5f4-e988-3fbc-7b30183f0f2e@linaro.org>
Date: Tue, 15 Sep 2020 15:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915174635.2333553-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/20 10:46 AM, Richard Henderson wrote:
> We already have a function that can alloc with alignment,
> but we need to pass this down from the structure.  We also
> don't want to use this function unconditionally, because
> the windows version does page allocation, which would be
> overkill for the vast majority of the objects allocated.

Stefan, why are we using VirtualAlloc in util/oslib-win32.c, qemu_try_memalign,
instead of _aligned_malloc?


r~

