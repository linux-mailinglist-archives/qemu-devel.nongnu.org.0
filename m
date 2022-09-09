Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFD5B35BF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 12:56:42 +0200 (CEST)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWbgf-00065C-BS
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 06:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oWbdC-00033o-GC
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 06:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oWbd9-0003fX-5H
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 06:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662720781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jM7eZrNN3LVdOgupnlJao/Zw6eVANnMZ0vwW7hnRt8=;
 b=X5zvQ16rtmiO9CwCQQ4l0q59DDhjhKuku3PQlzsuu2DqYZF0KAnXmox26+cTLMZW7asW91
 5SqY+hwMzfH0wiU8ux9r5GaAr8ogKvwmHxL61wTs3PkMfFHoLA3e/4FiaCLtrd5EU26wHR
 wAOpdc2SeBf063aB7ve3WrNbGLu5pyQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-aGELd85cNQadMeQpRVVWBw-1; Fri, 09 Sep 2022 06:53:00 -0400
X-MC-Unique: aGELd85cNQadMeQpRVVWBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E381080231E;
 Fri,  9 Sep 2022 10:52:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 853A5492C3B;
 Fri,  9 Sep 2022 10:52:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/2] configure: Add
 -Wno-gnu-variable-sized-type-not-at-end
In-Reply-To: <20220909035758.17434-2-chenyi.qiang@intel.com>
Organization: Red Hat GmbH
References: <20220909035758.17434-1-chenyi.qiang@intel.com>
 <20220909035758.17434-2-chenyi.qiang@intel.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 09 Sep 2022 12:52:57 +0200
Message-ID: <878rmsom46.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Fri, Sep 09 2022, Chenyi Qiang <chenyi.qiang@intel.com> wrote:

> In recent linux headers update to v6.0-rc, it switched GNU

Maybe

"A Linux headers update to v6.0-rc switches some definitions from the
GNU..."

?

> 'zero-length-array' extension to the C-standard-defined flexible array
> member. e.g.
>
> struct kvm_msrs {
>         __u32 nmsrs; /* number of msrs in entries */
>         __u32 pad;
>
> -       struct kvm_msr_entry entries[0];
> +       struct kvm_msr_entry entries[];
> };
>
> Those (unlike the GNU zero-length-array) have some extra restrictions like
> 'this must be put at the end of a struct', which clang build would compla=
in
> about. e.g. the current code
>
> struct {
>         struct kvm_msrs info;
>         struct kvm_msr_entry entries[1];
> } msr_data =3D { }
>
> generates the warning like:
>
> target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct kvm_msrs info;
>                         ^
> In fact, the variable length 'entries[]' field in 'info' is zero-sized in
> GNU defined semantics, which can give predictable offset for 'entries[1]'
> in local msr_data. The local defined struct is just there to force a stack
> allocation large enough for 1 kvm_msr_entry, a clever trick but requires =
to
> turn off this clang warning.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


