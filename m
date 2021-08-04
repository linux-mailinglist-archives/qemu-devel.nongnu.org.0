Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3F3E0215
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:33:07 +0200 (CEST)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBH18-0005Am-97
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBGrw-0008EQ-J8
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBGru-0000Xx-Uk
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628083413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xKuF2986k9tEXm9YUkXnW6qjtPDGqDVP2MChyZ3+c50=;
 b=dvxKkzR8e1gJSF6C0ATL8oskE0c45VRyFIxAy0asLEVvLLNXoBLPyF6IoqfYLsdyq+sUXu
 QkmFksABoAjnSKxAlnFXjDrmLqpcWmoH26MGW61vYW9IyS0jsUyL4p8zo8N1+6yhDIxc4F
 7P0+pbrp1ekeG2Rqhkk4uejY3XUQjC8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-8SYebuBaNPCNxK2I_ObGNA-1; Wed, 04 Aug 2021 09:23:33 -0400
X-MC-Unique: 8SYebuBaNPCNxK2I_ObGNA-1
Received: by mail-qt1-f197.google.com with SMTP id
 g10-20020ac8768a0000b029023c90fba3dcso1048360qtr.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 06:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dqBYOWHnZc/TrTtY8qsJKkUv/q1z/UKOQDCIPA4BugI=;
 b=kGc+nP1Qfn4BjQTVauNrQFRQakmF78cWOnYugP6699q3ZjfwYt1zvtufJj4E04r8IO
 5jkNyRO2JAPcMd/3FtsKwHqDAJjFCXoSBH78ZEsWCLTkBjWMnQ/IXrzsWbCynPfvvKYJ
 GH0qorpTzRlBSSEGDPL8rqN6pEaeP1uQIxnx2bPZxJFNiUzvhH97H1+xMqIVrfX9qvgJ
 MIGcQ6uwBq1yj0eRV/2N4dzHf3d3i9jJuLytdTfeoLwzWuX+kex28lblsyNd21OxaxOo
 +Rcfk83IRDUoqliTkPXYcNxj1gm981+s+Lfhg1J0n5CE7hhMefW+lQ72GZRAj6kubyZ+
 F60g==
X-Gm-Message-State: AOAM5314AO4sFCkMGbMH3TY4aMTrWyhvzbGdBuSm8psDgUtX3BBH/vnt
 q4ntf0L7iP5Vw3Q2Z2PMsH6hiMM6VzrZCP6fe7QJUOWvVHddSXfL3dE/VpR6OYWl749bDVz//5B
 xyezX2HNlwz1kOUDsDCABZeIwWeiguW3nO75Be/Lf9Wp4GDz4Hg0PpLFtvuFCpoaf
X-Received: by 2002:ae9:ef54:: with SMTP id d81mr25916529qkg.234.1628083412335; 
 Wed, 04 Aug 2021 06:23:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKr+0CPs0hWGez75WcgqJs4/Tq4AwC+w3h4pbu5Nkn+MRacCHirnH4kCKgZI13c7hBJHcRJQ==
X-Received: by 2002:ae9:ef54:: with SMTP id d81mr25916491qkg.234.1628083411994; 
 Wed, 04 Aug 2021 06:23:31 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca. [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id z29sm1388608qkg.9.2021.08.04.06.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:23:31 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Makefile: A few fixes to tag generation
Date: Wed,  4 Aug 2021 09:23:26 -0400
Message-Id: <20210804132328.41353-1-peterx@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I didn't squash patch 1 because they fix different things at different plac=
es=0D
(patch 1 removes the "meson" dir warning on master branch already for gtags=
).=0D
Patch 2 is the same as posted previous on the list.=0D
=0D
Please have a look, thanks.=0D
=0D
Peter Xu (2):=0D
  Makefile: Fix gtags generation=0D
  Makefile: Fix cscope issues on MacOS and soft links=0D
=0D
 Makefile | 5 +++--=0D
 1 file changed, 3 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


