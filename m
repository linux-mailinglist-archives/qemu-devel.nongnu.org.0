Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F031FBC23
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:53:10 +0200 (CEST)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlEph-0004Y5-ED
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jlEnw-0002tA-FO
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:51:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59260
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jlEnu-0003fO-RA
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592326277;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Nu3dqHgqDRru6QQstkXBT7Sn4MQBTGt8+Rxb/DxEFA=;
 b=JfYMw1QDE5Tm3465zNytkcxrErjrxCFa9lzqhcp9v62gJW4QEFiB8oa8ZdLMsNuBAGeEXO
 6avBlurzCrMzQcfVQak/EqLfk4tK0TqDWa0t1/bsEXNVR5hxTP4Di4Dae96HcWkl4O0Zv8
 z4/IwxVv2XvPczcBYnwP3Dk6WTLuDtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-xSDJTc3uNjW-ol_2_X-rTw-1; Tue, 16 Jun 2020 12:51:14 -0400
X-MC-Unique: xSDJTc3uNjW-ol_2_X-rTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C2910AEA01;
 Tue, 16 Jun 2020 16:51:13 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 603D479303;
 Tue, 16 Jun 2020 16:51:12 +0000 (UTC)
Date: Tue, 16 Jun 2020 17:51:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [PULL 3/5] crypto/linux_keyring: add 'secret_keyring' secret
 object.
Message-ID: <20200616165109.GR550360@redhat.com>
References: <20200615103633.300208-1-berrange@redhat.com>
 <20200615103633.300208-4-berrange@redhat.com>
 <m2y2on6jmc.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m2y2on6jmc.fsf@dme.org>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alexey Krasikov <alex-krasikov@yandex-team.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 16, 2020 at 05:49:47PM +0100, David Edmondson wrote:
> On Monday, 2020-06-15 at 11:36:31 +01, Daniel P. Berrangé wrote:
> 
> > +if test "$secret_keyring" != "no"
> > +then
> > +    if test "$have_keyring" == "yes"
> 
> This generates a complaint when building on Debian testing:
> 
> ./configure: 6319: test: yes: unexpected operator
> 
> Perhaps should be a single = ?

Yes, you  are right.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


