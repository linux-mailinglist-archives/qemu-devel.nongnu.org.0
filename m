Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D90450732
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:37:28 +0100 (CET)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd6t-0007X6-OV
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmd3U-0001K2-6h
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmd3R-00055G-3Z
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636986832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSqauDDs6OHkpqHQ/fKRWgfBhsZ5DWugRDGnirEAY9g=;
 b=XE61sYfjHmO7U2i7dCr7O2UGUks02TtECotllmqNzdE27hgg9Kjdi/VxISrUTNqliz+Lwl
 1jf8fkyeost/bAEfvclJgTlyH4nNodaTFDdt01ee02cGw8EQYFytGeOg/YYHPCrT9nJ2Oo
 un93nVzq3mE596bWzxBmtqNxRy5yI54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-C_m9HYtmN0q1D3llAvoc0g-1; Mon, 15 Nov 2021 09:33:48 -0500
X-MC-Unique: C_m9HYtmN0q1D3llAvoc0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02AE18125C1;
 Mon, 15 Nov 2021 14:33:47 +0000 (UTC)
Received: from [10.39.194.77] (unknown [10.39.194.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A05B922719;
 Mon, 15 Nov 2021 14:33:34 +0000 (UTC)
Message-ID: <7fb209d4-0d3c-af8f-f08d-d051d3b73e09@redhat.com>
Date: Mon, 15 Nov 2021 15:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gitlab-ci: Split custom-runners.yml in one file per runner
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115095608.2436223-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211115095608.2436223-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/2021 10.56, Philippe Mathieu-Daudé wrote:
> To ease maintenance, add the custom-runners/ directory and
> split custom-runners.yml in 3 files, all included by the
> current custom-runners.yml:
>   - ubuntu-18.04-s390x.yml
>   - ubuntu-20.04-aarch64.yml
>   - centos-stream-8-x86_64.yml
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20211111160501.862396-1-crosa@redhat.com>
> https://gitlab.com/stsquad/qemu/-/tree/for-6.2/misc-fixes
> ---
>   .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
>   .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
>   .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
>   .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
>   4 files changed, 268 insertions(+), 264 deletions(-)
>   create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>   create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
>   create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml

Should there maybe be entries in MAINTAINERS for these new files, so that it 
is clear who takes care of the external runners?

  Thomas


