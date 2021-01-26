Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48551303C7A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:07:12 +0100 (CET)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4N7n-0006Sa-DA
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4N6I-0005bo-B2
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:05:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4N6F-0008R8-41
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611662733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IQbrTqcrTPr5QnaeTO2m/rzvQcFqwAI5JnKRNe3uko=;
 b=L2A/O5ac4IFHCM9ebyF2lcUVaEH/gNunbtGaVeRzuUznVj2DEaMY7lkL+PD+DkONRwLkB5
 QxzD/gq7qvu+RuqJNOLRgRvOEBzpBBJkwmv3o2tm6k2NjpGG/TKFLhXbrPM6dASZ4I2hUF
 +r4a+oyEFN4QF2MtIl1IZIzFrGK694o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-EyhLBhpWOQGWieiWIJi0Jg-1; Tue, 26 Jan 2021 07:05:29 -0500
X-MC-Unique: EyhLBhpWOQGWieiWIJi0Jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57F0115720;
 Tue, 26 Jan 2021 12:05:28 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 176F060636;
 Tue, 26 Jan 2021 12:05:23 +0000 (UTC)
Subject: Re: [PATCH 0/2] gitlab-ci: Test Fedora capstone package
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210126113649.3148417-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <22c595d7-e5ce-c536-b0de-b1183550c960@redhat.com>
Date: Tue, 26 Jan 2021 13:05:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126113649.3148417-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2021 12.36, Philippe Mathieu-Daudé wrote:
> Add a job for a supported feature: capstone.
> 
> Philippe Mathieu-Daudé (2):
>    docker: Install libcastone on Fedora
>    gitlab-ci: Test Fedora capstone package
> 
>   .gitlab-ci.yml                         | 7 +++++++
>   tests/docker/dockerfiles/fedora.docker | 1 +
>   2 files changed, 8 insertions(+)

I've posted a patch for this a couple of days ago already:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg775255.html

  Thomas


