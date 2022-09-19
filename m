Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CC5BD655
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 23:26:36 +0200 (CEST)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaOHi-0006LE-SP
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 17:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1oaOG5-0004yt-QV
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 17:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1oaOG2-0000eZ-Fe
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 17:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663622687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=455D+QggKejju7i4pbQsgh2YB7wnN+6TAmCZgPGeu+Q=;
 b=jTACNjv2aZcmt1UFpwS1KMt8bjR882hmaP+EYKwmB67iekNzT4pjBeoTGXZWqlwHaO5nMJ
 YaOEDtRIIju42/n+1ay1M5ieZWeIRnMKfmdD1uKy50X9hxy1DANxF8AM2p4TYsiDmVQnSn
 PG8WmxchMX6BpHf/GgmDDWiO43dmvrA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-zNNSg5X-OlWGshfoeOn32A-1; Mon, 19 Sep 2022 17:24:44 -0400
X-MC-Unique: zNNSg5X-OlWGshfoeOn32A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0812429AB419;
 Mon, 19 Sep 2022 21:24:44 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B96C15BBD;
 Mon, 19 Sep 2022 21:24:43 +0000 (UTC)
Date: Mon, 19 Sep 2022 23:24:41 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: "Anders Pitman" <anders@apitman.com>
Cc: qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: Fast usermode networking with QEMU
Message-ID: <20220919232441.661eda8d@elisabeth>
In-Reply-To: <d859a414-ca5a-48a8-ab96-2cb869f8978f@www.fastmail.com>
References: <d859a414-ca5a-48a8-ab96-2cb869f8978f@www.fastmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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

Hi Anders,

On Mon, 23 May 2022 14:51:17 -0600
"Anders Pitman" <anders@apitman.com> wrote:

> I came across this blog post[0] concerning passt, which is an
> alternative usermode networking implementation for QEMU.

...and I just came across your email, entirely by chance. I'm not
actively monitoring this list most of the time.

> I'm working on a project that uses QEMU on Windows hosts running
> Linux guests. I'm trying to get faster usermode networking than is
> available with libslirp. My performance target is 200Mbps even on
> older or less powerful hardware, such as Celeron mini PCs. Currently
> I'm seeing 15-30MBps with libslirp.
> 
> It appears that passt doesn't currently support Windows, correct? Is
> there a guess as to how difficult that might be to implement? If the
> speedup is significant, I would be interested in taking a crack at
> adding Windows support.

I gave some quick comments about the challenges I see in the
perspective of a FreeBSD port at:
  https://bugs.passt.top/show_bug.cgi?id=6#c2

and I suppose a Windows port, by the way tracked at:
  https://bugs.passt.top/show_bug.cgi?id=8

could face similar challenges.

But from a quick browsing of the Winsock reference documentation months
ago, it actually looked easier because there seemed to be a description
of an equivalent for every bit of TCP socket information we're fetching
on Linux via TCP_INFO socket option.

I can try to remember/double check and give more details if it helps,
but if you're familiar with Windows development I suppose I wouldn't add
much value. :)

-- 
Stefano


