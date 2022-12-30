Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8EF659874
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEn5-00046g-HW; Fri, 30 Dec 2022 07:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEn4-000457-24
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:47:14 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEn2-0004YD-C3
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:47:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id t15so10993355wro.9
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y+yoK34uG+J6q2iz9r2h4UDRXRhJEGcUjLqaALJX3wg=;
 b=JA63JSJyImSg28Kiy6U7zJk87c6BdbQayCsrd/HJkQmrq0fDkn49xQ2bLBupquuDrH
 Vavr3IWRHoAlcIrkqudqBZ9NglQzTsyBFLp/WAdPBSlFTqg8CkdWqazVFnqVHORHxPDO
 GdGgIrN7YorCK4FtCkLkZe0S9kFW5gvvFbSm10RCJ/5ffJnRVpJZipM2ddfTSk+Lqt5Q
 aJlPtww8Z8xpVyYf3M3ZEjws2HNiASf10NymzjOVi+S+U+kXImpa5U07VvpKYfI4RX3T
 ayxJGRT7i7TeWX+1EaBjsmRXw7V1qcn0TDzEpGhYZ+GbmwNMMyUJYWiwWW/hXC9TBK74
 44/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y+yoK34uG+J6q2iz9r2h4UDRXRhJEGcUjLqaALJX3wg=;
 b=6QUwgyw4xowRw8+0ZahRnmyr+Tx/+Ps0XiK5zD+pCEemNyysrf0vv7YDZc1tnIDZ4j
 IAckffhY75olFO6MrHj9c+0iDHxApxPst6mOB/3Gu6C+zSxKV3LXJBrDfO1CioZIq6iO
 idU5T+yMtcpBk5qwBOBU84dp3+aUcuo/XwTyI5NfQ7F0lAQNneHcR62crzhoxAP1G4dc
 3R06IGYt1EKG0I4kh3sGLKrpOalvhYLF9YjnQDILUaOw44IxnWj/IEAP//SccfTUY9zh
 QMQdtzMTlM/cCMimkTLs1T+G08qR4XCNbrflPa0scpe0Tm8k7vy4IrF7KEf3IycjGDfz
 1odw==
X-Gm-Message-State: AFqh2kqbc6MDp1Fs09jPGjyzLEut78NPJDk9Xrwe60sBLQP3iijNlQ2j
 CIEQAJ1Fwt1Q3ztK9P/vKg2BXQ==
X-Google-Smtp-Source: AMrXdXtbXWbrX2SwuKous9pOQM6LpGFnc99BHeXUoj5GdSCcSiZngpM1LIHlIOBDPdZaOe5xeOXfVA==
X-Received: by 2002:a5d:40c2:0:b0:272:ab11:29d0 with SMTP id
 b2-20020a5d40c2000000b00272ab1129d0mr20906862wrq.52.1672404430327; 
 Fri, 30 Dec 2022 04:47:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b00286ad197346sm7436878wrw.70.2022.12.30.04.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:47:09 -0800 (PST)
Message-ID: <f3af0901-ec45-a3dd-e0c2-9517775df8b9@linaro.org>
Date: Fri, 30 Dec 2022 13:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] i386: Deprecate the -no-hpet QEMU command line option
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
References: <20221229114913.260400-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221229114913.260400-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/12/22 12:49, Thomas Huth wrote:
> The HPET setting has been turned into a machine property a while ago
> already, so we should finally do the next step and deprecate the
> legacy CLI option, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2:
>   - Rebased to current version from master branch / adjusted version info
>   - Dropped the descrpition in hw/i386/pc.c (already done via another patch)
> 
>   Note: The "hpet" property should now show up in the output of the
>   "query-command-line-options" QMP command since commit 2f129fc107b4a, so
>   it should be feasible for libvirt now to properly probe for the property .
> 
>   docs/about/deprecated.rst | 6 ++++++
>   softmmu/vl.c              | 1 +
>   qemu-options.hx           | 2 +-
>   3 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


