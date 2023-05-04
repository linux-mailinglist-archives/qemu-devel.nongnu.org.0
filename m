Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9829C6F67DD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:59:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUnI-0004cf-A7; Thu, 04 May 2023 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puUnG-0004cA-AP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puUnE-0004BA-Sg
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683190707;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+oa78KseC6zvhs77DhdK4zKcP3W3zTsG059VHkwkfSM=;
 b=bMVERX6xA7F7QDMEwBZLqaGiK3s3PZXOo79ACBPBNLg6NX6BK4h8M+/8J7P4D/5iAqh/H9
 dJiK1opOWoInYNrznIBVdl0R+QpK2FVG4wiWE6NvPXpO1qLZNkCKWZQEKaGK8aMVrTjolc
 olqRyQJdd69ipEH6LWlvWJz5UEvCVb4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-mO5ZqMZpOcuH5S1LgaFbkA-1; Thu, 04 May 2023 04:58:26 -0400
X-MC-Unique: mO5ZqMZpOcuH5S1LgaFbkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CE87A0F387;
 Thu,  4 May 2023 08:58:26 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83CCE1410F29;
 Thu,  4 May 2023 08:58:24 +0000 (UTC)
Date: Thu, 4 May 2023 09:58:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 wainersm@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Message-ID: <ZFNzrXnLAVO37LgX@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <602A585B-01D1-4140-899F-F7E3A5045E47@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <602A585B-01D1-4140-899F-F7E3A5045E47@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 04, 2023 at 12:40:12PM +0530, Ani Sinha wrote:
> 
> 
> > On 04-May-2023, at 12:05 PM, Thomas Huth <thuth@redhat.com> wrote:
> > 
> > On 03/05/2023 16.55, Ani Sinha wrote:
> >> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
> >> adds those two tools in the docker container images.
> > 
> > tests/qtest/cdrom-test.c already uses genisoimage to create ISO images, and the containers already have that tool installed. Could you maybe switch the biosbits test to use that tool? Or the other way round? ... at least having two tools to create ISO images in our containers sounds IMHO excessive.
> 
> The dependency comes from the use of grub-mkrescue in the avocado
> test in order to generate the iso with the bios bits enabled grub
> and boot off with it. Grub-mkrescue is a bash script that uses
> mformat and xorriso.

Where does grub-mkrescue come from ?  IIUC, we don't have a dep
on the grub package in our dockerfiles.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


