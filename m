Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34B3937C0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:06:57 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNDU-0004in-1V
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNC7-0003sn-3G
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNC4-0000LS-6r
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622149526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hYY1q980aVDNCK2eJmT0AdE6p4PjWDjiT2K1MsBNgCs=;
 b=ffItGSZGKLH4Xt2RHK1+4W1S5M8s9rxdIFbOLP6bjgcWepc61v4qtKU6ZypJfnMYt5dXai
 P0h6D5LEJ9ct60bM9ERqS72X00Z4J6Lx1znRCSvVu1zUO84kJBMnd302DXYsLGUp9pPVuP
 0lKGxKxqhY0kSmNtnwLOYVkeCf+MwWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-khA2MUZSPxWpD35lXoI8Zg-1; Thu, 27 May 2021 17:05:24 -0400
X-MC-Unique: khA2MUZSPxWpD35lXoI8Zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5871A1927800;
 Thu, 27 May 2021 21:05:23 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60B81163CE;
 Thu, 27 May 2021 21:05:22 +0000 (UTC)
Date: Thu, 27 May 2021 17:05:12 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 5/5] hw/core/cpu: removed cpu_dump_statistics function
Message-ID: <20210527210512.vy6asdyjub6gzn2f@habkost.net>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
In-Reply-To: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 05:21:04PM -0300, Bruno Larsen (billionai) wrote:
> No more architectures set the pointer to dump_statistics, so there's no
> point in keeping it, or the related cpu_dump_statistics function.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


