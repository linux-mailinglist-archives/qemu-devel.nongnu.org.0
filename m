Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F631D9A3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:41:45 +0100 (CET)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCM9I-0006qa-Og
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCM6c-0005tJ-0n
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCM6X-0005j9-Ly
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kqZ7rDRiMBt3d9Kmy6SHLVlElSQSLt48qol2HcwoPMM=;
 b=MpiL+ays5XqNULZUKgb1JFVnk83kiYF9q1DI2l49r1Qn5HsWBDSX8QJLL0JzQ8Fls4th9V
 bcD6CvEyM6wrGDy0Y91NMD0GQGqTfJkYZRTevEwK8UkrnItVonJ3Ed/J7j2eIe7cO+q0t1
 gpLhSV4Anb93kYqqAOM8UleKkLYT+ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-ulwfwSa6NjqiyvJX7dqzEQ-1; Wed, 17 Feb 2021 07:38:38 -0500
X-MC-Unique: ulwfwSa6NjqiyvJX7dqzEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 276CF1005501;
 Wed, 17 Feb 2021 12:38:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E47C210023B4;
 Wed, 17 Feb 2021 12:38:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DB3B18000A2; Wed, 17 Feb 2021 13:38:35 +0100 (CET)
Date: Wed, 17 Feb 2021 13:38:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Support unique keys of JIS keyboards
Message-ID: <20210217123835.kk6lgvydc7xzx2nf@sirius.home.kraxel.org>
References: <20210212000404.28413-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210212000404.28413-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +    // JIS keyboards only
> +    [kVK_JIS_Yen] = Q_KEY_CODE_YEN,
> +    [kVK_JIS_Underscore] = Q_KEY_CODE_RO,
> +    [kVK_JIS_KeypadComma] = Q_KEY_CODE_KP_COMMA,
> +    [kVK_JIS_Eisu] = Q_KEY_CODE_MUHENKAN,
> +    [kVK_JIS_Kana] = Q_KEY_CODE_HENKAN,

Added to UI patch queue.

thanks,
  Gerd


