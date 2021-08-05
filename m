Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56143E1D2B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 22:11:49 +0200 (CEST)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjiW-0002zw-Cw
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 16:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBjhe-0002C4-AN
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:10:54 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBjhc-00019l-P7
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:10:53 -0400
Received: by mail-qv1-xf31.google.com with SMTP id em4so3672258qvb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pYqg3EmrNmigpIeCPgL9Shzu+Y1MOk3TBCrQCm5O2Q=;
 b=H79xEw13Rkq/zK02FKqcnyrzn2ftRVMTt11DJwyYOhiTaanXJHq35bT1Besp/RZlbo
 PRz95PGQ/Q+Tm3v2DKQuSCFeAlnfUEjjKg/DctYMHgsI2uyIuNbGONfjZgFi5UHUioE3
 b8SLJWhfxnSrTZQ/aXvLuXRItPYr4wAj1Sz1jzslk9mNvm2v/pkl8PXS35uxLWf3sap3
 pT6W1untnWk17dBxDAzamABokLxbM4Plh8r4Uh3hi717p8THj7Un3DydmeSBoNordeSQ
 v77oyAyeUbv0MRJbvUqFqehmQmTE0r/Ozt2O/FyWQY+ZBfxg8y+R7919oJU7NtbU1C6I
 EfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pYqg3EmrNmigpIeCPgL9Shzu+Y1MOk3TBCrQCm5O2Q=;
 b=ZHAL064IG+AckeTeRETONFbuFEC1HnP2nK9lXbBh4rn+wp5qQSLcc/V/PXv0kfplgw
 cvC3zd8vhJAT9eOmP8uHMb5ACaSbu2QGlQurJM9XATz7rMnMh5U71rv9/m0ifIfNfiCF
 ettFH+iECyRrV+EAQ21So2df+w+BJJVdXNx9xlJT+WYn2zSjHmqYs6zYjWcs3CpD2Wek
 8OyLchWEt0Ihwe3BiOknEaTZFdOAEdr5VOo07k8qOcNG38zA73hxF94fg0q/K7/2adr0
 9iqfTFyo20jhylolM7BOavWa6P4ySfcIrJJH5JmhC/cMSCRbjCb//MKQTvaMN6QvNDXA
 Aw/g==
X-Gm-Message-State: AOAM532KAKt8rd82rpOV+d5SspMJaN/yCjl+lZbIvnS8o2j/WAf212iN
 SGsX//3Vkw38PEI/pDOeBIYAIg==
X-Google-Smtp-Source: ABdhPJyItBigFx7uPVIbp9nAOSRVz6nudwDb6bv0JKjdkWF66jNCqloAEyeSWu+dRJgbZ+06htMX9A==
X-Received: by 2002:a05:6214:1329:: with SMTP id
 c9mr7247211qvv.18.1628194251080; 
 Thu, 05 Aug 2021 13:10:51 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id w185sm3659568qkd.30.2021.08.05.13.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:10:50 -0700 (PDT)
Message-ID: <1f4640676066862455f958e182ccae4286febe2d.camel@linaro.org>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
From: shashi.mallela@linaro.org
To: Leif Lindholm <leif@nuviainc.com>, Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 05 Aug 2021 16:10:49 -0400
In-Reply-To: <20210708220546.rd7yqpsh6l7dmltu@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
 <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
 <20210604104204.z3hhm2cxesnm2jx2@leviathan>
 <16db7ae4bb0b38100a08f0539ae2865c15264f1e.camel@linaro.org>
 <20210708194053.ar4yspiodigxwbwc@leviathan>
 <CAFEAcA-9XnY=4qsD9RGVy1sTW-d=B6MGPLd-Qqs7HWMRC-dfeQ@mail.gmail.com>
 <20210708220546.rd7yqpsh6l7dmltu@leviathan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf31.google.com
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
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-07-08 at 23:05 +0100, Leif Lindholm wrote:
> On Thu, Jul 08, 2021 at 21:05:02 +0100, Peter Maydell wrote:
> > On Thu, 8 Jul 2021 at 20:40, Leif Lindholm <leif@nuviainc.com>
> > wrote:
> > > I think my summary-summary would be:
> > > - I think we will need to introduce a compatiblity-breaking
> > > change to
> > >   sbsa-ref.
> > > - I think we will need to have support for more than one ITS if
> > > we're
> > >   going to be able to use QEMU to prototype real systems.
> > > - I think we should then start versioning sbsa-ref (like many
> > > other
> > >   platforms already are). And there are other reasons why I would
> > > want
> > >   to do this.
> > > - But I think it would be unfair to hold this set back for it.
> > 
> > FWIW, I do not currently expect this series to make 6.1, so we
> > have some time to get things right.
> 
> Ah, ok.
> 
> Then I would ideally like to see this patch add the ITS block between
> Distributor and Redistributors regions. I think it makes the most
> sense
> for this version to match the GIC-600 layout.
Have added ITS block between Distributor and Redistributors
regions,with comments.
Also,added sbsa versioning support (as discussed in last call)
> 
> I am also going to rework those two remaining gicv4-ish patches based
> on my acquired understanding, to be sent out post v6.1.
> 
> And, I would like to switch the default CPU of sbsa-ref to "max" as
> part of that platform versioning, now that is supported in TF-A
> (from v2.5).
> 
> /
>     Leif


