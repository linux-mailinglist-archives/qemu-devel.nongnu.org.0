Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01E2E8C19
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 13:19:33 +0100 (CET)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw2M7-0005Wo-Ty
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 07:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2Is-0004mW-60
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 07:16:10 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2Ip-0004eM-CH
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 07:16:09 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t30so28162979wrb.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 04:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GLYs+IO/fWDXeR7JWvdSzlLaBKLKrfzG+8k/S6MJkYI=;
 b=B+UJ5wuX5KCaNjGshAkyin8fMlKnllw6RU35shzUBDP/DhUVLHObPWiCRFdj/QwMKf
 wzf081nzMnD2gzSmhOHOiTdzwTs35sx50KEALPrGNki/aJdyu7Gh/D+WN8J5ppNQsshU
 uDpnrUKno9THh6BBJk2JS32ZU0IFUP9gzm7gv18cA65W3XqeSQuOaL9BhY4vrGXiX+Vg
 boAPm0kWug9cKjMP11oeSS5SSoj0I7Grwy3a14rVtAKbl+UToO5kpEAM6qaXuYFJYyir
 fsqzbG9ZocYJo3fp3cykPCBkzJ98PvcLtYTzBR+LMlHPkj+vR8kiuzqp9aRha3yINVRi
 23yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GLYs+IO/fWDXeR7JWvdSzlLaBKLKrfzG+8k/S6MJkYI=;
 b=EXUhGk3EATmASTRz0i6OKR2Ix0T5yESPQnRLpBE3nQc+LzDu6lWImAv96SM71sDstA
 jha595y+KhGSPqqNEP2te6d6jmwUibGxFr0j4cWF7xCx8z+diW/ilown1oSiyOfBgtFR
 /fqBP31Dzzc/A9Tui294+bBK/DkuPzcJayIB4bo+7uCrivQ3t0GEmbsbiWA3TnR5ilpS
 2vXJMGUvo117s3/fFErJKe23B1V4ou90pl124tnr5/Koc/1IlpX2XPvJtrSdk20HhSz+
 /KDpoP4EACLOTVnF7fWPJ4OpebNilhOKakCKMAyZ8J45AzE5WmJHHsY5lfzHquGAAdOO
 tWEA==
X-Gm-Message-State: AOAM533PHa4tmIHO5f3WRz6KzJwTfvfp71KJTxeils8bPaT5wjAiqg3h
 lHkjNlMgRa12qcoyK8QCAa0=
X-Google-Smtp-Source: ABdhPJz4dKwXzwxGBXUI40i/a60Q1XZolMATaVUIYO2x+LlRQT1GxJy2wc/PbcITLjHVo7A42sHy7w==
X-Received: by 2002:adf:8145:: with SMTP id 63mr73471810wrm.8.1609676165642;
 Sun, 03 Jan 2021 04:16:05 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id l7sm27987017wme.4.2021.01.03.04.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 04:16:04 -0800 (PST)
Subject: Re: [PATCH 11/24] vt82c686: Use shorter name for local variable
 holding object state
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <69655b23df2ecebbf0aff29726f4b4746f5b74de.1609584216.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <949691e9-9f5b-17aa-88f3-951a12d6b6ff@amsat.org>
Date: Sun, 3 Jan 2021 13:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <69655b23df2ecebbf0aff29726f4b4746f5b74de.1609584216.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
> Rename local variable holding object state for readability and
> consistency.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


