Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6844A5AD6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:05:11 +0100 (CET)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqyE-0004B1-9B
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:05:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEqui-00018Y-IY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:01:32 -0500
Received: from [2a00:1450:4864:20::436] (port=34583
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEqug-0001gW-K6
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:01:32 -0500
Received: by mail-wr1-x436.google.com with SMTP id f17so31236131wrx.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BLLWFeM9WfiiYnd9gOi6bSZTkP5h1e5vO6qhOxxL2dg=;
 b=dOEwSKZFZV0Neeswwlt0dUptd7MDZ5cYu5qZuE9kqv3YCgl3bJE/0BzBpqV+MlYmuV
 sSxM0wUJCecdqMSBkL3LZ73gDNxnO3vrm5PBOnbi+lcWe1wC9xgHNWli6TnOr+qJzOlA
 pynUMPfoFJIoF+67uXufmCTgqRdhjX+N9ZVaVu8gCXPEN8cgcqmHPPqMTIEKUFfcdZPp
 gl0X9blp5sC9ueHHK2okr7dZrxH0i0gxRDqilzFYcfpu4FhN5CMxIdQ5LOb2k53OoZFW
 vNUgRVOrraV7wnetlo0itOtBc5aLdOaIlCTNFKRcB11ydj4ae3lilRvH1gbTsIjU7cpC
 rUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BLLWFeM9WfiiYnd9gOi6bSZTkP5h1e5vO6qhOxxL2dg=;
 b=FnPtW/jUfB2CjM+fTimd3x5tJV1ebiHucDE1acpp7oTwyKwbxmmn9Uw+SALi74UzVc
 H/NIopAoVv65tnYns/dI5SblNiaqetekHHa0qk+uzE4EJXvN5e/DdKNpNhcV9xdbyzW7
 Z79+jUkrRILQ92oluBY7v0mfhJB84ePyiyhP2ErWjXOEW4GR/Pk0gyUKChhijR5lzadI
 hiW8hab+dieUI7trGvec+kW/IBr6JGmfUfV5nilPJAA4RsFmSsZYQdqPOvi7fUsRY7qj
 50XunBbu2fIvOU3Th3lW3NPnPTL6wyzuwljj8HbgEY+Vau0HJMtrXw8OwFJFKOQDW68/
 2xSg==
X-Gm-Message-State: AOAM531iHlHEu26ljXOnw/wpRlAO3G6zYQCpfxxnKYevMQXHF2SA6iCb
 5pGO15aPjPMrNkuzXNPqWKI=
X-Google-Smtp-Source: ABdhPJxyVl77BbCmAUZ0xJX5TUzDvTkCmI7fsV1FCHvX9JN6/g6lFCvwpQjYIQRUcnvNAClkc5p9Ug==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr20716346wrq.41.1643713285785; 
 Tue, 01 Feb 2022 03:01:25 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o2sm1847696wmq.21.2022.02.01.03.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:01:25 -0800 (PST)
Message-ID: <581bf100-ec9e-2f5c-25d9-b4d3fae85cd8@amsat.org>
Date: Tue, 1 Feb 2022 12:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220201101911.97900-1-thuth@redhat.com>
In-Reply-To: <20220201101911.97900-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 2/1/22 11:19, Thomas Huth wrote:
> Support for CentOS 8 has stopped at the end of 2021, so let's
> switch to the Stream variant instead.

"Run 'make lcitool-refresh' to update the generated centos8.docker."

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/dockerfiles/centos8.docker | 4 ++--
>  tests/lcitool/refresh                   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

