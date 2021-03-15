Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB933AC50
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 08:33:53 +0100 (CET)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLhjc-00031O-Ts
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 03:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLhiV-0002YS-6t
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLhiT-0005qB-LF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615793560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRl9wS5hnFZRw3hkMCgjvYYeZGm20gWSSAIf9+maEhM=;
 b=TGJ97nnnJ/tp1CeDisa8drM68+vsWnJjpWKsYhcrl6sxFkj2kmvmbe2wSVFBA5o5+i+3UD
 Odtnrey1P82OWl3GxJDbb24Vv3KRytoPFmtoQQkl7jtMzGdrrZfKmSWeoF8qzxxybYGQyR
 asfXvBZJYmM3In8UgZ8styTWaRW8wVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-vnVZImp6NbqB9XmbFXO-KQ-1; Mon, 15 Mar 2021 03:32:37 -0400
X-MC-Unique: vnVZImp6NbqB9XmbFXO-KQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4500039392;
 Mon, 15 Mar 2021 07:32:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1B695D9DC;
 Mon, 15 Mar 2021 07:32:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4AE618000B7; Mon, 15 Mar 2021 08:32:33 +0100 (CET)
Date: Mon, 15 Mar 2021 08:32:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not raise keys before QEMU resigns active
Message-ID: <20210315073233.edxuqhu7m2lmxgzg@sirius.home.kraxel.org>
References: <20210314070147.34731-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210314070147.34731-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 14, 2021 at 04:01:47PM +0900, Akihiko Odaki wrote:
> ui/cocoa used to raise all keys before it resigns active to prevent a
> stuck key problem caused by key up events it does not see while it is
> inactive. The problem is solved by checking -[NSEvent modifierFlags] in
> commit 6d73bb643aa725348aabe6a885ac5fb0b7f70252, which is better
> because it handles the case that key *down* events are missed while it
> is inactive.

Well, I think it is a good idea to virtually lift all keys when the
application goes inactive.  Does this cause any actual problems?

Worst case should be that we send an extra keyup + keydown if the
qemu goes through a active -> inactive -> active cycle while a modifier
key is down, which you probably wouldn't even notice unless you log all
key events inside the guest.

take care,
  Gerd


