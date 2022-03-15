Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74E4D9B9D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:50:45 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6dR-0008Jk-2h
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:50:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6bY-0006X9-Si; Tue, 15 Mar 2022 08:48:49 -0400
Received: from [2607:f8b0:4864:20::1031] (port=44778
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6bX-0006ZV-F2; Tue, 15 Mar 2022 08:48:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so2307655pjb.3; 
 Tue, 15 Mar 2022 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bqIaqSwpz0Lyb+niWhJLUXrxjp9Ld/mmeff0WgX7J7s=;
 b=c4vI5mAdb7zJyshOCxpx8aKIdWBZfyFDE+J6HqqV4wVOzjqVsDcA0p8nqBlfGoqJIz
 Sle74XNJ+mZowE/T9KgFJob4ok97HOUwrn1chLQRSAiUzyJzHKdFeYEv957MPyGtuzD4
 GPP3Cb0IZksH7Ov7UNP8W9kR6Mkqa/d0QaEJuoV5bca9LGypO4UMYImUOEJtrAfaVH7s
 K5cp/VvG76CeERvHN2zHn8JoAaaxZwkkLxPFOogBYZs5GvJJrT7J7BuwfLtnvR90ca3a
 DQBwn+MfVHp3N4Td7JDDPKCyiodDRj1qfnFqNGCGJpcSmBxYVu8YA0Z6T2Dn0XLkVdMy
 H2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bqIaqSwpz0Lyb+niWhJLUXrxjp9Ld/mmeff0WgX7J7s=;
 b=zyCD7rWcYQzULqh4LwVQ+zdIFzFANK0wEsb1rZXAUKF64YZ9X+v2zX95XLbJrzYcMG
 e7XqhTahRJj4hmQhAp/Ob3vcfliSgeNeDQiaKnexyqVaY+i5yfv8bey8RUT1h21Lg2yV
 wHnmM5uHgYfiXbxW/ewS1a6z7rfGXdr806W4RXdl02A6tiB5bACNo9wjFTt8hDAfKHjE
 mVHhkTgf068yU0QgxJtEBD52qzSgBbvmV3JXZSutEwXmKcXaD159Y/4bZ8iVgT9oBbe9
 x5AdGdMlBNiZJu5/DO9GmDE1d5DA+Mc+WtzLYnsTCWbW8DfeA/ngdREP8r8A3PYWXFmA
 9mtw==
X-Gm-Message-State: AOAM5315CAj3zRSr5l8DpNdHSa1d15Fmb/2/Il9DqhbThIbsDkLhnYG/
 qiXXtPmNCwpMkahyXZMiTSo9p6tfGqM=
X-Google-Smtp-Source: ABdhPJwvQS6Myx4eekxw0ol92TnoKC7PiDTkpefuOicIPa1kpswEJoKXJNTU+IyChBbO3Ws6/CrBIQ==
X-Received: by 2002:a17:903:192:b0:151:8df9:6cdb with SMTP id
 z18-20020a170903019200b001518df96cdbmr28462423plg.20.1647348525445; 
 Tue, 15 Mar 2022 05:48:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a621a05000000b004f79f8f795fsm14520780pfa.0.2022.03.15.05.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:48:45 -0700 (PDT)
Message-ID: <5ac6656f-6f31-8b64-c5d9-820f0a7c5360@gmail.com>
Date: Tue, 15 Mar 2022 13:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 00/22] host: Support macOS 12
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 00:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Few patches to be able to build QEMU on macOS 12 (Monterey).
> 
> Missing review:
>   0006-hvf-Fix-OOB-write-in-RDTSCP-instruction-decode.patch
>   0013-osdep-Avoid-using-Clang-specific-__builtin_available.patch
>   0014-meson-Resolve-the-entitlement.sh-script-once-for-goo.patch
>   0015-meson-Log-QEMU_CXXFLAGS-content-in-summary.patch
>   0016-configure-Pass-filtered-QEMU_OBJCFLAGS-to-meson.patch
>   0017-ui-cocoa-Constify-qkeycode-translation-arrays.patch
>   0020-ui-cocoa-capture-all-keys-and-combos-when-mouse-is-g.patch
>   0021-ui-cocoa-add-option-to-swap-Option-and-Command.patch
>   0022-gitlab-ci-Support-macOS-12-via-cirrus-run.patch

Queuing reviewed patches; IOW all except:

    0006-hvf-Fix-OOB-write-in-RDTSCP-instruction-decode.patch
    0022-gitlab-ci-Support-macOS-12-via-cirrus-run.patch

Thanks,

Phil.

