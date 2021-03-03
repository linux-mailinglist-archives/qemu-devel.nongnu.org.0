Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1732B9A3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:56:54 +0100 (CET)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVjx-0006Rc-EP
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHVj2-0005Wz-Jb
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHVj0-0000sg-RI
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614794153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gM+Urme1a8157WhKEzAxTg8rWZg4KKC7RVRuKD2LNA=;
 b=UXrX/vOgCH8kK3ZSWpKWka56Au+Mn8IjFQrvwZtIWMPnHYRfjE7qqqjMGua/hAiYkt30gr
 vWv2EjHimC4ePfw9d4ZT2qinHFFyouoslFovHX/EfbuW5P36DnMmKKfUFTSiso4Yyo7kk8
 soGizxVVNmor5jmYA5lVqgW7yA/PITc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-XGvOp70IOBatPn0mSElTDQ-1; Wed, 03 Mar 2021 12:55:52 -0500
X-MC-Unique: XGvOp70IOBatPn0mSElTDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA40B1E564;
 Wed,  3 Mar 2021 17:55:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55A0760BD9;
 Wed,  3 Mar 2021 17:55:45 +0000 (UTC)
Subject: Re: [PATCH 0/3] gitlab: Add missing job -> container dependencies
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20210303130646.1494015-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d4d36759-55b0-81ea-0e0d-883dfee1726c@redhat.com>
Date: Wed, 3 Mar 2021 18:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303130646.1494015-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 14.06, Philippe Mathieu-Daudé wrote:
> Following up Daniel's "fix build failures from incorrectly
> skipped container build jobs" effort (merged).
> 
> Philippe Mathieu-Daudé (3):
>    docker: Alpine build job depends on Alpine container
>    docker: EDK2 build job depends on EDK2 container
>    docker: OpenSBI build job depends on OpenSBI container
> 
>   .gitlab-ci.d/edk2.yml    | 1 +
>   .gitlab-ci.d/opensbi.yml | 1 +
>   .gitlab-ci.yml           | 2 ++
>   3 files changed, 4 insertions(+)
> 

Thanks, queued now to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


