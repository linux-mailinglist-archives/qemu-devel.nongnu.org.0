Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859144053C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:03:20 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZy3-0006FU-JU
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgZw5-0004oU-G4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:01:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgZw3-0005MO-CT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:01:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d13so18794845wrf.11
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z4sT093S2P7r4tZAomFVyjP0U8/JgJ3fdPLlMfE4078=;
 b=nltiUIGG0nEsgmoiFMTYe59Qfm5dp+jQHltkfDS8Spf/BMyrQ4We8dUoknOkfFpO0/
 vzU/R82okOCqc+srRAzSza9n76knxe6XtNyxmmpRXTokM/G12wCpSZwTHPpPcnrJvBhU
 uneiFOcjHMnvEroxos9mONzzuKhhe95QUYnY33ftDUTCwFQnkdLx346wbzU9XKvCR29/
 lrcC3+077FI50PgBm0JRZMLSB9WLZjyxNqg+ZUNBgtRZ/GAnlttM9+2QY0MSc0vHJddl
 VDRPWQfn6jtPo5P6bR3H4RRr4sWCEXnGVtJOq3fUf69fIkrlvXXttswwNNvTfpRj8CJ1
 YTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z4sT093S2P7r4tZAomFVyjP0U8/JgJ3fdPLlMfE4078=;
 b=e5dGryZ8ESYYGKhdoZW33QhOz45KXHek12GbF3PU4jVxth41ZUeUE5zkoiAs3hnGju
 cp8ejNIEHyMdW90Zs39sLaqCNJ4jVO8lMe0T3sSOnk16KBljSXNui8LGIAlm+/XOU0F0
 PkC408XAneoc3tdig+oFYByfYw5FyzNUKZlmFkspP1sdrzUeVgVPkUMpohPlhoyyKUsz
 B6nNOI2WFTpBqxAqryjDJuOmnhbKpkELTcExxmkX/O2421SpJbHogsjh9jDOP8G9g/iu
 60k1h4LKzBVwkKSYlSsWP0zOPS/p4oxCP03fvrjs72qskc0To/SvA2Jnu3eLr72HPffb
 Cvfg==
X-Gm-Message-State: AOAM53178lBBFbpIGGSQe+Cqm01cQ3pSGHwe9ybuRVgdyl6rgTihfIzc
 IYFjTJKRfkHQXU3rCFRi0AQ=
X-Google-Smtp-Source: ABdhPJzQHcQ5HYJIBfso9s/0VIdV/BoMfCgWawIF4wQaUV1ji3ZkQlkrxSKUZTNMPW2Pqw9uKDIQTQ==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr6109673wrr.143.1635544873788; 
 Fri, 29 Oct 2021 15:01:13 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k63sm9926601wme.22.2021.10.29.15.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:01:13 -0700 (PDT)
Message-ID: <da45e061-c34e-7a3c-468a-e0f375c97d50@amsat.org>
Date: Sat, 30 Oct 2021 00:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 12/30] hw/char/sh_serial: Split off sh_serial_reset()
 from sh_serial_init()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <ffb46f2814794c8dfc2c5a0cf83086a7bd754e10.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <ffb46f2814794c8dfc2c5a0cf83086a7bd754e10.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

