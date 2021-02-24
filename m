Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF89323F29
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:31:48 +0100 (CET)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvCd-0001BT-5K
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEvBk-0000gU-Gy
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEvBd-00056A-Ne
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncn8X+h3YeW8gLlB9/OfLc6EpOTEqSVgQGUxGWacgjQ=;
 b=eiK6HLqdKxTHTNa0QEPnw9w/2s75qiS+Kd+YYjkpfttRO4GO8h/GKV5Gsyblb15AxzANU2
 1C808KorL2WCZh1Wo6MqL8L17wEA/p1YidSAO+FdF0kSGzVNTPfWb+7yiyDQO/6q61Mfrm
 ACF7SWFuPhNIDAlw5TArOmG58Ht/22E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-tsoAs0ThPramRZ4pGmK4Xg-1; Wed, 24 Feb 2021 09:30:39 -0500
X-MC-Unique: tsoAs0ThPramRZ4pGmK4Xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 285CC801B1C;
 Wed, 24 Feb 2021 13:39:14 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453DE60855;
 Wed, 24 Feb 2021 13:39:06 +0000 (UTC)
Subject: Re: [RFC PATCH] docs/devel: re-organise the developers guide into
 sections
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210223105146.6695-1-alex.bennee@linaro.org>
 <a03c1d90-d30b-e805-8466-4d6aa9bfb015@redhat.com>
 <CAFEAcA8kt_vsHFHGL=dQMPBqogJTQOiAV=O-Zc=UBxQ5AR7opA@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a0164e59-cc94-976a-a804-1c0c7c51f89a@redhat.com>
Date: Wed, 24 Feb 2021 10:39:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8kt_vsHFHGL=dQMPBqogJTQOiAV=O-Zc=UBxQ5AR7opA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/24/21 10:15 AM, Peter Maydell wrote:
> On Wed, 24 Feb 2021 at 12:51, Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
>> Just a fyi... yesterday I realized that the (current) TOC is not getting
>> rendered on my Firefox (or chrome) browser:
>>
>> https://gitlab.com/qemu-project/qemu/-/tree/master/docs/devel
> That's the source code for the docs, isn't it? gitlab
> is trying to render it as raw rst, but that won't handle
> all the Sphinx-specific markup, including the TOC.
You're right Peter. For one second I thought gitlab was able to render 
the rst files.
>
> The built-and-rendered docs are elsewhere (the gitlab CI
> job runs Sphinx and puts the rendered manuals here):
> https://qemu-project.gitlab.io/qemu/
>
> thanks
> -- PMM
>


