Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51E3D5D33
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:39:32 +0200 (CEST)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82hX-0005Fs-PE
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m82gJ-0003tG-WF
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m82gI-000165-Et
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627313893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3/Qn/fYYqGbDcrp3l0CJ8KN8KazpnxiFsIz+IPkMWfY=;
 b=ZTH8PM4oSOFr/MaKS5qN558XOtFTSJ5xHrWptoRv46ggWtyT5zbRT8id+vC3HtHpqHqfDt
 zSgN5j4dQCBPImWQWOmDk965oUXLw881aQJ+RegSbGNM773lCksjLOgek1srWOIRV7Uzhn
 usIVTMCo7L4GNEHI3AiahZO/NthrkRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-_uu9gUnCPGi3FZU4odHRkg-1; Mon, 26 Jul 2021 11:38:11 -0400
X-MC-Unique: _uu9gUnCPGi3FZU4odHRkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A7931084F56;
 Mon, 26 Jul 2021 15:38:10 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.phx2.redhat.com [10.3.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0870F10016DB;
 Mon, 26 Jul 2021 15:38:09 +0000 (UTC)
Date: Mon, 26 Jul 2021 10:38:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1? v2 4/9] net/checksum: Remove unused variable in
 net_checksum_add_iov
Message-ID: <20210726153808.tck2vpdymeemx7rp@redhat.com>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
 <20210725122416.1391332-5-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210725122416.1391332-5-richard.henderson@linaro.org>
User-Agent: NeoMutt/20210205-647-5d4e008
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 25, 2021 at 02:24:11AM -1000, Richard Henderson wrote:
> From clang-13:
> ../qemu/net/checksum.c:189:23: error: variable 'buf_off' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  net/checksum.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


