Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A5414A88
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:28:01 +0200 (CEST)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2I4-0003qo-4I
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT2EM-0000Dk-0r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT2EJ-0003V1-2L
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632317045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EqBpcXE2DBo7xSJwhhN5Mrr85a3WUNx8DczEnG2lQ6w=;
 b=I8EQEvXAJ6zkEDXRjHZgOeaL9wLYg6zhrocyCzEmYmIloSIIeMZP0gbIRsTNZggt7rGYVn
 hMV6F6ajcMkPF1S+qp17QCl1uONJ6miRRAIO5HfmAIU3T6ELBIxhbDCWh6vcSJ3eXEYh/5
 yuALMXXY7rprZ3Sws+snkSVvGEExKws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-DXyElh7ENm6zIRREk4TAiA-1; Wed, 22 Sep 2021 09:24:03 -0400
X-MC-Unique: DXyElh7ENm6zIRREk4TAiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CAD619251A4;
 Wed, 22 Sep 2021 13:24:02 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.195.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F88D5C3DF;
 Wed, 22 Sep 2021 13:23:50 +0000 (UTC)
Date: Wed, 22 Sep 2021 15:23:48 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
Message-ID: <YUsuZCYNq5aAVpPX@paraplu.home>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <CAFEAcA-vF0P7+aPLfv8GYb_9PdKKwqSv5smg1h+pZw-Qzip9XQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-vF0P7+aPLfv8GYb_9PdKKwqSv5smg1h+pZw-Qzip9XQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 02:05:24PM +0100, Peter Maydell wrote:
> On Wed, 22 Sept 2021 at 13:11, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> >
> > As of writing this, qemu.org is down, so I've used a one-month old
> > copy[1] of the wiki from 27Aug2021 to do the rST conversion.
> 
> The wiki is now back up, and it says the most recent change to
> any of these 3 pages was May 2021, so there shouldn't be any
> recent changes missed by using that old copy.

Saves a re-spin; thanks for checking. :)

-- 
/kashyap


