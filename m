Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D735131947A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:29:55 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIb4-000182-WB
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lAIHe-00024z-0m
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lAIHY-00030q-PO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613074182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6KxFJ/F+lLW3nVhgojxc2tfZgcnAaBV4mB3HRs7hys=;
 b=c295kVhZJbv7ow2l5IwZoquws2X1AaWOse8jZjbvFrFoVH1x9i+RtiRI7R5Cb5zLCGQ4Mw
 LXp0gDeiBQWJVI3bups2cMBpsjutOsVk3YNIcT5eWxd0FjbKw4nKKre8Zw3cZxX18nLQZg
 DfSZr+cKr2kRTWEgQEUdwYEJugboAy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-MtahO6ALON6kLkJ9JoOIaQ-1; Thu, 11 Feb 2021 15:09:39 -0500
X-MC-Unique: MtahO6ALON6kLkJ9JoOIaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D248980196E;
 Thu, 11 Feb 2021 20:09:36 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E556D6268E;
 Thu, 11 Feb 2021 20:09:28 +0000 (UTC)
Subject: Re: [PATCH 2/2] travis: remove travis configuration and all
 references to Travis CI
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20210209135011.1224992-1-berrange@redhat.com>
 <20210209135011.1224992-3-berrange@redhat.com>
 <083d5485-eae8-e3e0-7e2b-57406683c570@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <f5e6a15b-2e25-44e7-4e1b-b6faf9781b48@redhat.com>
Date: Thu, 11 Feb 2021 17:09:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <083d5485-eae8-e3e0-7e2b-57406683c570@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/9/21 11:32 AM, Thomas Huth wrote:
> On 09/02/2021 14.50, Daniel P. Berrangé wrote:
>> The Travis CI system QEMU has been using has removed the unlimited free
>> usage model, replacing it with a one-time only grant of CI minutes that
>> is not renewed. The QEMU CI jobs quickly exhaust maintainer's free CI
>> credits, leaving them unable to test with Travis. This is not a
>> sustainable situation, so we have no choice by to discontinue use of
>> Travis. GitLab CI is now the primary target, with Cirrus CI filling
>> in some platform gaps where needed.
>
> I've currently got a series in flight that moves some of the remaining 
> jobs to gitlab-CI:
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01924.html
>
> Could you please hold this patch 'til my series got merged first?
>
> Also I think we could still wait some more weeks with the final 
> removal of the travis-CI either 'til travis-ci.org got shut down 
> completely (and thus we cannot use it for QEMU at all anymore), or 
> until we finally got the s390x and aarch64 runners up and running in 
> the gitlab-CI.

It's reasonable to me.

- Wainer

>
>
>  Thomas
>
>


