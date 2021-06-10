Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F53A272A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:34:30 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrG8z-0000OL-Ec
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lrFq1-0003pa-66
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:14:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lrFpy-0006M2-JT
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623312888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VUlES7KtCh0Q0lTI5rTPqVZIyubV8IV0OhQGJ5sqZU4=;
 b=ebpLMMnNEmj6k8TViR6/MLW512j1cBwvUUv9ywKoqCnUeYIQC5LavoJyhevHmlwC+m4+vT
 cwYRmpmWgLUAeh2oBC97Iv/13G1Ox03nGPh6wdvPecAzPVpoQZfQkWe739+S1iMx30jfsO
 +qn7hPaN+vtxAyIsKp6P2bAPTs3FLrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-eicFOsArOqKQ1jIWYWvxjg-1; Thu, 10 Jun 2021 04:13:36 -0400
X-MC-Unique: eicFOsArOqKQ1jIWYWvxjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF181012588;
 Thu, 10 Jun 2021 08:13:35 +0000 (UTC)
Received: from nautilus.local (unknown [10.40.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F555C1C5;
 Thu, 10 Jun 2021 08:13:24 +0000 (UTC)
Date: Thu, 10 Jun 2021 10:13:21 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <YMHJoVrcuEwS7nYg@nautilus.local>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <CAKJDGDa2Xpjnvds2F5NeKAimHCFm0ceWKRGrhidObnpOr7pC7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKJDGDa2Xpjnvds2F5NeKAimHCFm0ceWKRGrhidObnpOr7pC7A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

...
> On a freshly installed Ubuntu 20.04, the script failed for me with
> dependency messages on the apt side. After I updated the packages on
> the system, the playbook worked without problems.
> 
> So, my suggestion is to add the "update = yes" here, or add a note in
> the documentation asking the user to update the system before running
> the playbook.

I'd advocate for always updating the system automatically rather than putting
it into the documentation and relying on users actually doing it.

Erik


