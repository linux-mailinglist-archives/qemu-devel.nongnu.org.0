Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D712001C6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 07:52:09 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm9we-000265-PH
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 01:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jm9vp-0001Py-Sm
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 01:51:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55908
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jm9vn-0003rU-6z
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 01:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592545873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=9+1gKPGwoN3tzVoR5McUBhC1vK7HMBLAnOBLvR9GcWo=;
 b=WiYrpcXBLw1UYtruWNXaaMRoaE30UiPt/sl+qqpMgKhQWrez2j/RpnkSDu1GuZhzLI/+9J
 gwkF0jYLJ45Iq4FLnEqT+hDx9ahq8YlSakirnRfjMRVTX2gY1xcsTd8LEtIJN1EVwFjGqW
 E+rP0qo1802lLvzQ5FyaWVn/e3xdEmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-JKeHgKifOE2Juy-XX6UXQw-1; Fri, 19 Jun 2020 01:50:01 -0400
X-MC-Unique: JKeHgKifOE2Juy-XX6UXQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF681107ACCA;
 Fri, 19 Jun 2020 05:49:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 351247CACE;
 Fri, 19 Jun 2020 05:49:55 +0000 (UTC)
Subject: Re: [RFC v6 1/4] softmmu: move softmmu only files from root
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200618190401.4895-1-cfontana@suse.de>
 <20200618190401.4895-2-cfontana@suse.de>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2b329108-802a-23a2-a00b-cdcef0611156@redhat.com>
Date: Fri, 19 Jun 2020 07:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200618190401.4895-2-cfontana@suse.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:51:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/2020 21.03, Claudio Fontana wrote:
> move arch_init, balloon, cpus, ioport, memory, memory_mapping, qtest.
> 
> They are all specific to CONFIG_SOFTMMU.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS                                  | 12 ++++++------
>  Makefile.target                              |  7 ++-----
>  softmmu/Makefile.objs                        | 10 ++++++++++
>  arch_init.c => softmmu/arch_init.c           |  0
>  balloon.c => softmmu/balloon.c               |  0
>  cpus.c => softmmu/cpus.c                     |  0
>  ioport.c => softmmu/ioport.c                 |  0
>  memory.c => softmmu/memory.c                 |  0
>  memory_mapping.c => softmmu/memory_mapping.c |  0
>  qtest.c => softmmu/qtest.c                   |  0
>  10 files changed, 18 insertions(+), 11 deletions(-)
>  rename arch_init.c => softmmu/arch_init.c (100%)
>  rename balloon.c => softmmu/balloon.c (100%)
>  rename cpus.c => softmmu/cpus.c (100%)
>  rename ioport.c => softmmu/ioport.c (100%)
>  rename memory.c => softmmu/memory.c (100%)
>  rename memory_mapping.c => softmmu/memory_mapping.c (100%)
>  rename qtest.c => softmmu/qtest.c (100%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


