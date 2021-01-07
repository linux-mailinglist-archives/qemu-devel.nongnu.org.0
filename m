Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A822ED3ED
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:07:20 +0100 (CET)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXol-0004Ra-4S
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxXnb-0003UN-DH
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxXnZ-0000Qu-Lt
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610035564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JnHy+JU8FF8WohWiSiandFteeYe+g0kdyzeEbWvdJ4s=;
 b=KhgnRznVXDpb6yCElFCavfkyr1isoKxoAIb5iZL8tPDnOJOcEssXfk2Dqmls+tiUR+2lcH
 KiJ/oCQT6GjZo8EuLYmymGWmktDqKFp9yTJNNn+YWW1bds2/tbLLKQBmyGNvPL1Yb81jY2
 k2LtD1usnkvWNmsTISQbZxLEeKFGh6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-kL6cLQ4TMxqhO8dxRHpS1w-1; Thu, 07 Jan 2021 11:05:58 -0500
X-MC-Unique: kL6cLQ4TMxqhO8dxRHpS1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1419BB8108;
 Thu,  7 Jan 2021 16:05:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C92B6268F;
 Thu,  7 Jan 2021 16:05:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CBD1180061B; Thu,  7 Jan 2021 17:05:46 +0100 (CET)
Date: Thu, 7 Jan 2021 17:05:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/8] gtk: remove CONFIG_GTK_GL
Message-ID: <20210107160546.ezuyp6o73fb7256e@sirius.home.kraxel.org>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210107140039.467969-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 03:00:34PM +0100, Paolo Bonzini wrote:
> CONFIG_GTK_GL is defined if OpenGL is present and GTK+
> is 3.16 or newer.  Since GTK+ 3.22 is the minimum supported
> version, just use CONFIG_OPENGL instead.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


