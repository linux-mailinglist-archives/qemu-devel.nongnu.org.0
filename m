Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B03DB942
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:22:16 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9SSt-0006fh-Dd
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9SRQ-0005BC-36
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:20:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9SRN-0004s9-PL
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:20:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso7734982wms.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GfBN5KJpyESL2rXXjGyqkzE+vnJ+Y8QT1pKyZpv4gjU=;
 b=sywJOJafMgHO+Af4ZyKZtPRC8IoeSkTIUZebouyJHpK3hr9ezniDwsNexehgWy9Ct1
 j+F29/CaeIF0dEmDU+C34nsNk12OuRpDeOzYtJkEmEQYO7HHTD2GdgNKANMiMP15Bsby
 O1eChtKrN15mWr35+d9ZgUXywQhT9Qv3cIg1eXhmwk9ehcJojd9k4PRhz4xiBUCCIvJy
 vesxQ+iJRD/unXP7Tg6R+k5I15iEDmGutqkJRpLKO3tNG+/FqIvu9opxilpsfB1pVw55
 qrf6q3mmC6KpDmFDyaWdv/Mxk1MWBSttOWCS6g7sAjbGJNJ3db/PyNEzF/+eUN0x3qnb
 L8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfBN5KJpyESL2rXXjGyqkzE+vnJ+Y8QT1pKyZpv4gjU=;
 b=nJFdUim5j3WgjJr/b9a1NN6SdKxmDPHnccRf0mM8b3ARVh0i0fIKfOIu4LtJ5TrlCm
 4Zff4/sdzkkVDa6mdoMt0DGmWw2PLFEyvH7x8n5VBOPr3DGH2Y95xQqAqbW0C2Uf1kFe
 JDpl3SERSPtqNgaZCdRdl7v+8/MEjpi0joDvmhoNVBsgXn3dBqwHoL3g5LzYR6Dih4/A
 TOCge8A7aBV076lUzCpkfjmg/kzsFyku/gcDubH6bVzB9gNq9dJEmwKQtZGMfjxon/ir
 q3EPijH6tOz3k0SoDpkvCL+H+FSYX5kzevCTIG+GAkMUiiR8S5S2z1WAhmBnWUrxKbpE
 nVkw==
X-Gm-Message-State: AOAM531Wcb84m7o5hKFVKdsw0FDlP0DfqBL2BPVfOlqjOHAl/cNQbI0W
 pII9W/ZXoB6JRBMl3BxAjMU=
X-Google-Smtp-Source: ABdhPJxZUrv17U5X2TXjf52iFXyhf3an7f6F+O9z7EMV7X1MqcmIVcuKnV01hC8xw/fBwgkxrN9wgA==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr2949354wmr.134.1627651240341; 
 Fri, 30 Jul 2021 06:20:40 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f2sm1654503wrq.69.2021.07.30.06.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:20:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/8] arch_init.h: Add QEMU_ARCH_HEXAGON
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <980f6bb1-5ec4-cb78-a74c-e928a75afe7c@amsat.org>
Date: Fri, 30 Jul 2021 15:20:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 PM, Peter Maydell wrote:
> When Hexagon was added we forgot to add it to the QEMU_ARCH_*
> enumeration.  This doesn't cause a visible effect because at the
> moment Hexagon is linux-user only and the QEMU_ARCH_* constants are
> only used in softmmu, but we might as well add it in, since it's the
> only architecture currently missing from the list.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/sysemu/arch_init.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


