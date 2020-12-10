Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82E2D6158
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:13:19 +0100 (CET)
Received: from localhost ([::1]:33380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOZC-0002qX-GV
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOTY-000610-6t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOTW-0008S5-3e
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MeEN+QshBGK04+uBBfxx/4Ymjz7ZtawyOW+E03BKCY=;
 b=HZ81E+DpK1tyngPr/eWW5ZFEK6RLKG9qOY1dofea74H4QM37TYsYALWs2d3/59doX8BSyQ
 sYyJm3UGqAHWA8f7f5h5x95/4IP79dVgakV65Q1Hvy8mAuBKrayOJU7X04nDtK195V2ux5
 PgTPMTfMFbHyO2o3OVTJ+b4LlO2dJlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-UONJ0ng3Nk6hatYf0BFxrw-1; Thu, 10 Dec 2020 11:07:21 -0500
X-MC-Unique: UONJ0ng3Nk6hatYf0BFxrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25B1D192CC50;
 Thu, 10 Dec 2020 16:07:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB35D6F965;
 Thu, 10 Dec 2020 16:06:59 +0000 (UTC)
Subject: Re: [PATCH] accel/tcg: Remove deprecated '-tb-size' option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201202112714.1223783-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f0c583f-0f37-1335-56c1-b82c6b7ee8a8@redhat.com>
Date: Thu, 10 Dec 2020 17:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201202112714.1223783-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/2020 12.27, Philippe Mathieu-Daudé wrote:
> The '-tb-size' option (replaced by '-accel tcg,tb-size') is
> deprecated since 5.0 (commit fe174132478). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/system/deprecated.rst | 12 +++++-------
>  accel/tcg/translate-all.c  |  2 +-
>  softmmu/vl.c               |  8 --------
>  qemu-options.hx            |  8 --------
>  4 files changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 565389697e8..70bdb62a6d6 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -100,13 +100,6 @@ QEMU 5.1 has three options:
>        to the user to load all the images they need.
>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
>  
> -``-tb-size`` option (since 5.0)
> -'''''''''''''''''''''''''''''''
> -
> -QEMU 5.0 introduced an alternative syntax to specify the size of the translation
> -block cache, ``-accel tcg,tb-size=``.  The new syntax deprecates the
> -previously available ``-tb-size`` option.
> -
>  ``-show-cursor`` option (since 5.0)
>  '''''''''''''''''''''''''''''''''''
>  
> @@ -523,6 +516,11 @@ for the ``id`` parameter, which should now be used instead.
>  
>  The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
>  
> +``-tb-size`` option (removed in 6.0)
> +'''''''''''''''''''''''''''''''

Sphinx complains:

Warning, treated as error:
/home/thuth/devel/qemu/docs/system/removed-features.rst:36:Title underline
too short.

 Thomas


