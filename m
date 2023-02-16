Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BBA699502
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdqc-0006kk-9s; Thu, 16 Feb 2023 07:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdqX-0006jz-QI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:58:45 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdqW-0007vr-7h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:58:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n33so1543459wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t1bddwxU6wwx5dTZeUEYAjH4QHAKht2JsJAzeGfvEyQ=;
 b=BCEY9v+VAhq8yrhd0YHSUuy2X1yNDg8bNp/UkQPBa7lWXaFMu0yA+FtU3Vgt4e1/WX
 EvHT5kgOyr9n6R5d5V+ZVaHZ4qzG+gUdq0uk3j1YjkLrxISIHSRGo+DRm1jnwnoV9aoO
 9iY8sKbDx1qo6iZPAcqBUIwxHMreYvKUFIg+BjHo+rPAviLSb3MA2nOJ0fH/HBbkFNR6
 MIkTqU70EdEt05dQgaJo+w9fIsnesmg+Rj6Tst7xfIaBD5/+IZ5LMLstEtjHxnaIyxFJ
 mdvT2WZDD7ksNPn5McD9XRalt1HIYzLxUmj2CQ5qagUmSO1WMaNyeXTuew8mTE6empux
 6U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1bddwxU6wwx5dTZeUEYAjH4QHAKht2JsJAzeGfvEyQ=;
 b=ofiXpdAibnbbbSxV9LRDGOvt8lZwpyXTBPr1Muo+AqWvUdt/9e2UAPswoiUCBdLlwM
 3kQxaRwmaDvSm3SXWDy7cb44QlD8UoXZCFjLxm3j6WC7uz3/l3cZ8whZauYwOzfkO4ri
 WiJQzAit07kGC3WDOtyK1Hst5NRecCMyWd1rd6RYFXPMVAI0RtGOHYMwayDR6RWIKy7B
 bVrVDj5QjBFRCD7i4VJG81j8ilBRzg86V8jMosWd7RkHNGLPxxghyAMt9cn4qHbuAWrq
 0ymEwPEOPNdixDPEvpLQeJEZN48Hk3s195wVp2U9xHHC+9WAF0RvLJ4d48+9qonNz2cZ
 ME+g==
X-Gm-Message-State: AO0yUKVNvMn5RqhtD+uygQj9dXGREAONQ9N1lQnjZgqC7OVU/KCK3Gt5
 d1CKNEeFL8MxT1w9oii04A8ofg==
X-Google-Smtp-Source: AK7set89cIrxwBK1Aq9voM3+yeVDmw32QLkRr4F2ZGvDtJY+MvIdHWf4fYVoq7kS7+/ZzvC3KFAuEQ==
X-Received: by 2002:a05:600c:3ba6:b0:3dc:37b4:7983 with SMTP id
 n38-20020a05600c3ba600b003dc37b47983mr216721wms.0.1676552322521; 
 Thu, 16 Feb 2023 04:58:42 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 s5-20020adfeb05000000b002c54c0a5aa9sm1452780wrn.74.2023.02.16.04.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:58:42 -0800 (PST)
Date: Thu, 16 Feb 2023 12:58:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
Message-ID: <Y+4ofnf3wWKenB7T@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-5-smostafa@google.com>
 <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Wed, Feb 15, 2023 at 05:29:04PM +0100, Eric Auger wrote:
> >
> > The property added arm-smmuv3.stage can have 3 values:
> > - "1": Stage-1 is only advertised.
> Stage-1 only is advertised

I will update it.

> > - "2": Stage-2 is only advertised.
> > - "all": Stage-1 + Stage-2 are supported, which is not implemented in
> > this patch series.
> >
> > If not passed or an unsupported value is passed, it will default to
> > stage-1.
> >
> > The property is not used in this patch as stage-2 has not been
> > enabled yet.
> Usually the user knob (ie. the property) is introduced at the last
> stage, ie. at 16/16.
I will split this commit, move the knobs to the end and keep features
definition as it is used by other commits.
I think it would also make sense to merge the knobs commit with last
one([RFC PATCH 16/16] hw/arm/smmuv3: Enable stage-2 support).


Thanks,
Mostafa

