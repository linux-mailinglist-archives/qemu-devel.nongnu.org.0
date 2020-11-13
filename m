Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8032B1859
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:38:08 +0100 (CET)
Received: from localhost ([::1]:43140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVWx-0007tU-2Y
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kdVVw-0007DH-VD
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kdVVt-00063g-JS
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605260218;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdlsP4b9dw87QD0bMiXOc64MesB7wb1J3lOHPV4WeUA=;
 b=O3v32AR5ZZlCF4h/we3njssXOaTaMw+oNIcvgi96RyLYUegkOJeVTvL3VgsKTGLUCPNe5k
 UwE8WaEtWKJS+dMN12CmKlrCZ3pQOYKDyqqItuFiAobsLGO+3dG+yWVebJqdqLcL5JMCKh
 oOmCeCoVFG+/3WNjWlah7ay6+PeKd18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-pz8sd9qCMj2QB4_-G22xUg-1; Fri, 13 Nov 2020 04:36:53 -0500
X-MC-Unique: pz8sd9qCMj2QB4_-G22xUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08831107B479
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 09:36:53 +0000 (UTC)
Received: from redhat.com (ovpn-113-180.ams2.redhat.com [10.36.113.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E0D5578C;
 Fri, 13 Nov 2020 09:36:51 +0000 (UTC)
Date: Fri, 13 Nov 2020 09:36:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] authz-list-file: Improve an error message
Message-ID: <20201113093648.GA30434@redhat.com>
References: <20201113062358.2563662-1-armbru@redhat.com>
 <20201113062358.2563662-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113062358.2563662-3-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 07:23:58AM +0100, Markus Armbruster wrote:
> When qauthz_list_file_load() rejects JSON values other than JSON
> object with a rather confusing error message:
> 
>     $ echo 1 | qemu-system-x86_64 -nodefaults -S -display none  -object authz-list-file,id=authz0,filename=/dev/stdin
>     qemu-system-x86_64: -object authz-list-file,id=authz0,filename=/dev/stdin: Invalid parameter type for 'obj', expected: dict
> 
> Improve to
> 
>     qemu-system-x86_64: -object authz-list-file,id=authz0,filename=/dev/stdin: File '/dev/stdin' must contain a JSON object
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  authz/listfile.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/authz/listfile.c b/authz/listfile.c
> index 1421e674a4..da3a0e69a2 100644
> --- a/authz/listfile.c
> +++ b/authz/listfile.c
> @@ -73,7 +73,8 @@ qauthz_list_file_load(QAuthZListFile *fauthz, Error **errp)
>  
>      pdict = qobject_to(QDict, obj);
>      if (!pdict) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "obj", "dict");
> +        error_setg(errp, "File '%s' must contain a JSON object",
> +                   fauthz->filename);

This code pattern was copied from other places in QEMU which use the
same QERR_INVALID_PARAMETER_TYPE. There are another 10 or so examples
of this error message pattern.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


