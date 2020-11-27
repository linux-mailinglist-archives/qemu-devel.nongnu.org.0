Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B172C6AE5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:50:00 +0100 (CET)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihsd-0002Oi-Q2
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kihqv-0001R7-I0
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kihqp-0006p3-5y
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606499285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CDA6raDxxSGWiNancGndqT9B9Pa6DE1ZnRLlj4lGKg=;
 b=S8Ztkdi1bLH3MSnSLZLbe1j+OPjCXMCeaOPz4J6OyBhiNoQNPRcyJT7W+KRNOwhjKckekU
 +208YF3L93J/vi0NUvdXh6huGwmYTPd72MEkc5SGmI6diMbcUMRuJaBoDA8ppuMzq9AdLX
 6+ZPhKKfugFGNmO0wGiTeDNad7iLBXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-YqCmsOTfNzODsDnirItQ0Q-1; Fri, 27 Nov 2020 12:48:03 -0500
X-MC-Unique: YqCmsOTfNzODsDnirItQ0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1609185E498;
 Fri, 27 Nov 2020 17:48:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-70.ams2.redhat.com [10.36.113.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B37AB5D9D3;
 Fri, 27 Nov 2020 17:47:54 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
Date: Fri, 27 Nov 2020 18:47:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127174110.1932671-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
> We lately realized that the Avocado framework was not designed
> to be regularly run on CI environments. Therefore, as of 5.2
> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> current users, it is possible to keep the current behavior by
> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> (see [*]).
> From now on, using these jobs (or adding new tests to them)
> is strongly discouraged.
> 
> Tests based on Avocado will be ported to new job schemes during
> the next releases, with better documentation and templates.

Why should we disable the jobs by default as long as there is no replacement
available yet?

 Thomas


