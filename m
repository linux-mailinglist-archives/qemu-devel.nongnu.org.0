Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900D4AB24B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:17:55 +0100 (CET)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGouw-000557-Kn
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGoto-0004Ov-Gb
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:16:44 -0500
Received: from [2a00:1450:4864:20::32f] (port=37425
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGotk-0002l8-AQ
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:16:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13171505wmj.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 13:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0TkYk6+Vr9rXFjmzIuMGZddcDRDN8JFULyIXK3m75mw=;
 b=hM4D/48GwzjaFxdHm8K4w0+s9C5a3Hanf0swEbWNO/3WYN/MHb4OzmKW7iF0EaI64J
 l6cE6P25w+GWMEuXR6mVIuMYDi7quEP7C6Trb78DET7Mx3u49p4t7ExezTxkwvhtMlwQ
 3QdzH0EaartbQobFfQQkDOosyOI+4uCylpS+njekN2eUy+BRaIYUzTft2oq/1Z5d4llv
 yrZXOEBW+WnS1kWlZ0qNdudP8mnftpe2mkCfWepy45E//oUA00f4X8ezndLQzqkV013+
 Lf21dOI7fmko4qgPOXIdEDE6xh/ZIyKVkrpV2qrWZKXYBvGcf+1QHdoY/gS39vr9Ycsv
 X43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0TkYk6+Vr9rXFjmzIuMGZddcDRDN8JFULyIXK3m75mw=;
 b=RFFpfl2S+au31yfpdy5hysWTWRnIsmGNSJUSuN+FbJXxqImCvxnKthLxtt/ElghQf9
 JYJEqe+aPyRwg7RsS3qr+Wfs84s/liusT6wifv6TMM4Hwdqr20TGIvvHiRbbocx7cVvg
 VHgDL4xmf6TD0WjLabkqjf1qf8h85XfoVO3w7QhKAhAFPm0fxVdnj6bLr/0Yc42E60Ns
 RqyayOnfdz3P+GHGiiNCwNoT/F9ToFmbJTlVEUgb1Hw4Bws7NW2Ct+rg0CEoy1j/SmM6
 ROeq4GGYf2OwLhZ+n6bNfyq9dWVCSX0J+IEKdQRCrDlsCZWD+vdKTYj0hEf3D0YCcs3l
 82/A==
X-Gm-Message-State: AOAM533wineT58MmcZPmhDiEP+CNA6kxTZtgm2GD44j0tEOZZ1nPuWuI
 FTnNfgnUfA18puNaW8sE0bfaQMI2/+g=
X-Google-Smtp-Source: ABdhPJwnl1fCJS73C+MpQo18aqb3TvVXJ6lnCCfhl6ON8P5XFgxmp9a28aXSg9pMFjUFUAkvbJx0nQ==
X-Received: by 2002:a05:600c:4f06:: with SMTP id
 l6mr8168230wmq.126.1644182145039; 
 Sun, 06 Feb 2022 13:15:45 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j19sm17560292wmq.17.2022.02.06.13.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 13:15:44 -0800 (PST)
Message-ID: <4106f0d9-06ad-e71d-1192-1bacd925a3f4@amsat.org>
Date: Sun, 6 Feb 2022 22:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 01/11] 9p: linux: Fix a couple Linux assumptions
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-2-wwcohen@gmail.com>
In-Reply-To: <20220206200719.74464-2-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

On 6/2/22 21:07, Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
>   - Guard Linux only headers.
>   - Add qemu/statfs.h header to abstract over the which
>     headers are needed for struct statfs
>   - Define `ENOATTR` only if not only defined
>     (it's defined in system headers on Darwin).
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> 
> While it might at first appear that fsdev/virtfs-proxy-header.c would
> need similar adjustment for darwin as file-op-9p here, a later patch in
> this series disables virtfs-proxy-helper for non-Linux. Allowing
> virtfs-proxy-helper on darwin could potentially be an additional
> optimization later.
> 
> [Will Cohen: - Fix headers for Alpine
>               - Integrate statfs.h back into file-op-9p.h
>               - Remove superfluous header guards from file-opt-9p
>               - Add note about virtfs-proxy-helper being disabled
>                 on non-Linux for this patch series]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   fsdev/file-op-9p.h   | 9 ++++++++-
>   hw/9pfs/9p-local.c   | 2 ++
>   hw/9pfs/9p.c         | 4 ++++
>   include/qemu/xattr.h | 4 +++-
>   4 files changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

