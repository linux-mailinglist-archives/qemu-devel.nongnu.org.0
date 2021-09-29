Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B041CAF6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:16:28 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVdBz-0006nr-BH
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVd8l-0004id-O9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:13:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVd8k-0005tb-BS
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:13:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u18so5500390wrg.5
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rmgm4HZcZ3zZOm+hv4pfl35aBfZjgvTcCgGk7iU8N44=;
 b=maKFm6859yNmFvZY5zrjfz4AWzA5zDMvqp5FzDrYYtE37cYTVlZ4nJYSB6szXlbaXg
 2RXGJKdGiz8fF550gykvrKnvGuyabua8F/ysRWwoiB8ux/09DpbY5T7WPgCARI4DYpz6
 9rj7m6Mu2l1j+MuGFCS16L7J7kHRgXYgR1ibPuhZwxZQ2sjq8o9qDsNm58O2ZMw/+gnJ
 BG0fcr1CrX/PWfu9/jCGVd45g7ZvTsWrUgvQPIBTFYS17FJJ7i0PK+/1AxIoY5mEBXZL
 wGoGWiYWpzuS3D3J4olNWlndH+nk4/SGHqJmd+Y47JNes/VUVuXCO9mXwR/pXx8CTIDh
 GNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rmgm4HZcZ3zZOm+hv4pfl35aBfZjgvTcCgGk7iU8N44=;
 b=qO29ZOo+gEfosepsxCko0AyE41ZDT3te9MjlnsV0sO7lqagWwlcpGQD1ty8o5mnx9d
 23Gx5QArUFvWjKm1s9PayZ+IulaGlgFtclShDIP8wN1zGHtJUx0mfnG/luQPNedBmP1i
 qIFXGz4oAq5tgYG20NdRs+TdulmjDITWWdVomcoGbnQv6/HUMwPJ7BBbORomRayLDlbr
 soTJ5B4s3VwOsWWa2KonjtWdppQyqHG7YWrwVd/0MgXnq21auJy/jm+4wkaPr4SkAaVz
 zfXITSjiOJf8sThh0K7gFTUx7d6EBX/5sJ6KKI0DIqQEwKvej7flA6OzcBCRnI8hdnkK
 aTVg==
X-Gm-Message-State: AOAM530hJZlNkEh9gpjq+2v86nNKyVTkkVW5h4xap+6W8V1vzMU2iuv5
 eH1tSNe60NbX/YSGgKoC37cebvTB8IA=
X-Google-Smtp-Source: ABdhPJx4o6gFx81F1yI4AjvRhLYGhWG6DhP0nGjCi1+epr+sISXXcOcbeXAoDwL6vNiSa+N6QEoVQw==
X-Received: by 2002:a05:6000:18cf:: with SMTP id
 w15mr1243631wrq.314.1632935585001; 
 Wed, 29 Sep 2021 10:13:05 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 20sm2399937wme.46.2021.09.29.10.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 10:13:04 -0700 (PDT)
Message-ID: <47fd30ff-0d78-6c30-05f5-bfeba5250883@amsat.org>
Date: Wed, 29 Sep 2021 19:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 10/30] tcg/loongarch64: Implement goto_ptr
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-11-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925173032.2434906-11-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 19:30, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target-con-set.h | 17 +++++++++++++++++
>  tcg/loongarch64/tcg-target.c.inc     | 15 +++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 tcg/loongarch64/tcg-target-con-set.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

