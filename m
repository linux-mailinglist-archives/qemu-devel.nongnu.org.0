Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCBF21EE21
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 12:40:26 +0200 (CEST)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvIMK-0007LY-JX
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 06:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jvILb-0006tx-GP
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:39:39 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:44758 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jvILZ-0002E3-S8
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:39:39 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1A6794C87A;
 Tue, 14 Jul 2020 10:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1594723173;
 x=1596537574; bh=dDDniMcL7h6ErMjL07Tyn6Kei8vXefMbFE2fvfwbDdU=; b=
 DmTP1jygqmtZF/2a76mGsvq0xpU2aJX3gWhEIDuNMzYDf0GSFt4ThdZpiJ07zkx6
 kerZ8usHtG2273ECKaLglcbICpsIewF7L3J5nA14VgWr7Bv3eiP7jODNViwQ4Inc
 D03zTGzHYmFTFXZ7GCgAl80V20kti487jEz330JdVIw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryxqAIUoU0ib; Tue, 14 Jul 2020 13:39:33 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0131A47D0B;
 Tue, 14 Jul 2020 13:39:32 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 14
 Jul 2020 13:39:32 +0300
Date: Tue, 14 Jul 2020 13:39:32 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH for-5.1] i386: hvf: Explicitly set CR4 guest/host mask
Message-ID: <20200714103932.GB90799@SPB-NB-133.local>
References: <20200714090726.41082-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200714090726.41082-1-r.bolshakov@yadro.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 05:09:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: programmingkidx@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 14, 2020 at 12:07:27PM +0300, Roman Bolshakov wrote:
> Removal of register reset omitted initialization of CR4 guest/host mask.
> x86_64 guests aren't booting without it.
> 
> Fixes: 5009ef22c6bb2 ("i386: hvf: Don't duplicate register reset")
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 

If one has a chance to test or review it, it'd be very helpful. That'd
allow to include it in RC0.

Thanks,
Roman

