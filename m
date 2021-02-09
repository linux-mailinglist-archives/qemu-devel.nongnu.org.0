Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06180314C7B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:08:56 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Px1-00046j-2j
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9PvZ-0002tk-4t; Tue, 09 Feb 2021 05:07:25 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:39442 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9PvW-0002J4-QR; Tue, 09 Feb 2021 05:07:24 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 60BF24128C;
 Tue,  9 Feb 2021 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1612865238;
 x=1614679639; bh=uQd7lBfu0PQDzZQQFr9JSbZnm51uP01un0c/iEfPsd8=; b=
 iG0HUdbLO+aDsI3XWcE0/BuyFuObyMLz2rj3yja8NaNjCus9JBIKEH388EZzfWZV
 l+OrJEBRPkzIHcpWOH8MMoHbcuYdnbgV7LxlFfwV+sjl+ctxEI0AUJdSfA3xpbSh
 MjzowTFf5+q6BLG9oSxLKu7UX6PVv5K+7G4iHv/iw10=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klOqTLAw_zf8; Tue,  9 Feb 2021 13:07:18 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5E018411FB;
 Tue,  9 Feb 2021 13:07:17 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 13:07:17 +0300
Date: Tue, 9 Feb 2021 13:07:16 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v6 02/11] hvf: x86: Remove unused definitions
Message-ID: <YCJe1F4ke4sgJDog@SPB-NB-133.local>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-3-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210120224444.71840-3-agraf@csgraf.de>
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 11:44:35PM +0100, Alexander Graf wrote:
> The hvf i386 has a few struct and cpp definitions that are never
> used. Remove them.
> 
> Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---

Queued, thanks!

-Roman

