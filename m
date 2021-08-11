Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6A3E92E1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 15:42:28 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDoV0-0003Ks-G3
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 09:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDoTv-0002Ke-I5
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 09:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDoTs-0007tL-Pe
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 09:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628689274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q20KrUkR7MsbG79i79vAF5MOF6BNiEXRrsZS5BYJL/s=;
 b=X74EVLL84UdMW1bicFLdn3VC7Vyt2M5I33MfGKLw5JxdhWtKRRX9mJO2mAbJ6G/J9Igj+x
 p5A489Phxvq9zpg+AXYDQbJIpVhUYdqlWOYDcDanAWtGQOXWf7ihHOalzAfrPsAMpKN+wD
 DWfhKq1pdgtDymX9i1ToQFiemdt3cS4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-Ojl3xyFmOvqLkNnIU_M7jQ-1; Wed, 11 Aug 2021 09:41:13 -0400
X-MC-Unique: Ojl3xyFmOvqLkNnIU_M7jQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 u17-20020a05651206d1b02903c76e2b62a3so909712lff.10
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q20KrUkR7MsbG79i79vAF5MOF6BNiEXRrsZS5BYJL/s=;
 b=fEmBYkkkZqHR1bpA1d8QoMb/YS3Pz1zTpXVQ2/wTL5jKpq2WHk/xOSwjnF8vkHCYHp
 Gtzvy25ouIoYm4NCg9R3tU1WnjkrY5ykxxw3Vr1J7wpwNobl4onAN5cMvPCvw27NWSqq
 zL/WEJzGAEP8+jgOQoBggZCRyhyOpqlSaEsuRDJryeRiIh5ecT71aTeVFRu1fdFPT+wJ
 CKRrLuD+NGHlnmDYV+VhgDvVlgwLgApJLmQcdOTNdfSzkWKRvxTaIPW3X05B8uNxpckq
 DesJ2xnE+11KXFtyVe0kxYC1+8fjH8YufM4BL3z3XzokRsY442xB/4SNmEWy6s3WsnP1
 M9ww==
X-Gm-Message-State: AOAM531lmM3qsG55OzKPPi75iPTx4bMN/ceTEvgOynnv4n+i/w0jrpfa
 8Thj5sl41aTS8oY/LRmHKKXpoioWGaWL/xLP0+s70Fa+8cptXxtQ5x1WnoIXBx2MSWiJRucw31w
 H5o2byUSBMulsVR/3i9vGJPkOZiWi2o0=
X-Received: by 2002:a05:651c:1318:: with SMTP id
 u24mr23436034lja.200.1628689272196; 
 Wed, 11 Aug 2021 06:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+6BdoUaBCFxukN4ueUP4CyCqCQCjOrtjSlQ68bQIAme3PFXhQwnvtCXRS1PnGzqfNmqUY8Frv1CWTH7KUc1w=
X-Received: by 2002:a05:651c:1318:: with SMTP id
 u24mr23436016lja.200.1628689271960; 
 Wed, 11 Aug 2021 06:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
 <87eeb59vwt.fsf@dusky.pond.sub.org>
 <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
 <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
In-Reply-To: <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 11 Aug 2021 09:40:56 -0400
Message-ID: <CAOpTY_qbsqh9Tf8LB3EOOi_gkREotdpUyuF3-d_sBFsof3-9KQ@mail.gmail.com>
Subject: Re: [PATCH v12] qapi: introduce 'query-x86-cpuid' QMP command.
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/08/2021 20.56, Eduardo Habkost wrote:
> > On Sat, Aug 07, 2021 at 04:22:42PM +0200, Markus Armbruster wrote:
> >> Is this intended to be a stable interface?  Interfaces intended just f=
or
> >> debugging usually aren't.
> >
> > I don't think we need to make it a stable interface, but I won't
> > mind if we declare it stable.
>
> If we don't feel 100% certain yet, it's maybe better to introduce this wi=
th
> a "x-" prefix first, isn't it? I.e. "x-query-x86-cpuid" ... then it's cle=
ar
> that this is only experimental/debugging/not-stable yet. Just my 0.02 =E2=
=82=AC.

That would be my expectation. Is this a documented policy?

--=20
Eduardo


