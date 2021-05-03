Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6D371ECD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:40:30 +0200 (CEST)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcYX-0003lA-KG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldcTp-0000uh-Ky
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldcTl-00080N-4Y
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620063330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D5WkpqcvBKFPoRAljVl/kj4A5CcGh0n1vJVY9xVkUT0=;
 b=GBn4VxmvLXi53lj1gHFOFUtXYV0+9E0tBnd0UbGWMPAOf/ohpB9+NZIao6iVkvJn2IhD30
 +LI/iO0fxC/kxFAfZ9JDDUJfbr2AyUMJh8bdBln4uVdHAPjZk7opO1uTGPlMdIhmN2GEc9
 mPJF/T2OmFGdvpZDLAl9BB0NDdFS+dU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-3QiS6e5CN4ib7ri93l21Tg-1; Mon, 03 May 2021 13:35:27 -0400
X-MC-Unique: 3QiS6e5CN4ib7ri93l21Tg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so4303220wrb.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8q8cMg1Nx6zjGr+DnUeGHd4mMna/J9GPnPvZn2873uQ=;
 b=AlF7rBFBc8+E7MkusukcIQiTHdvebl4TBHxNqsrhyoe4j9haxuYrpTN4Z2qxMYZfTj
 atCnSu4JV3RayNPorqPmq+O1/aXhyqoVbH5Tf1kq/J4EU70WgJEmuNbAKwwfXwHefjLI
 7/Ssl5nN9I4e/tbXEUSGWo6oU1LmlKqPERIFpNMm25SFmy5+9W7S6BsNM9ofZ2Qkxdbo
 LZDqY0bDiyzlnu3QklHgaBmY13WCvy5VC7srjMsT38PmLojTlsIbzNmVrbI4c1kJ2+aR
 /84vwmUilt65c9K7W++MvMtN+3c+VoJom1SH8wdhFP7pK4RfzTJL+TkhicM60iyZ/kqP
 BqHA==
X-Gm-Message-State: AOAM530nbql+pJ73grZ9Gd3kKTWKf1C8YLMSWW76OmA9X5R+/J8MegdK
 shBdcLfPEZueNpPSMoxxAPQRC8V2LdVzSBFc30OpYxl7pJasrHLxOa5bQ7oY6iT3MXSg6xPmGu3
 IFKOV4I+mefdsJWpNN9KesVxXDwoGu5pZmLwHmBzVCNQ6c7Q8B/3+KEUhcRkxpqXN
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr18422912wrr.222.1620063326034; 
 Mon, 03 May 2021 10:35:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmmJihaaqmGwBkptbpak6T2lIE5VXYiO4Ijgbf4LsHnv33zSbXaRUV1NQeW3lrDp1rrcbqFw==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr18422888wrr.222.1620063325847; 
 Mon, 03 May 2021 10:35:25 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z18sm13038198wrh.16.2021.05.03.10.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:35:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/i386/cpu: Constify CPUCaches and X86CPUDefinition
Date: Mon,  3 May 2021 19:35:22 +0200
Message-Id: <20210503173524.833052-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

X86CPUDefinition[] is never written, move it to .rodata section=0D
by marking it const.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/i386/cpu: Constify CPUCaches=0D
  target/i386/cpu: Constify X86CPUDefinition=0D
=0D
 target/i386/cpu.c | 21 +++++++++++----------=0D
 1 file changed, 11 insertions(+), 10 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


