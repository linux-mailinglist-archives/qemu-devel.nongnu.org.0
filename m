Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A164297773
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 21:03:36 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW2Lf-0003PF-73
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 15:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kW2If-0001kW-Sr
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 15:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kW2Ic-0004Wh-LF
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 15:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603479622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6ctCNQUUyTO3pVmlcxfrifV3oV5Hug6tcToFdkt/1s=;
 b=hutBfDbBlMVOt0fCmTIEmUWMTG2ozgtL3rannL7iOl2HAEjPZfJlVCfc3tzF+Q7J556PrE
 mX98NDclIS91hmhOq7/QerABK5kRUDC4s14HdN5jCQEagc5ge1jEJJ/L77x7FmkPbGMgjE
 nV5KmP8V/PQqo0Ng7dwPlV3nndDW2y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-7OjEk5o-OzWEJEptlHd_jg-1; Fri, 23 Oct 2020 15:00:18 -0400
X-MC-Unique: 7OjEk5o-OzWEJEptlHd_jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAE061099F6A;
 Fri, 23 Oct 2020 19:00:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5129E5D9D5;
 Fri, 23 Oct 2020 19:00:16 +0000 (UTC)
Subject: Re: [PATCH 17/30] x86 tcg cpus: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023122801.19514-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4e61bd64-165e-672c-7ea7-35e81d60eabf@redhat.com>
Date: Fri, 23 Oct 2020 21:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023122801.19514-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 14.28, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  target/i386/bpt_helper.c            | 2 +-
>  target/i386/cc_helper.c             | 2 +-
>  target/i386/cc_helper_template.h    | 2 +-
>  target/i386/cpu.c                   | 2 +-
>  target/i386/cpu.h                   | 2 +-
>  target/i386/excp_helper.c           | 2 +-
>  target/i386/fpu_helper.c            | 2 +-
>  target/i386/gdbstub.c               | 2 +-
>  target/i386/helper.c                | 2 +-
>  target/i386/int_helper.c            | 2 +-
>  target/i386/mem_helper.c            | 2 +-
>  target/i386/misc_helper.c           | 2 +-
>  target/i386/mpx_helper.c            | 2 +-
>  target/i386/ops_sse.h               | 2 +-
>  target/i386/ops_sse_header.h        | 2 +-
>  target/i386/seg_helper.c            | 2 +-
>  target/i386/shift_helper_template.h | 2 +-
>  target/i386/smm_helper.c            | 2 +-
>  target/i386/svm_helper.c            | 2 +-
>  target/i386/tcg-stub.c              | 2 +-
>  target/i386/translate.c             | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


