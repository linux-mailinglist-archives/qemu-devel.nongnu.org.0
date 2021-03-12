Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C0339055
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:50:55 +0100 (CET)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKj7u-0000H3-6h
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKivE-0003WX-1P
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKiv5-0003BU-1a
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615559855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFuUAzOw156/zPsNZsfg7lnhr3bdGCl6UOMnaudP23Y=;
 b=hiNyw7W36rJPXUFWihQ7obskqIH8/i1K4fIKpKMI4jGvJmnVrnxlS3Y60QJzSlol6lGse1
 nLtsGxydnihrWsgkqPGF0do5SVnDRZyc/aTpHqqkqq8J3iMVevXDqGLRoFptRL2DnqumzM
 /xRD4dkiMA861FiSK/0D8EoqJLoKtt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-pvyXASOmNWqJac0USZo3yg-1; Fri, 12 Mar 2021 09:37:33 -0500
X-MC-Unique: pvyXASOmNWqJac0USZo3yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 921FE107ACCA
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 14:37:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 804525D9CC;
 Fri, 12 Mar 2021 14:37:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC93918000B4; Fri, 12 Mar 2021 15:37:27 +0100 (CET)
Date: Fri, 12 Mar 2021 15:37:27 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 00/27] Add D-Bus display backend
Message-ID: <20210312143727.sllpme4pgdhoj4ja@sirius.home.kraxel.org>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312111806.zdh2c63cxaiyabyp@sirius.home.kraxel.org>
 <CAMxuvayh_8=bp4=_CZ9ezEjE6god+35RJ9dBx6TBF34NnO_+zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvayh_8=bp4=_CZ9ezEjE6god+35RJ9dBx6TBF34NnO_+zw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Fri, Mar 12, 2021 at 3:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > On Fri, Mar 12, 2021 at 02:00:41PM +0400, marcandre.lureau@redhat.com
> > wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > The whole series calls for a splitup.  First the bugfixes, which we
> > should be able to fast-track for 6.0.  Next the ui opengl changes.  For
> > those a cover letter would be nice, describing the overall direction and
> > motivation for the change.  Make sure these don't re-introduce a opengl
> > dependency to core qemu for modular builds.  Finally the new display
> > backend patches / discussion.
> >
> 
> I agree, what about reviewing and queuing the first patches? Then I can
> resend up to the second part.

Can cherry-pick them.  First four patches I assume?

take care,
  Gerd


