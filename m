Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49A397231
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:14:51 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2ME-0006kl-7W
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo2K6-0005JT-Dp
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo2K0-0000ZD-Gi
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622545951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXnnXaMrgOSeQkfACoQwmAFGCws5NdUqVoRFjjbvxw0=;
 b=HESDaMCrKMw8RyZr4t39SVvFDM9b6dwA+F9d6bzq+X2aNFeM1ZfK+tfI9WN9SXdK77lDTy
 ICfsKYNa8KVLzycqtLeVbN3O6tYnkzkO0Ua3O2FfMmlbF7sE2UiQmvkMLT/DF4FwWFXMoF
 iZ7Y6Afo/iBOUiGc0EHZz02j77f+yYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-u5ZviiWyPeS3hFNsmXUTTQ-1; Tue, 01 Jun 2021 07:12:29 -0400
X-MC-Unique: u5ZviiWyPeS3hFNsmXUTTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06FCF8042B5;
 Tue,  1 Jun 2021 11:12:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 351E23CC7;
 Tue,  1 Jun 2021 11:12:26 +0000 (UTC)
Date: Tue, 1 Jun 2021 13:12:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3] docs/secure-coding-practices: Describe how to use
 'null-co' block driver
Message-ID: <YLYWGEZPJ/1Y72R9@merkur.fritz.box>
References: <20210601053503.1828319-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601053503.1828319-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.06.2021 um 07:35 hat Philippe Mathieu-Daudé geschrieben:
> Document that security reports must use 'null-co,read-zeroes=on'
> because otherwise the memory is left uninitialized (which is an
> on-purpose performance feature).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Simplified using Vladimir suggestion.
> ---
>  docs/devel/secure-coding-practices.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/docs/devel/secure-coding-practices.rst b/docs/devel/secure-coding-practices.rst
> index cbfc8af67e6..79a3dcd09a3 100644
> --- a/docs/devel/secure-coding-practices.rst
> +++ b/docs/devel/secure-coding-practices.rst
> @@ -104,3 +104,12 @@ structures and only process the local copy.  This prevents
>  time-of-check-to-time-of-use (TOCTOU) race conditions that could cause QEMU to
>  crash when a vCPU thread modifies guest RAM while device emulation is
>  processing it.
> +
> +Use of null-co block drivers
> +----------------------------
> +
> +The ``null-co`` block driver is designed for performance: its read accesses are
> +not initialized by default. In case it this driver has to be used for security

"it this driver" is probably a typo?

> +research, it must be used with the ``read-zeroes=on`` option which fills read
> +buffers with zeroes. Security issues reported with the default
> +(``read-zeroes=off``) will be discarded.

Kevin


