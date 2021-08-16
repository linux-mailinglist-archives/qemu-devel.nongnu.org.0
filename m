Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF43EDDA6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:11:56 +0200 (CEST)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFi1V-00027R-PG
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi09-0000g6-1H
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi05-0000ZC-9v
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629141019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XIYWLWV0pd9qWm8FNB7CoyoQzaqN9aRotIwznxUztdw=;
 b=LgOpgr+WHkoynY2Drp+7vqK9b8XI2fDeMsEldaooUSn/eamf63doEhNDX7K8a64vKgZbKW
 TfYhK68dMEgdRrbPKjQ7HC7oMhbPWuTHFVxOOLg77MRtVwa9tQfUF97Sine8pHTEgEFvEp
 16hGMLEFUQBM766buhtJw9tGKb0S9Lg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-4iJS1Z2tOiiwK_iMX7y9ZA-1; Mon, 16 Aug 2021 15:10:18 -0400
X-MC-Unique: 4iJS1Z2tOiiwK_iMX7y9ZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 10-20020a05600c024a00b002e6bf2ee820so74594wmj.6
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 12:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MGeSewQc89b6d3ZJpiWsfNpaF3cXmeLaEPK1cZvAERY=;
 b=cgU05h5i4ezA2O1gN4uDRTVYO6n7V72GXLf8WoywCNbn1DWCge9MrYJausL1+PLFb8
 vWwcuMyiEJBjC0YZpbEIQjWbSLnW/+MToUlgGpRccjogCed13B/fIJQLVUmsnwNRe+mT
 uiQu5aCZbp3e/vgI946f1Dg92dfdOkVl+BL6dX9oatMMc/gbABCWE52UPtkAY37JN5kL
 vryY90P55zSI+TPB2YTEF/1+Z1cHyj7icfDboj0Ka11YOWzFMDzMR1SCiUXBL6ztlLhc
 3IXbVMHL7co9wsZEOLWi6l2StBw9KEpIHR0gsH3cNM2OpYwA8tNezpnbBHFFVCtTsAxT
 wzZQ==
X-Gm-Message-State: AOAM5313l1+LqBtYEYQSjjl0HhybxfNhtbySqEO4goAx+wr0sk6852Rh
 CxB0H1kIjuXIOYxpOrcRIFqWmHXLq9+ngf2aR5hIgWG30EYsJBzgn0rxZgLUf2+kvBQy8ySBSzs
 qKO4U7+mamcuIzR0TC8xKpbEd88wCuWE+a6Axx2EZ1OcCMDv3KzAhCPyjnk1tvtXG
X-Received: by 2002:a1c:46:: with SMTP id 67mr560112wma.29.1629141017081;
 Mon, 16 Aug 2021 12:10:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz614pIhVANfw0pgGDk9nF61NPIO+KGOphOzDyg7mZTQ9F+CUie4yFClG0UtzsgxqjYQnjoQQ==
X-Received: by 2002:a1c:46:: with SMTP id 67mr560089wma.29.1629141016870;
 Mon, 16 Aug 2021 12:10:16 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z1sm75388wrv.22.2021.08.16.12.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:10:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] MAINTAINERS: Split Audio section
Date: Mon, 16 Aug 2021 21:10:11 +0200
Message-Id: <20210816191014.2020783-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the current 'Audio' entry in multiple ones, allowing developers=0D
with different interests to add their contact to the relevant entries.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  MAINTAINERS: Split Audio backends VS frontends=0D
  MAINTAINERS: Remove SPICE from Audio backends section=0D
  MAINTAINERS: Split Audio backends sections=0D
=0D
 MAINTAINERS | 61 +++++++++++++++++++++++++++++++++++++++++++++++------=0D
 1 file changed, 54 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


