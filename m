Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36486628A3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtEE-0006G0-DN; Mon, 09 Jan 2023 09:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtD9-000643-Fk
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtD7-0001wk-Qf
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673274792;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sQoF7TwePtFQa6ZK8msuGQks1VNsOvsQu1wkOnZh4o=;
 b=S4ggrsJnEisp4YxaV8RSJIDhQg8f2iszrL4iLaIXStt5/UbXdSG6WGZ3/zIGj3VwlSiVHA
 yJNLZx0Omtxkf0PkENBqvF7h+fW7g0HriOAY+sN1QqIF2kncQsKhXIFsyp9x2072rOYVlX
 LtcImorxTBknGsyooCgJdnCuXfASR88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-emdOdTs6OyatM2xZO_7dcg-1; Mon, 09 Jan 2023 09:33:09 -0500
X-MC-Unique: emdOdTs6OyatM2xZO_7dcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5246D858F0E;
 Mon,  9 Jan 2023 14:33:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F5F1121314;
 Mon,  9 Jan 2023 14:33:07 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:33:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
Message-ID: <Y7wlnqwU+/auE0Jj@redhat.com>
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 02:56:13PM +0100, Philippe Mathieu-Daudé wrote:
> On 9/1/23 14:33, BALATON Zoltan wrote:
> > On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
> > > Use the same property name than the TYPE_PFLASH_CFI01 model.
> > 
> > Nothing uses it? Can this break command lines and if so do we need
> > deprecation or some compatibility function until everybody changed their
> > usage?
> 
> Good point... I missed that :/
> 
> How deprecation works in that case, can I simply add an extra
> property with DEFINE_PROP_UINT8()? I'm worried about an user
> doing:
> 
>  -device cfi.pflash02,device-width=4,width=2,...
> 
> and the processing order of the properties, besides property
> overwritten isn't warned to the user.

Correct nothing warns.

Something would need to issue a warning when the deprecated
property is set.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


