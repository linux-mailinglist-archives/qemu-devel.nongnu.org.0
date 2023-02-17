Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29F69A49B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:02:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrwK-0004HP-Rz; Thu, 16 Feb 2023 23:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSrwI-0004F7-LH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:01:38 -0500
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSrwG-0007eX-P4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:01:38 -0500
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 258599645
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X2rvq6Iiu9e8WuLeFE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENS1zMDx
 zdKXmuPbKrcZ2qkKN91aYng8xlXsJXdz4NrQFNorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8rWo4ow/jb8kg35qyi4GlwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj6/hRT1MyML9Iwd0pED5qt
 sE3eQsuZynW0opawJrjIgVtrsEqLc2uJZ9G/385nG6fAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2M+M3wsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTWDkV0gjuSwWDbTUtWqXd5wx3y5n
 GLL7Ur4OQkLKMWb+wPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMy9O08rR30CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:ZlEbb63PCqRCQFjA8cPojwqjBGQkLtp133Aq2lEZdPWaSL3+qy
 mLpoVn6faUskdqZJhEo7q90ca7MBHhHPJOkOws1PKZLXXbUQiTXfpfBOnZskTd8kTFn4Y3pM
 RdmupFeaXN5DBB7foSizPIderIruP3lJyAtKP1400oYztXS5xN2S9ENyfzKDwIeOCEP/YE/V
 ini/avawDPRZ3fVKvbOkU4
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:01:32 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so2436864qtj.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rd3N5QS4HS+wFLBD+MaPnOdY24ONyLKVvnOvbKoBHd4=;
 b=DSWsyjQ19J7DA6QwprPOei8TUPBPNKg6qvTixErxhI/KhC4edMHvJR7aTGB8DaDWjA
 +RIzxA0Gz/E6CYs8vQyCwn7u9pEw1VVQVxFFQQTQ3xBKwq2kpazRDLpn9BCaZQwK/N5/
 8tSFEZEQye/XXtLxF5gYfQB5iMgh4+zWg/LSF5Dt9tf4oT7F/QKogqcNH5iWws9Hw+/u
 QGgNa4QvCfaX0nLgSYrAlR39FPD628ex5bWTUcPm8sXqEYTegAGktBO2u6OY2L6d71vm
 U9jOVImluRVdksYpVN1tnFwwvVu5GtOVtOhUMu1en8nGO/c7HxKpedxY20Dk4JwJod8f
 CwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rd3N5QS4HS+wFLBD+MaPnOdY24ONyLKVvnOvbKoBHd4=;
 b=6VTcSvGizMvlOw85Xkj6ftG6cKlkOXCp6Vg5W714F++qWYgUVZJOaQlXdduYvbu4OB
 xt6R6AAPk/3umcZCMXF198ilxWl6Q6p34/3YNYDFs59bOPVPVLUgqSPioDtm5z3rB5Zh
 L1GviOZXmUlbjCG7+TY9oFaDDEm4QDyAo9Mewih/XTpjw2+uXAnTYsVeDP9TZBF5qjAE
 A4fv0dLR5xT9VkcaDHE3A5s9pmVmFIO9JrQi+zWy0N9eysOq59327nwe5GYOXXRWWgJj
 p03B22CpMsIUh+6wEJlr4epH21m+86wuW3/qozeYS8r3RfL7ukrR1E6tDasAccmuQ2pt
 Sp2A==
X-Gm-Message-State: AO0yUKVDQKld7K10cjQHFMpEQtsDOZzEI9xbY7FXAetIoJFMB9oiIQ9Z
 wL8FV1QUb9JG4u9RJ8nkoTwnugdU7A8nj9+Ch2/pS3YeRH5JAs1781gIZYgXesg2v309GAe400l
 wJ537EnTAQzlo1WdNO/rDwHK4mZaLew==
X-Received: by 2002:a05:622a:1647:b0:3b9:bda7:bfa7 with SMTP id
 y7-20020a05622a164700b003b9bda7bfa7mr13383223qtj.40.1676606491100; 
 Thu, 16 Feb 2023 20:01:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8iLJTB8grrsT+NGfj+olwjkT4CygHkeZffAlVAot21fKgrOHYirzDSsBPFVo0D3fcgsK1OTQ==
X-Received: by 2002:a05:622a:1647:b0:3b9:bda7:bfa7 with SMTP id
 y7-20020a05622a164700b003b9bda7bfa7mr13383207qtj.40.1676606490814; 
 Thu, 16 Feb 2023 20:01:30 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 b20-20020ac844d4000000b003b84b92052asm2511075qto.57.2023.02.16.20.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:01:30 -0800 (PST)
Date: Thu, 16 Feb 2023 23:01:27 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Darren Kenny <darren.kenny@oracle.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 03/10] fuzz/generic-fuzz: use reboots instead of forks to
 reset state
Message-ID: <20230217040127.ezu4ua7xoyky43y5@mozz.bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-4-alxndr@bu.edu>
 <m2o7pxr69d.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2o7pxr69d.fsf@oracle.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230213 1426, Darren Kenny wrote:
> Hi Alex,
> 
> On Saturday, 2023-02-04 at 23:29:44 -05, Alexander Bulekov wrote:
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  tests/qtest/fuzz/generic_fuzz.c | 106 +++++++-------------------------
> >  1 file changed, 23 insertions(+), 83 deletions(-)
> >
> > diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> > index 7326f6840b..c2e5642150 100644
> > --- a/tests/qtest/fuzz/generic_fuzz.c
> > +++ b/tests/qtest/fuzz/generic_fuzz.c
> > @@ -18,7 +18,6 @@
> >  #include "tests/qtest/libqtest.h"
> >  #include "tests/qtest/libqos/pci-pc.h"
> >  #include "fuzz.h"
> > -#include "fork_fuzz.h"
> >  #include "string.h"
> >  #include "exec/memory.h"
> >  #include "exec/ramblock.h"
> > @@ -29,6 +28,8 @@
> >  #include "generic_fuzz_configs.h"
> >  #include "hw/mem/sparse-mem.h"
> >  
> > +static void pci_enum(gpointer pcidev, gpointer bus);
> > +
> >  /*
> >   * SEPARATOR is used to separate "operations" in the fuzz input
> >   */
> > @@ -589,30 +590,6 @@ static void op_disable_pci(QTestState *s, const unsigned char *data, size_t len)
> >      pci_disabled = true;
> >  }
> >  
> > -static void handle_timeout(int sig)
> > -{
> > -    if (qtest_log_enabled) {
> > -        fprintf(stderr, "[Timeout]\n");
> > -        fflush(stderr);
> > -    }
> > -
> > -    /*
> > -     * If there is a crash, libfuzzer/ASAN forks a child to run an
> > -     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
> > -     * communicates with this child using a pipe.  If we timeout+Exit, while
> > -     * libfuzzer is still communicating with the llvm-symbolizer child, we will
> > -     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
> > -     * to lead to a deadlock in the forkserver. Use waitpid to check if there
> > -     * are any waitable children. If so, exit out of the signal-handler, and
> > -     * let libfuzzer finish communicating with the child, and exit, on its own.
> > -     */
> > -    if (waitpid(-1, NULL, WNOHANG) == 0) {
> > -        return;
> > -    }
> > -
> > -    _Exit(0);
> > -}
> > -
> >  /*
> >
> 
> I'm presuming that the timeout is being left to the fuzz orchestrator
> now, rather than us managing it directly in our own way?

Yes. The fuzzer should handle timeouts directly now. 

-Alex

