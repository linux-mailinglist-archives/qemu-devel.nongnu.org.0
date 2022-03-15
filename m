Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1C54D9BDC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:12:01 +0100 (CET)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6y0-0000Z0-6V
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:12:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6nH-00043G-Sq; Tue, 15 Mar 2022 09:00:56 -0400
Received: from [2607:f8b0:4864:20::1031] (port=46016
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6nG-00019C-5c; Tue, 15 Mar 2022 09:00:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so2335974pjl.4; 
 Tue, 15 Mar 2022 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6ZI+/pDVqgXSylsqmzbhSIeu+6cIOSV08rPd2PArRVs=;
 b=bJLVKYjr7Frferw+CXMKxxhzdMaNbtcZsgOPRfetXstfXc0NHNtgG76W9ELA5fAuvt
 s9fjnYiWpH/Cu+kOI/ABXvTpI1XPJmdsVW0a9H+Usl9aImgeBEtTuSxxNqY2ene33jBn
 9D3oqrvE1TPwHi7b9HULFGCQLxHP7O10pjyFvmGzMrerdakQrfZeGI4CIjuSsOgVyPIT
 TFnslW5p/ynjZZpkEB9A1L2ll2Ra9DOrWbbilbPf86qntprfkIDPpLgwmJXZY9+It8ky
 ylGcwFJfGG2CB4O28N6BUQAMFCR12/NJ5UV1OneVQdb2wBEcwXCMqitMHxuaK/2aZDDy
 yUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ZI+/pDVqgXSylsqmzbhSIeu+6cIOSV08rPd2PArRVs=;
 b=JNLgmIUyfrkNPwq5L7VB3sLv8mY8kATtcH4hfbm0UloZb+Epx3A+R3ovUpLgZFZAzc
 0L7xJHd///Se8te08EnmAuYcXe1q7du33VjQmxGtwmBiedWpYj/hK9M0zyB983EeLFAx
 aOYcZxCHHPGTNUZbHr/vFOoa0EMxdNGusx5RuCSwEOGj0HJmlIfJEgOM06hVV1JMBr6S
 LFoAM+fFf+VvapNWlnO69l58AuFCFZJeQkCR4yHw8wxiKU4Hx8YAUl0foexdigZTVQ5x
 CzttYol8uuk8KdLgciTBfzSZA4QRlrc8w8UQdBUSFjIT3KRf5PFEgMzwrTa9zZkwEQIY
 I2bQ==
X-Gm-Message-State: AOAM532QOPZGfIHelJL/9pvcAbVwnGZ0PpVm/jafMDpQlbPRZwmP5086
 gnQCp9jK0r6JgaPmmuOKEGE=
X-Google-Smtp-Source: ABdhPJyiQJI0i16LpDYryarVsNU8vx9N4+bwlOt5PJU+1iEtTuQd2yUePhCSygKKqubWSqd/My0f6w==
X-Received: by 2002:a17:90b:1e05:b0:1bf:4673:7e7d with SMTP id
 pg5-20020a17090b1e0500b001bf46737e7dmr4580827pjb.10.1647349252188; 
 Tue, 15 Mar 2022 06:00:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056a000b8d00b004f75395b2b4sm24499572pfj.55.2022.03.15.06.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 06:00:51 -0700 (PDT)
Message-ID: <df46b3e7-78dc-3d7a-4191-3c4e5ccea791@gmail.com>
Date: Tue, 15 Mar 2022 14:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 06/22] hvf: Fix OOB write in RDTSCP instruction decode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-7-philippe.mathieu.daude@gmail.com>
 <097ec9aa-ad9d-960e-502b-0f038ebe8a31@gmail.com>
 <CAFEAcA_3ZHXT4qcs29P5iFqoLbJCyTwe80kPeO3pZrRLEQ7p0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA_3ZHXT4qcs29P5iFqoLbJCyTwe80kPeO3pZrRLEQ7p0w@mail.gmail.com>
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
Cc: Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 13:58, Peter Maydell wrote:
> On Wed, 9 Mar 2022 at 10:20, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> Hi Paolo,
>>
>> I forgot to Cc you. Could you Ack this patch?
> 
> I had review comments on the version of this patch in v5 which
> still need to be addressed:
> 
> https://lore.kernel.org/qemu-devel/CAFEAcA8yaBOD3KXc-DY94oqzC5wkCENPkePgVCybqR=9NmdQFQ@mail.gmail.com/

Thanks for pointing at your comments, I totally missed them.

I'll let Cameron address them.

Regards,

Phil.

