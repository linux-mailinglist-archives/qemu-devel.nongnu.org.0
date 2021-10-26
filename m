Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BE43AE43
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:41:18 +0200 (CEST)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfI1F-0006m6-Ea
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mfHxU-00037F-0H
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mfHxQ-0003jm-3R
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635237439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPgneS56wBQHsrfoPMfDO5cf6IPEB9ppts+WYZEdb34=;
 b=CTtm+3eKT3F73O9ezfNp6LjMufoC1BO2ToMGjoUqKb5wDAnC1btnA4sMIdVeJ+mgKZsa94
 PGJuYvjj4XpNMwF+A8XTfPbchhCGDYGx8Q2qqMGj3rY458xRrn1iNNB9hmI1yy08xBKiD3
 oeyaIAmFTBkOZqgIy+ZK2d0Zgk0PtXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-KP4fGbzmPiKUMMK1fHqW6Q-1; Tue, 26 Oct 2021 04:37:16 -0400
X-MC-Unique: KP4fGbzmPiKUMMK1fHqW6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7865A1018724;
 Tue, 26 Oct 2021 08:37:15 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E3A860862;
 Tue, 26 Oct 2021 08:37:01 +0000 (UTC)
Date: Tue, 26 Oct 2021 10:36:58 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Libguestfs] [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXe+Kue5335CGSq4@paraplu>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXewOaSDEXJDYV+1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, pkrempa@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, libvir-list@redhat.com,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 09:37:29AM +0200, Kevin Wolf wrote:
> Am 25.10.2021 um 07:25 hat Markus Armbruster geschrieben:

[...]

> > This commit updates documentation and prepares tests.  The next commit
> > updates the QAPI schema.  The remaining patches update the QAPI
> > generator and wire up -compat policy checking.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> Obviously, replacing the old convention gets rid of the old drawbacks,
> but adds a new one: While using x- makes it very obvious for a human
> user that this is an unstable feature, a feature flag in the schema will
> almost certainly go unnoticed in manual use.

FWIW, I wondered about it too, as I like the visual reminder of the "x-"
prefix.  Then I thought, "how many people besides QEMU and related
tooling developers -- who would read QAPI docs anyway :) -- launch
experimental QEMU commands manually?"  Maybe that's too big of a leap.

-- 
/kashyap


