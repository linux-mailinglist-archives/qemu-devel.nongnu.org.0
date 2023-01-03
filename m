Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D045165BCAA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 10:02:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCd7z-0005TP-EX; Tue, 03 Jan 2023 03:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pCd7y-0005Sr-31
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pCd7w-0000jS-EA
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672736311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULqFF6Yse4THtFVi0VY719rvyKhO0+uN+8RvvwpXPLA=;
 b=JFiF6d29TQUhtQ6EPNjFBzd99SYX203WqPcfkGEWLsvZysnVrgWI8cp9+BhhRsa5exxHN3
 mfMQpUUvwUBRZTrqUZ4zb15F1WkB6XUmTt4XQthiyC6xChdeRAxo6YtLjVZhRZKcAmuJTw
 A3brCmGLBY5xr3zfYaSLtSVgRxGqL9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-qL5HelbqMHiY1HGuyS0meQ-1; Tue, 03 Jan 2023 03:57:13 -0500
X-MC-Unique: qL5HelbqMHiY1HGuyS0meQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 341D285C06B
 for <qemu-devel@nongnu.org>; Tue,  3 Jan 2023 08:57:13 +0000 (UTC)
Received: from angien.pipo.sk (ovpn-208-20.brq.redhat.com [10.40.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2050AC15BA0;
 Tue,  3 Jan 2023 08:57:11 +0000 (UTC)
Date: Tue, 3 Jan 2023 09:57:09 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] i386: Deprecate the -no-hpet QEMU command line option
Message-ID: <Y7Pt5YtozCrzVEQ2@angien.pipo.sk>
References: <20221229114913.260400-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229114913.260400-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 29, 2022 at 12:49:13 +0100, Thomas Huth wrote:
> The HPET setting has been turned into a machine property a while ago
> already, so we should finally do the next step and deprecate the
> legacy CLI option, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2:
>  - Rebased to current version from master branch / adjusted version info
>  - Dropped the descrpition in hw/i386/pc.c (already done via another patch)
> 
>  Note: The "hpet" property should now show up in the output of the
>  "query-command-line-options" QMP command since commit 2f129fc107b4a, so
>  it should be feasible for libvirt now to properly probe for the property .
> 
>  docs/about/deprecated.rst | 6 ++++++
>  softmmu/vl.c              | 1 +
>  qemu-options.hx           | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)

Libvirt currently still uses '-no-hpet' but adapting to configure it via
machine should be straightforward. I'll post the patches soon hopefully.


