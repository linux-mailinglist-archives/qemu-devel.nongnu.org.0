Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9987E57A202
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:41:16 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoPT-0003Gj-Qi
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDoAP-0004L3-Rc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDoAM-0000WJ-6E
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658240737;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OjR9TiNM3/cT18FmkkPSPrdzymuDu5LjVA+QDminekE=;
 b=iberA96wDPgaM7xYmO+drfvlFR9v2sAbtrshgtCumKD02QeVdKagd2kE7qpNaPjIOZ5eV5
 pB+qR4aTJRQvYZ2IS3vPOffRmySuE2Ff1NWijED9xqbX9PdS+dd1eR14Qcqh0bIXaCt+vE
 rV6eeVSPB5bpD3A54hqifDDVWHGkcmo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-4H6hVheEMpCptrnypiZ-WQ-1; Tue, 19 Jul 2022 10:25:27 -0400
X-MC-Unique: 4H6hVheEMpCptrnypiZ-WQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59E93858EEE;
 Tue, 19 Jul 2022 14:25:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7722B2166B26;
 Tue, 19 Jul 2022 14:25:26 +0000 (UTC)
Date: Tue, 19 Jul 2022 15:25:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Drap Anton <drapas86@gmail.com>
Cc: qemu-devel@nongnu.org, anton.drap@auriga.com
Subject: Re: [PATCH v2] Loading new machines and devices from external modules
Message-ID: <Yta+06u01e16zKTd@redhat.com>
References: <20220719115922.306265-1-anton.drap@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719115922.306265-1-anton.drap@auriga.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 19, 2022 at 04:59:22PM +0500, Drap Anton wrote:
> From: "Drap, Anton" <anton.drap@auriga.com>
> 
> There is no mechanism to load external machines and classes from modules
> at the moment. This patch is to add two parameters `add_machine` and
> `add_modinfo` for it.
> `add_machine` is to add machines from external modules.
> `add_modinfo` is to add devices from external modules, needed for a new
> machine, for example.
> Main aim is to have possibility to develop independent models and be able
> to use it with mainline QEMU. It will help to make develop new models of
> proprietary boards, simplify to use Qemu by hardware developers and extend
> number of supporting boards and devices in QEMU. It will be easier for
> small hardware manufacturers to use QEMU to develop their own board models
> and use them to shift left of FW/SW development.

IIUC, this is suggesting QEMU load pre-built .so files created from
non-upstream code, to arbitrarily extend QEMU's functionality. Such
.so files will inherantly have to be GPLd as they'll derive from
QEMU's internal APIs which are GPL. Given the proposed use case is
to emulate non-released proprietary hardware, I struggle to see how
you'll fullfill the requirements for GPL licensing of the loaded .so,
without revealing your proprietary hardware design to any who receive
the .so files.


More generally, QEMU's existing loadable module usage is explicitly
designed to try to *prevent* loading of non-upstream code. It aims
to only load code that was built as part of the integrated QEMU
build process. ie, QEMU's loadable module system is about making
it possible to build many QEMU features, but then selectively load
them at runtime to reduce footprint/attack surface. It is *not*
intended to allow non-upstream code to be loaded.


Aside from our goal to prevent/discourage GPL violation through
closed source loadable modules, QEMU also has a strong desire to
not lock ourselves into supporting a public API for loadable
modules. Maintainers wish to retain flexibility to change the
internal APIs at any time.


Partially related to this topic, there is some work taking place
with the goal of making it possible to define new machine types
in QEMU from a QAPI based JSON description.  The actual hardware
devices and CPUs would still need code to be built into QEMU
and upstream, but the way the hardware devices & CPUs are wired
together would be customizable via the JSON config.  That could
get some, but not all, of the benefits you seek without the
downsides the QEMU maintainers wish to avoid.  This isn't ready
to consume yet and we don't have any firm ETA either I'm
afraid.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


