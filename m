Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5016733AB9C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:34:06 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgnl-0006HU-5k
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLgmT-0005hC-55
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 02:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLgmO-0003Tp-PM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 02:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615789957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAEwlBbE99P5TcB8vdIDS+lv+3K2evZ6GTLc7onw79M=;
 b=W10MiB7WYdaP7cG9dFBA7k83V/FeEswz7H1fvWOfJiXrd/gt+sDTNVraHn0XbTTHenwBze
 WNYVlXJW5kYOu4E/FAyx30mx7HQ1DX9yL0hK3L3DdKrqpGIHRDbKPbUfYN//0PoaDX8TQi
 TwTO3/Z1jRpNxUa72QZt1pCKrwJbvIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-P6UgA9kdOJq6ZItX82cEqQ-1; Mon, 15 Mar 2021 02:32:34 -0400
X-MC-Unique: P6UgA9kdOJq6ZItX82cEqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 824DF1015C84;
 Mon, 15 Mar 2021 06:32:32 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758D019D7C;
 Mon, 15 Mar 2021 06:32:28 +0000 (UTC)
Date: Mon, 15 Mar 2021 07:32:26 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v3] multi-process: Initialize variables declared with
 g_auto*
Message-ID: <20210315063226.vcjpencawtvfcstp@lws.brq.redhat.com>
References: <20210312112143.1369-1-yuzenghui@huawei.com>
 <20210315054804.6yxv6dvypipwa7wu@lws.brq.redhat.com>
 <a5fd7fd6-55a1-5daa-e821-098d8926c78a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a5fd7fd6-55a1-5daa-e821-098d8926c78a@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
 laurent@vivier.eu, berrange@redhat.com, wanghaibin.wang@huawei.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 02:20:10PM +0800, Zenghui Yu wrote:
> On 2021/3/15 13:48, Miroslav Rezanina wrote:
> > Missing declaration without initialization in hw/s390x/s390-pci-vfio.c
> > othwerwise correct. Will you send v4 with missing initialization or
> > should I send then as another patch?
> 
> I'd prefer the latter so that subsystem maintainers can take the
> separate patch into their own tree ('Multi-process QEMU' and 'S390 PCI'
> in this case). Please go ahead for the s390 fix.
> 

Ok,

I'll handle remaining g_autofree.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

> 
> Thanks,
> Zenghui
> 


