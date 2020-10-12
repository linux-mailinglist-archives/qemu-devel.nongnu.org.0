Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E4128B247
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 12:34:32 +0200 (CEST)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRv9z-0005Vi-Nx
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 06:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRv8a-0004VY-QX
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 06:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRv8Z-0007MM-0o
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 06:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602498781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26S9f3eHEnRhswPvDrolfN3+dVAmErggc8gbjPqk0/8=;
 b=JwjUJUsEZ6f5yoyViJ3zGh0vZaSPmUzPBW1rJsBNQmEahO+jyo0Hdpl9RD4q42sVNGL2wI
 TgWlP5MtH18jvUdDuPTXsEnrI4U90XNRJcl1SVgL/BSeNT9QunFTLvkW5h46k+FHJNJm1G
 IZDrjWA7JRKfREZRnFbELm+D3HCH74c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-NQFYQ1tBMyOceCzd_ZrUYA-1; Mon, 12 Oct 2020 06:32:59 -0400
X-MC-Unique: NQFYQ1tBMyOceCzd_ZrUYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5657107AFA5;
 Mon, 12 Oct 2020 10:32:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8F360C13;
 Mon, 12 Oct 2020 10:32:54 +0000 (UTC)
Subject: Re: [PATCH 0/3] Acceptance Tests: improve usage on GitLab CI
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20201009205513.751968-1-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <23db8a4a-f30a-ae35-249f-e1a3317fd0cf@redhat.com>
Date: Mon, 12 Oct 2020 12:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201009205513.751968-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/10/2020 22.55, Cleber Rosa wrote:
> This attempts to improve a bit the execution of acceptance tests
> in both GitLab CI, and in restricted Python environments.
> 
> For the GitLab's rendering of test results, a sample can be seen here:
> 
>   https://gitlab.com/cleber.gnu/qemu/-/pipelines/200639030/test_report
> 
> Cleber Rosa (3):
>   Acceptance tests: bump pycdlib version for easier installation
>   Acceptance tests: do not show canceled test logs on GitLab CI
>   Acceptance tests: show test report on GitLab CI
> 
>  .gitlab-ci.yml         | 7 ++++++-
>  tests/requirements.txt | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 

Thanks, queued (with the bug URL fixed).

 Thomas


