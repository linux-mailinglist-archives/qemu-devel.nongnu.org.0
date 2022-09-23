Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768855E7E4D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:24:22 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obkXM-000658-P1
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obkSp-0002OA-VU
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:19:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obkSh-0007JK-3v
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:19:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id rt12so355393pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=C53a88ilPMMq8FH6gkmHjUB/f/adhTK42oyuIQJx8Oc=;
 b=HgY80YzjC3p9fPdhLy2d591W1XzGU+8R9C0SeyXLwf4SvdaY6x1eEs9G0ZqAv7goQu
 HZ9gNHNlYt8hUcb7vUiivHaFjXWhnAQdFpFCXAH142+b5tLWRK0f1tWYPnqlkOEaLIIm
 wlV6qLgX6e8UEXW+HaK8KVVhKi8lsP69TUsBzpmd8X9Vz7rsBfxoi8/6/S9VKr5I9TSS
 KDKRL5QSfFa3fhH42J2d4VHugbTdJJYJVg52L6x1WIaZS9+El/e2nY/JtgDQAppzG4U6
 JIl1G9haNb9EK8KqM7zRJadj30s1O8hqljeVOquLOZq47d435QT6vmVSBWHUYuPi46/v
 HP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=C53a88ilPMMq8FH6gkmHjUB/f/adhTK42oyuIQJx8Oc=;
 b=MRhOgdW4ONmc1Inloz9mibgnnp801VFLjVnrDb/flCdsxqCaRTbDU7RNqy2mlH57hU
 NDJNX56Fe96wR51N/+nBBWTy1wZbvTiy9GuuuExAda+tmyPGEsQLCWozAHY91+IHbek0
 YFqMQlnQVfGp/yA/iL6rnh++FxtbZqJEQ/YWtvsPBlNIxm39a/i7CY2ZU0Xkhy4u376N
 7g6RQTyv0oEb4zC7X3mrpRaOpRSaIBcHbdSFDseF4m5u2YbcKVZtxrBMaQdCwkv4nz1O
 UzEJNIpTepcYlFtKu2kfb2FJ8ybGGXx4reyIef5eIHAdXriHAFFz0OwSoilBHXP5+Jju
 XZRg==
X-Gm-Message-State: ACrzQf1kK2sLE6yCr8NPsz+Jd3satpg96P1toca87mqP+XyoKXFMOHXg
 m2esRx1w2STFeSfyGn8NA2k=
X-Google-Smtp-Source: AMsMyM6gcvD6yWQbaS1lDXnRGMSSpBmjxZx96sSeRxjtlP/Whz08lhhcnqX5UqfCN+lcxvPqC0yhsQ==
X-Received: by 2002:a17:902:904b:b0:172:cd04:a3d3 with SMTP id
 w11-20020a170902904b00b00172cd04a3d3mr9204759plz.173.1663946369526; 
 Fri, 23 Sep 2022 08:19:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090abb0c00b001fba4716f11sm1741861pjr.22.2022.09.23.08.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 08:19:29 -0700 (PDT)
Message-ID: <51a886ff-56ad-39a5-ed78-270e96209a77@amsat.org>
Date: Fri, 23 Sep 2022 17:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 2/4] module: rename module_load_one to module_load
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220923145131.21282-1-cfontana@suse.de>
 <20220923145131.21282-3-cfontana@suse.de>
In-Reply-To: <20220923145131.21282-3-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 23/9/22 16:51, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   audio/audio.c         |  2 +-
>   block.c               |  4 ++--
>   block/dmg.c           |  4 ++--
>   hw/core/qdev.c        |  2 +-
>   include/qemu/module.h | 10 +++++-----
>   qom/object.c          |  4 ++--
>   softmmu/qtest.c       |  2 +-
>   ui/console.c          |  6 +++---
>   util/module.c         | 14 +++++++-------
>   9 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

