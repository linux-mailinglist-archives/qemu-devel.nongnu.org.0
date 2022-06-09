Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B9544C2A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:34:14 +0200 (CEST)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHMa-0002o0-Kl
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF81-00075m-6k
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:11:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF7z-0007Yx-9m
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654769458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hps1i8lqRyyf0+3yrsA7GnEhAQgCDrW1Vh8LTMeDRk=;
 b=UIx+el0FnDTZ9rpDMchWB/UxAgBz/2YMEdfvkmda0VZLdYWk5gEalJLk+IwlIKlFDmfbv2
 +9mBpxe6PgY6/PruQGuYNGS5xWVIgRPwyyq0GjPFyDnfMD52L/vQcFafjLLrvWMO2LFYkp
 zlP0/2NwhgUzRrJZNfb1bReGj368Q3E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-gee_MMN-M8GVT1dLXYKsLg-1; Thu, 09 Jun 2022 06:10:57 -0400
X-MC-Unique: gee_MMN-M8GVT1dLXYKsLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E80EC3815D22
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 10:10:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CC01410DDB;
 Thu,  9 Jun 2022 10:10:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D33C61800094; Thu,  9 Jun 2022 12:10:54 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:10:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] ui: move 'pc-bios/keymaps' to 'ui/keymaps'
Message-ID: <20220609101054.eaeow5gqknazssmd@sirius.home.kraxel.org>
References: <20220426160150.812530-1-berrange@redhat.com>
 <Yoyp3l9bHYRcGpAX@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yoyp3l9bHYRcGpAX@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 10:48:14AM +0100, Daniel P. Berrangé wrote:
> Ping, any thoughts on this ?
> 
> On Tue, Apr 26, 2022 at 05:01:50PM +0100, Daniel P. Berrangé wrote:
> > The 'keymaps' directory contents is nothing to do with the firmware
> > blobs. The 'pc-bios/keymaps' directory appears to have been used
> > previously as a convenience for getting the files installed into
> > a subdir of the firmware install dir. This install time arrangement
> > does not need to be reflected in the source tree arrangement. These
> > keymaps logically belong with the UI code.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Makes sense, queued up now.

take care,
  Gerd


