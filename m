Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C13C72AF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:56:50 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jq5-0001M9-Ob
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m3JoG-0000bb-PQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m3JoC-0006R9-CO
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626188090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=woCgaeXD7+xLkPRQnRO6u8UoA1wKJ5Niwqd+N1Ol7j4=;
 b=iDiwa4C4osDw4QVFDxXhZ6e9HU+xkfgGGxx2+ECHyHRNGCri/UhlLyrPEhksJ5M6hOkaZY
 fLEeue43KLvyBcIkEoKrewOuq88LrHaoVGqbCDKhynt2FY1YGdy9eI71y8fvlO/qP7b5Fi
 nPpGhAUrvy/yrZOT+BgL9gFXuYrm68o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-y9P259FdMhOzwFCn6PlkwQ-1; Tue, 13 Jul 2021 10:54:48 -0400
X-MC-Unique: y9P259FdMhOzwFCn6PlkwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4CC51023F63
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 14:54:47 +0000 (UTC)
Received: from [10.10.115.211] (ovpn-115-211.rdu2.redhat.com [10.10.115.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1452694D6;
 Tue, 13 Jul 2021 14:54:41 +0000 (UTC)
Subject: Re: [PATCH 0/4] Fixes for the --without-default-features configure
 switch
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <c7ac9cb5-3a39-a72a-6c4e-06c059a67cd2@redhat.com>
Date: Tue, 13 Jul 2021 10:54:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713093155.677589-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 5:31 AM, Thomas Huth wrote:
> Many features do not get properly disabled when the user runs the
> configure script with --without-default-features. Let's fix that now.
> 
> Thomas Huth (4):
>   configure: Fix --without-default-features propagation to meson
>   configure: Allow vnc to get disabled with --without-default-features
>   configure: Fix the default setting of the "xen" feature
>   configure: Let --without-default-features disable vhost-kernel and
>     vhost-vdpa
> 

Patches look fine and fix some issues but others persist
(--disable-system isn't triggered). IMO this needs an audit, but more
importantly 'configure' should be rearranged a bit to make this less
likely to regress:

* move all the --enable/--disable variable init into one section with
nothing else mixed in

* convert the values to all use
$default_yes/no/auto/enabled/disabled/... variable syntax so visually
it's consistent, and if a default is ever changed like $default_no ->
$default_yes then we behave correctly (as opposed to 'no' -> 'yes').

Thanks,
Cole


