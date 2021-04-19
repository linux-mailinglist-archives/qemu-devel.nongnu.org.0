Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B1364A95
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:30:02 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZar-0001Y1-8S
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYZED-0006Lo-5o
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYZE8-0004S8-CU
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618859189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F92CLQjLcOZ2f+iWVJtdrsBytfHApeiNfabMoD13auQ=;
 b=S8khcOephO51aQ8j1ja5biNp3sjri8Z3XGPtn3xki0u/V7+g+9/LPdSYjbMG49OaSnNBYf
 gtS7PwLED45Dfqj8I1jpVpj9XMS8fzRrWaqsY2miqmaHByz6znUJ9wa+kLxU9oDYoWP3qz
 IZ37DybM3CYWTbFwbWxWxsikfv1lB6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-4MSazqD0NMaA3-hccjdD4A-1; Mon, 19 Apr 2021 15:06:27 -0400
X-MC-Unique: 4MSazqD0NMaA3-hccjdD4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B749310053ED;
 Mon, 19 Apr 2021 19:06:26 +0000 (UTC)
Received: from work-vm (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B47C21037E83;
 Mon, 19 Apr 2021 19:06:25 +0000 (UTC)
Date: Mon, 19 Apr 2021 20:06:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jing-Wei Su <jwsu1986@gmail.com>
Subject: Re: Live migration using a specified networking adapter
Message-ID: <YH3UrzZ4L4/tGIK2@work-vm>
References: <CAFKS8hW6mwS89HHteyYcjRuvw7c5LxLdUrYo705Op7XreJBjTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFKS8hW6mwS89HHteyYcjRuvw7c5LxLdUrYo705Op7XreJBjTQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jing-Wei Su (jwsu1986@gmail.com) wrote:
> Hello experts,
> 
> 
> I have a network topology like this diagram.
> 
> When start live migration moving a VM from Host A to B,
> 
> the migration process uses either 10GbE (10.0.0.1) or 1 GbE (10.0.0.2),
> 
> but the user cannot specify the source NIC by current migrate command.
> 
> 
> To solve the problem, my rough idea is to add a source ipv4:port argument,
> 
> the migration command seems like
> 
> ```
> 
> migrate -b tcp:10.0.0.1:4444 -d tcp:10.0.0.3:4444.

I'm not sure what the OS lets us do, but if it lets us pick the IP and
port I think that would work; I don't think you need another tcp:
since we already know which protocol we're using.

> 
> ```
> 
> Is it an available solution? Or, is there any concern and sugesstion?
> 
> Besides the idea, is there any good way to this issue?

It's unusual; I don't think I've seen anyone ask for it before.
I assume there's a wayto get the host network stack to prefer
the 10GbE interface.
Or to use separate subnets; rememember that each interface
can have multiple IP addresses.

Dave

> 
>    +-----------------------------------------------------+
>    |                     10GbE switch                    |
>    +-----------------------------------------------------+
>            |            |                |
>            |            |                |
>            |            |                |
>   10.0.0.1 |    10.0.0.2|        10.0.0.3|
>    +-+----------+-+--------+-+  +--+----------+---------+
>    |  |10GbE NIC | |1GbE NIC||  |  |10GbE NIE |         |
>    |  +----------+ +--------+|  |  +----------+         |
>    |                         |  |                       |
>    |      +---------+        |  |                       |
>    |      |   VM    |        |  |                       |
>    |      +---------+        |  |                       |
>    +-------------------------+  +-----------------------+
>            Host A                         Host B
> 
> 
> Thank you.
> 
> 
> Regards,
> 
> Derek.
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


