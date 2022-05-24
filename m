Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F3532A4E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:24:37 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTaW-0006R6-D7
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntSqG-0008OK-VC
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:37:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntSqE-0001N2-S6
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:36:48 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 31so16092661pgp.8
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l0PpHrECB9JnE54ijLCLCnzjp2NCKOde8VVM6+y+qfA=;
 b=U7a+5O+xQmLAA3VTe6unf6mA6zVR222slcjEcSUFGFDP2SjxEADrlU8Y9dilAJ7kXs
 k10Qb8sWCRRlhHRoDwWTlx7YEY5LGAfdGhYLVDEQ8tocbU9BNRV7XFvi2ypgNvEkIVEF
 ZdbNiCu8U3grg2t8knBjFhOlLz6J5VRWjx75C5D2zyZcLG1aUenPmmstrQRhVE49Zb/m
 /1LipZ2a3QcIT3l9qPgA8Re25pfkA0+XYvERnk+XNYjXHjpNtm60ZN5R7gcllTpi6PIZ
 gg32CojIMZSTrop8BrfJ3WcLlnk39GL2Dy+Dni6Tbuq6lDDxB8K7PJmqtYi29YkRW0+E
 2l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l0PpHrECB9JnE54ijLCLCnzjp2NCKOde8VVM6+y+qfA=;
 b=KIKfc2jETlX+7x5Ppim+wT4a2kGrAzBEkUpjLyK4NQyo1FOsajKmUTrGvDoWYw6DxS
 focRI+hF+Tbv7c8hc88ffTr1//NVCLPPclL0/M/+pER7gGHNw4jJlYEdzPR2WANaX+TW
 PVXih2M0PNLjK8DjdU4xfuMopsNKzC3sP8B+k1Qu2UddBe1uuAD/IBX0T8wcHRkf0vI0
 m3kOCWOqD0RmeWUNYcwmJTjqvhHwFDPxFSP8Mubx3jz25iEgCNzCWxdhdcLC1T/YigsE
 DlP4w3n5Xy5uhmHgxrA/Tb5r8ugNy7mGC9SYYN3Xuv6EeQwaocgR+MlWni3kN4Ozx7p3
 n51A==
X-Gm-Message-State: AOAM531UjU5s8QMaicXBFTR7euIfjYiCRWY7hg6KWapS3n5mhqDmtWWG
 9/d5xRCN5uM9FEnNSn+nYundJw==
X-Google-Smtp-Source: ABdhPJzez6upm+LvIKxaCs6kMTdkbr08FB/1A0cznMT+nh1egTr1b9BQQzqXuGeL0TebM911H5UUtA==
X-Received: by 2002:a65:428c:0:b0:3db:822e:2163 with SMTP id
 j12-20020a65428c000000b003db822e2163mr23542266pgp.466.1653392202414; 
 Tue, 24 May 2022 04:36:42 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 v16-20020aa78510000000b0050dc7628184sm9351457pfn.94.2022.05.24.04.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:36:41 -0700 (PDT)
Message-ID: <b58e044c-e577-7c13-350d-43f3a3ea4686@linaro.org>
Date: Tue, 24 May 2022 04:36:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] .gitlab-ci.d/crossbuilds: Fix the dependency of the
 cross-i386-tci job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20220524092600.89997-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220524092600.89997-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/24/22 02:26, Thomas Huth wrote:
> The cross-i386-tci job uses the fedora-i386-cross image, so we should make sure
> that the corresponding job that builds it (the i386-fedora-cross-container job)
> has finished before we start the TCI job.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

