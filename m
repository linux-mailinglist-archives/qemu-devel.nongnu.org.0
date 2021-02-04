Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4B930F514
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:36:37 +0100 (CET)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fkK-0000fb-OX
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l7fhJ-0006QQ-6X
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:29 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l7fhH-000695-Jk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:28 -0500
Received: by mail-lj1-x235.google.com with SMTP id e18so3602244lja.12
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xkdDG3i8COhlrstdleDSnmJss+riUa4zhVHMfn5hAco=;
 b=gp4waBXpMdJwXgi+qwH9soYOjwm2/NgB9OQTT6CrlSY3gRH4OKE4h5BIcsp3QChfw0
 jriZG3ZTl3CRQBWKZaE/LTD2b370S565SEjFFEc2poi1A7X0jWC4TsODm6vylM7uFTMA
 +9XXfGo+DVd2SHXGc8aEMJBEz9NaE9TK5T9Cr3aIuLZvK9AJBrfOmTLLJeiro1Cg5xsw
 nJocGhalsK7SWtXOdm3s3abWFkrzI/Q0VLRxcIHSZbAZOofd1ZMD3oAkZke1IjpodEJc
 H87aNWgPnTUVIl8SA+1XSf3MSxzGM8GB/eg86Rmy/XXjJ/w/O2VVo/3Hk+Uof2G3+2DU
 0a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xkdDG3i8COhlrstdleDSnmJss+riUa4zhVHMfn5hAco=;
 b=GLQQX8lhAWZbPBPwUMWrv1Q9c+MovWFv6yFljxpkbc8I9UT8LWue+Bd+7knXbCLXoD
 /wTQ1fyTycEFDdgE4Z2o4s8jQRBs+SFLKAlRTRe1WuGJzfL25JhakndsOmeq3+uKQ7jx
 VThXaqmE0MQ63J1qNsb/x+selZmE/BmHKBclU/UwSQCd2uiAHI5OIzEkP+zVdWFkxd9U
 skDtherdcQHHywa+rLs+SH8XVIInZ3Nasb8vHk/H5LEbh7Qe6W937yRta4YdeoWw1oxR
 kJpqrHgutXtjOP8JaqnHNB+uyf6n982Me41WEoA3PB2dea2QWHEkuB7OSNt3gYzR+vqs
 /lhg==
X-Gm-Message-State: AOAM533IoMfXStAkRTE0dbXl/an16DtXjTHPmLnMVOQckV8k5S2Uf5et
 nZgCC7XLB9YFmE5infCtUnc=
X-Google-Smtp-Source: ABdhPJy+UVIMfJ/3qo3kdGNXbX7mM2okR6B6CXIy9dXrIlx55U/gn8aKaPBnGN4uZHitzJ/ZkZfHxQ==
X-Received: by 2002:a2e:bc28:: with SMTP id b40mr4822157ljf.167.1612449205001; 
 Thu, 04 Feb 2021 06:33:25 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id z23sm680096ljj.25.2021.02.04.06.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 06:33:24 -0800 (PST)
Date: Thu, 4 Feb 2021 15:33:23 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] target/cris: Use MMUAccessType enum type when possible
Message-ID: <20210204143323.GF477672@toto>
References: <20210128003223.3561108-1-f4bug@amsat.org>
 <20210128003223.3561108-2-f4bug@amsat.org>
 <c92e6957-8e17-e11f-e269-888b8b1b3c84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c92e6957-8e17-e11f-e269-888b8b1b3c84@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 04:45:50PM -1000, Richard Henderson wrote:
> On 1/27/21 2:32 PM, Philippe Mathieu-Daudé wrote:
> > Replace the 0/1/2 magic values by the corresponding MMUAccessType.
> > We can remove a comment as enum names are self explicit.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >  target/cris/helper.c |  4 ++--
> >  target/cris/mmu.c    | 13 ++++++-------
> >  2 files changed, 8 insertions(+), 9 deletions(-)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Can this go through the trivial tree?

Thanks,
Edgar

