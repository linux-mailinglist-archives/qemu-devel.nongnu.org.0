Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3BD2482FB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 12:30:44 +0200 (CEST)
Received: from localhost ([::1]:50416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7yt9-0007aH-1D
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 06:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k7yrq-0006CJ-2o
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:29:22 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:39220 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k7yro-0001HG-8p
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:29:21 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 58B67548E8;
 Tue, 18 Aug 2020 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1597746557;
 x=1599560958; bh=eS3H6W4JKsukmi39FK8PxGtk7QxRbPtQ/zMCVULnvjI=; b=
 eEOz5AnkttYFUYbjRtw6wCsnI+LLtG14iqj5LoRX3B+g/rwdE25Ygq0wztuY1hmX
 0gEZearHRKDyYQ2l8HxUtuIug1WfO/qtEYDk0SgzkTyKQzRX9e5JQHA04bF3gyXF
 sj5uvJkOW9QZdssxMl37sJim32J98L1oxBxUeKre/h8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0l6HgVm6B7H; Tue, 18 Aug 2020 13:29:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 49D45548E3;
 Tue, 18 Aug 2020 13:29:17 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 18
 Aug 2020 13:29:17 +0300
Date: Tue, 18 Aug 2020 13:29:16 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 13/41] hvf: Add missing include
Message-ID: <20200818102916.GA74567@SPB-NB-133.local>
References: <20200813222625.243136-1-ehabkost@redhat.com>
 <20200813222625.243136-14-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200813222625.243136-14-ehabkost@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 05:59:06
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 13, 2020 at 06:25:57PM -0400, Eduardo Habkost wrote:
> The sysemu/accel.h header is needed for the ACCEL_CLASS_NAME
> macro.  This will be necessary to allow us to use OBJECT_DEFINE*()
> for TYPE_HVF_ACCEL.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  include/sysemu/hvf.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

