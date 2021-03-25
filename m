Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A945F34893F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:38:59 +0100 (CET)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJdy-0001tZ-PB
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPJc5-00010Q-He
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:37:01 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPJc1-0000Mi-WD
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:37:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id h25so818596pgm.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vc+wvFFTvodrX20OPKNrBQQHGB5pcLD4efIBgcy5DJ8=;
 b=d3anZLPItxFsvkWNZXMb4zwZJZErGxbcBEbHUDImVernnwHl/HpacEgalfyiBHsKvd
 VdMa7BovSCLW5iSVFS+0KD0bCViDKMvkdt/J0Xmt4vW2NlLzguRrxIgHOVcUBpNQLn+u
 ir8VyNnnSk3585vN6G2QSVLIicAlamN0OmutEBKkyfzL+LJ1DRjfD82j3pi4lY/WM8JO
 ReloAo6wtuEGkySMtjlvElVeKnUAZHge2UMqkkBQQ5anQwHP6PbCHKiRYCcCalN4aqin
 dPDQOcEX3neTzIhjVbpZ4QGXUTXQf3xps2SUEjEPrPdFx/IS4P2Ug2SJ2Pt5ewuI5xDG
 Wsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vc+wvFFTvodrX20OPKNrBQQHGB5pcLD4efIBgcy5DJ8=;
 b=X2hlVFqdRnBNUJT/hcbqzkNmfYuADCnQqd6XoiC6vyeLM5ST9sXCEWQjxlOvseMT8i
 K12v1QI1y3C0qwaCkvmAz9rMXRLEgLziee+j0riNj68CGf72xdjTkE+6igfGXgSbHIAv
 D74IRboW10JypDltlfcSPKBF3/GOlk101pzYB+JJPuocnVtUisl3fFYT7Mp4xVtYUqOs
 uALvSvOM9Utxdwh27ZMJAJMgxf8kBv/7i8tnuZ7f+BORvJ7WLkR1oObl4UQ8mWCbiEcY
 H/HJWMX2FRx4EX3TahOu9eFarmNi7h7Z1YN+oRtziRVd9bwtYLR1aMz/yHMg0BGVYCj/
 SNkQ==
X-Gm-Message-State: AOAM532gCRaIP54GOxHgC3Shbt7Oq9nKjENOn8fIp5ge4maBJZRDoD+m
 tfxX6PswyNVsEXIdccNQKtPOkg==
X-Google-Smtp-Source: ABdhPJyb333MF6FsdaBNIqpHXm1FzaJBdReq0cSfGvlp7i9CZi3xK+fHIiiOuKVUg47LD6IyuqwQRQ==
X-Received: by 2002:a62:6045:0:b029:20c:b6a6:6077 with SMTP id
 u66-20020a6260450000b029020cb6a66077mr6634257pfb.51.1616654216517; 
 Wed, 24 Mar 2021 23:36:56 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id v135sm4479469pgb.82.2021.03.24.23.36.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 23:36:52 -0700 (PDT)
Date: Thu, 25 Mar 2021 12:06:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Deng <jie.deng@intel.com>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
Message-ID: <20210325063649.tvsxcxbbxuajl3og@vireshk-i7>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <f2f80985-b452-23e0-1892-2c8eaba4e691@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2f80985-b452-23e0-1892-2c8eaba4e691@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25-03-21, 14:17, Jie Deng wrote:
> i2c->adapter_num is set here, but used in vi2c_remove_adapters.
> when you goto out from while {...}, i2c->adapter_num is always 0,
> May be a bug ?

It certainly is, this should fix it:

diff --git a/tools/vhost-user-i2c/main.c b/tools/vhost-user-i2c/main.c
index 071493cbd5c5..65d27ef04d42 100644
--- a/tools/vhost-user-i2c/main.c
+++ b/tools/vhost-user-i2c/main.c
@@ -202,7 +202,7 @@ static void vi2c_remove_adapters(VuI2c *i2c)
     VI2cAdapter *adapter;
     int32_t i;
 
-    for (i = 0; i < i2c->adapter_num; i++) {
+    for (i = 0; i < MAX_I2C_ADAPTER; i++) {
         adapter = i2c->adapter[i];
         if (!adapter) {
             break;

-- 
viresh

