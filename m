Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B291581852
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:24:53 +0200 (CEST)
Received: from localhost ([::1]:33744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOIe-00038k-OS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGNci-0007UP-VB
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:41:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGNch-0002UF-DJ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:41:32 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b7-20020a17090a12c700b001f20eb82a08so17797911pjg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:to:content-language:cc:from
 :subject:content-transfer-encoding;
 bh=M4jxKuBJ3bkS3/JjSdkTTnJnf4inqEW2ZXMcEd9x7vg=;
 b=YCy1le0dPWW2Qgeef+uXiP+VbMP7SoDOU5uZ6LI5ag5YAlycli++E6Y4QB6RVa5xMU
 gszpCnKoFSutmwN0utfgwh7UW6WrgclaQjv8ZtkeLAx/FmJcm1G2N7XApKZTWEm3Wcch
 f66rcYVzZg7bjx+f58EyWGt1i9vecGyhYd8WHQtVxbsYfo29J39XR3y/IuY2mFykaWeq
 oRy2bfnQn7Rnzs9coK38G2+8krY5SEEXfp+MUMmzrDSUBMdhA3NZTu4MpxEHqQ8CCxkW
 dH3aa8X6UJXeReb6vDuV7t3NqgqbiV8bksVvg4WNUz31uFXO9VCaitAzk57zSze2bjC5
 V2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :content-language:cc:from:subject:content-transfer-encoding;
 bh=M4jxKuBJ3bkS3/JjSdkTTnJnf4inqEW2ZXMcEd9x7vg=;
 b=MZbp0EJHSsS29dEPy/D7gtgDPEwrLpEeSI8S5iNPwMc16SerXommaYMYaC9dRUl3s4
 8m6KdXd/97hAGBmhkic0qbQcDM/Jp5jipRYGhVWjhCnmLfqkLgB4DUeV21BtvbDTOkef
 tjpgGp5X3SeeFQe2iyDVmeteksWrkPnCbffdKiK0k7QTg5kcoszZKkrSQPDkGA6wZdJ6
 Xv4PebzvUoviFsh6zfQszKjhtQ2fa8mQpEnbghSeUJzrVvd955SbP+qxgWjkrLGVQHeG
 5Qb8/p53cHzhYFR03upESdoIPZWQ64wtqxpAYwkpaU3Mn2duN3wVL0t17rEYVW66Qso2
 eBkg==
X-Gm-Message-State: AJIora+eJhXN81RXl93zLb5fMmBA5LZAzBZViKvrgq2j01khx81a/cnL
 DkSqXfbAgyzCNfzGBX3DZl9atA==
X-Google-Smtp-Source: AGRyM1uI4B/KUDcYj809qSS9LMdZPeM3TgYRmGhWz5c3UIBsJJPEeLO2Y2r3onRlmlUVccr25yq2rg==
X-Received: by 2002:a17:902:f650:b0:15f:3a10:a020 with SMTP id
 m16-20020a170902f65000b0015f3a10a020mr17695233plg.61.1658853689923; 
 Tue, 26 Jul 2022 09:41:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 lw12-20020a17090b180c00b001f054633283sm1518436pjb.42.2022.07.26.09.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 09:41:29 -0700 (PDT)
Message-ID: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
Date: Tue, 26 Jul 2022 09:41:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Language: en-US
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: hexagon docker test failure
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Taylor,

One of your recent hexagon testsuite changes is incompatible with the docker image that 
we're using:

tests/tcg/hexagon/multi_result.c:79:16: error: invalid instruction

   asm volatile("%0,p0 = vminub(%2, %3)\n\t"

                ^

<inline asm>:1:2: note: instantiated into assembly here

         r3:2,p0 = vminub(r1:0, r3:2)

         ^

1 error generated.


Can we try again to update debian-hexagon-cross?  I recall that last time there was a 
compiler bug that prevented forward progress.  Perhaps that has been fixed in the interim?

I'm willing to accept such an update in the next week before rc1, but if we can't manage 
that we'll need to disable the failing test(s?).  Thanks in advance,


r~

