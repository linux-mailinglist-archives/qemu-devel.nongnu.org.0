Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B43C2A87
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:51:10 +0200 (CEST)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xSn-0002xm-Or
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1xQn-0002H0-Tb
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1xQk-0000Tc-RC
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625863742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuQg7NgWfLiv53lTHA8C4Hh4r20pKUFmXgdapWTJ1Yk=;
 b=NSVl+oC+WDYPCvd527vOQNjQNm1bZjsaZHS4oFBngioQehwcywkBSBXUOf5yQxxT1FoQAy
 Rt/9p88s10Z6H6XIn0iFFd9HXd1xeTmbygZLv5PBFjfw6Gw3UtgrjDW9G9dL75G6NsrJSs
 CmbtOx/sb9X3CYCVSKXMC89FDGTsko8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-fS5K1-ewOf2Xm_lXUSyOuw-1; Fri, 09 Jul 2021 16:48:59 -0400
X-MC-Unique: fS5K1-ewOf2Xm_lXUSyOuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0406D18414A6;
 Fri,  9 Jul 2021 20:48:59 +0000 (UTC)
Received: from localhost (unknown [10.22.9.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 969C260C04;
 Fri,  9 Jul 2021 20:48:58 +0000 (UTC)
Date: Fri, 9 Jul 2021 16:48:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/4] docs: improve -smp documentation
Message-ID: <20210709204857.n3lgxit32lcvlkv7@habkost.net>
References: <20210628113047.462498-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628113047.462498-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 12:30:43PM +0100, Daniel P. Berrangé wrote:
> This is a spin off from this thread:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06135.html
> 
> to improve the documentation of the current behaviour of -smp
> arg. In that thread it is suggested that we change the behaviour
> to prefer use of cores over sockets, when topology is omitted. This
> documentation update explicitly notes that default topology is liable
> to change, to allow for this enhancement.

Queued, thanks!

-- 
Eduardo


