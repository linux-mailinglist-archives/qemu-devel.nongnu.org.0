Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03342446CE3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 08:41:27 +0100 (CET)
Received: from localhost ([::1]:38902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjGKK-0003Ms-0V
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 03:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjGJG-0002gr-23
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 03:40:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjGJA-00047k-Ne
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 03:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636184410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VN34cCVVkuoTc4pfavg7blgOaIR1+Z6A2qBIlstZzvA=;
 b=BOfD2+/BPt7AaSmRtzgY5PkGFFq9G0Nd/wTjDySUuI4KgGuoIh8Mh2hNx5OPAC9OcD2oXp
 K3cegA6Lr0cf1GsRlRdgUbOCo4l4MUG1kJr+T4JnzsiqdbMZN5I6r5CfzY0/WaIat4oAUr
 iAEhdM/h9hVyBDkygRBzmUc/8fl3auk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-6zF8I35sPamIl1MKCu-hBQ-1; Sat, 06 Nov 2021 03:40:09 -0400
X-MC-Unique: 6zF8I35sPamIl1MKCu-hBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA1A806688
 for <qemu-devel@nongnu.org>; Sat,  6 Nov 2021 07:40:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D69957CD2;
 Sat,  6 Nov 2021 07:40:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 925AC11380A7; Sat,  6 Nov 2021 08:40:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Artificially target-dependend compiles
References: <87czneyaw3.fsf@dusky.pond.sub.org>
 <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com>
Date: Sat, 06 Nov 2021 08:40:00 +0100
In-Reply-To: <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com> (Paolo
 Bonzini's message of "Fri, 5 Nov 2021 17:15:33 +0100")
Message-ID: <87fss9u3zj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/5/21 14:45, Markus Armbruster wrote:
>> Moving these definitions to machine-target.json moves the generated C
>> from qapi/qapi-*-machine.[ch] to qapi/qapi-*-machine-target.[ch], where
>> CONFIG_ACPI_VMGENID is okay.  It also makes qmp_query_vm_generation_id()
>> target-dependent: it needs qapi/qapi-commands-machine-target.h.
>
> If I understand correctly, the problem that
> qapi-commands-machine-target.h is target-dependent, because it uses 
> "#ifdef CONFIG_ACPI_VMGENID" around the prototype?

Around the prototype and struct GuidInfo.

> On one hand, the "#ifdef" is unnecessary: the prototype does not
> depend on anything target-specific.  Removing it will avoid the 
> target-dependence.  On the other hand, the "#ifdef" has a defensive
> purpose, in that an unnecessary definition (such as the one currently
> in the stub) will fail due to the implicit definition of 
> qmp_query_vm_generation_id().

Also, it immediately flags uses of qmp_query_vm_generation_id() and
struct GuidInfo.  Without it, the linker still catches most, but not all
uses.

>> Have you seen similar artificial target-dependence elsewhere?
>
> I can't think of a specific example, but it does ring some bells.

I just ran into an instance that may be clearer.

The "rocker" device is target-independent (hw/net/meson.build adds it to
softmmu_ss), but linked only for selected targets (hw/net/Kconfig has
depends on PCI && MSI_NONBROKEN).

This makes our build machinery put CONFIG_ROCKER in
$TARGET-softmmu-config-devices.h, and poison it in config-poison.h.
Feels uncalled for.


