Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0F205745
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 18:33:23 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnlrO-0007T7-99
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 12:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jnlpv-0005xh-Le
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:31:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45440
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jnlps-0006IF-SZ
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592929906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HnUFO4GLRnyYxqMKa07QUTa20TK2VHRcsnfFr1hxvXw=;
 b=KxuGi60XD7YyaPg7pH8dxDvEr8lR++x1sNhhcec/rkYMGwBMCmYDpADKwq77kj86YCCRt1
 2ZM/yiA8SBgwch2IrR3OYIeJHWdg1eTcGjoOV3/rcyhL3CN6MuUKlPa1B0beQwd/dbg/iT
 JGpLg/nRbBZ/tGqBC8Vf0fcFBh0HuKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-IF8ExbVkNn242DxKa_2vVw-1; Tue, 23 Jun 2020 12:31:42 -0400
X-MC-Unique: IF8ExbVkNn242DxKa_2vVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B34B51940920;
 Tue, 23 Jun 2020 16:31:41 +0000 (UTC)
Received: from localhost (ovpn-113-247.phx2.redhat.com [10.3.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E0DB79307;
 Tue, 23 Jun 2020 16:31:40 +0000 (UTC)
Date: Tue, 23 Jun 2020 12:31:39 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4] target/i386: Add notes for versioned CPU models
Message-ID: <20200623163139.GF9925@habkost.net>
References: <20200324051034.30541-1-tao3.xu@intel.com>
 <cf93e187-9ee0-d1a9-be81-1afba87c1420@intel.com>
 <9bfdd16c-ec47-2d3a-8309-b32c1f6f9ec2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9bfdd16c-ec47-2d3a-8309-b32c1f6f9ec2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Tao Xu <tao3.xu@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 09:43:37AM +0200, Paolo Bonzini wrote:
> Queued, thanks.

Thanks Paolo, and apologies to everybody for not replying before.
I'm severely behind on my upstream mailbox handling.

-- 
Eduardo


