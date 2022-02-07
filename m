Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B344AB8F3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:44:50 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1Vp-00010u-Nv
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:44:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH1Hs-0003NH-5h
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:30:24 -0500
Received: from [2a00:1450:4864:20::42a] (port=34721
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH1Hp-0008Cs-TU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:30:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id f17so23891552wrx.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E3+oS3KcUriNFQOyz8LYFq2j0Jlv73biXoSD7kuvXUo=;
 b=GiQEU3984SaeHlUEHF+Fcvwp8z9qXx53wZSW5LHjCyhiokkv5/SQ0/ROkOKlzw7BlM
 SNFAztKCMPnUFF5llQMzr+NHvnFt4zwqKFs3jqRMKks5O3cnXGfFptbkHkMzBroddpJ+
 2JKh8x90WaGbEGXoG/xxUCrmsBQgXubJ22tZpjTeamLlhTREwPLvd7yN+gzTn1yTlBdq
 uFC9/VmZX372bc5S1+Vyb0ULWzHiiQJ8fXdAS27uEAZQX96qwGkIRaHjJwLt08CtMB0+
 ARW9AUJGfg/XYb2BmIqKI33eFbSjoijuqkUAgCRzrHq4xZH6vuhzlToH9cGtPzeNUvnV
 mX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E3+oS3KcUriNFQOyz8LYFq2j0Jlv73biXoSD7kuvXUo=;
 b=QbmIY4gXR4KxBiFsmIrMcodYdHit9Yd0vDgezJ53IcS0qSCoKCG9JNM5d9qFG4qo7t
 HpUgvkxfEfCu6Fa5j7pc+KpNhkJLZ9T1lPU2AANq1YaxN8GaebWbNkTl7Kri9LLoKDx3
 NiWMgTtrdhs36ePMiuUmfyR3mlgztk25vOPRdIdzktYytnz4LMgFZfU4RCum/azK1A3x
 Lwuiu+7LxEFni0Xup0kTyFs3OjluxQXm6Jjz0y4U2yPaj14z/W7KtwM90e7OseEk0d07
 QteG94qf2uDu3fdofjttxjqQu687VLaVnMQ/xtAdyBkmLicNKoNCH1p3lbTgKZcsPqBg
 Iwcg==
X-Gm-Message-State: AOAM532xtEInj5xX6e28t73NItwLeNWVNhKi822trpbUZcpzUGPOaC8J
 Lki3owpYhVyy8cCeuwIFFzM=
X-Google-Smtp-Source: ABdhPJwZTfsCtRWKULQ853jJFnFVmERJRjS+PIYdlFdUaD1Z2U0qk8ruQt8fhkmGnlfxerZUnM9Chw==
X-Received: by 2002:adf:e784:: with SMTP id n4mr9369229wrm.215.1644229819692; 
 Mon, 07 Feb 2022 02:30:19 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 3sm2388966wrz.86.2022.02.07.02.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 02:30:19 -0800 (PST)
Message-ID: <a48d6e38-e420-fb34-899d-7d933b384089@amsat.org>
Date: Mon, 7 Feb 2022 11:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
 <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
 <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
 <20220207094717.5f92da9d@bahia>
In-Reply-To: <20220207094717.5f92da9d@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/2/22 09:47, Greg Kurz wrote:
> On Sun, 6 Feb 2022 20:10:23 -0500
> Will Cohen <wwcohen@gmail.com> wrote:
> 
>> This patch set currently places it in 9p-util only because 9p is the only
>> place where this issue seems to have come up so far and we were wary of
>> editing files too far afield, but I have no attachment to its specific
>> location!
>>
> 
> Inline comments are preferred on qemu-devel. Please don't top post !
> This complicates the review a lot.
> 
> This is indeed a good candidate for osdep. This being said, unless there's
> some other user in the QEMU code base, it is acceptable to leave it under
> 9pfs.

virtiofsd could eventually use it.

