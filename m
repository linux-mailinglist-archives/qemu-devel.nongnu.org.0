Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72348341B49
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:20:55 +0100 (CET)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDBW-0007cx-IW
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNDAE-0007CL-QL
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNDAB-0005w7-1j
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lizDMu2jq9f4MThd1kihCuNpVKwyFV8Ld+8KPebSP4A=;
 b=VlZ8teXhtTJdpXSXvftiw+Ip6o35knFn16RmaTbygxmyFeTeHY41vonkIptZqOVlV1Cn65
 JgE6CI92QRvd0VwPsslor4MqilaETXRv8fZK8dNMRBjLKFldHn3hW/RwXvbJyoEewmvRtC
 BSgPN7ckhHLjDsWbs6zv1SXlo5FWIYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-rBzAD9LBNAWuMv4_WaX87g-1; Fri, 19 Mar 2021 07:19:28 -0400
X-MC-Unique: rBzAD9LBNAWuMv4_WaX87g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5544D8143F0;
 Fri, 19 Mar 2021 11:19:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CC755D9F2;
 Fri, 19 Mar 2021 11:19:25 +0000 (UTC)
Subject: Re: gitlab-ci: cross-i386-system job timeouting
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <e34b63a3-87e6-ff84-0a4c-306ac6091120@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <77a34c82-8c80-3f9e-2afa-bdf3dc3269b9@redhat.com>
Date: Fri, 19 Mar 2021 12:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e34b63a3-87e6-ff84-0a4c-306ac6091120@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/2021 11.56, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> With all the recent pull requests merged, I'm now seeing
> the cross-i386-system reaching the timeout limit:

I just took 53 minutes in the main repo:

https://gitlab.com/qemu-project/qemu/-/jobs/1111677521

I assume you were just temporarily out of luck ... but let's keep an eye on 
it...

  Thomas


