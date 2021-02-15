Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638931B94E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:33:41 +0100 (CET)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBd4N-00039c-2I
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBd2m-0001rP-TQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBd2l-0003a4-AV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613392318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQQUet4oguH/r0A9y2c11nGHIc3Jey6eumbHGPHGF74=;
 b=UA/QmtFWgryN1ggJe5Cu7YGER428li1t04O57lb6kYwRxkJKtun4oqhL0JjO+7QErvByZb
 vGh0qeHQLZwIppQ0DucQTo2wljlU6+HNu3MpFiW9tQyNWDl7DXvgTDkRiUcVq9OzKwbLCR
 d2+TujOz6CwbQIwDilfx0YwUG8TlHQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-FZ-QtoRPPN24PlY0Hf3rLw-1; Mon, 15 Feb 2021 07:31:56 -0500
X-MC-Unique: FZ-QtoRPPN24PlY0Hf3rLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49CD2801962;
 Mon, 15 Feb 2021 12:31:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC5860875;
 Mon, 15 Feb 2021 12:31:54 +0000 (UTC)
Date: Mon, 15 Feb 2021 13:31:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PULL 3/5] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
Message-ID: <20210215123152.GM7226@merkur.fritz.box>
References: <20210212232134.1462756-1-eblake@redhat.com>
 <20210212232134.1462756-4-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210212232134.1462756-4-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.02.2021 um 00:21 hat Eric Blake geschrieben:
> From: Peter Krempa <pkrempa@redhat.com>
> 
> Verify that the modification of the bitmap persistence over migration
> which is controlled via BitmapMigrationBitmapAliasTransform works
> properly.
> 
> Based on TestCrossAliasMigration
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> Message-Id: <d9c8e9827e9b6001b2dd1b92e64aab858e6d2a86.1613150869.git.pkrempa@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> [eblake: Adjust test for explicit read_zeroes=False]
> Signed-off-by: Eric Blake <eblake@redhat.com>

This breaks 297:

--- /home/kwolf/source/qemu/tests/qemu-iotests/297.out
+++ 297.out.bad
@@ -1,2 +1,8 @@
 === pylint ===
+************* Module 300
+300:605:0: C0301: Line too long (80/79) (line-too-long)
+300:677:0: C0301: Line too long (98/79) (line-too-long)
 === mypy ===
+300:646: error: Dict entry 2 has incompatible type "str": "Dict[str, bool]"; expected "str": "str"
+Found 1 error in 1 file (checked 1 source file)
+


