Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA105BBFF0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:50:24 +0200 (CEST)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1F8-0006dl-Ff
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa111-0002DO-62; Sun, 18 Sep 2022 16:35:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa10z-0006Kw-L3; Sun, 18 Sep 2022 16:35:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q62-20020a17090a17c400b00202a3497516so4297802pja.1; 
 Sun, 18 Sep 2022 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=OWYjF5bQHQQoqt++zkniTDdtHOcIwlSrBpIeMYzqBkA=;
 b=b6TUXgdctPWBjRgO2ehYHYQjUJspM5OtCRAiMUax9hMSfkPYJ0GirrSY9pBzMLXTkh
 80kFxekKHfWgDOJq1lHJ8YpLGe3OeNFK648obnRSh2jjdbiVUmpK4OGP/4AAP0BxmnRZ
 7V72wMu1bp2N9fQ2BPa9qPZBKgyluVUtCJc8FoGYTkKuQclT+HrfduRN3GhwLR4OrGuM
 e4Esl+tz5oBgf9gTYpPrYy/NbMvlm5nA6uaVHDm/NIB99XfQbSYOOFjfaVRRoFweV5lQ
 y678H7/MGVwEOXX9aepQR0W43JTwYQupe35gDnhujr/yqg/Y+0t1JvlmDL0yst/g08aj
 UNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=OWYjF5bQHQQoqt++zkniTDdtHOcIwlSrBpIeMYzqBkA=;
 b=qsdf9cYfKPEph/Si1dJu5qs2sJXdV23xU3UnCiS9OQ5g5QvsSALeukS8bvjDEJrHsB
 sRjcXCUHSTVq2TziXAAYHUuWfEO8/AP6lHLWfqAFDQMBad+OK/zYF5R/kLz8cCWxyRtw
 Smyh5oPNsJVH3/IyAQXH2TInqv7Mhp/YftOJC+ztYEPnbOcr/reuNOOBkt9dqZ2YnKfp
 xxPNmb3+wm/3peHJ/rES1xP+8+Bz3EQjztUedtrR35Oqo4/D49YZPDDPQW6Z7H/gwxTy
 BZfrCwqZ7UFDEUXaB7XUTWw4jzdvsQkmYCy3BcOIsY7zRWM1NeTlR/j8TIEDNq3ARJFB
 E7WA==
X-Gm-Message-State: ACrzQf0g6P0gEGKzxVUjuby+V4QWabAfi6PDttV3sX3F/jeIocJwvn0i
 +a/EmsjpSxYquBr08eJ5/MH1xxSq6RU=
X-Google-Smtp-Source: AMsMyM4svuzOoBpYOyt+OW7e2+KKRN9tnpYTjK6T9dFtvjEtJg9dny8ZJachYMup9EkWNVtlKrDJFQ==
X-Received: by 2002:a17:902:d492:b0:177:ee56:3b6a with SMTP id
 c18-20020a170902d49200b00177ee563b6amr10057509plg.132.1663533343891; 
 Sun, 18 Sep 2022 13:35:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a63df49000000b0041cd5ddde6fsm16974560pgj.76.2022.09.18.13.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:35:43 -0700 (PDT)
Message-ID: <a7ada88e-283f-efaf-a28d-b4dbc1cf87d9@amsat.org>
Date: Sun, 18 Sep 2022 22:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 09/21] ppc440_sdram: Split off map/unmap of sdram banks
 for later reuse
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663531117.git.balaton@eik.bme.hu>
 <3a20418047435a55dcd8c5aa719646d039cf8a56.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <3a20418047435a55dcd8c5aa719646d039cf8a56.1663531117.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/9/22 22:24, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

