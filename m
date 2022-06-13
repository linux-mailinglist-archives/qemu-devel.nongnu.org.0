Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E7548740
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:58:38 +0200 (CEST)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mSb-0004oy-L9
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0mOW-0007av-Rj
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:54:25 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0mOV-00038Y-3m
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:54:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so9205857pjm.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=nHJVhnE9ITPoEkRn2jJu6Akvnw4FhB/RBzEVAwrZNYY=;
 b=jLOnW4vvy+7rnedI3UvibpOr7H4Lp9pwo78dNdJXRa85A0cHE+bIjtZRisvPrJLMYX
 kJieV1hk8UBfaylVOAhQgJKGURC7wg41xl1QL1bWdI9yuHWrRSCESDvr8bEJ3DXptdzw
 XpjdzOQaCEmRihXCk7xa+OwNraykTnLQD3SATeus4wMt9eFfIDUHUPMhPEiU13JrWn0g
 i7bAmDbwUT8gYdjptcSRjH6aiItfFV88Kc9s6CC6psxnXUFVtSE/P4PO4FabxmXmXN0B
 W2z8/vZOYtxe/UDLcGTTvq8s2PZmQKeHk1jgH3Tt7cAMstsn8QiZ3Ffaaw05tCvOwLWO
 mfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=nHJVhnE9ITPoEkRn2jJu6Akvnw4FhB/RBzEVAwrZNYY=;
 b=Bjpu0IKOfN6Cm2f58e68UqbH91qlCX+J5Roukv7gk5ufk6gQ6/LGD0BE2UeZHrwj7r
 TWBAw3/nEJLoGo2PLufbHtROS1Wfxs5w35vlITAA3/9sKbqK9Ga81Y3OpMaTpaBdeJmg
 9+wu4zlFRO+feLAZwepUXuVb7igzVGVn3VBF16NfOhKeyOpaDPrz9O2YVQ9qurjr/z6z
 nGehguQTcdkPi3glkc30DSMMgfgEXdT+KUlUB+vT4+HytSEfKcq/ujLpbgRILmL00dF/
 3162iWjhifL900zdjr/V3/Q7xMTzQfsPz/UONKA3tZZ2nhOeQ/jWm+uRuOuFy+3/Nltd
 3wOA==
X-Gm-Message-State: AJIora9MvlUrQEe3+kX/fOGk1oxLZ+fbV6/UUtvhMORyBKyPiWToWONG
 zMGl2oXyKsQJsmURGxW1snoHDWy3XhNJ0Q==
X-Google-Smtp-Source: AGRyM1sD3tyn8G3zosvdRQwgK8NEK7opcw/arRNKm27jqBsG5w/THdyvq7J9m433qMbuCAwQHvwxJg==
X-Received: by 2002:a17:902:ce83:b0:166:42de:29d5 with SMTP id
 f3-20020a170902ce8300b0016642de29d5mr287593plg.123.1655135661614; 
 Mon, 13 Jun 2022 08:54:21 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ab8200b001616b71e5e3sm5283754plr.171.2022.06.13.08.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 08:54:21 -0700 (PDT)
Message-ID: <ba8e6d19-f49a-a367-918a-2f05c8793864@linaro.org>
Date: Mon, 13 Jun 2022 08:54:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
In-Reply-To: <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 6/13/22 08:52, Richard Henderson wrote:
> On 6/13/22 04:36, Gerd Hoffmann wrote:
>> The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
>>
>>    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 
>> 21:13:27 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
>>
>> for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
>>
>>    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
>>
>> ----------------------------------------------------------------
>> usb: add CanoKey device, fixes for ehci + redir
>> ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
>> virtio-gpu: scanout flush fix
> 
> This doesn't even configure:
> 
> ../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.

... or, rather, corrupts the source tree on the first configure, so that any retry fails:

	deleted:    ui/keymaps/ar

	deleted:    ui/keymaps/bepo

	deleted:    ui/keymaps/cz

	deleted:    ui/keymaps/da

	deleted:    ui/keymaps/de

	deleted:    ui/keymaps/de-ch

	deleted:    ui/keymaps/en-gb

	deleted:    ui/keymaps/en-us

	deleted:    ui/keymaps/es

	deleted:    ui/keymaps/et

	deleted:    ui/keymaps/fi

	deleted:    ui/keymaps/fo

	deleted:    ui/keymaps/fr

	deleted:    ui/keymaps/fr-be

	deleted:    ui/keymaps/fr-ca

	deleted:    ui/keymaps/fr-ch

	deleted:    ui/keymaps/hr

	deleted:    ui/keymaps/hu

	deleted:    ui/keymaps/is

	deleted:    ui/keymaps/it

	deleted:    ui/keymaps/ja

	deleted:    ui/keymaps/lt

	deleted:    ui/keymaps/lv

	deleted:    ui/keymaps/mk

	deleted:    ui/keymaps/nl

	deleted:    ui/keymaps/no

	deleted:    ui/keymaps/pl

	deleted:    ui/keymaps/pt

	deleted:    ui/keymaps/pt-br

	deleted:    ui/keymaps/ru

	deleted:    ui/keymaps/th

	deleted:    ui/keymaps/tr



r~

