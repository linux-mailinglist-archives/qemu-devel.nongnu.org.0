Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0F22AFEB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:06:46 +0200 (CEST)
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyavt-0003jV-9b
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyav9-0003KG-Ss
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:05:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53786
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyav7-0001TN-Hs
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595509556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=nx4488akHd+9ueCDEH3Ez24fQFlFQmz1ftTCK+KRyHY=;
 b=DmzHi+EOV2Asa2NEVRnePgf17NZFvcDhghQdYiZ9DCkFcCjrLXUX+jHLEGNithupqeuY4n
 TudzLzCJAOJYKIB4swVorLUTLGpwGocPIcAX8IEo6ShZRq/xhsjqud4wcMWcou2gBHLwKy
 v02DtR9+fdw39DAb1imU3LegDBAs0Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ngD_HI94M564LLqHYhPz_w-1; Thu, 23 Jul 2020 09:05:52 -0400
X-MC-Unique: ngD_HI94M564LLqHYhPz_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B847857;
 Thu, 23 Jul 2020 13:05:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 331956931B;
 Thu, 23 Jul 2020 13:05:46 +0000 (UTC)
Subject: Re: [PATCH 3/4] tests/acceptance: Disable the rx sash and arm
 cubieboard replay test on Gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200723122800.723-1-thuth@redhat.com>
 <20200723122800.723-4-thuth@redhat.com>
 <a78f13d8-5f81-43ae-f497-90f86f60f0bc@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <de0c01b5-80e0-63f7-7a69-fb8f0d4b5b4c@redhat.com>
Date: Thu, 23 Jul 2020 15:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a78f13d8-5f81-43ae-f497-90f86f60f0bc@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:26:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/07/2020 14.53, Philippe Mathieu-Daudé wrote:
> On 7/23/20 2:27 PM, Thomas Huth wrote:
>> These tests always time out on Gitlab, not sure what's happening here.
>> Let's disable them until somebody has enough spare time to debug the
>> issues.
> 
> Is the Avocado cache working? Is it failing with an empty cache?
> If so, maybe we need to run avocado cache fetching in a previous
> step, before the testing job.
> 
> Can you share a url of failed job so I can have a look?

CentOS:
 https://gitlab.com/huth/qemu/-/jobs/651179303

Debian:
 https://gitlab.com/huth/qemu/-/jobs/651179296

... might be a cache issue, indeed.

 Thomas


