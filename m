Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A442F6AC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 17:09:27 +0200 (CEST)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOpr-0003rL-2i
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 11:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbOoN-0002rP-Oz
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbOoK-0004Dp-MG
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634310470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z5rXnVexIEPwDks/z4532/vE1EIzO7cjaTY2Vyo/4AI=;
 b=TeR2LtHQiAW+sWnd91as9Y8+mGcsqZA8XXDCTZBVkATgg1U/PKieICH4zs7jVlWu9sGkn0
 G0tw6zNt5f9K+a+QlLLLxhtsFqkATh3Z4Ew5u5gq5sAkHJwoVcIfPptgyuK1hDc7u61rtH
 IVD3yjBs8KDxwxCtdQf9t/YizTDB/iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-YC0CWcX5MSWO_bLZJq5zxg-1; Fri, 15 Oct 2021 11:07:46 -0400
X-MC-Unique: YC0CWcX5MSWO_bLZJq5zxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9675D1006AA2;
 Fri, 15 Oct 2021 15:07:45 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5F1F7086D;
 Fri, 15 Oct 2021 15:07:43 +0000 (UTC)
Date: Fri, 15 Oct 2021 11:07:43 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v2 0/2] Remove unsupported features in SNR CPU model
Message-ID: <20211015150743.qzm32gfty746a5cu@habkost.net>
References: <20210827064818.4698-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210827064818.4698-1-chenyi.qiang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 02:48:16PM +0800, Chenyi Qiang wrote:
> Patch 1: https://lore.kernel.org/qemu-devel/20210825195438.914387-2-ehabkost@redhat.com/
> 
> Patch 2 removes one more feature (core-capability) in Snowridge-v4 CPU
> model based on previous patch.
> 
> Chenyi Qiang (2):
>   target/i386: Remove split lock detect in Snowridge CPU model
>   target/i386: Remove core-capability in Snowridge CPU model

Patch 2/2 queued (patch 1/2 was already merged).  Thanks and
apologies for the delay.

-- 
Eduardo


