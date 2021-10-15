Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC342EF29
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:54:24 +0200 (CEST)
Received: from localhost ([::1]:55010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKr2-0003Wm-07
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mbKpg-0002qx-9Z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mbKpe-0003gm-Ny
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/Ofifev486097JSZ6YO2tEnUKPRS1O5CkTiLJVD+R6U=;
 b=Vd1UTT7KkCW5jr/GF9s9wvTrtV8ufMbJggUN9LyY9h/q6dyFrwO6pWCl5zoCK3Jou08iVh
 mWTRHAzaZs7rO44fvoJJ4o0I/ZhRA0VdORSStpTzQ8RqtTY2bTt47Tb6U/EudZrbxAEZPC
 RdCEJGA1xrxKbUzvVAEku2DniUdRC4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-gKz5RLK-PS6XK0NTrgdjVg-1; Fri, 15 Oct 2021 06:52:56 -0400
X-MC-Unique: gKz5RLK-PS6XK0NTrgdjVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDC318D6A25
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 10:52:55 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CEF60583;
 Fri, 15 Oct 2021 10:52:53 +0000 (UTC)
Date: Fri, 15 Oct 2021 12:52:50 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: On versioned CPU models, aliases, and machine types
Message-ID: <YWldgo3j6KEFpVvL@paraplu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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
Cc: berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

With the versioned CPU models, I see that the plain, non-versioned named
model now says: "alias configured by machine type".  For example:

    $> qemu-system-x86_64 -cpu help | grep Broadwell
    x86 Broadwell             (alias configured by machine type)                        
    x86 Broadwell-IBRS        (alias of Broadwell-v3)                                   
    x86 Broadwell-noTSX       (alias of Broadwell-v2)                                   
    x86 Broadwell-noTSX-IBRS  (alias of Broadwell-v4)                                   
    x86 Broadwell-v1          Intel Core Processor (Broadwell)                          
    x86 Broadwell-v2          Intel Core Processor (Broadwell, no TSX)                  
    x86 Broadwell-v3          Intel Core Processor (Broadwell, IBRS)                    
    x86 Broadwell-v4          Intel Core Processor (Broadwell, no TSX, IBRS)     

Now, any QEMU binary (qemu-system-x86-6.0.0-1 in my case) supports a ton
of versioned machine types.  So when the plain "Broadwell" model says
"alias configured by machine type", I have two questions:

(1) Is there a way to figure out _which_ exact versioned CPU model will
    plain "Broadwell" alias to in the above case?  

    My guess: Assuming I'm using the plain 'q35' machine type (which
    aliases to the latest versioned machine type), "Broadwell" will
    alias to "Broadwell-v4".

(2) Also, it sounds like depending on the versioned machine type I
    configure, the CPU model alias of plain "Broadwell" might change --
    is this correct?


(Ideally, I'd like to document an example of each of the above in the
in-tree doc, cpu-models-x86.rst.inc.  It's not really obvious.)

-- 
/kashyap


