Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFB3A761B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:51:26 +0200 (CEST)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt12r-0005H6-UE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt10x-0004Wr-CF
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt10t-0006Zv-LG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623732561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nyUPIz57SI+ZT+m9DOQ/SKaYUUG+2XC0Y5HqeKBIvtU=;
 b=eHkcCJgL+9w9c+xb6oMeEBi3BmU6ipQuQ+JFYwgIeY81jcWhHPbqXiPWrxA6m7cc9ducV/
 he+nb8i+3YvyI7LH+vWvREttRxJfah8kfLUiGgZzUk8pGC+7UA6wp9A4i0+2yZwUYCCoZl
 vPWBkUxPTtIuCuVgPW4qrAkVNMyTDhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-NQ9PArNNNxKa9kM1j-69lw-1; Tue, 15 Jun 2021 00:49:18 -0400
X-MC-Unique: NQ9PArNNNxKa9kM1j-69lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CA53100C61A
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:49:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5365C19C66;
 Tue, 15 Jun 2021 04:49:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A96C518000B2; Tue, 15 Jun 2021 06:49:15 +0200 (CEST)
Date: Tue, 15 Jun 2021 06:49:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Another possibility to eschew .o parsing is to add something like this to
> the sources
> 
> #ifdef QEMU_MODINFO
> #define MODULE_METADATA(key, value) \
>    =<>= MODINFO key value
> #else
> #define MODULE_METADATA(key, value)
> #endif
> 
> MODULE_METADATA("opts", "spice")
> 
> A Python script could parse compile_commands.json, add -E -DQEMU_MODINFO to
> the command-line option, and look in the output for the metadata.

Hmm, worth trying, although I guess it would be easier to code this up
straight in meson.build and pull the information you need out of the
source set, especially as you'll know then which source files are
compiled into which module.

take care,
  Gerd


