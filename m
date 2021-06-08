Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C720139F909
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:26:48 +0200 (CEST)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcgp-0003No-SX
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqcfb-0002f2-A6
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqcfW-00030r-RH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623162326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W06qYxZ2qqVS1u0PaxWEQqxCVdQfxnfRPwvFhIVhLIg=;
 b=UOdyMkLNirbPyjba0uWe2VVIwJwixA0bn7PCn4Ej7A5dPHr//tkPPph58iTzfBOWvMBUqC
 vXa9u9hRYwHZbvcOfLL2zv3JyJRuV7Rtjh1r4NaJJakDbAcbMNwXkKZUM2h6AUw1uQaw5l
 GHfxCsLy7JF6c3sf3zMee522h5o+kWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-7s_2-VngMrq3aOaWNEN8GA-1; Tue, 08 Jun 2021 10:25:25 -0400
X-MC-Unique: 7s_2-VngMrq3aOaWNEN8GA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE203108BD19;
 Tue,  8 Jun 2021 14:25:23 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F16110016F4;
 Tue,  8 Jun 2021 14:25:19 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] GitLab: Add "Feature Request" issue template.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210607153155.1760158-1-jsnow@redhat.com>
 <20210607153155.1760158-3-jsnow@redhat.com> <87lf7klama.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5c9d9795-7134-b1c8-a154-092bcfd1b53b@redhat.com>
Date: Tue, 8 Jun 2021 10:25:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87lf7klama.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 9:59 AM, Alex Bennée wrote:
> <!-- Patch or branch references, any other useful information -->?
> 
> Either way:
> 
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> 
> 

Thanks. I'm not sure who will merge this -- It might even reasonably 
fall under your jurisdiction. You could squash this in if none of the 
other reviewers object to it.

--js


