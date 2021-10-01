Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1B41E938
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 10:54:02 +0200 (CEST)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWEIr-0002jL-1i
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 04:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWEHg-00022I-1y
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWEHe-0005el-2v
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633078365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=F6GwcA9+/d3D8lW91R6/rptEk4xE+IFKKXeQnFdUfDM=;
 b=DBPUX+Sux5BQ/KkE2aYeW6TUmTMGsKX9H48n3hMK1uJ67BBYukJSKRmrNH/h/Pcm0C0WeH
 eO6//iBADLOPdhOJmmF0RXFTf2jxXMOeLdl+OCt35AY9eAaTD4m4xaDa1n3+GQRzVhIbu8
 kcuw4LRPB3oKM0cDmWxVmV42UDEnhzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-pNyOIIq2NoCRP6gFGERiNw-1; Fri, 01 Oct 2021 04:52:35 -0400
X-MC-Unique: pNyOIIq2NoCRP6gFGERiNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91EDA1018720;
 Fri,  1 Oct 2021 08:52:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A35A9608BA;
 Fri,  1 Oct 2021 08:52:22 +0000 (UTC)
Date: Fri, 1 Oct 2021 09:52:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVbMROzMahQmaRt5@redhat.com>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
 <YVXePK28T7nl9J7k@invalid>
 <YVa0p4rZDh3teOwC@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVa0p4rZDh3teOwC@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Eldon Stegall <eldon-qemu@eldondev.com>,
 michael.roth@amd.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 08:11:35AM +0100, Stefan Hajnoczi wrote:
> We need to keep the security of QEMU releases in mind. Mike Roth
> signs and publishes releases. Whoever facilitates or hosts the files
> should not be able to modify the files after Mike has blessed them. One
> way to do this is to keep hosting the .sig files on download.qemu.org
> and to redirect the actual tarballs to a file hosting provider. A way to
> securely publish files without hosting anything on qemu.org would be
> even better though (maybe it's enough to publish signatures on the
> static GitLab Pages website).

If someone modifies the download files, then when you verify the sig
it will be detected. It doesn't matter whether the sig is on the same
host or not, because if someone modifies the sig too, then it will
still fail validation. The important thing is that the user has got
the right public key to verify with.

IOW, hosting the .sig separately is not required. We need to ensure
that our public key, however, is published & discoverable in a
trustworthy place that is separate from the download server. We fail
at that today because www.qemu.org and download.qemu.org are the
same server.

So it will be beneficial if the download site is split off from
the public website, compared to our current setup.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


