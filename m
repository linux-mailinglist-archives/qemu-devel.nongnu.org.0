Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A437230BAD3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:23:47 +0100 (CET)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ruT-0004Tv-19
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6rsv-0003Mz-58
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6rsq-0006x8-Vt
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612257722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qK8+nGc44OoBBNc/eOs2+qw6GyzNSQ4Azr5PWUoHAio=;
 b=KkLLMwPyYvfEslqQgp4dwafO6TqmR962K2liFZyVzqRbooVGSL5O7n9RPh6RJVyoh/Yqs5
 IABiOFrSMq8/ku93prqDuyjb4563l/EbpaLU5KVLRgVeY84hbWKccLzmUWe46aA/xR/7z2
 QBechwIYSpvMD/NNi5FvWCzo3t42lsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-YfQSMdozPU2LaCOqlSKAjQ-1; Tue, 02 Feb 2021 04:22:01 -0500
X-MC-Unique: YfQSMdozPU2LaCOqlSKAjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04B99107ACE3;
 Tue,  2 Feb 2021 09:21:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 042385F7D8;
 Tue,  2 Feb 2021 09:21:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6CDBB113865F; Tue,  2 Feb 2021 10:21:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH RFC 1/1] hw: Replace anti-social QOM type names
References: <20210129081519.3848145-1-armbru@redhat.com>
 <20210129081519.3848145-2-armbru@redhat.com>
 <c448e0cb-f0c4-57fb-20df-077b65e386c6@ilande.co.uk>
Date: Tue, 02 Feb 2021 10:21:47 +0100
In-Reply-To: <c448e0cb-f0c4-57fb-20df-077b65e386c6@ilande.co.uk> (Mark
 Cave-Ayland's message of "Mon, 1 Feb 2021 20:45:40 +0000")
Message-ID: <875z3ag6z8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 29/01/2021 08:15, Markus Armbruster wrote:
>
>> Several QOM type names contain ',':
>>      ARM,bitband-memory
>>      etraxfs,pic
>>      etraxfs,serial
>>      etraxfs,timer
>>      fsl,imx25
>>      fsl,imx31
>>      fsl,imx6
>>      fsl,imx6ul
>>      fsl,imx7
>>      grlib,ahbpnp
>>      grlib,apbpnp
>>      grlib,apbuart
>>      grlib,gptimer
>>      grlib,irqmp
>>      qemu,register
>>      SUNW,bpp
>>      SUNW,CS4231
>>      SUNW,DBRI
>>      SUNW,DBRI.prom
>>      SUNW,fdtwo
>>      SUNW,sx
>>      SUNW,tcx
>
> My personal preference for the SUNW prefix would be to either drop it
> completely or change it to "sun-" instead. The reason being that the
> "SUNW," prefix is the standard way to reference Sun devices/packages,
> and looking at the replacements which still have a SUNW prefix in
> captials makes me thing the hyphen is either a typo or my fingers go
> on autopilot and type a comma anyway...

Works form me.


