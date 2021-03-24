Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE1634810D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:58:04 +0100 (CET)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8hf-0006EX-K9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8R8-0007yD-53
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:58 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8R5-00077E-SR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:57 -0400
Received: by mail-oi1-x235.google.com with SMTP id i3so21818923oik.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLqwlxU7CZCY5ek5xkutck9ENYJfgQuoRSUzp2B9UG8=;
 b=UWdsO6LUEsc3vlTVAbVyCkr5k5Kw4AZeVulE3hrwjxpZtsQt60GkWYzhCPfD4VS2B2
 Y/8kUuA2qp12xCp5fpCCvRMCG80bFvPtMiTuOwz3N1H6TBcIuxwFMd4UNdBeyBtY5wuZ
 FsajeCdABZ4LUGc/DwW0fA2pYxXwtYcGZhcakvZEK8KmvPm9PpSXr0fdy7UAXCpHUXyr
 9LAh89NZ52Cic3n+vRNaamQyiOt97dXHE4aw/EKBcO6o9PJ94wPDR6vMSbSbsh8zzw5x
 4hDqynF9qEW6Y+DoeZsmvEq/t59gMwKswGutJpteG5lGTowbDzIK0hDBfDPulhFZPJcQ
 Vxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLqwlxU7CZCY5ek5xkutck9ENYJfgQuoRSUzp2B9UG8=;
 b=t/bVdNtNhq5OfVjDRhgoOUmP7KD6yRW4tUtwWwT3CZz4/cl2oMv0aQXRjssC3NmlfE
 FDHAKrHXSznVLz8L/MerGPFSuibjTbOaUnUuQ1C3R9r2qY932DXAt96cdblG5XJVKikf
 FxB+Sw+F38cbMhbih6TBwo2mOdKoar/NzDrn9A2NT64wnNKLUd3AmEoAC93PUM94MN5g
 KqbgwyHRqM5iP9LidkRXG0lZpHRJTq+AV7fe49T0rhEaMmj4MXD0GeZ2nbNzRg39W3Og
 7xIpcNgWOYivwF5htRbr1EwOqPYqbKO5pUXld+pahN9YK4c4yxSP41tzqtBWKg6mdS5K
 xabw==
X-Gm-Message-State: AOAM532h9cNU6etArO6sUNE3FeaJ+PnYhTXT7f09LkeyLVVPMYUsMEWK
 M/5w6Wr/rtHeHT32v6I/qymU/Q==
X-Google-Smtp-Source: ABdhPJxGJmftW8UFPQDo9qWNhuWdaPLD0/kbfpmB7ofKpRTXbznyMV4Qi9M2DdYCwtF/NVmcqCGZAA==
X-Received: by 2002:aca:d514:: with SMTP id m20mr3309229oig.47.1616611254706; 
 Wed, 24 Mar 2021 11:40:54 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t14sm692495otj.50.2021.03.24.11.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:40:54 -0700 (PDT)
Subject: Re: [RFC v11 14/55] target/arm: cpregs: fix style (mostly just
 comments)
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-7-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cd74616-bc10-831e-ae52-d90390f94ea4@linaro.org>
Date: Wed, 24 Mar 2021 12:40:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-7-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpregs.h     |  54 ++++++---
>   target/arm/cpregs.c     |  60 ++++++----
>   target/arm/tcg/cpregs.c | 253 ++++++++++++++++++++++++++--------------
>   3 files changed, 241 insertions(+), 126 deletions(-)

Again, this should have happened before code movement.

r~

