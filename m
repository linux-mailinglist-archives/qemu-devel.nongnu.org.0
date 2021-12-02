Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93368466120
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 11:06:08 +0100 (CET)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msiyd-0000bg-71
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 05:06:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1msiwT-0007Z7-ND
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1msiwO-0001mX-WF
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638439427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFkZDRHLWmY2nppsYnjWh63nN7VvAjuSKdR7feV4YqI=;
 b=TcIBU+Q/4bfHceozYrz9pE56zuiljLaw3lqDkEdp9E3y4FuvD4qNBfunIfTRvmsso0HySO
 roJQnHyUZhs3BM43hcOZPzSWB/P1tzPNbNXwu/nU2NZ4lvohG/ubT23Owe1Aw4HgNrer4C
 ofStslX3oO0iNmVtMPehiiGAow5KCto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-291-H1YO9TWcPomt0ZsEOwda1g-1; Thu, 02 Dec 2021 05:03:46 -0500
X-MC-Unique: H1YO9TWcPomt0ZsEOwda1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E54381EE6F;
 Thu,  2 Dec 2021 10:03:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0151660622;
 Thu,  2 Dec 2021 10:03:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48084180079A; Thu,  2 Dec 2021 11:03:43 +0100 (CET)
Date: Thu, 2 Dec 2021 11:03:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Subject: Re: How to enable virgl in headless mode?
Message-ID: <20211202100343.jple7npnypmgs3m2@sirius.home.kraxel.org>
References: <CAE2XoE-RgL3762rVVjCmTajrPea2-5kcOaSj=qWsa3oHiEP+jw@mail.gmail.com>
 <20211124110552.inssty5eki6v6ywn@sirius.home.kraxel.org>
 <CAE2XoE8xKf-p3wZZYkXDEUNubQTR==4ukKSpcCzzo2uuwO0YBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE8xKf-p3wZZYkXDEUNubQTR==4ukKSpcCzzo2uuwO0YBw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 02:50:34AM +0800, 罗勇刚(Yonggang Luo) wrote:
> On Wed, Nov 24, 2021 at 7:06 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > qemu -display egl-headless
> 
> Thanks a lot, I tried this, and it's forced me to provide  rendernode
> option like this:
> ```
> -display egl-headless,rendernode=/dev/dri/renderD128
> ```
> My question is what I need to do to remove the need of rendernode, because
> I wanna getting egl-headless to be usable on Windows.

Well, ui/egl-*.c needs some platform code to initialize egl on windows.

take care,
  Gerd


