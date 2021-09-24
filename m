Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7BA417BBB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:21:37 +0200 (CEST)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqlM-0004yN-Vy
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqR9-0008DS-S0
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqR3-0007kB-MQ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632510037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKnHc/0Qwo8TsloL+Ek+Nk7exyH09fejtfoxaHRrLp8=;
 b=ddyUuqP4ajf7WZdA5eN6Io+d/kRsOngsU5fFHUvJn3EfKfAdp2NNxjYBkWDboS5L2GmDum
 wC1C2vLHfrwdN562bPoVuGifpybTVNfshJJ3B7MyOO35Da0tU3WxXKRgCQsmWAiFJSI2Sm
 nwE9dbHD7FIMPb815n0PR5L56pLW2sA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-iB_B3Br-Nt2n5RpgbusabA-1; Fri, 24 Sep 2021 15:00:33 -0400
X-MC-Unique: iB_B3Br-Nt2n5RpgbusabA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE12F802C80;
 Fri, 24 Sep 2021 19:00:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C9D6A916;
 Fri, 24 Sep 2021 19:00:25 +0000 (UTC)
Date: Fri, 24 Sep 2021 14:00:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 10/11] vl: Enable JSON syntax for -device
Message-ID: <20210924190024.lkktjojrdwlfo5kd@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-11-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-11-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:26AM +0200, Kevin Wolf wrote:
> Like we already do for -object, introduce support for JSON syntax in
> -device, which can be kept stable in the long term and guarantees that a
> single code path with identical behaviour is used for both QMP and the
> command line. Compared to the QemuOpts based code, the parser contains
> less surprises and has support for non-scalar options (lists and
> structs). Switching management tools to JSON means that we can more
> easily change the "human" CLI syntax from QemuOpts to the keyval parser
> later.
> 
> In the QAPI schema, a feature flag is added to the device-add command to
> allow management tools to detect support for this.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qdev.json | 15 +++++++++----
>  softmmu/vl.c   | 58 ++++++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..cdc8f911b5 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -32,17 +32,23 @@
>  ##
>  # @device_add:
>  #
> +# Add a device.
> +#
>  # @driver: the name of the new device's driver
>  #
>  # @bus: the device's parent bus (device tree path)
>  #
>  # @id: the device's ID, must be unique
>  #
> -# Additional arguments depend on the type.
> -#
> -# Add a device.
> +# Features:
> +# @json-cli: If present, the "-device" command line option supports JSON
> +#            syntax with a structure identical to the arguments of this
> +#            command.
>  #
>  # Notes:
> +#
> +# Additional arguments depend on the type.
> +#
>  # 1. For detailed information about this command, please refer to the
>  #    'docs/qdev-device-use.txt' file.
>  #
> @@ -67,7 +73,8 @@
>  ##
>  { 'command': 'device_add',
>    'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
> -  'gen': false } # so we can get the additional arguments
> +  'gen': false, # so we can get the additional arguments
> +  'features': ['json-cli'] }

Eventually, we'll get rid of this 'gen':false, but this patch series
is already an improvement towards that goal.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


