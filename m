Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138536476F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:52:30 +0200 (CEST)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWCL-0007op-8M
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYWAF-0007H9-7r
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYWAD-0001xL-BQ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618847416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gk/xJ48PoQOgkLI6AlIBv88OExOq0DUDxTulSNgLsXw=;
 b=JVICkMZISWYOQ8KiCO++GVoQWuhI+EvQhqjB+4f5YeadvStFUyM3szwBZwGG6naIVgKr4v
 m/H3gqi/Q80EKo+bxJu5DRcb7sp+otHYRsklocTl6To+eW1sO6zqGE1Jrprd8GbM/qzJd/
 M2iqCGRVhtA6r/Z0WKtdy/KT/b4RpSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-q-Owp4UQPMCnb6BTC2W1zQ-1; Mon, 19 Apr 2021 11:50:14 -0400
X-MC-Unique: q-Owp4UQPMCnb6BTC2W1zQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5235B87A83B
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 15:50:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 776A119C66;
 Mon, 19 Apr 2021 15:50:12 +0000 (UTC)
Subject: Re: Upstream bug comments on the mailing list and Launchpad
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20210415094954.GA84874@paraplu.home>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5e885bb5-63a1-b109-e3bb-c731a4c387df@redhat.com>
Date: Mon, 19 Apr 2021 17:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415094954.GA84874@paraplu.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/04/2021 11.49, Kashyap Chamarthy wrote:
...
> PS: I recall there was discussion on the list of moving to a different
>      GitLab tracker.  As Thomas Huth mentioned on IRC, more people seem
>      to have account on GitLab than on Launchpad.

I think we basically agreed that we want to migrate to gitlab, but e.g. 
Peter suggested that we copy the open bugs on launchpad to the gitlab 
tracker first, so that we don't have two active trackers at the same time... 
thus this needs someone with enough spare time to work on such a convertion 
script first...

See this discussion here for some more details:

 
https://lore.kernel.org/qemu-devel/CAFEAcA_8PKkfeninOXCzPdtY7WVHnC7Pkon758zXe7h9MzS+aw@mail.gmail.com/

  Thomas


