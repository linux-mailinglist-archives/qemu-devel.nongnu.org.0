Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B51400316
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:17:42 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBsr-0003X1-5o
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBi0-0004DY-Pq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBhy-0000ad-SH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630685185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gFI9zMNptHZ0L3VQrzHT9WPOD36EcRJXNE0IcUNGzRI=;
 b=IE9bLAJQgk7G0GZUGfvkFrn9avxod8K1eR8ng1x9ZAhUPjFXs/vgE/4JBG+V4DpPllLhFQ
 vN31Po4WZK1bRcLybtpLhNqin2DddJAh3oR7n4fuqb9nB0FS4CZpebwkJD4OgriIsLSOBo
 trpaHwE4mUzV9HxPT+sBReu5OtiKAxs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-cuB1X5fhMUCWTOx8HNy0dg-1; Fri, 03 Sep 2021 12:06:25 -0400
X-MC-Unique: cuB1X5fhMUCWTOx8HNy0dg-1
Received: by mail-wr1-f70.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso1727820wrm.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZylgTx/vuKia+mI3+H1XgXhLiJl4wJbVhDJ8OGkjRdc=;
 b=PxtruewQMzOFmLxn0kYqd/8CqlGNDpjdvItwRCpesSEOWlMs4Meva3Xi7Qanpb3EcY
 IUs+O4HUwiX6ogMocA4iwQzNMruQkn0WRB3cYMKvMahFmqi+3Rz3UrObeS/10C6RWExc
 SjEldeo0iD6RSivwEdX0b68tBKz20ncNKNca0tcLfPNQbr2tJhLg8CeKlvITabmxChqO
 kwllyWgUvQpq8H/lZdEy111UbC2x03o0iIA6tjjq5atAzSkkKgxbC45Ea5IYKr0PTDVr
 lAQOr5HsO8+HssaIpDq8Ss+raoF7lcWFX662Ffa4tSya96h8mZSIP4bIGnnrbRCfhVhg
 W/tw==
X-Gm-Message-State: AOAM532C/hde6LW3sUjLk4UzKkqbQJRYcdpASqfdpqi0wa0J9AToY/dw
 rshDvDEw1NL7TrpzPUUYVSA+zd41V6tJZN0tQsTW9XtgtqXF5F5BA6Th5fxLzl2Trn57C0fLS6a
 eqDDg7S+iwPZLl2ELybPvt1rofPeoVfM1ruvhdyAsAKpewFqQVg8R/CtSD9q5pIky
X-Received: by 2002:adf:fdd2:: with SMTP id i18mr5053688wrs.406.1630685183388; 
 Fri, 03 Sep 2021 09:06:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW5nk60GZmfSACoBPq5ysJAakq2mnrxTHbQj9fr0rdudFYrsMD6OTlLFuMkL9JU/ef8ZYpVg==
X-Received: by 2002:adf:fdd2:: with SMTP id i18mr5053649wrs.406.1630685183188; 
 Fri, 03 Sep 2021 09:06:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 k18sm4740859wmi.25.2021.09.03.09.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:06:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/2] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Fri,  3 Sep 2021 18:06:17 +0200
Message-Id: <20210903160619.699632-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow Peter Maydell suggestions:=0D
- Split mtree_info() as mtree_info_flatview() + mtree_info_as()=0D
- Remove duplicated Address Space information=0D
=0D
Since v5:=0D
- Fixed messed up during v3->v4 (peterx)=0D
  . Restore format=0D
  . Remove unused 'int counter'=0D
=0D
Since v4:=0D
- Merged patches 1 & 2 (David)=0D
- Remove unnecessary return void (David)=0D
- Added David R-b=0D
=0D
Since v3:=0D
- Fix typos=0D
- Split mtree_info_flatview() + mtree_info_as() first=0D
- Rebased last patch keeping Peter's R-b tag=0D
=0D
Since v2:=0D
- Removed unused AddressSpaceInfo::counter=0D
=0D
Since v1:=0D
- List AS similarly to 'info mtree -f' (peterx)=0D
=0D
checkpatch warning (81 chars):=0D
=0D
  WARNING: line over 80 characters=0D
  #86: FILE: softmmu/memory.c:3359:=0D
  +                                  address_space_compare_name);=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  memory: Split mtree_info() as mtree_info_flatview() + mtree_info_as()=0D
  memory: Have 'info mtree' remove duplicated Address Space information=0D
=0D
 softmmu/memory.c | 149 ++++++++++++++++++++++++++++++++++-------------=0D
 1 file changed, 107 insertions(+), 42 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


