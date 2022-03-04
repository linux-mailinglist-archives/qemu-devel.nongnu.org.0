Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0CF4CD77B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:15:30 +0100 (CET)
Received: from localhost ([::1]:45268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9eT-0002I2-1h
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GF-00067j-Ek
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:50:27 -0500
Received: from [2a00:1450:4864:20::42c] (port=36804
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GE-0003RK-0J
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:50:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r10so13064781wrp.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KaT/T8x9Ni3SmsyE6Oq/k49HQXWvj35ylhepAG2XVyM=;
 b=TuJXojP6btSjnMhL2SRrr2BigDlCE1NBArya6zG80/lVzqh/LkDrvToFrDqGUltJBT
 uQ6KUH1nxFQYTxutO7Y8xck3MU0ZMpTsFjtATrjULstLB5718NYB89ZTdE1y82JuFijH
 C1SCjQP3jaedE96ZxRhU0tKulybnzaT/1SF6Ih+VgwP0cAamD/6Nx3zNohXA28+GqEXY
 rd3BJrgYZientD0Fe4WUR07N9Hd2s2H4zNii2XRYOldJtkfqeHJQYAbje3Dnj/RTqOPo
 8NSjdZJTTX0FMZyvjDTSwPloo7MQWDAWkxCo4Izx/WffFaoK84OfnFCdzhfCV/Kodqfw
 4Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KaT/T8x9Ni3SmsyE6Oq/k49HQXWvj35ylhepAG2XVyM=;
 b=kKR2k6Ynel2Q2mdWhNO3q0OjdNVDJZrIJfi4MrcusTfubE/uoRRrCbzEtRvSuwcd2h
 eY0/sbgfIX1QG1N+KDEl6d6fxNtKKT70zULaymyrSQQHIuTj6GsWjbKbvo816S5p43PW
 py6gro0EJ1T2wzRT0yB+D+BJu02tfDwdEbDrkHrv/Z5KiIgj6bDZLQwHTJj7m8AC1QQI
 d6644YnzTpH2IcfGuUdkrUJyf86X1DNAfNmysRFkeDxk533hFIpY/myktXFBsAYwFfps
 onFC0H8qov64RSTOFdB9Okp+0NuW5xDBZXgvkU3Ye51/WUyzN6O5hkIhYZ95x7Bn6uLP
 SQdw==
X-Gm-Message-State: AOAM532CTU6cYy0EFO/6lAukGBR+qAFJX4UXRyRDzNp0t943OsLNjpDW
 xjd+DkYZ5NcHXc8N+mYROk4=
X-Google-Smtp-Source: ABdhPJxEzebMpRMDlLI90OM5SfQZj9osk+nu9pusr7/tfHSuwylI1NBFHssSMDpERg3wEVbzi+biQw==
X-Received: by 2002:a5d:4a08:0:b0:1ed:b997:46d8 with SMTP id
 m8-20020a5d4a08000000b001edb99746d8mr29914802wrq.440.1646405424036; 
 Fri, 04 Mar 2022 06:50:24 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i9-20020adffdc9000000b001f046861795sm4596676wrs.19.2022.03.04.06.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:23 -0800 (PST)
Message-ID: <361f453d-fe49-0eba-296f-1ce516251587@gmail.com>
Date: Fri, 4 Mar 2022 14:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] softmmu: remove deprecated --enable-fips option
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220304115657.3177925-1-berrange@redhat.com>
 <20220304115657.3177925-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304115657.3177925-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:56, Daniel P. Berrangé wrote:
> Users requiring FIPS support must build QEMU with either the libgcrypt
> or gnutls libraries for as the crytography backend.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/about/deprecated.rst       | 12 ------------
>   docs/about/removed-features.rst | 11 +++++++++++
>   include/qemu/osdep.h            |  3 ---
>   os-posix.c                      |  8 --------
>   qemu-options.hx                 | 10 ----------
>   ui/vnc.c                        |  7 -------
>   util/osdep.c                    | 28 ----------------------------
>   7 files changed, 11 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

