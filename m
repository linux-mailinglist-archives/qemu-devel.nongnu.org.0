Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BF2514F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 11:05:39 +0200 (CEST)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAUte-0005JB-AA
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 05:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kAUsR-00049p-P2
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 05:04:23 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:44924 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kAUsP-000445-UD
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 05:04:23 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C2042574EA;
 Tue, 25 Aug 2020 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1598346258; x=1600160659; bh=Bfg43W6veXwmXShFeNEHps
 gpDQxMmmNhK3YPuB3PNVU=; b=fkygnJIxv8ohO6aK0NvrPuO9GTpWwmDiM3BPYi
 b64cmBur49ejbZNFIAx7NbLSsIyJGSdpDJNUnDWpPeShoancKT1EufI94k4SWfSy
 w2yy66d7LrIhnMy1sMHdncdUO80BssZbNPlNdEzY+rXHQ9Ag9uI4/bR3NB+kGY7G
 9PPms=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0kclFBCxe0h; Tue, 25 Aug 2020 12:04:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5C3215229A;
 Tue, 25 Aug 2020 12:04:18 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 25
 Aug 2020 12:04:18 +0300
Date: Tue, 25 Aug 2020 12:04:17 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Don't make object files for dtrace on macOS
Message-ID: <20200825090417.GA38400@SPB-NB-133.local>
References: <20200823090546.47957-1-r.bolshakov@yadro.com>
 <20200824142431.GL10011@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200824142431.GL10011@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 05:04:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 24, 2020 at 03:24:31PM +0100, Daniel P. Berrang� wrote:
> On Sun, Aug 23, 2020 at 12:05:47PM +0300, Roman Bolshakov wrote:
> > dtrace on macOS uses unresolved symbols with a special prefix to define
> > probes [1], only headers should be generated for USDT (dtrace(1)). But
> > it doesn't support backwards compatible no-op -G flag [2] and implicit
> > build rules fail.
> > 
> > 1. https://markmail.org/message/6grq2ygr5nwdwsnb
> > 2. https://markmail.org/message/5xrxt2w5m42nojkz
> > 
> > Cc: Daniel P. Berrang� <berrange@redhat.com>
> > Cc: Cameron Esfahani <dirty@apple.com>
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  trace/meson.build | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Daniel P. Berrang� <berrange@redhat.com>
> 

Paolo, should it go through your meson-fixes tree?

Regards,
Roman

