Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FD38F300
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:29:39 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFKc-00046w-9q
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llFJ8-0002ja-KJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llFJ0-00080m-Pk
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ5onq6fJ0B0DfdV+Eqa8ku81yY5Zor5n8ooWaolaWk=;
 b=YRAIjH6DRZmhSpoQ+72cbrOBgTgVOo2ZrJ3zE01RutwbwgyJfKm44RXLgUHvzdTEX6ycrR
 ksiy57D4qgTWQgMm47hTI9EaTY6b64v9BQxco3O/QqIFVSrMyyk41mriFTuRtx6qi6OPZ7
 ZUI9oWs9DG6Cx1FGyWJG6sHcCiIUuTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-TJpidzsZMpy8TNQZzFPHeQ-1; Mon, 24 May 2021 14:27:56 -0400
X-MC-Unique: TJpidzsZMpy8TNQZzFPHeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB49800FF0;
 Mon, 24 May 2021 18:27:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 643A55D71D;
 Mon, 24 May 2021 18:27:52 +0000 (UTC)
Date: Mon, 24 May 2021 20:27:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
Message-ID: <20210524202750.63af5557@redhat.com>
In-Reply-To: <a734314b-e495-550b-9a01-40e9e75f6b8f@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <949b3ab6-2d87-a873-d96b-41ee7ef5e7d5@greensocs.com>
 <a734314b-e495-550b-9a01-40e9e75f6b8f@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Mirela Grujic <mirela.grujic@greensocs.com>, mark.burton@greensocs.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 May 2021 18:57:36 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 21/05/21 16:06, Mirela Grujic wrote:
> >>
> >> PHASE_NO_MACHINE
> >> =C2=A0=C2=A0 -> machine-set -> PHASE_MACHINE_CREATED ->
> >> =C2=A0=C2=A0 -> accel-set -> PHASE_ACCEL_CREATED -> PHASE_MACHINE_INIT=
IALIZED -> =20
> >=20
> >=20
> > My understanding is that an equivalent of previously supported=20
> > 'preconfig' state is PHASE_ACCEL_CREATED, from the perspective of the=
=20
> > QMP configuration that Igor implemented. In other words, I believe that=
=20
> > when -preconfig CLI option was passed, QEMU was waiting for the QMP=20
> > configuration in PHASE_ACCEL_CREATED phase. Now, if accel-set advances=
=20
> > the machine directly to PHASE_MACHINE_INITIALIZED, there will be no=20
> > chance to configure what Igor did with -preconfig. =20
>=20
> Right, that was only NUMA.  I have to check, but I think it can be moved=
=20
> to PHASE_MACHINE_CREATED.
Dependency for NUMA were:
  1: -smp/-cpu being parsed before set_numa_options QMP command is called
        it's necessary to for machine being able to provide topology for
        given -smp combination.

        -cpu is not must have dependency (currently), it was just convenien=
tly
        available when building topology in possible_cpu_arch_ids(), settin=
g
        cpu-type there could be deffered to the later time (actual user for
        CPU type is QMP command query-hotpluggable-cpus, so that user could=
 know
        what cpu type and what properties to use with device_add at hot-add=
 time).

  2: memory backends depended on accel (TCG)
     (I think, Paolo has removed that dependency)


> Apart from that, if we add a third command for the CPU model, that third=
=20
> command would run from PHASE_ACCEL_CREATED so the pre-existing preconfig=
=20
> state would be accessible.
>=20
> Paolo
>=20
> > Is this something you don't want to support anymore, or it can be=20
> > configured in another way? Or is this something that we haven't thought=
=20
> > of yet, but we should? =20
>=20
>=20


