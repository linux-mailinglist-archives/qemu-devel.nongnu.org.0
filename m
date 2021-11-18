Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55204554E4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:50:38 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnbFl-0001d5-AB
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:50:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mnbBb-0000SM-GQ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:46:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mnbBM-0004yj-30
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637217962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X9DOiJj2XKWHGPkE1UP1muVl9TA4l3ACmPT6WmuTAwY=;
 b=NTYvI6nS5pqTfPfCXCajwfu4XvSGEqCIbMfPHSIjNpFSUTthFvfMgx0BRRYtXBaoXKYBVV
 F0kioqRU1d+lBdm+ICkH4ndbLMHrtz67/yytPVOt3EtCYkEZlGYeeTRcfOTqQfT9ARhxjz
 bcnnIOZzo7Tf2+JrXNoC4BtiUDx0bp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-uPBHknW9MuGvCKh0BYSdNw-1; Thu, 18 Nov 2021 01:45:59 -0500
X-MC-Unique: uPBHknW9MuGvCKh0BYSdNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B90441006AA0;
 Thu, 18 Nov 2021 06:45:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D31545D9DE;
 Thu, 18 Nov 2021 06:45:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CEB2B18000AA; Thu, 18 Nov 2021 07:45:34 +0100 (CET)
Date: Thu, 18 Nov 2021 07:45:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PULL 0/5] Python patches
Message-ID: <20211118064534.vbamk7ky2b5hawqm@sirius.home.kraxel.org>
References: <20211117003317.2844087-1-jsnow@redhat.com>
 <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
 <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> - Split python/qemu/qmp out into its own repository and begin uploading it
> to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)

I think you can do that as two separate steps.

pip can install from vcs too, i.e. when splitted to a separate repo but
not yet uploaded to pypi you can simply drop something like ...

	git+https://gitlab.com/qemu/qemu-python.git@master

... into pip-requirements.txt.  That way you can easily test things
before actually uploading to pypi.

take care,
  Gerd


