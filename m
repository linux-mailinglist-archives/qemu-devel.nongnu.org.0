Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC557274D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:32:19 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMYM-0001qx-IQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUP-0004sT-2Y
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUM-0004nU-SE
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id r10so6590729wrv.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s2Y0M6J0BPnacOShpVucSD3h2YZU0U3E08PBx5ALuXY=;
 b=kVGb+hBKiSpD0c5N/U37svlrMmxwXRNgM6EWWWtwTeY+qaZ6eQ3W9mIDbMEdofQyct
 bzxgn/La19i/Jd2H19IaUtlxK+rtPi91lm4vC7+PrQB2Sn3KC97AWz2S+jVjVeUdDqyL
 ID6ywo/WGOEoEcL9oUmOf+BJZvgMqheW45FIDxF7Q5ZrxFi/NOQkjSfRn1So5TgSs0Fj
 dzAcVuf2ocjuMIyzwQvXAUNgpNZpUE5HjUwWWUlWrrjX4lUbPt5pfK0C0QWbbDGAZt+U
 AjojhcgLSNCOGpNT/By9St7VcsPcTMBP74IzF8edR/SulUHSOVZFYEpSBdMt4cNnzsJU
 vn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s2Y0M6J0BPnacOShpVucSD3h2YZU0U3E08PBx5ALuXY=;
 b=XZLViYk9mZ+j+ZCFwO3C64q9Lwwqh9nBMJ4lP8TAe7VScIfPVPXdRqnIGoEFSFwzW7
 CT87qBqvIfGy9LFxmcyZGqzJ/QzXThuTvQhCqpzcTYWpuUVdWYt8HljUspWD1HHuwIj/
 HaOSbXqzMFa0T03Zb2tBkOfPXzlFmIAHmSJBdaeTM+nSHcrnf0dy8CSb5PvtvSLHQd/j
 dqQ0JB+gi3l+WqQZOycVZ6wBsYtAtpe7lUeinegTvOPmERJT4FA7bgVdTtKb/sukY+MO
 qOtCn440DFNNGPH5IL7itFEGvqkzjzksDwmiX+qLH8nGPavqv0MLj9XeCBXdpU+6zshH
 DVPw==
X-Gm-Message-State: AJIora/HOvkveoN/mcIG1Fn0WTBWIBC2xKy7r++0UH44y9aULGgVGQX4
 eYDW9YADCu7b8oeq43YL4mY=
X-Google-Smtp-Source: AGRyM1t+LRePIisitFiXxRq+6Byf20bFjBBmJ9DScLK93WfKvbUuYg5Jw9CwbOKf6lfZicKRhjYj2w==
X-Received: by 2002:adf:de0d:0:b0:21d:66a1:ad4d with SMTP id
 b13-20020adfde0d000000b0021d66a1ad4dmr24118558wrm.17.1657657688974; 
 Tue, 12 Jul 2022 13:28:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w13-20020adff9cd000000b0021d20461bbbsm9072863wrr.88.2022.07.12.13.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:08 -0700 (PDT)
Message-ID: <4d2bdc57-8cdb-daf3-e610-45bbdb685927@amsat.org>
Date: Mon, 11 Jul 2022 18:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 8/9] misc: remove qemu/osdep.h from headers / included
 source files
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-9-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-9-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/7/22 18:37, Daniel P. Berrangé wrote:
> Since qemu/osdep.h is guaranteed present in all C source files,
> there is hno reason for it to be present in header files. Some
> C source files are not directly directly, but rather included
> from other source files. These should also not have qemu/osdep.h
> present, as the primary source will have already included it.
> ---
>   crypto/akcipher-gcrypt.c.inc                              | 1 -
>   crypto/akcipher-nettle.c.inc                              | 1 -
>   crypto/cipher-gnutls.c.inc                                | 1 -
>   crypto/rsakey-nettle.c.inc                                | 1 -
>   crypto/rsakey.h                                           | 1 -
>   include/hw/cxl/cxl_host.h                                 | 1 -
>   include/hw/tricore/triboard.h                             | 1 -
>   include/qemu/userfaultfd.h                                | 1 -
>   net/vmnet_int.h                                           | 1 -
>   qga/cutils.h                                              | 2 --
>   target/cris/translate_v10.c.inc                           | 1 -
>   target/hexagon/hex_arch_types.h                           | 1 -
>   target/hexagon/mmvec/macros.h                             | 1 -
>   target/riscv/pmu.h                                        | 1 -
>   target/xtensa/core-dc232b/xtensa-modules.c.inc            | 1 -
>   target/xtensa/core-dc233c/xtensa-modules.c.inc            | 1 -
>   target/xtensa/core-de212/xtensa-modules.c.inc             | 1 -
>   target/xtensa/core-fsf/xtensa-modules.c.inc               | 1 -
>   target/xtensa/core-sample_controller/xtensa-modules.c.inc | 1 -
>   ui/vnc-enc-zrle.c.inc                                     | 3 ---
>   ui/vnc-enc-zywrle-template.c.inc                          | 1 -
>   21 files changed, 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

