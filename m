Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FD42B0F13
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:33:26 +0100 (CET)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJHZ-0007kv-Hb
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kdJG0-0007Fu-4r
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 15:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kdJFw-0002kj-Pm
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 15:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605213102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mj0ksKXlX9KPtyQExUZU3sIYr/bIW2+4LaC/QRzRhPw=;
 b=MyVJ+Nqe0ZPC6R92kXn98Kn8nkwMZvql+oABBBmai+RN7X+BbpT8dTv6jRRc/12ZfQTFcU
 laJFEk4CfxdnOPHH1H03Phe3ieodP3yqr990I8k7l7zniZTZM6B0BtK8ODiJjP1PbVprwk
 6Tjl4+EyxmaoRwuDIlGcEN7Jjtd3yps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-r7C_7W1PMXyXl33aM-Yefw-1; Thu, 12 Nov 2020 15:31:41 -0500
X-MC-Unique: r7C_7W1PMXyXl33aM-Yefw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D438015A8;
 Thu, 12 Nov 2020 20:31:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A22C71002C0D;
 Thu, 12 Nov 2020 20:31:37 +0000 (UTC)
Subject: Re: [PATCH v3 06/11] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-7-philmd@redhat.com>
 <579650f6-e8a1-fa8c-c28c-566d15ef2088@redhat.com>
 <16b2e7ca-5d08-d55c-8db4-08a5d5d4663b@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <69708ea6-35e8-5a29-0c9d-4bb9d6beef83@redhat.com>
Date: Thu, 12 Nov 2020 18:31:28 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <16b2e7ca-5d08-d55c-8db4-08a5d5d4663b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/12/20 5:02 AM, Thomas Huth wrote:
> On 10/11/2020 21.42, Wainer dos Santos Moschetta wrote:
>> Once Cleber said "acceptance" wasn't  a good name for those tests. Indeed
>> "integration" is widely used, so okay for this renaming.
> Should we maybe also rename the folder and "make check-acceptance" into
> "make check-integration" ?

I'm okay with that. But I also would like to hear from Cleber.

- Wainer

>
>   Thomas
>
>


