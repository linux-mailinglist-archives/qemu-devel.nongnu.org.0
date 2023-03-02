Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7EC6A83E0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:54:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjMr-0002B9-A6; Thu, 02 Mar 2023 08:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pXjMp-0002Ai-Gh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:53:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pXjMn-000222-Qa
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677765184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxrFGO6vGHw61IjTyrbor0EZmi9eMcheHl+ZUzndwqY=;
 b=X46C5ylzrMO6RqlbgF39Cov771/JXk2RVDtCn50di/3zed9DmGMhpoupi9nDgmSYzkgubX
 lc4gwRJLn6cMttOFKa7RnUUUUmf13gui/xBd+bTSZMEJFHwybq5cUXr2zw0CATBtAdiY44
 CIOS2ZQ158/S53Wp6kaRKwX848pp0dQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-HdFm4vdlN2q33PRSwwA5Wg-1; Thu, 02 Mar 2023 08:53:03 -0500
X-MC-Unique: HdFm4vdlN2q33PRSwwA5Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851C685A5B1;
 Thu,  2 Mar 2023 13:53:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44D4540C6EC4;
 Thu,  2 Mar 2023 13:53:03 +0000 (UTC)
Date: Thu, 2 Mar 2023 13:53:02 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Ayush Singh <ayushdevel1325@gmail.com>, Erik Skultety <eskultet@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: Re: [GSoC 2023] Introducing Myself
Message-ID: <20230302135302.GM7636@redhat.com>
References: <CA+Yfj7vS0kdkbQGe-HYf7stqf-So-5ny5dioeoC_V0LGvMfVuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Yfj7vS0kdkbQGe-HYf7stqf-So-5ny5dioeoC_V0LGvMfVuA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 07:17:46PM +0530, Ayush Singh wrote:
> Hello Everyone,
> 
> I am Ayush Singh, a 3rd-year university student from the Indian Institute of
> Technology (Indian School of Mines), Dhanbad, India. This email is just to
> 
> I participated and successfully completed my GSoC 2022 Project under Tianocore
> Organization in Rust, so I am pretty experienced in Rust Language. I am also
> fairly proficient in reading and working with C, although not to the same
> degree as Rust.
> 
> I use Qemu often for testing and thus would like to contribute to Qemu as a
> part of GSoC 2023. I have narrowed down the projects to:
> 
> 1.  Rust bindings for libnbd: https://wiki.qemu.org/Google_Summer_of_Code_2023#
> Rust_bindings_for_libnbd
> 2.  RDP server: https://wiki.qemu.org/Google_Summer_of_Code_2023#RDP_server
> 
> I would just like to confirm if both of the above projects are up for grabs in
> the upcoming GSoC 2023, and if there are any specific requirements/tasks to
> complete to apply for either of the projects.

We do have another candidate.  I'm not sure what happens in these
situations .. Erik?

Rich.

> Finally, what is the preferred way of discussions in Qemu community? I did see
> an IRC channel as well as qemu-discuss mailing list.
> 
> Yours sincerely
> Ayush Singh
> 
> Github: https://github.com/Ayush1325
> GSoC 2022 Project: https://summerofcode.withgoogle.com/archive/2022/projects/
> PwQlcngc

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


