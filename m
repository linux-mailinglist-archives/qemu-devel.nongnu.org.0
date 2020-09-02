Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A225A7BB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 10:25:15 +0200 (CEST)
Received: from localhost ([::1]:52476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDO4w-0002IT-R3
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 04:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDNxO-0003ge-IM
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:17:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21506
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDNxM-00039G-Qm
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034643;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Mzks7dACQ3aINxrT3K2SJgHZLlXfnSPn/IUFBXHTK2o=;
 b=hNhnLxIJx8QbCI1z+qXnHtQm78tdnyR16IBURHe274bz3TMIXzKjkxlxweR2bQeYYUi4zT
 +U0DKeWDUcbaQVUZQer9PdAfO3lhIs/nyI0Q59lE/Y2uFmm/JZlGdBF3LBH/JAS0xIyiif
 T5ONyb52wZQTHRXZ0CXcG4Bxhn/kG8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-v_aOMMIhM_KCOKYmKKTkJQ-1; Wed, 02 Sep 2020 04:17:22 -0400
X-MC-Unique: v_aOMMIhM_KCOKYmKKTkJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F001008570;
 Wed,  2 Sep 2020 08:17:21 +0000 (UTC)
Received: from redhat.com (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8A4219C71;
 Wed,  2 Sep 2020 08:17:16 +0000 (UTC)
Date: Wed, 2 Sep 2020 09:17:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: Re: ui: fix potential compile error.
Message-ID: <20200902081713.GD403297@redhat.com>
References: <370e6ed66acf43e68f1ef2bffc3026f7@tencent.com>
 <20200902052313.unmxqfgsix6kuerb@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200902052313.unmxqfgsix6kuerb@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?B?cnVpcHBhbijmvZjnnb8p?= <ruippan@tencent.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 02, 2020 at 07:23:13AM +0200, kraxel@redhat.com wrote:
>   Hi,
> 
> > 1.     CentOS7 with Python 2.7.5
> 
> > Root cause is my argparse and python version. But change the invoking order can adapt both new and old argparse.
> 
> python2 is EOL and not supported any more.
> please "yum install python3" (yes, centos7 has it, was added in 7.8).

Hmm, I'm surpised the build even got this far.  configure should be checking
python version and refusing to run with python2 at all before even starting
the build process.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


