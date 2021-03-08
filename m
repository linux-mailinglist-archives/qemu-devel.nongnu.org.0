Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C33305B7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 02:57:47 +0100 (CET)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ59W-0002yk-Dx
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 20:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJ57R-0002WF-VF
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:55:37 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:34207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJ57L-0004fo-VZ
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:55:37 -0500
Received: by mail-ot1-x334.google.com with SMTP id n23so2111830otq.1
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=FQL1/Y3VoGYphDIyY8+T0HmX/xwDYNF5JZic1TfbPRA=;
 b=ge/s3kHlnO705ZHL12BJL3BXhrSebCW1xTUZ9WkzvxVDx8lHv5HZBIqqQeu03JmZ0A
 sh0+YgSSaK2g32glCtQ1XMTqRFomPIR4LsckJH5vd0unSdfrtHlP9VJEIM8FQpj/eSye
 ik/ncIJir6trNGsf8lEIRM5iRTupF+LAZMG4HAozl6EbEPWkqHeMSDcHnoLHWOCtVOvc
 Cx6zMhzYpjWqs8/giPfxSCKMDCftsJlbVfqP8PsLQOOzwGho0uW5NlqkrovDtktJlUwR
 yH9g0iSK3yCTXDMyPpm1PPV3dwmffPnPrL6s/j1KFo8UJ7MDl/i3jJPO/G03IvEQhY5y
 1G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=FQL1/Y3VoGYphDIyY8+T0HmX/xwDYNF5JZic1TfbPRA=;
 b=ZkkGdb6o24DoASvz5NOcR1ftpup6HH/xKz+NpsPgB9bepzP4hQ4ByS3GjV2D73Pwt9
 K+LHZ6jOlVkTlcjxaRMOJ0sEKtrtsjHXMSxq0JsXJdveNvytzVdYH6dJGW8nrIq/Zrj0
 7uek+gujy49Klrg68elR1qCE0dMNbRhke/MXSoCBK4OW/i4L7Fsbp25XQ4KJ/C24fO5K
 gjYxVMWklg35nV1NcRq9yULdj/vD6dbuNVaWUhNBn9A3QKaWXVeJYt/FFBaI4TgzEZSY
 bhPFJUn/42c1OPAobuI2+/ThwTU23teCEKknOWLaRlT1nxpN/pM8qccy+pn0rVjX4xY9
 s0Hg==
X-Gm-Message-State: AOAM533cfNSiKwc30VdRz1vW2bwqwUoqjsnhTXpd1ASn2xxzcny7cowk
 5V5TMw4k0rnCgpGnDdPg1o/DpA==
X-Google-Smtp-Source: ABdhPJyo5CJhFoQ0QG+L/TRLmr1i2F5bZ0rNO6hJjDsbH8cWR57ZrZQcCZKgcTfdP7C6sxAAfnZuqQ==
X-Received: by 2002:a9d:42c:: with SMTP id 41mr17075301otc.108.1615168528108; 
 Sun, 07 Mar 2021 17:55:28 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id w5sm2123499oig.24.2021.03.07.17.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 17:55:27 -0800 (PST)
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Subject: SubmitAPatch wiki page has broken link to coding style
Message-ID: <a59a52a2-42da-c6be-ce15-b2b661ff3499@nuviainc.com>
Date: Sun, 7 Mar 2021 18:55:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit cbcf09872a936ccefef6a34298046d3b9aefc148 on February 25th 
CODING_STYLE.rst was moved into the developer manual. So, the "Use the 
QEMU coding style" section of 
https://wiki.qemu.org/Contribute/SubmitAPatch should probably be updated 
to link to:

https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/style.rst

-- 
Rebecca Cran

