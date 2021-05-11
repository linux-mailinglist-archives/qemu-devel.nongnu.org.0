Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920D37AC84
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:56:59 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVgo-0002kU-3k
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVeP-0007y5-It
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:54:29 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVeH-00049y-2I
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:54:29 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so18077981otp.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rFZbjYExGF9Gj5m8oYEDnEjzAnWEc70HNqNg2/mm+jI=;
 b=BK0PlH/b3lTNPYj0lTzMBDt40u/bvfd8fxXQUPf6+NIQ0ppHQNbKIkzjpj96iyvhiz
 W7nCUgMw1Cqy9E/pKhlb5tGu3Dyn6KkpKse/7lAiYY4pLzI7IfDqfQBw2eRcDoIYhd0f
 cmtv6lDcH4IKEbAjGFD3Aa0979TAyZKdZPmOYxyaal68LjWjFeo5jDusWArAV/JSiebT
 BujR3e2fdeM+YMmHkFAzHXleEdMirtFmhsTa4ZeNSqiYt9v8H0C2U288Oz4Du5pNuP0A
 RUykjlefGIa084oMlt9LMQd9e7TqwYB7akUho2zT7qT7xi9nt0nsKBdyU8xGdY00a3xh
 Sy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rFZbjYExGF9Gj5m8oYEDnEjzAnWEc70HNqNg2/mm+jI=;
 b=JeGrW0Oe/lSsSOaYpQi0sbE5NzipEHOV+sFLUKzuK70G4Oz3EITl1UdXlAAtEVxv87
 5BvwyYCRJUiuyT5GBab5a0PPByYIcCPRlpdmPNnGrIIJ71Irk4V1IxGhSaVlXoF9DvMt
 9HEf9ocZ/J8cFC0zs53/PghCnR+ItIw/5SaD8SMCXZlWme0FYSqj6W6m8w0NEHK/jOWh
 QgC4cUPDIZErFQWmF9qbATnspA5JVev9LxdmTP9i+D5mnqHdLAEHu9BTSMlR1HEE9sgX
 gP7f7+0Zq+r5zP/w5PAbGA4Ascj9tUGYukKcNpXNX/nQg5WuB/WVb8FKFy+B4XX0oDRU
 o6RA==
X-Gm-Message-State: AOAM533T2mEE2uX1o3+xrEPsgkgShwoRbCDUlXZnqlhiz9XWvmtFbxzV
 Hp4or/cWo4R5opD3pQeEe9nWNg==
X-Google-Smtp-Source: ABdhPJx5EqBlOWtkAJh+aGaow8sBE3Z2lCQmUPrMnzIxbJ2bknAC3LrPc6O8msnwP6XmyD2Qcc6ajA==
X-Received: by 2002:a9d:37a1:: with SMTP id x30mr21250690otb.141.1620752059834; 
 Tue, 11 May 2021 09:54:19 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id q2sm2955428ool.3.2021.05.11.09.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:54:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a468e3d-2b48-a7fb-32f1-f280c72c8298@linaro.org>
Date: Tue, 11 May 2021 11:54:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 5:41 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/virtio: Pass virtio_feature_get_config_size() a const argument
>    virtio-blk: Constify VirtIOFeature feature_sizes[]
>    virtio-net: Constify VirtIOFeature feature_sizes[]

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

