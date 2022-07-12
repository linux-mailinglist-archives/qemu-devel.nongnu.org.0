Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B457285A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:16:31 +0200 (CEST)
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNF5-0008Mp-Nw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNA5-0000u2-27
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:11:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNA3-00019k-J9
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:11:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id o8so5421126wms.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eN052Hkv67zritsFaQPBSx0lPuNQMc4eVhsvbxQxwr8=;
 b=X1nnVH+Vv/OYrX0gMTPh6k/bZDw69kuzCxNmtlGqD1rrfrxm5FlpPThXtGYFEkNCFJ
 tyIO+xnbwL7endyEZPcaG6v2aTffXlMsNVsCG4I8oaqYclKVszbkGTZiN/GOIOXap6+6
 D6xMsOgTA+X01lj9weooKSx4LDMs8tSK1VDaBA1sKxJQYHBq9ZTPo1frgvXHblmuwP7Q
 ZLUgW1+uDf78SBPZk2PROFsnxuuAnQP4OYOk+V68ivKq1V2ATAxwbRPPlmmSiY0TpF7M
 tSuGJH0XjCJcbhT6k2zrNo9D+UHRh7BwwkpIzkvFEZNaqD4X1s4/Jdwm3K9czk5uI9Hv
 Nn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eN052Hkv67zritsFaQPBSx0lPuNQMc4eVhsvbxQxwr8=;
 b=g9nfY7FgU8QD15CvPscaiN+ygkFggW5CGOJZkNjkeduUKyEc9LSWB2ZGEfLgdPfObt
 BpD+/PB7M4TgiaT42gSDNPhDoTeQ95PzigEhytC+KHy0vt85nbJoPO/claEjDnVVosDK
 BjHHoaqi7xinsR1ECwXf2ZoSaNdGY77NC1ImMuzbTQWKDdzTYhpTKXrKMMcDx1ABQAC8
 Wg1prXHEiwJaCktCsEayCMMH2ie86xVnssL7sR3SdWgdpUc0P2O+3YnJe+YlRsVPyfPw
 P0v18p5XWaUmfEw/Y4qyn34hZNlE9Wg6+BnowbKs5Yy3EgUUwQJiNBP9/KcotFAqnv6G
 V03w==
X-Gm-Message-State: AJIora/xcNwD/lUFcypga1Rxb0SKosAqgA6y393XhS5Tn/aqWrArFSx3
 Wlv1s1V0RQRWA7StWCCed3s=
X-Google-Smtp-Source: AGRyM1vmmDf/FXzioza4AlDY2L0irCgsXWddg1XvFY20KPqp9LCSGZxwpx66mlhmB1Nrqw3DpDXzeQ==
X-Received: by 2002:a05:600c:190b:b0:3a0:ac8a:7c2d with SMTP id
 j11-20020a05600c190b00b003a0ac8a7c2dmr6051552wmq.205.1657660274257; 
 Tue, 12 Jul 2022 14:11:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c9-20020adfed89000000b0021d9233e7e6sm11027557wro.54.2022.07.12.14.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:11:13 -0700 (PDT)
Message-ID: <55891da0-4597-4667-fb64-86af21f04861@amsat.org>
Date: Tue, 12 Jul 2022 22:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] configure: Restrict TCG to emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220706153816.768143-1-thuth@redhat.com>
In-Reply-To: <20220706153816.768143-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 6/7/22 17:38, Thomas Huth wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> If we don't need to emulate any target, we certainly don't need TCG.
> 
> This should also help to compile again with
>   ".../configure --enable-tools --disable-system --disable-user"
> on systems that do not have a TCG backend.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [thuth: Re-arranged the code, remove check-softfloat from buildtest.yml]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure                  | 20 ++++++++++++++------
>   .gitlab-ci.d/buildtest.yml |  2 +-
>   2 files changed, 15 insertions(+), 7 deletions(-)

Thanks for re-spinning! Queued via mips-next.

