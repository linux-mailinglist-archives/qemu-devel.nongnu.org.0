Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7034B3D40F8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:38:29 +0200 (CEST)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7108-0005hh-G5
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wi-0006Cm-9n
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wf-0002Kn-Eo
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dRNVqO4ARRL9TeZqJ/N7UBh3E25eDt9oNeTL008s9G8=;
 b=W1pcdZQNNG2+IcmYqFEMQ7iRoAm3XtKMjoFwhmpCnt/807sYuxaGX68Ah2ASraFnKe9PC6
 N77s8jN2D61befPT+emXpHL1PoyvhrlcA6f15WShqOpiAP+sJ0Q9zTQrK7kRrDo5rDKhMI
 OPu097qSsWHKWleGGfXD1F6QScOaF/o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455--dePv4ipMim5eLhoo0FQbg-1; Fri, 23 Jul 2021 15:34:50 -0400
X-MC-Unique: -dePv4ipMim5eLhoo0FQbg-1
Received: by mail-qt1-f200.google.com with SMTP id
 w19-20020ac87e930000b029025a2609eb04so1677131qtj.17
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEbHoW4gktYVNBFRc0GJBTcsjLdDXfXMulwEQTBovq8=;
 b=O7SNy1Uc4etmklXoGj20CiD5TofqkwVtBR4/2uHvON4fhdFDWek3G09blGttP2qs8h
 zAhb9htOmh9/7CVEd1tvthgiramKxQHsTJ2CK6LC4ejBn1ZH6sl3N4YybTMlA/Q2MfXq
 hxUUNipCHK6goBHkWoL/eGsKfdyyEtRgQWo1Iq4Rj2IcK2y9R+qaNiCua8LCr9guQ4tu
 cwWc+5Zz83Q9VN5/bkxtZKO6Sb3KVU7EOKjjS/CfV+kvpxQjitXTTzNjAvhI8x8dRaj1
 8WksbkF2yyQZVlRumgl0lrndB3T6s6af0mlytHL3w5hYN819dTY5k2F7vPm4XRh+jwXC
 K/bA==
X-Gm-Message-State: AOAM5300aV53OTdpIfGq5d08o9+aZL7HatzIiPII1kBNhGZ6GVjvMYSi
 652d6MW2MCN2dEit3dT/HSaicsghn5z2Qqolm+OACvHXyyEq4lMQFXiqRuHN0AUicO2nIpWbFGz
 L1r2epL5maeDWnQBjEicHa8D5v7te7x1mUZ16i7CEe+9wWjsrL+nPQkhoSWvU8ARc
X-Received: by 2002:a37:8581:: with SMTP id h123mr6201215qkd.316.1627068889064; 
 Fri, 23 Jul 2021 12:34:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp066N2JpThlhlOCqYEzewtu4nKVQ+1OIPtrX3dlkvIMaijy/t2FuRGbGT5WDaiDFk7h5lMg==
X-Received: by 2002:a37:8581:: with SMTP id h123mr6201187qkd.316.1627068888760; 
 Fri, 23 Jul 2021 12:34:48 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:48 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] memory: Sanity checks memory transaction when
 releasing BQL
Date: Fri, 23 Jul 2021 15:34:35 -0400
Message-Id: <20210723193444.133412-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v2 of the series.  It was actually got forgotten for months until i=
t=0D
was used to identify another potential issue of bql usage here (besides it=
=0D
could still be helpful when debugging a previous kvm dirty ring issue in th=
at=0D
series):=0D
=0D
https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@C=
H0PR02MB7898.namprd02.prod.outlook.com/=0D
=0D
So I figured maybe it's still worth to have it, hence a repost.=0D
=0D
There're some changes against v1:=0D
=0D
  - patch "cpus: Introduce qemu_cond_timedwait_iothread()" is dropped becau=
se=0D
    it's introduced in another commit already (b0c3cf9407e64).=0D
=0D
  - two more patches to move do_run_on_cpu() into softmmu/ to fix a linux-u=
ser=0D
    compliation issue.=0D
=0D
Please review, thanks.=0D
=0D
=3D=3D=3D Original Cover letter =3D=3D=3D=0D
=0D
This is a continuous work of previous discussion on memory transactions [1]=
.=0D
It should be helpful to fail QEMU far earlier if there's misuse of BQL agai=
nst=0D
the QEMU memory model.=0D
=0D
One example is run_on_cpu() during memory commit.  That'll work previously,=
 but=0D
it'll fail with very strange errors (like KVM ioctl failure due to memslot=
=0D
already existed, and it's not guaranteed to trigger constantly).  Now it'll=
=0D
directly fail when run_on_cpu() is called.=0D
=0D
Please have a look, thanks.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03205.html=0D
=0D
Peter Xu (9):=0D
  cpus: Export queue work related fields to cpu.h=0D
  cpus: Move do_run_on_cpu into softmmu/cpus.c=0D
  memory: Introduce memory_region_transaction_{push|pop}()=0D
  memory: Don't do topology update in memory finalize()=0D
  cpus: Use qemu_cond_wait_iothread() where proper=0D
  cpus: Remove the mutex parameter from do_run_on_cpu()=0D
  cpus: Introduce qemu_mutex_unlock_iothread_prepare()=0D
  memory: Assert on no ongoing memory transaction before release BQL=0D
  memory: Delay the transaction pop() until commit completed=0D
=0D
 cpus-common.c                  | 36 ++---------------------=0D
 include/exec/memory-internal.h |  1 +=0D
 include/hw/core/cpu.h          | 22 ++++++--------=0D
 softmmu/cpus.c                 | 42 ++++++++++++++++++++++++---=0D
 softmmu/memory.c               | 53 ++++++++++++++++++++++++++++++----=0D
 5 files changed, 97 insertions(+), 57 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


