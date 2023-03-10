Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E206B3A3A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paYwF-0003hk-78; Fri, 10 Mar 2023 04:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paYwD-0003hF-5B
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paYwB-00055V-Gp
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440078;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EuSV07mhx844h64mfUGP7M+QkQ8f5K5SdusiuIHL3s=;
 b=R+hNS+Nwx5gnXNfE8IxDIR3/IHDETQK/Rm6xve23ywn+9F5QD9CybMNZLSjDgDo0z+n73O
 aWF3gu6q3jGj5g3UcFfa5QVz0+aBgPotJNPDAD4nvdtF1SBwuDlEspoqFzL3hGcYABGtD4
 RTP6eTHg0b/dvXSHezONour+jFMgfhA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-_3o3-CuQM0u_TujJU6w6lg-1; Fri, 10 Mar 2023 04:21:17 -0500
X-MC-Unique: _3o3-CuQM0u_TujJU6w6lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1726E3C10C6A;
 Fri, 10 Mar 2023 09:21:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23AE240C1106;
 Fri, 10 Mar 2023 09:21:16 +0000 (UTC)
Date: Fri, 10 Mar 2023 09:21:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
Message-ID: <ZAr2iYVHX09Ve/Y6@redhat.com>
References: <cover.1678401400.git.dxu@dxuuu.xyz>
 <c73263127c3533c9da06042a57bed2f334c5ea2e.1678401400.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c73263127c3533c9da06042a57bed2f334c5ea2e.1678401400.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 09, 2023 at 03:40:57PM -0700, Daniel Xu wrote:
> Currently, any captured output (via `capture-output`) is segregated into
> separate GuestExecStatus fields (`out-data` and `err-data`). This means
> that downstream consumers have no way to reassemble the captured data
> back into the original stream.
> 
> This is relevant for chatty and semi-interactive (ie. read only) CLI
> tools.  Such tools may deliberately interleave stdout and stderr for
> visual effect. If segregated, the output becomes harder to visually
> understand.
> 
> This commit adds a new enum variant to the GuestExecCaptureOutputMode
> qapi to merge the output streams such that consumers can have a pristine
> view of the original command output.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  qga/commands.c       | 31 +++++++++++++++++++++++++++++--
>  qga/qapi-schema.json |  4 +++-
>  2 files changed, 32 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


