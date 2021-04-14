Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414335F451
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:56:23 +0200 (CEST)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWf4A-0004A9-Af
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWewQ-00061T-Lv
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWewN-0004x5-Ey
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618404497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2v6xE+0Hhs+2BTPkOHI1y6Fx5rbhcsZM9CCLqc/C0g=;
 b=bhJ31aK0xuTXaK4+yG/CWtfDb6T27b1wxUGp+mqJPjrS2ffN6epboxLMroyU541oJIoXTo
 7Q+RWLp5lwtG8V3zNnD8DM64GYJoi8eBZoTrMerpkEkTsBIFu8OwcKZkkiah3zPZ8PTboY
 rlilm9sbltf3oA9Oym2Kn3TSpmzAVkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-QWQnJVCsPL280oK1pss5_w-1; Wed, 14 Apr 2021 08:48:14 -0400
X-MC-Unique: QWQnJVCsPL280oK1pss5_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 290F510054F6;
 Wed, 14 Apr 2021 12:48:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B838D5D9DC;
 Wed, 14 Apr 2021 12:48:11 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: any remaining for-6.0 issues?
Message-ID: <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
Date: Wed, 14 Apr 2021 14:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/2021 17.32, Peter Maydell wrote:
> Last call to note anything we need to fix for 6.0 on
> https://wiki.qemu.org/Planning/6.0#Known_issues please.
> The schedule is to tag rc3 tomorrow, which I would ideally like
> to be the last rc before release. After rc3 I will only be taking
> fixes for bugs which are absolutely critical...

  Hi Peter,

I've seen some intermittend, non-reproducible crashes with usermode QEMU in 
some of my CI runs, e.g.:

  https://gitlab.com/thuth/qemu/-/jobs/1178256498#L3876

  https://gitlab.com/thuth/qemu/-/jobs/1146276208#L3241

This was only with ccache enabled, so I thought that it might be related to 
my work-in-progress ccache patches...

... but now Cornelia reported that she has seen such a crash in one of her 
branches, too (which is completely unrelated to my ccache patches):

  https://gitlab.com/cohuck/qemu/-/jobs/1178860927#L3867

That makes me wonder whether we currently have a real problem with user-mode 
in the master branch? Did anybody else see such problems?

  Thomas


