Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03543548514
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:13:33 +0200 (CEST)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0iwm-0007eb-1c
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iO3-0001ew-Vg
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iO0-0002Pr-CP
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655120255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3hr6/Mvb/jaN11bbDLELIxUfKwDaNqRMrvYY8g0H0k=;
 b=RJ1SBvm8WkSGfjZmbrBag/ckdjXhouD5OdBcWDmdkaopXykmPzEnP2lv64wZ4I+1pB84dr
 VTeaDloJq/kkN781nRV8Hb2PGimejFc/rMFRAmmfTX9NrDT0UceRVhfDM6/vh2JSEEpehR
 /IkWOS0jmfSeiNGTKHucgj4Mq61lo5k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-bfQBZ9cjNP-Ny7Ps4OqiSg-1; Mon, 13 Jun 2022 07:37:34 -0400
X-MC-Unique: bfQBZ9cjNP-Ny7Ps4OqiSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 372D71C0F696;
 Mon, 13 Jun 2022 11:37:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E05840C1247;
 Mon, 13 Jun 2022 11:37:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0AAD1800626; Mon, 13 Jun 2022 13:37:32 +0200 (CEST)
Date: Mon, 13 Jun 2022 13:37:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2] ui: move 'pc-bios/keymaps' to 'ui/keymaps'
Message-ID: <20220613113732.qeme56veolnfuwmf@sirius.home.kraxel.org>
References: <20220613084456.470068-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613084456.470068-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Mon, Jun 13, 2022 at 09:44:56AM +0100, Daniel P. Berrangé wrote:
> The 'keymaps' directory contents is nothing to do with the firmware
> blobs. The 'pc-bios/keymaps' directory appears to have been used
> previously as a convenience for getting the files installed into
> a subdir of the firmware install dir, as well as to make it easier
> to launch QEMU directly from the build tree. These requirements
> do not need to be reflected in the source tree arrangement. The
> keymaps logically belong with the UI code, and meson can install
> them into the right place. For in-tree execution, we merely need
> a suitable symlink from the source tree to the build tree.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> Changed in v2:
> 
>   - Make configure symlink ui/keymaps to $BUILD/pc-bios
>     so in-tree build execution works. (Thanks Volker)

Replaced patch, v2 pull req sent.

thanks,
  Gerd


