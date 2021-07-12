Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA43C657D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:32:21 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33XI-0001Dx-5X
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m33Ve-0008Bq-19
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m33Va-00060T-Sw
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626125431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Z/wcTzaU0ugHwzQmuOZR7Sw/MGReqmJ5uBpwADs+1k=;
 b=W/csC6AjDTfgzexgGDPfTlIiokdOuuLO5xcLDuD8YNMSyDU8QH31h41xlq35HAEjMs07Vg
 n+PR5RFDw+lw+Bk/vTzfm48vWrep+eit9ikzfzIKgKvJn6MoL7xv+gRRE7+8V4i8Tj2K7P
 vNQpMB5gKQzkHwMTb3Os6t8UDEImE0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-wfJpcr58O6aVChTbQKSFTA-1; Mon, 12 Jul 2021 17:30:30 -0400
X-MC-Unique: wfJpcr58O6aVChTbQKSFTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEB0C50751;
 Mon, 12 Jul 2021 21:30:28 +0000 (UTC)
Received: from [10.10.117.211] (ovpn-117-211.rdu2.redhat.com [10.10.117.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5C11893C;
 Mon, 12 Jul 2021 21:30:28 +0000 (UTC)
Subject: Re: [PATCH 0/3] Atomic cleanup + clang-12 build fix
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
Date: Mon, 12 Jul 2021 17:30:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712155918.1422519-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 11:59 AM, Richard Henderson wrote:
> The first two patches are not strictly required, but they
> were useful in tracking down the root problem here.
> 
> I understand the logic behind the clang-12 warning, but I think
> it's a clear mistake that it should be enabled by default for a
> target where alignment is not enforced by default.
> 
> I found over a dozen places where we would have to manually add
> QEMU_ALIGNED(8) to uint64_t declarations in order to suppress
> all of the instances.  IMO there's no point fighting this.
> 

I tested your patches, they seem to get rid of the warnings. The errors
persist.

FWIW here's my reproduce starting from fedora 34 x86_64 host:

$ sudo mock --root fedora-35-i386 --install dnf --install dnf-utils
--install fedora-packager --install clang
$ sudo mock --root fedora-35-i386 --shell --enable-network
# dnf builddep -y qemu
# git clone https://github.com/qemu/qemu
# cd qemu
# CC=clang CXX=clang++ ./configure --disable-werror
# make V=1

Thanks,
Cole


