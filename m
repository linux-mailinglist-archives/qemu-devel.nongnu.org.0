Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9652B809D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:35:54 +0100 (CET)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPUv-0007ce-AQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfPTZ-0007At-0m
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfPTV-00042C-Rn
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605713664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9Ojzq4DJTRVKf9tW99a7Gnml1Ut2ixVpjEaLLnUFSLw=;
 b=dDZm5AFo4dWWkNOUA9PUf4KBV9JBX3HDMWwa0JBYt8VYPSxBRVv+1BP+lfQ1Z/BeQ+E+2M
 JHyk6JEOMAs5N0p6e7bJrvo1R6CEKBISiRJCptb+0kpTGx0L8eHQcT6aAEO2y8ZPdBE56F
 72o9m/+yexrd6LOrqpualCLwXJB1ZAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-GEXU4yzsMVCn9dY4sOVPtw-1; Wed, 18 Nov 2020 10:34:20 -0500
X-MC-Unique: GEXU4yzsMVCn9dY4sOVPtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCB2618C35BA;
 Wed, 18 Nov 2020 15:34:19 +0000 (UTC)
Received: from redhat.com (ovpn-115-41.ams2.redhat.com [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E59160853;
 Wed, 18 Nov 2020 15:34:18 +0000 (UTC)
Date: Wed, 18 Nov 2020 15:34:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <20201118153416.GG229461@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 15, 2020 at 11:57:25AM +0100, Stefan Weil wrote:
> *** Setting INSTALLER no longer handled
> 
> meson.build sets a hard name for the Windows installer executable: installer
> = 'qemu-setup-' + meson.project_version() + '.exe'.
> 
> Previously the installer name could be changed by running `make installer
> INSTALLER=qemu-setup-something.exe`. This no longer works. Is there an
> alternative solution how the name of the installer executable can be set? Or
> how could I reimplement the lost functionality?

Why were you needing to override the name ?  Was this so that you can
give distinct names to the Win32 vs Win64 installer exes ?

If so, would it be better if QEMU used a distinct filename for the
Win32 vs Win64 installers automatically, to avoid need to override
at all ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


