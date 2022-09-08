Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D957F5B1807
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:08:36 +0200 (CEST)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWDWV-0007KH-NP
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oWDUv-0005Nx-LQ
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oWDUr-0007Jk-Fx
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662628012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dLpJ/JGiqejbG2zgDabJ/3ZHTFRPW3768zyYM+PhEck=;
 b=fDvefucm7HpISvkNEgahdM85te9itDejdDAKSkOOTUZlNBfry4f3rNS6yVIYubTETvMPRk
 9zCqtSC/8GHzgHKLdrURmRndACmKoS9mQYJvi8uBMRGMbX2LfDBSr/peXRjEt+sVQrC5La
 wGRxL+LknUAeiLWleuR6LWSLCykZuR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-1v49LDeZNemuOCc1YefHOA-1; Thu, 08 Sep 2022 05:06:51 -0400
X-MC-Unique: 1v49LDeZNemuOCc1YefHOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A62AF185A794;
 Thu,  8 Sep 2022 09:06:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A8F2026D4C;
 Thu,  8 Sep 2022 09:06:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Chenyi Qiang
 <chenyi.qiang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Michal
 =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
In-Reply-To: <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
Organization: Red Hat GmbH
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
 <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 08 Sep 2022 11:06:48 +0200
Message-ID: <87v8pys09j.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 08 2022, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 8 Sept 2022 at 09:08, Chenyi Qiang <chenyi.qiang@intel.com> wrote:
>>
>> After updating linux headers to v6.0-rc, clang build on x86 target would
>> generate warnings like:
>>
>> target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
>> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>         struct kvm_msrs info;
>>                         ^
>> target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable sized
>> type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>         struct kvm_cpuid2 cpuid;
>>                           ^
>> target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
>> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>         struct kvm_msrs info;
>>                         ^
>>
>> Considering that it is OK to use GNU extension in QEMU (e.g. g_auto stuff),
>> it is acceptable to turn off this warning, which is only relevant to people
>> striving for fully portable C code.
>
> Can we get the kernel folks to fix their headers not to
> use GCC extensions like this ? It's not a big deal for us
> I guess, but in general it doesn't seem great that the
> kernel headers rely on userspace to silence warnings...

We only get the warnings once we define structures that include the
imported structures, so I guess the header per se is not broken (and the
kernel itself probably does not use them that way, given that there's an
effort to build it with clang as well.)


