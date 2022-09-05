Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB615ADA73
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:56:47 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJ9B-00086p-JF
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJ7j-0006e6-Up
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:55:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJ7i-0000h2-A4
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:55:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id q3so9286187pjg.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=6jKobHDj5FJlqadbDI35YjGmzh+UVNYkrDuyXIMS52A=;
 b=GWRestB3K3FbFSBjYty892jue7d8JFTKk0w1Qp+gGsAfF4AZsEqO+kjyb8af3tFnmF
 1spmBDw24Df/f6J8MDxD1ZqEH5/6/sTeaCXqR0F1vlkAjC0SB2b7POZZyooOosdjnjap
 OfRA0MV563tyFZ9n1iGHMpX0emW1CFh8dEg3ooYqOGx6MOJrtmt+QIbzRLYSsb1Zycpd
 VQwj3crfZrVbCWh10R8eM5phgpFwxYFprg4Iy1gU+PSZMr8EMP0vMFFZ56fWo2AoQfQg
 jhVcoZvk0RIp2vQHdEsyGWQlrtocFycw5FGkXyWrzUzlhUohPjQ9Nfvms5vlwpxUDqm+
 dyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=6jKobHDj5FJlqadbDI35YjGmzh+UVNYkrDuyXIMS52A=;
 b=k/uIiosqMrpKfh7MGajibyWrMAZknR9IXk/h1HCCMTqf1jm8mLsJsEmx++852/iybm
 iq6O2opGK825iK2PKGXIS33T2Vkp91eWcFnQedreTm4I+K0BrwYuj4rj0QJ1Ni1Nbu/z
 cnSrPs5t97McjcfzY6o76HbAfAkmmmk8GWX7GUaFqs83uhGxYEeZyzjrEuuhJuBWvkoJ
 zphhoSsLmXbDu6QG1i0BDBWadrLppOUB+LJpMaak8NBmMMPk24LsXzCvW+HsKD9J6mGA
 I/FS33IlMY8mab90c7OtMXezBgIkogKM1f4fsS5fB9t0M6wlJxQxUcNOsms3njgLH8d6
 VnqA==
X-Gm-Message-State: ACgBeo2WR/7wBjhuEfyL7arMNxKQxmm+ChggFCmpXb/hKGfy5aUSjPCG
 ikchArppPRxFFUi3QZMUzto=
X-Google-Smtp-Source: AA6agR4E1ucp34g9dGz/KaaA0NOq7F9i3kjneqU0tBDWiPJi9miOl7kbgsyd+p54jvdBnedu3f8HrA==
X-Received: by 2002:a17:902:dac8:b0:174:cf17:6e93 with SMTP id
 q8-20020a170902dac800b00174cf176e93mr39400797plx.93.1662411312663; 
 Mon, 05 Sep 2022 13:55:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r15-20020aa7962f000000b0052a297324cbsm8179698pfg.41.2022.09.05.13.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 13:55:12 -0700 (PDT)
Message-ID: <f7a9293e-1158-d5ae-a6f5-31c4a4ef6fed@amsat.org>
Date: Mon, 5 Sep 2022 22:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC] module: removed unused function argument "mayfail"
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220905155532.1824-1-cfontana@suse.de>
In-Reply-To: <20220905155532.1824-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 17:55, Claudio Fontana wrote:
> mayfail is always passed as false for every invocation throughout the program.
> It controls whether to printf or not to printf an error on
> g_module_open failure.
> 
> Remove this unused argument.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   include/qemu/module.h |  8 ++++----
>   softmmu/qtest.c       |  2 +-
>   util/module.c         | 20 +++++++++-----------
>   3 files changed, 14 insertions(+), 16 deletions(-)

Why RFC?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

