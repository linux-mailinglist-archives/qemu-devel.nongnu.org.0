Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A242B96B6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:52:24 +0100 (CET)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmER-0005rg-Ht
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfm9B-0000gP-Qg
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:46:57 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:54036 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfm99-00040I-Sp
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:46:57 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 55B3F41391;
 Thu, 19 Nov 2020 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605800811;
 x=1607615212; bh=87PKepDaDrFaKyexBAzFgvgF4DT7yKMvOgLLTdiY1Ao=; b=
 u8+I0NZebtM1H2viYmVPmNDug+DGxSV2ylleyVfpohYed6MKUitwSvCWETov1TDx
 wOQrIYknpPHmpZdO3SMHLbRBJDEHl1uG31dPRaaqADigqNMKLDb0J/KYSYwIjNHy
 MdAlf9hr3xutMKFCn9OI1RuXI3HtJ4A5OZLZXK511fs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBh71502uRFj; Thu, 19 Nov 2020 18:46:51 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 67A6841387;
 Thu, 19 Nov 2020 18:46:51 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 19
 Nov 2020 18:46:51 +0300
Date: Thu, 19 Nov 2020 18:46:50 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH for-6.0 0/6] Add HMP/QMP commands to query accelerator
Message-ID: <20201119154650.GG81070@SPB-NB-133.local>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <6ba77678-473a-0da1-f2d4-1fde46790972@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6ba77678-473a-0da1-f2d4-1fde46790972@suse.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 10:46:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:41:53PM +0100, Claudio Fontana wrote:
> On 11/16/20 2:10 PM, Roman Bolshakov wrote:
> > Management applications have no way to determine if certain accelerator
> > is available. That complicates discovery of non-KVM accelerators.
> 
> are we thinking about how to make this future-proof when it comes to
> modularization efforts, ie, when we get to fully modularized
> accelerator plugins?
> 
> Maybe too soon to consider, but still worth mentioning on my side I think.
> 

Hi Claudio,

I'd be happy to do it future-proof if you have something on the mind.
As far as I understand from the discussion, if we have /machine/accel
container, we can use QOM to query properties of the container including
accel name:
qom-get /machine/accel/type

Thanks,
Roman

