Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346294206C6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:44:19 +0200 (CEST)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIe2-0002vo-9P
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXIcw-0001iS-R9
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:43:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXIcv-0003hG-7q
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:43:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id t2so5557808wrb.8
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dtJvvc/KGyP7nKnazhSAQF9yiQW/tmwr4hnWwtsOUas=;
 b=i4aynmyEF9pznob/V+vKh/1LYwn19ETQMELpt35/qdhThk9l36QEuAry3Hy7HHFNbK
 ABKNAbCL3Y+b+o4hcbLd2HiS+K2P4yRX7Vgf48U+Q6vyAX6C/G5GTpRXafpMKYj9shTf
 4BdHGcijc8MGdJn5eZF2ZGhtzUHQAK6Isr7kxk27fKBtlNYBm69TGxsGa7G2xL0ruWlN
 aRRY4TSwjXaFWY0CsgZls5Ik8fhXE4b6WpOiX5crJFpClwHm+dI+iIl8sDk7gg3tKTZA
 wH+SuZGx6/GTNoxy2BimZBck5TYK3W41i1/jkq+yu4/8aokGx1y0p8U6JfPuip96mi5r
 iRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dtJvvc/KGyP7nKnazhSAQF9yiQW/tmwr4hnWwtsOUas=;
 b=pon9sVzUyioQ0hWsoYI/6VTB4/61qo7R+SXj9jGe99pSYLZdzwam8eSb2LOks8RaO4
 rybQw/BtykWnhp+gwNzlOL7zf9suhuvNN/o5GcwaMwj4hjG7zRN4T49N0OrWXO9tnQ6G
 ZDZ/BFx9cFeBk4jWIi4e5YwTwLhMt+Mp1j0X4LBJxLyqUmXgctllKCw9q3WoP9jBHMJz
 3FliyQ7a49L5igyxhuuMi3T+LLYPXX9xbHnZXjgfPTanzpkj3N4oM0vV6KrQBneNVUE0
 Pwq/EinTikPEsbT6h0DgQ5U97shgRIHRibeojncQLi0LNum+MN/qk7hmibeqRZVfqFSP
 Kj8Q==
X-Gm-Message-State: AOAM530uVOVRJLP6AnVB/XmHPAspTSaj5LCvhpp3Sw3lWAgb5LH5uH5q
 oy5NAW07US5H5Ze1AjUxDx4Y1fcyEMY=
X-Google-Smtp-Source: ABdhPJxKOGhPDYe4g/RJ+bpcgYRXLeZYgakUBoaG7tYSYoHctZn3fs5OtHmpEmDreyNp3qSVLl5Kug==
X-Received: by 2002:adf:8b17:: with SMTP id n23mr10887036wra.290.1633333387502; 
 Mon, 04 Oct 2021 00:43:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g1sm16413087wmk.2.2021.10.04.00.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 00:43:06 -0700 (PDT)
Message-ID: <a117a9b7-8b0e-d6d0-692d-f9d67d6c18d8@amsat.org>
Date: Mon, 4 Oct 2021 09:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/2] tcg: add dup_const_tl wrapper
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 23:42, Philipp Tomsich wrote:
> dup_const always generates a uint64_t, which may exceed the size of a
> target_long (generating warnings with recent-enough compilers).
> 
> To ensure that we can use dup_const both for 64bit and 32bit targets,
> this adds dup_const_tl, which either maps back to dup_const (for 64bit
> targets) or provides a similar implementation using 32bit constants.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
> Changes in v2:
> - Changed dup_const_tl to enforce the sanity check with
>   qemu_build_not_reached as requested in the review.
> 
>  include/tcg/tcg.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

