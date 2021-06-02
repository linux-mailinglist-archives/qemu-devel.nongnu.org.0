Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0B398ECD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:37:43 +0200 (CEST)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loSwA-0003vi-Cz
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loSul-00039M-Pm
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loSuh-0001FT-Sg
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622648169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LvgVBQ/AlE9Q3rCM/ofCGi+Bxxj3iA69qcyvLym7BG0=;
 b=RzgTj7/n0CR81jXG6YoNfK+BJw/CfbmUtaPO8i8PAzDaijZ+oZi/wjhhzOK6Ko7c/QSEZR
 39SK/hfDEyfe74Kf+5hR1o8igGrtVgAD6aMrLH/m2z/18Pr3bUqJl+DakSP+9HyGVv8wuf
 Jze2nr3WUSJ0cR8GFNTUZhdxHKihHTI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-0gB51gW_P0isTCKVqUfLZQ-1; Wed, 02 Jun 2021 11:36:08 -0400
X-MC-Unique: 0gB51gW_P0isTCKVqUfLZQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso1638072edu.18
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 08:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LvgVBQ/AlE9Q3rCM/ofCGi+Bxxj3iA69qcyvLym7BG0=;
 b=O63CvnSkEAubMkaWDzwoISEUwT57wSaWCT0EdUImIY9l7ihfjacsE5OonWICIPDdH4
 M3m0wZaqz0LysCRXN2fuHytlM9YW5sWMqb54/MuG1TrwdhgMPV5bnMfhFk10cxgA1KE5
 O7Hgoaht9+rmqzCYhSY4fJ6lJqAu7Ipo2o6zcyWgpsaOGPeoj0FhV+Xhhpz4TVy8yjiS
 UyN7LTfEot9GCAXFT9FfBGS9RyM7bfUYiyl55vdnh3txauyZaUX1Nki8FHS6o/4xDef0
 dW7OqbOKLoLXoCmMCk10bfYuIfjBijqPefF8HPZskFEBsrrCEGG7SOFfvil5S+MnjHwl
 db0g==
X-Gm-Message-State: AOAM532RWExRlqDQAMhfcimYeFNGUA9UCN32ncgUvIvMik6+W9T+7jnq
 6OYXpSa3xBTrB1WOAvXrBTIfUCiFtLshvfOgGOvV2BiDGMtVrMdEeDHaNoAIaB+Ag53RUOgP31L
 N6elPxegSLIKRDEQ=
X-Received: by 2002:aa7:d2d4:: with SMTP id k20mr38410537edr.384.1622648167067; 
 Wed, 02 Jun 2021 08:36:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzttdsanoLbrMma25J176yLWrX7FknQH50/wGHoBrYjBr4rYNGnWAJ6rjb3OP6EL0wPq3eoBA==
X-Received: by 2002:aa7:d2d4:: with SMTP id k20mr38410525edr.384.1622648166960; 
 Wed, 02 Jun 2021 08:36:06 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id e12sm177390ejk.99.2021.06.02.08.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 08:36:06 -0700 (PDT)
Subject: Re: [RFC PATCH] gitlab: work harder to avoid false positives in
 checkpatch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210602153247.27651-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6c6136a0-8ecc-06c0-fc89-d98b8645a072@redhat.com>
Date: Wed, 2 Jun 2021 17:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602153247.27651-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 5:32 PM, Alex Bennée wrote:
> This copies the behaviour of patchew's configuration to make the diff
> algorithm generate a minimal diff.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/static_checks.yml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


