Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F21350EFE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 08:28:00 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRqoB-0004Z5-IK
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 02:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRqn1-000416-Ui
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:26:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRqn0-0007qd-Au
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617258405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvpbullpooboMkzwRod+hyPuG+CQ5B0mtgxCp8Kdqxs=;
 b=JixkFtUoUADeFZIhxpNKs5TPLWs+IPgKNT3oHBlBNgHOYZCfnyJDfQBXsFG5YAEY76vZB2
 WCaz56XPRKSINlGxh0UGaL9jlB09W4MYyZguelezhGwLtbcExSsrI5WDsDJBpikCGyC9PQ
 2DpyukZtFwBWv4E/TYjE2Kxed5Dahx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-gVZYQNkxNKCflxOVsyckhw-1; Thu, 01 Apr 2021 02:26:43 -0400
X-MC-Unique: gVZYQNkxNKCflxOVsyckhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F20107ACCD;
 Thu,  1 Apr 2021 06:26:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42D9D5D74A;
 Thu,  1 Apr 2021 06:26:42 +0000 (UTC)
Subject: Re: Status update for maintainers file
To: Sarah Harris <seh53@kent.ac.uk>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210331184221.d81b4ffed7c7c733c33f8c66@kent.ac.uk>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fa45a0ee-b5cc-fbda-d9f4-af1b3a1aaffb@redhat.com>
Date: Thu, 1 Apr 2021 08:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331184221.d81b4ffed7c7c733c33f8c66@kent.ac.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/2021 19.42, Sarah Harris wrote:
> Hi all,
> 
> I was added as a reviewer (in MAINTAINERS) for the AVR target for the duration of my research work using it.
> The funding for my project expires in the middle of April, so I will not be able to provide time for reviewing patches from that point.
> 
> I'm not sure what the process is for removing my reviewer entry, but I assume if someone needs to be notified they'll be a member of this list.

This is done by sending a patch to the list that remove the entries. I just 
did that now - would be great if you could reply to that mail on the list 
with "Reviewed-by: ..." or "Acked-by: ...".

  Thanks,
   Thomas


