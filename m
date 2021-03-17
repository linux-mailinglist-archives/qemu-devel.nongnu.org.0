Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055433E9AF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:26:12 +0100 (CET)
Received: from localhost ([::1]:53242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPdD-0002sQ-97
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPbR-0001rX-Pp
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPbJ-0006wY-JC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615962251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TenE5c4VagT1GcbH0jWczeo+Dy/cryjWVKVpzM6iZz8=;
 b=gS95xwJZa2oa7NS8sh30avvvHgdlTafwoazkeR0J+a2dm9iaFAGJVDOihk6zZNzxloTCzr
 8I3Y1RDIN0Qordk1OC0GZ5GIkt7FK1WAZ4WRmCe15fSqCdehuJQO0YqbyeFQa9o0SPR/Mm
 nyluppLrDcWK7yt7XnLUvUdB3pCIFhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Ci4JWF4WNCKD3aKhQTB1ug-1; Wed, 17 Mar 2021 02:24:10 -0400
X-MC-Unique: Ci4JWF4WNCKD3aKhQTB1ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17302107ACCA
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:24:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E20CA5D9C0;
 Wed, 17 Mar 2021 06:24:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 492AB180038B; Wed, 17 Mar 2021 07:24:04 +0100 (CET)
Date: Wed, 17 Mar 2021 07:24:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Half a usb-redir idea
Message-ID: <20210317062404.bkl5s4qmtaeg2yeo@sirius.home.kraxel.org>
References: <YFDo/oHikOEcXFcg@work-vm>
MIME-Version: 1.0
In-Reply-To: <YFDo/oHikOEcXFcg@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: victortoso@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 05:21:02PM +0000, Dr. David Alan Gilbert wrote:
> Hi,
>   I've got a half-baked idea, which I thought might be worth mentioning.
> 
> How hard would it be to give qemu a usbredir server rather than client?

The usb part is probably not that hard.  The devices are not standalone
though.  Tricky is the integration with the rest of qemu, with the input
subsystem (hid devices), chardevs (usb-serial), network (usb-net), sound
(usb-audio), block (usb-storage), ...

ccid and u2f are probably easierst.
mtp should not be hard too.
maybe storage when limiting support to storage daemon.
then it'll be tricky.
maybe the multi-process qemu effort solves (some of) these problems.

take care,
  Gerd


