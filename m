Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D687C511C4D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:15:53 +0200 (CEST)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkKW-0004xV-Ex
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njkIj-0003nw-9M
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njkIf-00077O-47
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651076036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KsNp0WFVHOv6CqYWqxFh6g/qcHEvCEY9+GqRmh2OwDM=;
 b=YCuKfSGA3mv3aZHTGWmPQSibxm3IaxUT0P37NIYMA9yxZoXC4lA89SfESyw9dXB8U03qve
 cmlKt/qFV+FaunIuWn1ytxaeeko2Ipxf258VNrAeQw2mlqB9bVoLN6IfZYhAv1HY1zxxI8
 OKIn7xsA5yuAc1DGa10sdHCl75zJ6Ro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-Vt3Zn3oXPKSzoYbhFVG8pA-1; Wed, 27 Apr 2022 12:13:53 -0400
X-MC-Unique: Vt3Zn3oXPKSzoYbhFVG8pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE4C0801E67;
 Wed, 27 Apr 2022 16:13:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 024BB40149A6;
 Wed, 27 Apr 2022 16:13:51 +0000 (UTC)
Date: Wed, 27 Apr 2022 18:13:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 0/4] Revert "main-loop: Disable GLOBAL_STATE_CODE()
 assertions"
Message-ID: <YmlrvgQjZzfMZwzz@redhat.com>
References: <20220427114057.36651-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427114057.36651-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.04.2022 um 13:40 hat Hanna Reitz geschrieben:
> Hi,
> 
> This assertion was disabled in commit
> b1c073490553f80594b903ceedfc7c1aef6b1b19.  We wanted to re-enable it
> once the 7.1 tree has opened (which is now), but to do so, we should
> also fix the bug reported in
> https://gitlab.com/qemu-project/qemu/-/issues/945 .
> 
> Patches 1 and 2 fix that problem (I hope), patch 3 re-enables the
> assertion, and patch 4 adds a regression test for issue 945.

Thanks, applied to the block branch.

Kevin


