Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D5739E2DB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:26:01 +0200 (CEST)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqI4d-0002PR-BW
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqI3l-0001gc-Bk
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:25:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqI3j-0002VK-JS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:25:05 -0400
Received: by mail-pf1-x42e.google.com with SMTP id s14so12580120pfd.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eQn9/FXWt73CaPaomH5nQjlWWGHxzFdzkwo4S8w4ZkY=;
 b=KPa+n5umeTlo2k+MSbpnLavyHvrFNK3xFMt7bV2agPTGK9Y7HgnS5Sn1QhxhF6t8Rq
 iTNEFlz9Ha8wwZh7neae3UXOOoZ/dOCrZwgN2f56Ee2LOB0ZjdVuhSZAa/iC2Jawdt/K
 d6nmu0Tm6z4jlqyz11CHuCHMapZLGgov8T2G7gxd9gEY65oLFviEqK4QK4Dz2LKDnQD0
 q9Xp4jbOi0xZBB90PyURdu4wI+wfBYZk/IF+0dg6jIRAK4eLQvCOxhr2MsUzRV2KKrtL
 ZLWalvB/W/nMx4RW/ffUbXHZEkCp0Ln9xa7ogmgJo3x7RrIwMwhA7R/zlQhIGFsuo1rV
 PEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eQn9/FXWt73CaPaomH5nQjlWWGHxzFdzkwo4S8w4ZkY=;
 b=AgsNlG2uaFsfRyrnf21fvS7B2gFb91Y1Xinqt2tqAPsDa0XbqA94INJ0HM909vGf1/
 81OLHWZO3OzB3x4gPfq9iAOdi/BIu02A1T9BX/0StvpDyCdH61KxtBnYjyASD8c+EtFd
 v8UMDwUNYF0iObeatVEvv+QvVJGh2Ufk4tVPXoyLCjcmRUlhaUeElohtzur+RDv8tCwR
 +j2fIUl9iUBmpBeygZlg/2YdyEJy1mg42At2QJZCLmbHfqh/P2Wa4c0blfCHyFDupQeB
 v+H0amh0vXQN9W2NSJpOCrnirdB8eMbW+Wx/E1tBNISpv8wfb73mmTpX/l/UEzdWuBBa
 aWpQ==
X-Gm-Message-State: AOAM531eUoeB6vhK9kkaY2Q/1aunXz9WIkpQr4IIKbuyX45g50YFeVrs
 EwOd/rIs7vKPx6Cx6yZQVulLSQ==
X-Google-Smtp-Source: ABdhPJxl7QWXk+kQ7Qi5vRZWoqq5NrlnEWf4ncP37NsiMP81K8B8eePp0CMJwFQp0vb/dJZA5F1poA==
X-Received: by 2002:a63:dd48:: with SMTP id g8mr18187928pgj.102.1623083102109; 
 Mon, 07 Jun 2021 09:25:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o8sm6288824pfp.48.2021.06.07.09.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 09:25:01 -0700 (PDT)
Subject: Re: [PATCH v3 24/26] linux-user: elf: s390x: Prepare for Vector
 enhancements facility
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210607110338.31058-1-david@redhat.com>
 <20210607110338.31058-25-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c585f97-b28d-c491-7969-42b2f1e2d968@linaro.org>
Date: Mon, 7 Jun 2021 09:25:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607110338.31058-25-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 4:03 AM, David Hildenbrand wrote:
> +++ b/include/elf.h
> @@ -605,6 +605,7 @@ typedef struct {
>   #define HWCAP_S390_HIGH_GPRS    512
>   #define HWCAP_S390_TE           1024
>   #define HWCAP_S390_VXRS         2048
> +#define HWCAP_S390_VXRS_EXT     8192

Probably best to fill in all of the values, even if we don't use them right 
now.  Also, not the fault of this patch, but I don't think this belongs in 
include/elf.h.  This is linux specific, not some part of the elf specification.


r~

