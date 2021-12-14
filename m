Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F1474DEC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 23:33:23 +0100 (CET)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxGMM-0007ik-GP
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 17:33:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxGKr-0006uS-Vu
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 17:31:50 -0500
Received: from [2607:f8b0:4864:20::1035] (port=42918
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxGKp-0002ng-2P
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 17:31:49 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so17345872pjb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 14:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CGmkoqBBuf98qLznQ8b13M2AtrDXnPOwAva2Yyy67nc=;
 b=ybtO64iIWuxnwWBJvGopReB/xg55auObYrWJoyksAns6rzeb9WOiiullxGQ35dBmz8
 ZIs5VVfWGmcsGAa3Gc3tKk5fh5D4uUO58msbCae4eEe7dnD+jwRaGM/dzDE/SLtsMuG5
 sf7sNPF1n0kQ2r5GpioDhwIALoyQsepkI4U4TprL3vj6Hk6uMBeuAEkfpmcEx0K7N/vb
 DxqXtT9jdy0WbUrZ1+WO9KjBOsL9wgmA7TrdJZmStR6JKbryav8VZKL72rYVm9GDgjJ7
 mJXv0PK4LzVQ0ctBfMkuXPCs1TtodmNSxcKrWJbB9ajQBA2lV+Shti2HTGjrBiX7mR8r
 aUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CGmkoqBBuf98qLznQ8b13M2AtrDXnPOwAva2Yyy67nc=;
 b=KM+aJ4mQzF3hKawRALTMbZ7wduXjkB8hMmU87wYJYLhwRFq+wNJegdUteO1QdQp59e
 MgunlxWtYPrG0JnPWFk4AzitZlt3MEJTttLXMnLkXU3YPnkJ/dQZ5s/oFKAI32RAgHHn
 Bljq/aZ10ZdsCRWkKItW8cfv9lkTWAvvJ+dZkyyfUS2unpcQIu1aZG3WUoya2/btjcN8
 +HUAn7Qm8Hvu23/aZgoy35nh0vCoGUW5SnCHluMS/xJbodayuQLgXT4ibPTUk0Gy9IdR
 DeKBgxAET4kJGnN1wZrCGt+bP1lREJMUIUush3d8de4NPYXeHTzhUEnDbYoSXnxrK4cY
 NK9A==
X-Gm-Message-State: AOAM532u+0vLTUEcYpmlkAJmDXOKWnHg8i/5QynDH/zhW0nXRES5tx5h
 zXRnViOZgZ1d4sQaRJXBo+ULAw==
X-Google-Smtp-Source: ABdhPJz9oZUaAfSkPobUvbDC8hrRki/z2341GI/EZLwlo9GD2ej8A0draLuJCkRYmB+vuKtJtSD66g==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id
 r4-20020a170902c7c400b00141deb41b2fmr8471864pla.44.1639521105048; 
 Tue, 14 Dec 2021 14:31:45 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id x16sm94751pfo.165.2021.12.14.14.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 14:31:44 -0800 (PST)
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211209152117.383832-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <791dca68-86c1-46fb-7309-36450724f9eb@linaro.org>
Date: Tue, 14 Dec 2021 14:31:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209152117.383832-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 7:21 AM, Stefan Hajnoczi wrote:
> The following changes since commit a3607def89f9cd68c1b994e1030527df33aa91d0:
> 
>    Update version for v6.2.0-rc4 release (2021-12-07 17:51:38 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to cf4fbc3030c974fff726756a7ceef8386cdf500b:
> 
>    block/nvme: fix infinite loop in nvme_free_req_queue_cb() (2021-12-09 09:19:49 +0000)
> 
> ----------------------------------------------------------------
> Pull request
> 
> An infinite loop fix for the userspace NVMe driver.
> 
> ----------------------------------------------------------------
> 
> Stefan Hajnoczi (1):
>    block/nvme: fix infinite loop in nvme_free_req_queue_cb()
> 
>   block/nvme.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions
Applied, as the beginning of the 7.0 development tree.


r~

