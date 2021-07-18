Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E673CC81E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:53:03 +0200 (CEST)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51bi-0003jy-Kj
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51aY-0002Zv-0j
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:51:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51aW-0005I1-KA
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:51:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id t5so17449726wrw.12
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2GJWOMUd/qnUvdzy1d48HhhLPfYUut1SP3vlGBoFovk=;
 b=DQpXloWoQOliletWsCcpgTQqiJpMeFmozSuN0WEvOhvCuHntKLl66hu0oG/8JZ5X2O
 bkWN7niVDq59yLhAHsb9eye1kASVEvGu0Qd/Q+RYc1Xe2jEGZXOmsWzgtWiyg+ueoixt
 AkhiJbcWwO4ulJAskbqiVl1M7k5TMJ4E5/nZTBfbSRkp3ykbLluam7rG1VXK24nIn+/C
 HRHnN3/Wuk6UBsxXGeyW0PBPSY52ztQoymMwuKpuDv18fd7KNgpuZluexNWj0quwENdl
 gI2+ddT0j2Vs6lrfL595aKspRB+qJXEThzHMXV6W24noMs6lfTc+fF1FFZ1NEz6bPKUG
 zorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2GJWOMUd/qnUvdzy1d48HhhLPfYUut1SP3vlGBoFovk=;
 b=mjt/lu618pKAwdOIWcgDuO67vQPtqkFaraDSIVyLsxSj7Rscq6TFyWFhxprGD9xUVn
 8fX12JUGGQR5ELu12FOtn18StIAeUDTFubWHyAHj/QSVrP81B7uc80/FDRAoP47fdvK2
 OfL9p9WXO1QU9T/WLW2TLAePpJnmOIIELG+/im0M/Fx+YgLpp+2sMRyec5pwz0HwHljH
 Tzfou0IQzb9Amgk81U6Cel6IY6uRoU/4EdBoEZa/yUDnc8IsWBdLhFm65D/TDjnCtHdS
 xdFqOwY2TEl2jgXxDH3E2kG05yzPumC+S/1O7KW+1ePhYTkqEnKMSNDftLoEMnrP5QXQ
 pzbA==
X-Gm-Message-State: AOAM531jPaErK4p5VgbY0u83/xDml+S9AsKviSGeC9wnjiJS9TT8HZGP
 Ta9qH6wYHZsJq14uD5WOtVA=
X-Google-Smtp-Source: ABdhPJwitjthfkmb47mkeQ4EPZQSrbKVOeKESJpq+gU6JjhxOMzSyW6ie1KVE1nWW4nHs8W//kHlrw==
X-Received: by 2002:adf:90e2:: with SMTP id i89mr23812054wri.338.1626594707162; 
 Sun, 18 Jul 2021 00:51:47 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id p11sm15490594wro.78.2021.07.18.00.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:51:46 -0700 (PDT)
Subject: Re: [PATCH for-6.2 09/10] linux-user: Drop unneeded includes from
 qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3de0ba8a-846d-b0dd-88ee-aadf07967598@amsat.org>
Date: Sun, 18 Jul 2021 09:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717232103.18047-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 1:21 AM, Peter Maydell wrote:
> Trim down the #includes in qemu.h where we can, either by
> dropping unneeded headers or by moving them to user-internals.h.
> 
> This includes deleting a couple of #includes that appear at
> weird points midway through the header file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h           | 4 ----
>  linux-user/user-internals.h | 2 ++
>  thunk.c                     | 1 +
>  3 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

