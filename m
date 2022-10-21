Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757EA608025
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:47:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxyt-0001xV-4V; Fri, 21 Oct 2022 15:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1olxL5-0002x3-0g
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 15:05:58 -0400
Received: from esa15.hc2706-39.iphmx.com ([216.71.140.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1olxL2-0000rC-8C
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 15:05:50 -0400
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 230089315
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:teUry6hHdHXlWxTRRLTiiV6FX1610hIKZh0ujC45NGQN5FlHY01je
 htvUGyFM6nea2ekct8gO4W+pk8FusXXz4NiGVFuqyxgEi0W8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4mpA5DTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGXXAZJaMz8/1OCiJk8
 PkgLSIwdg+urrfjqF67YrEEasULKcDqOMYGuSglw2iIXbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDM2ApNUWQC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJl1QpgOm2aYe9ltqiV51emmeAt
 n39x2nnLDwlPd+VxR6Y/Sf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rtKtrsULyH4m7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmQphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:Kpf6rapswLqTQmM5krHABXIaV5r+eYIsimQD101hICG9E/bo8v
 xG+c5x6faaslossR0b9uxoQZPwP080lqQFg7X5X43DYOC8ghrNEGgK1+KLqVDd8kvFmNK1vp
 0QEJSWZueQMbFxt7ec3OGee+xQuaj+gdvY/9v2/jNPaQlrbq16hj0JdjpzancGOTWv2/ICZf
 yhDvIunUveRZ29VLXLOkU4
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 15:05:42 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 x16-20020a05620a449000b006eecf2d621eso4188252qkp.16
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vLBEKML3BlQkJ0selWhILbHAjLtv0IenJ6vzZpBM9F8=;
 b=IH414Bz8iDURetDC2KtLn3UVZSJVkcmzseVAoIgKf3S35qL1QCAWy9NmlSHqLNTWWE
 i8vgno42R18oFyLlFu05U0J28IokcvfnNYI03sIRlYCrqhxTvB01CFGK7iHtO8mQ7avl
 dsmqid1aYVUN0rB/WOJri2mnhFn8ITTXsOB4QpzQ94o3G4xIIzmDta8VxoR6T62cWaMc
 Ue9Frmo1L/DnR9/04cjVqdhBPqCxO/sTSHLzB6xjNk+WOW2sP7hh5gNCXpsbWdGD59gB
 thb5gdgQqqZhJXOizM5Ad9BSQ8k2lMLeV+0GcM7aPLDRqEeWbOJPZgg8w/0hJmhjmuEX
 mmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLBEKML3BlQkJ0selWhILbHAjLtv0IenJ6vzZpBM9F8=;
 b=IbgFe5b2aDDRl/NwCGjSWPVMXTSWkW+GjsIq4Vx+1uJOaCxhE/lE77+cGI8yv+2MkX
 iyVbzfm09kxOtx999SE8+SWcioMGeozLP1saZ2tAO0udn7lhF1fWwDD6IEpA0MF4fIKz
 AoPWJpvqXYM9iqVsw9qJbSqafp2r+3SU2784De9IJI0ewwJgRFlH0BWdcsnoOA9e/FT+
 koI+Nx18l2npEATcZikqCaORsLfy+IpLeSEyJ3ZSltCSCQk8GYiybfRB4ZzbI3mG0dOM
 4pP3ODV6LWw85dcvTNCZjT5dGwHUoLpG50hiqDVr9m2VOhWcavzkRYsxzA2U4TJ6c8V6
 +RJw==
X-Gm-Message-State: ACrzQf1rfEFFl2BezIHspZSfm8FJq7+gr0Dc2mZKHdJxGxWwnXeImvw5
 lxaVwXve98eNyuxTj0CUOiL2EargK4EuE5F8QvoZMqT7AdZFXdBQBQUljXHz1eKukUQLAqaQJ2l
 oQ1eOdBcHqqKpXxOW97Vnf2UxIRzTFw==
X-Received: by 2002:a37:9144:0:b0:6cf:5dc3:417c with SMTP id
 t65-20020a379144000000b006cf5dc3417cmr13948310qkd.213.1666379143100; 
 Fri, 21 Oct 2022 12:05:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57t/BIG4njLV/65UV8L/2VO+J+mCeRS8UtHdjh4Hi3rcjYawWJIt1ak9qpbgh+uUe5jv15IQ==
X-Received: by 2002:a37:9144:0:b0:6cf:5dc3:417c with SMTP id
 t65-20020a379144000000b006cf5dc3417cmr13948281qkd.213.1666379142800; 
 Fri, 21 Oct 2022 12:05:42 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a05622a180f00b00399b73d06f0sm8805935qtc.38.2022.10.21.12.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 12:05:42 -0700 (PDT)
Date: Fri, 21 Oct 2022 15:05:24 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Message-ID: <20221021190524.433s2uh6i5md74gf@mozz.bu.edu>
References: <20221019191522.1004804-1-lk@c--e.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019191522.1004804-1-lk@c--e.de>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.200; envelope-from=alxndr@bu.edu;
 helo=esa15.hc2706-39.iphmx.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.781, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 221019 2115, Christian A. Ehrhardt wrote:
> Fix memset argument order: The second argument is
> the value, the length goes last.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Cc: qemu-stable@nongnu.org
> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> ---
>  hw/acpi/erst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index df856b2669..26391f93ca 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>      if (nvram) {
>          /* Write the record into the slot */
>          memcpy(nvram, exchange, record_length);
> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);

Hi, 
I'm running the fuzzer over this code. So far, it hasn't complained
about this particular memset call, but it has crashed on the memcpy,
directly preceding it. I think the record_length checks might be
insufficient. I made an issue/reproducer:
https://gitlab.com/qemu-project/qemu/-/issues/1268

In that particular case, record_length is ffffff00 and passes the
checks. I'll keep an eye on the fuzzer to see if it will be able to
crash the memset.

For this patch:
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

>          /* If a new record, increment the record_count */
>          if (!record_found) {
>              uint32_t record_count;
> -- 
> 2.34.1
> 
> 

