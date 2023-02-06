Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E024468BFC2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Ed-0000MI-17; Mon, 06 Feb 2023 09:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pP2EC-0000A9-B2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:12:20 -0500
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pP2Dy-0002no-He
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:12:16 -0500
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 258232912
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WxgPgqk+naSWvddYsJqAagXo5gw5JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLC2zQbquNMzbwfItxbou0pksBuJ+Hyt5iSgpkryw9QS4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5gJmPJingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eYahA0MB9P2t1z
 eUDCzoiRRe81/mW+efuIgVsrpxLwMjDOYoevjR50WicA693HtbMRKLF4dIe1zA17ixMNayGN
 oxJNHw2MkyGOkwQUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjei3a4CEI4biqcN9hV7D9
 1r59WXDJioUc/Xc2ACiqGicv7qa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37VDyC9ekDkL+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIB866famRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:lFrviapnqhvJhoxkZFz2YRUaV5oNeYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTn4AtjjfZq/z/5ICPgqXItKNTOO0AHEEGgI1/qA/9SPIVyEysdtkY
 tmbqhiGJnRIDFB/LzHCATTKadG/DGKmprY4ds3xR1WPGRXg64L1XYeNu9DKDwOeOCRP+tAKK
 ah
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 09:09:12 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 n1-20020ac85a01000000b003ba2a2c50f9so908425qta.23
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=m3L+mFG1F+839Sac6C86QXI2Kqfq1xMvzRNeh040Odc=;
 b=Ks0xzsgof/B/nutB4wzx2Q1dR9yncKD9FyXM5upuXupDJTLvRaKip2zNcsA4jVMbDV
 RXDdy4xaaxMy8wIavbUOPr5TwwfXC1RELqw7sEzmQoE3T3LNIg7xcaNC+qGbR8SupF4s
 NTQ2SMQueJbMGkAkM6FFn+94MZgcwX18nqp7I9u/KGifjnnrt72JYV5Rqxf6MEN4J2vx
 XLYoo6fKFvmUNx9Y0k9O5ndfzlAykQohwzp2/Saf3jsSUVlDQGAQ+qANDR215nzRxZP/
 r1RMunddEoI/dHMSlr9DvkITq2wn3fhxCw83yCc7saC1vN7hDbRITPBWwBdjmok1/4HS
 /A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3L+mFG1F+839Sac6C86QXI2Kqfq1xMvzRNeh040Odc=;
 b=35ZCvJOLE4t/rSRObGKFozLpCX5wOQRjZ8lAc9n6RIRT6O/Im8KC84YeHhORSF/iQU
 rBcilLcSyH45yrMLBTdkZeNp7pSd9bPgqo/Q69VHPE2pibqfpOmDk1AYXFlw8C3Dg7oN
 FTjrWPOXBV/SYAT/w2lV+PCQ5aYRtEQJI+S9nzSXbPtZwOKhdXgVaxwkTAkOo2KRypAF
 AkN5d57STZpDruImKCHOgXOyPhsq71TQwdD9CxHkW1Vv1xEQHVlAVbC/N3p/bMBgo8rt
 tNkDiOgo+eK/fGyleFBHq/YEVquiUjQSPN3WwTpDE84iUI/WcIfqRGxsreyfSm/8bEBp
 PaWw==
X-Gm-Message-State: AO0yUKWF86vZlr3FKhmJt/JiiKa//iHuTALq94vzbeZm58FqmDgl7luA
 ImKxXA0uJ7fxLh/mrI5WEBceeVHLmZGI7Y+eIGgK7E3bCJfpBzwnZs1XITi2jBE+WyAaAJRM8Ej
 m6g/F790vOErKZGsM/tVwUWLUcrYVxA==
X-Received: by 2002:a05:6214:558e:b0:537:6529:2218 with SMTP id
 mi14-20020a056214558e00b0053765292218mr27492504qvb.30.1675692551827; 
 Mon, 06 Feb 2023 06:09:11 -0800 (PST)
X-Google-Smtp-Source: AK7set87VmY0wCIpXXwOhXNJscViQZqvk8+IS+CuWfjvgKwaOFpGvJAb1eWXwJC+tyW/787e+8NG4w==
X-Received: by 2002:a05:6214:558e:b0:537:6529:2218 with SMTP id
 mi14-20020a056214558e00b0053765292218mr27492479qvb.30.1675692551500; 
 Mon, 06 Feb 2023 06:09:11 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a05620a285500b0070617deb4b7sm7342781qkp.134.2023.02.06.06.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:09:10 -0800 (PST)
Date: Mon, 6 Feb 2023 09:09:07 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Message-ID: <20230206140907.tattlofsnhpc4ruh@mozz.bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <1abcd582-877d-6f54-1075-48eaa5de8539@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1abcd582-877d-6f54-1075-48eaa5de8539@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230205 1139, Philippe Mathieu-Daudé wrote:
> On 5/2/23 05:29, Alexander Bulekov wrote:
> 
> >   * Some device do not completely reset their state. This can lead to
> >     non-reproducible crashes. However, in my local tests, most crashes
> >     were reproducible. OSS-Fuzz shouldn't send us reports unless it can
> >     consistently reproduce a crash.
> 
> These devices are buggy, hard/cold reset should be reproducible.

Agreed. However I don't think the fuzzer is tailored to report these
types of bugs. OSS-Fuzz will just see that some crashes/inputs are not
reproducible. I have been thinking about ways to make the fuzzer report
incomplete VMStateDescriptions. Maybe something similar can be done for
reboots.
-Alex

> 
> >   * In theory, the corpus-format should not change, so the existing
> >     corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
> >     fuzzers.
> 

