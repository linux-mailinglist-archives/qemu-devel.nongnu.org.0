Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D14B0D95
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:31:45 +0100 (CET)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8bv-0006Pp-RA
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:31:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8Oq-000883-51
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:18:12 -0500
Received: from [2607:f8b0:4864:20::42c] (port=39695
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8On-0002CL-Jm
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:18:11 -0500
Received: by mail-pf1-x42c.google.com with SMTP id r19so9886574pfh.6
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MjFEhHEyyN8cW1P/6h+6/8+RGSArPU650f4sHAQQw+8=;
 b=UMWtcyZYkd8A4AOYKZlY7SLFzf3M4gU3xOb/5F0MQUmL1qui+dVlm0gqC8b9+nTkfF
 EvaFLg8ChmeEiK91tKMKQV2wadiPkUJVpMAT4zhlpcnrb0BkNV9CPzdeS9FT00rQUnUp
 UfXo2O08+dquPgM5PSrnIev7Gaj8JT3vQTrVjyPu/CAAY4RKQG7WmCdHPzSnX7s4poDp
 NZit1GTa6RCcMX86alHcAWquEYoirUEH/wc8PErwRlxeDebgBvG4qCHcBbR92opYNEFX
 1juMMXimOQG2ipzv57L5hTmrjMG5gau3aJFrZ/FeRaZjUi69WnMyKQy/q3X3muASqOFY
 nnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MjFEhHEyyN8cW1P/6h+6/8+RGSArPU650f4sHAQQw+8=;
 b=B4WjZwuBdauENmCaud5dapNIXLA3cUYBw7oCgUn/3A7OBXI8+uNAd+dJJa/cjfaQq5
 pPP+7Vo7DvCEvlkah6/Q45x6NPreEpqh7LmK8p8zpmOW4dd5bFS947r0TrD2EYgO1H2y
 u494izpI1CkwUfaAKc7FqBbMK3QANrd9z+gsT04ZqIq/s3Iwc8vC/Zu/qB7lo7qBKvhF
 HFHUG9mYVb/8GVcoBQuYCsegvXh+JURUapL26dC5Vxrtk8J2FurwFzLDvioGaKFqenQL
 Zp02vwFXpbXVWxB5CU/OGXmzxp1DsSGKeX7fje9QbJvUkMSsuH0/+5IqsrrDR6mzMML8
 ytHg==
X-Gm-Message-State: AOAM533WX3xbGzZf3nfr0kVh29EHol+ih9JwWs1X23Ec4Qu35NWwwKI8
 L4xwfc5nAQuIJB1q0n+XFLg=
X-Google-Smtp-Source: ABdhPJz/W5V2w1A5Eu1jXO4ToZ5L0M+pWxuqo5XGbeS4vxj4ctulngcKC/4+j3cmn28qTJE9UmZV1Q==
X-Received: by 2002:a05:6a00:181f:: with SMTP id
 y31mr7206630pfa.35.1644495488319; 
 Thu, 10 Feb 2022 04:18:08 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id s32sm16770994pfw.80.2022.02.10.04.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:18:07 -0800 (PST)
Date: Thu, 10 Feb 2022 21:18:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/4] hw/openrisc/openrisc_sim: Paramatarize initialization
Message-ID: <YgUCfWa1xCRLIc8Z@antec>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-3-shorne@gmail.com>
 <ac0eb0a2-8a8e-c95c-08a4-4dfe07862f9b@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac0eb0a2-8a8e-c95c-08a4-4dfe07862f9b@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 12:07:02PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/2/22 07:30, Stafford Horne wrote:
> > Move magic numbers to variables and enums. These will be
> > reused for upcoming fdt initialization.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   hw/openrisc/openrisc_sim.c | 42 ++++++++++++++++++++++++++++++--------
> >   1 file changed, 34 insertions(+), 8 deletions(-)
> 
> Typo "Parameterize" in subject.

Yes.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thank you.

