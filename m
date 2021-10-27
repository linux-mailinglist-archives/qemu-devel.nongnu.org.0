Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D471343C8B9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:38:54 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhGf-0007js-HT
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mfhDm-0006LD-Pa
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mfhDi-00045f-7l
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635334548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6l0E+jtgui5xVhp5HuSdp+ABv08XIoYea/IrfBARzWY=;
 b=XAT/IYww2Oum3CsNQy4zTZS9WV5IKcXtRqJD2NPGhgXBiX0F9JelvcrPh8Du44Ru0tt8F5
 jlAIyPY9Cp0h8PseEyjpPVEXIfeFYWsq5IYWwtav48yDSphbiEGugVgIx3Xx5K0zhqsh7p
 2nWvCll0tO92T8kKXOtQ2mbI5VECUPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-lOVE5m8tOhu2UF8uduCNUw-1; Wed, 27 Oct 2021 07:35:44 -0400
X-MC-Unique: lOVE5m8tOhu2UF8uduCNUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436FD8030A0;
 Wed, 27 Oct 2021 11:35:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-241.phx2.redhat.com
 [10.3.112.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E750B641A7;
 Wed, 27 Oct 2021 11:35:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 13EE51801AA7; Wed, 27 Oct 2021 13:35:25 +0200 (CEST)
Date: Wed, 27 Oct 2021 13:35:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
Message-ID: <20211027113525.sykvnsw5w2uu76qi@sirius.home.kraxel.org>
References: <20211026145509.1029274-1-philmd@redhat.com>
 <20211026145509.1029274-2-philmd@redhat.com>
 <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
 <YXkRQKUKkpnqgvcu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXkRQKUKkpnqgvcu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> This scenario a tricky problem, and I'm not seeing an easy answer to it
> so far.

Only exclude stable branches?

take care,
  Gerd


