Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1396A4BD7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjdD-0002B6-Vn; Mon, 27 Feb 2023 14:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pWjdB-0002Ad-NU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:57:53 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pWjdA-0000iy-3G
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:57:53 -0500
X-IronPort-RemoteIP: 209.85.166.71
X-IronPort-MID: 259684474
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RAjvhq8lTYeg2kgJ5VqhDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3z
 GBJWGzTa6uCY2H2KY1/Po3g90xXvJfRzdZkGQs/q30xFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNEg06/gEk35q+q4mlH5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJGYNLLI329Z2PTpf2
 +BJJm4yaR2Il8vjldpXSsE07igiBMziPYdau3Y5iD+GVLApRpfMR6iM7thdtNsyrpoWTLCOO
 oxAN2QpM02ojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKOnVIhjOSybLI5fPTWfZ1ntUSmh
 V7L/jnDDi1FLfWckAeapyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m8vqvF3+hPyCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBYJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:hNJinasW/0G2lOVpbNFa9kqf7skDiNV00zEX/kB9WHVpm62j5r
 2TdZEgvyMc5wxhP03I9erwXpVprxvnhOtICad4B8bRYOCkghrYEGlahbGSsAEIYheOgtK1tp
 0QCZSXvbbLfCZHZLjBkXGF+o0bsaa6GcmT7I+0vhQdKD2CRJsN0+4TMHfhLqQZfng+OXL5fK
 D92iOFnVWdkLYsA/hSthI+Lpj+ThHw+q4PkXU9dmIaAcC17ELLmdrHLyQ=
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 14:57:46 -0500
Received: by mail-io1-f71.google.com with SMTP id
 y6-20020a056602120600b0074c87f954bfso4801361iot.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nG2GkEHTtfdWEzO8mP03bKJG4nfaUDHDdP5YB9EqupY=;
 b=hMno5nHewjDOJZOeEm0Gsn2Ph3FEC+d87Tz6OCvxIEZcPa2cEsDnyJhZIJbRLOCgvU
 QKXs1e1SXgg6IjyNSSNIm1GYeArH9fxPYpCroD62bEy4DiQXiJdMhovQA++o0zCAPtDL
 zIMCBAuAotu5VImIKMGikDy7wJCVPSOibh6BBSRDKLMQm7hqQv/sU65BuIIcLVX7R27Z
 jTfAOaJTsRFY/AXGKmJVnVZhIBMIiBzd8Tj+6euBf1PQEfzSoQQwzNrENypmDGUU1Ars
 +Gkoyk0twBI4W8Bo0F4bD63n6pJW7ENjMnHUZDqW+nAjl1DIJgyV92NiwJL4w5KUEiQZ
 eyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nG2GkEHTtfdWEzO8mP03bKJG4nfaUDHDdP5YB9EqupY=;
 b=2DZR+vF6/2kjGR9UHGXYEc/WWVTPfLJ0FU/XFtcQXekFmSsndWHkPkcaEedCkPoMZR
 T+tjy5l1ik0PFY6lIF+hLilldfWD8eH8Dr3eEwcRslQkLAGw1MufyoM8CJaBSv76Swg3
 H2LJ0xpIYL847x9yqhOQN4eh+f109ujggjn4JtGf7931y00Dm6uEaKoleK39J8It7Cq5
 E5+vQEhw/50GBauXcYI/X3cMDVlrY1KD4bztOlzaPxnYc18VTBCPU3Srh+UtbY2dEAFu
 r8iC9SQ/ZAsXFmV182j/V8KnuEMUTvyfBJ28itm36yIgzWCwk4cANp5xLOM+PRVjaOuo
 p/Ww==
X-Gm-Message-State: AO0yUKVaY3oE6JnppL6m7kSoEb/x40ZGc2Gsq5VQS3t0eW9Z4Wc9fnvK
 4EIqwnTp1AWe0TYLjl/aSH7yULqNhOpmNlxoq9KJ0bXM3HygY6x0KNmOUN49Njo2yNR3Sjzdo0O
 vnlRSWUshBV1t523FOQ3ItGwf5jhdBg==
X-Received: by 2002:a05:6e02:1489:b0:316:e39f:1449 with SMTP id
 n9-20020a056e02148900b00316e39f1449mr554874ilk.32.1677527865478; 
 Mon, 27 Feb 2023 11:57:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/OG9+uGMawDPM6nS3/chyN6eKLACtdbQVz6PWeMGY8cUnz6pogFbUFK92Ov7/HzvGvhj5WNQ==
X-Received: by 2002:a05:6e02:1489:b0:316:e39f:1449 with SMTP id
 n9-20020a056e02148900b00316e39f1449mr554855ilk.32.1677527865218; 
 Mon, 27 Feb 2023 11:57:45 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056638004c00b003c51ac57342sm2335627jap.126.2023.02.27.11.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:57:44 -0800 (PST)
Date: Mon, 27 Feb 2023 14:57:40 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, fam@euphon.net, lvivier@redhat.com,
 berrange@redhat.com
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Message-ID: <20230227195740.vofxxdswduldwrz2@mozz.bu.edu>
References: <20230227174019.1164205-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227174019.1164205-1-rjones@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
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

On 230227 1740, Richard W.M. Jones wrote:
> These two tests were failing with this error:
> 
>   stderr:
>   TAP parsing error: version number must be on the first line
>   [...]
>   Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
> 
> This can be fixed by ensuring we always call g_test_init first in the
> body of main.
> 
> Thanks: Daniel Berrange, for diagnosing the problem
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

