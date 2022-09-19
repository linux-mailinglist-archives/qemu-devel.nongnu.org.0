Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F305BCF2F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 16:39:25 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaHvg-0001uE-B4
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 10:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zAZx=ZW=zx2c4.com=Jason@kernel.org>)
 id 1oaHsc-0007HN-Ji
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 10:36:14 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:52488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zAZx=ZW=zx2c4.com=Jason@kernel.org>)
 id 1oaHsa-00034i-RG
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 10:36:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4FF561D63
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 14:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB017C433C1
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 14:36:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="U2JpNG73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663598167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J3gDDcBoK/Ah37bzPr6XIlQ//3NIc7JbfieDbL3H6oo=;
 b=U2JpNG736UtvLPgYAL7YO6i2Gn3MzVpbi/PmfAXQ9R3Xm6RN/DROAblUufukZiQDXiIXpO
 4meVJUjwUfRYEw9wi9df1xf05vveBM/UoGF2FrRvWtpf3XMIAiUCVqifjJJMh+DNw//6w+
 yfYqZ1FQPqMIBVC/zgy3B+KrHsv5ksg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9047d40
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 19 Sep 2022 14:36:07 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id bu4so10335242uab.6
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 07:36:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf0FmqBM9dX9o8tOv587Xbou1ZuSTtkXvmoqpbgDzCSoToUP3ao5
 UhN7HmNblRWv8O6gG66OwAAMN00q8uNFLqKhLqU=
X-Google-Smtp-Source: AMsMyM76bk+mCNAu3lvQ1TQ54PtqOk6+BQB5Xv/eAEfmln9b15bKULaGkMgvLieqZPkwq5fkakBNPulprayxhPBX5s4=
X-Received: by 2002:ab0:2b0d:0:b0:390:ed8c:c78d with SMTP id
 e13-20020ab02b0d000000b00390ed8cc78dmr6088319uar.49.1663598167019; Mon, 19
 Sep 2022 07:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220919134126.75656-1-pbonzini@redhat.com>
In-Reply-To: <20220919134126.75656-1-pbonzini@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Sep 2022 16:35:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
Message-ID: <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
Subject: Re: [PATCH] qboot: update to latest submodule
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=zAZx=ZW=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FYI, that commit made it to:

https://github.com/bonzini/qboot

But wasn't pushed to:

https://github.com/qemu/qboot
https://gitlab.com/qemu-project/qboot
https://git.qemu.org/?p=qboot.git;a=summary

I have no idea what's canonical, except that the submodule in the qemu
checkout seems to point to the gitlab instance.

