Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12C3D065C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:23:08 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m60x1-0005Nj-2Q
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vg-0003Wo-Gm
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vd-0003vt-AF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626830500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VDRYXAahfxLLqjIGJOeq3HXdgE71AcSqJHTIdGnOEsg=;
 b=P3etTlOtbgbw+nHkOYMq6frF+PH7gcKrDIziUppPzcn94M5umhzJswbkce8j+MG5niHqz5
 60ptrWSmFA22PSH1MEng+iCNABNw1637lx+mNcAjL4j7/CS5yYyHguyeRlXI4prf+aUX8z
 EVpdKzZyCq6z4s04wizTuJd9GO39rxc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-pSrG9Oe8MkGjr60JIy48yQ-1; Tue, 20 Jul 2021 21:21:38 -0400
X-MC-Unique: pSrG9Oe8MkGjr60JIy48yQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 8-20020a3704080000b02903b914d9e335so516836qke.17
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YIc1mhuDgE/QymjJfa6wTciFCv5YKEP6D2foVMKe/2Q=;
 b=Llm4qtFUp9YRVPwLOPi2jWuc2pFRrEwibrp9+/B6thE4nrLyuVo1IkWjrmYKrBYRjI
 t+fwa8L3ygu7zmf/6LyjCOpftUva3aQIUPf/Dv5sXT5tKuq4S4lY7AAq3sum12OuXI6C
 PAaRczzZZ1poic1DmYFyXN3XCyCEHzR0Ra5XJubICCuRm8A/ib9yE9AnXpMleLF+dPAh
 QGUXpeE9BRzTRjZR/3Y90GsYuIFeBSNDRFkmMG4dBnO7sxc9YaR6tfNzJXm04v97HBT/
 oZlvFst8is8ot/W5Q1Qu7KESU2dQLu7CbXslhtFjCK0HIi5TYpHu/uSiZAn1Wa3fbOAh
 Y/5w==
X-Gm-Message-State: AOAM5332ROKFAsh5ze6s1TeMVbG5VsqMl8b9bJIEOy39mai3k0/f7Ms1
 1Km74as5y7Ib51FyZnLFutOXJepVMeIxII2gVkD9Bl1JdFpT/CutKzy3t1XL0rTlJ9RuM3xCgNE
 e16Hs42cbZNY8bl2pMEzXcH9Vxuce78GUyi8K0SfWx8RbMZN3Ut0r1St/p3UZGNhG
X-Received: by 2002:a05:622a:164d:: with SMTP id
 y13mr28970174qtj.244.1626830497856; 
 Tue, 20 Jul 2021 18:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXbL/9lZtC+T4I1Ue9rvWGoTWCRQJnRAZcbRDYGL/WqJA842GU3ILre++VfPbdXGS/m1/1YA==
X-Received: by 2002:a05:622a:164d:: with SMTP id
 y13mr28970140qtj.244.1626830497455; 
 Tue, 20 Jul 2021 18:21:37 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t26sm8399469qtc.44.2021.07.20.18.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 18:21:36 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] migrations: Fix potential rare race of migration-test
 after yank
Date: Tue, 20 Jul 2021 21:21:29 -0400
Message-Id: <20210721012134.792845-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 fixes a possible race that migration thread can accidentally skip=
=0D
join() of rp_thread even if the return thread is enabled.  Patch 1 is suspe=
cted=0D
to also be the root cause of the recent hard-to-reproduce migration-test=0D
failure here reported by PMM:=0D
=0D
https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/=0D
=0D
I didn't reproduce it myself; but after co-debugged with Dave it's suspecte=
d=0D
that the race of rp_thread could be the cause.  It's not exposed before bec=
ause=0D
yank is soo strict on releasing instances, while we're not that strict befo=
re,=0D
and didn't join() on rp_thread wasn't so dangerous after all when migration=
=0D
succeeded before.=0D
=0D
Patch 2 fixes another theoretical race on accessing from_dst_file spotted b=
y=0D
Dave.  I don't think there's known issues with it, but may still worth fixi=
ng.=0D
=0D
Patch 3 should be a cleanup on yank that I think would be nice to have.=0D
=0D
Patch 4-5 are further cleanups to remove the ref=3D=3D1 check in channel_cl=
ose(),=0D
finally, as I always thought that's a bit hackish.  So I used explicit=0D
unregister of the yank function at necessary places to replace that ref=3D=
=3D1 one.=0D
=0D
I still think having patch 3-5 altogether would be great, however I think p=
atch=0D
1 should still be the most important to be reviewed.  Also it would be grea=
t to=0D
know whether patch 1 could fix the known yank crash.=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (5):=0D
  migration: Fix missing join() of rp_thread=0D
  migration: Shutdown src in await_return_path_close_on_source()=0D
  migration: Introduce migration_ioc_[un]register_yank()=0D
  migration: Teach QEMUFile to be QIOChannel-aware=0D
  migration: Move the yank unregister of channel_close out=0D
=0D
 migration/channel.c           | 15 ++-----------=0D
 migration/migration.c         | 18 +++++++++++----=0D
 migration/migration.h         |  7 ++++++=0D
 migration/multifd.c           |  8 ++-----=0D
 migration/qemu-file-channel.c | 11 ++-------=0D
 migration/qemu-file.c         | 17 +++++++++++++-=0D
 migration/qemu-file.h         |  4 +++-=0D
 migration/ram.c               |  2 +-=0D
 migration/savevm.c            | 11 +++++++--=0D
 migration/yank_functions.c    | 42 +++++++++++++++++++++++++++++++++++=0D
 migration/yank_functions.h    |  3 +++=0D
 11 files changed, 101 insertions(+), 37 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


