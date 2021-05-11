Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E737A987
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:37:23 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTVi-0005oY-Ol
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTRA-00080t-N3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTR7-0006YG-BT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620743556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rc2puTvsk+u8nmknkCRMBwhEGa3zVKTuJrjYjXtzkxE=;
 b=hLAvs2QpwlHig6+rp4MHWIQql0amLagLPAhVD+pi01c5tU/je0W2Chq0Yt0omCQZZMoYoZ
 GQXYQXjpo8QcbmFk8pMrgQqP27E+miK/fOurEtgPZxmmpTz0ERs3TzM7u4+xeXY2yDaNqc
 ApzWs73yQ58xShuBZu+p0sbqkX6hlD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-ln27YZtDN162vGEqN5Nydg-1; Tue, 11 May 2021 10:32:34 -0400
X-MC-Unique: ln27YZtDN162vGEqN5Nydg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D59C7403;
 Tue, 11 May 2021 14:32:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 419B717D04;
 Tue, 11 May 2021 14:32:24 +0000 (UTC)
Date: Tue, 11 May 2021 15:32:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 /
 XCode 10.2
Message-ID: <YJqVdeGVsiMh1N6r@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <97e4071e-3d62-40f1-7d08-6718f2f7153a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <97e4071e-3d62-40f1-7d08-6718f2f7153a@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 04:18:54PM +0200, Thomas Huth wrote:
> On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> > Several distros have been dropped since the last time we bumped the
> > minimum required CLang version.
> [...]
> > -#  if __clang_major__ < 3 || (__clang_major__ == 3 && __clang_minor__ < 4)
> > -#   error You need at least Clang v3.4 to compile QEMU
> > +#  if __clang_major__ < 7 || (__clang_major__ == 7 && __clang_minor__ < 0)
> 
> __clang_minor__ < 0 is very unlikely ... I think you could drop the part
> after the "||".

True, though it might be desirable to keep it as a placeholder for when
we next bump the min version and have a non-zero minor digit.

> 
> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


