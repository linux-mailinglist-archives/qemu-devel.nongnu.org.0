Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7F3A2E62
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:36:55 +0200 (CEST)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLni-0000mw-UL
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lrLma-0007Ep-P7
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lrLmT-0002lK-24
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623335736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qm4Ld7TIuZa3/6QsWiB7y+NwEBtlb3GIvQGOU8CNAAo=;
 b=WB9zqLiJ2IUokYhx4fkElxggvpSnXS6fSLEEaIvEizOl7FHm3tupk8Njka2V8H+V9fl7Q0
 gPFNl3b/eIb9/3mdGB52pA9h9XPOpAEJ1NldARMCKWPSt20xdbx9Lmy6DUefp6ahR3Y2Sp
 2RkpgX2TR0tZONiFv5J5cPp7uLm9UZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-8sZgy1aXP2SdX1c2bibmWg-1; Thu, 10 Jun 2021 10:35:34 -0400
X-MC-Unique: 8sZgy1aXP2SdX1c2bibmWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEFA7801FCD;
 Thu, 10 Jun 2021 14:35:33 +0000 (UTC)
Received: from [10.10.116.110] (ovpn-116-110.rdu2.redhat.com [10.10.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F373119C45;
 Thu, 10 Jun 2021 14:35:25 +0000 (UTC)
Subject: Re: GSoC Intro - TUI interface for QMP
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
 <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
 <87czswxuwn.fsf@dusky.pond.sub.org>
 <1577ce78-bf98-3f3d-7594-2b91d84967ec@redhat.com>
 <YMCvDpooagPkPN2H@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <bb073532-6d90-4a3d-80a0-93bfad45b10d@redhat.com>
Date: Thu, 10 Jun 2021 10:35:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMCvDpooagPkPN2H@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Niteesh G. S." <niteesh.gs@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 8:07 AM, Daniel P. Berrangé wrote:
> I think that's  overthinking things. Even a small QEMU install is
> 10s of MB in size once you add up the qemu binary, firmware blobs
> and depedancies. If we only keep the raw help text from the json,
> we'll have < 1/2 MB, which is lost in the noise of the overall
> deploymnt size. No need for compression or complex load-on-demand,
> just keep it small and simple.
> 

Yes, you're right. Our first step should be to keep it small and simple 
and prove that it works.

We can worry about load on demand later if we still want it at that point.

--js


