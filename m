Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A272D8D08
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 13:11:27 +0100 (CET)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQDm-0003yU-Rp
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 07:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQBp-0002tl-M5; Sun, 13 Dec 2020 07:09:25 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQBl-0000K2-Jz; Sun, 13 Dec 2020 07:09:24 -0500
Received: by mail-wm1-x344.google.com with SMTP id g185so12720794wmf.3;
 Sun, 13 Dec 2020 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jcqMI+DuxarJWSaMDmZcQrXqULdnGNA+zi/SpTdem90=;
 b=TE0CgcJJ8G6Ol33Uw0U8dMbNgUqd2jfgpO4AHp39eEqoNYRBbMrgqVURJHdco/9fVL
 CFbyKEBwGD6KEkHewTA7xxPkJhVnIi4xjKHQMIbLph5iZ/eVqrDpVXCsMEg6aWOBrW2+
 5puq+pAJ+PIRn8Ld7w49ImdwjinI8jMiKMmCNH6mr7zqN2M3xy/zJ3zd32+bZUWn0ZHc
 LOstgV5wHKTdeqbKB1ji/cwYzyLoqGuFVaIOzsYmZH6B6GW8Hys9Npe/evi9/5VP8wmx
 UXzgNs04w8hkiE4igw50dJe6ud0WNWvie+yafh8n0QL5CFNp/sjJBftEFG5E6enTBZEG
 w+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jcqMI+DuxarJWSaMDmZcQrXqULdnGNA+zi/SpTdem90=;
 b=Hc57hP+/77qmS1epxCmanTTrTVa+Dzq15Q+h5bzdum/UiBneSAG+HjnS7jQt4WUC95
 7wflU2wPRUY9+bK9ltabGC6pLm8ARXWYfSq0+LYFuJOzxE3DW4FKUwjrZRuVhSkpJvLp
 Jncr9TCN6acVPqfpoVO3Zv3fKNfmDHOmJCeGQOcPF8dsjSxODXXNRkxE6Hpf8S+iegRG
 6TJCMtPInKYPCeMhyKrlLi4R1Mi19y8bRQj2W5s2ffGN+ULe24/O1H8MGKVZPOnh2RVX
 uJa9p+qwJteyyUU+SXG+ZH7J3W3aIFVsHEbuh1p9oSx1ctMV8VGmkKLJZ0GO2bl3Wng0
 Y+ow==
X-Gm-Message-State: AOAM533XGDfPo8vjWG+LDOytrRw/m79FWFxnyzj1IxgjrfVys3oDtGgo
 /sf3eoeULcyRNd9OfmxfHkg=
X-Google-Smtp-Source: ABdhPJyfhX5u3h2oYgGk1FwpYmiwpZWhyXJ82PiNGAjOUsmJEiWuNYDiE5AhCZ8TqisRRdpU4BZ14Q==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr22718249wmr.162.1607861358014; 
 Sun, 13 Dec 2020 04:09:18 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a13sm26464976wrt.96.2020.12.13.04.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 04:09:17 -0800 (PST)
Subject: Re: [PATCH 1/8] hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3a9f964-3642-57ee-5be3-46b980bc6217@amsat.org>
Date: Sun, 13 Dec 2020 13:09:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201212001537.24520-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 1:15 AM, Peter Maydell wrote:
> In a following commit we will move the PPC UIC implementation to
> its own file in hw/intc. To prevent checkpatch complaining about that
> code-motion, fix up the minor style issues first.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ppc/ppc4xx_devs.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

